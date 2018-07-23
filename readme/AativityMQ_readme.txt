1.下载ActivityMQ,并启动服务
   登陆后台 http://localhost:8161/admin
   用户名:admin 密码:admin
   
2.在maven pom.xml配置文件中加上jar包依赖
	<dependency>
  		<groupId>org.apache.activemq</groupId>
  		<artifactId>activemq-core</artifactId>
  		<version>5.7.0</version>
	</dependency>
	<dependency>
		<groupId>org.apache.activemq</groupId>
		<artifactId>activemq-pool</artifactId>
		<version>5.7.0</version>
	</dependency>

3.配置ActivityMQ整合Spring
  3.1 编写:applicationContext-jms.xml
  		 <!-- 1.配置ConnectionFactory -->
	 <!-- 真正可以产生Connection的ConnectionFactory，由对应的 JMS服务厂商提供-->  
    <bean id="activeMQConnectionFactory" class="org.apache.activemq.ActiveMQConnectionFactory"> 
    	<property name="userName" value="admin" /><!-- 用户名 -->
        <property name="password" value="admin" /><!-- 密码 --> 
        <property name="brokerURL" value="tcp://localhost:61616"/>
    </bean>  
      <!-- ActiveMQ为我们提供了一个PooledConnectionFactory，通过往里面注入一个
      ActiveMQConnectionFactory可以用来将Connection、Session和
      MessageProducer池化,这样可以大大的减少我们的资源消耗 -->
    <bean id="pooledConnectionFactory" class="org.apache.activemq.pool.PooledConnectionFactory">  
        <property name="connectionFactory" ref="activeMQConnectionFactory"/>  
        <property name="maxConnections" value="10"/>
    </bean>  
     
    <!-- 获取连接的工厂 --> 
    <bean id="connectionFactory" class="org.springframework.jms.connection.SingleConnectionFactory">  
        <property name="targetConnectionFactory" ref="pooledConnectionFactory"/>
        <!-- 必须要配置一个clientId -->
        <property name="clientId" value="osmusic"/>
    </bean> 
 
 3.2 编写applicationContext-jms-server.xml
	
	<import resource="applicationContext-jms.xml"/>
     
	<!--Queue消息发送者 -->
    <bean id="queueJmsTemplate" class="org.springframework.jms.core.JmsTemplate">
        <!-- 这个connectionFactory对应的是我们定义的Spring提供的那个ConnectionFactory对象 -->
        <property name="connectionFactory" ref="connectionFactory"/>
        <property name="pubSubDomain" value="false" />
    </bean>
	
	<!--Toppic消息发送者 -->
	<bean id="topicJmsTemplate" class="org.springframework.jms.core.JmsTemplate">
    	<property name="connectionFactory" ref="connectionFactory"/>
    	<property name="pubSubDomain" value="true" />
	</bean>

 3.3 编写applicationContext-jms-listener.xml
    <!-- 生产者和消费者都是使用同一个服务,所以使用产生的连接都是一致的 -->
	<import resource="applicationContext-jms.xml"/>
	
    <!--这个是队列目的地-->  
    <bean id="queueDestination" class="org.apache.activemq.command.ActiveMQQueue">  
        <constructor-arg index="0" value="queue"/>
    </bean>
      
    <!-- Queue消息监听器 -->
    <bean id="queueMessageListener" class="cn.believeus.jms.QueueMessageListener"/>  
    <!-- 消息监听容器会执行一个死循环不断的执行queueMessageListener的onMessage方法监听Queue -->  
    <bean id="jmsContainer" class="org.springframework.jms.listener.DefaultMessageListenerContainer">  
        <property name="connectionFactory" ref="connectionFactory" />  
        <property name="destination" ref="queueDestination" />  
        <property name="messageListener" ref="queueMessageListener" />
        <property name="pubSubDomain" value="false"/>
    </bean>  
    
     <!--这个是主题目的地，一对多的-->
    <bean id="topicDestination" class="org.apache.activemq.command.ActiveMQTopic">
        <constructor-arg value="topicDestination"/>
    </bean>
 	
 	<bean id="topicMessageListener" class="cn.believeus.jms.TopicMessageListener" />
 	
 	<!-- 这段配置我们可以发现对于每一个listener监听者我们都需要配置一个container容器,很麻烦!用如下配置 -->
	<!-- <bean id="topicListenerContainerA"	class="org.springframework.jms.listener.DefaultMessageListenerContainer">
		<property name="connectionFactory" ref="connectionFactory" />
		<property name="concurrentConsumers" value="1" />
		<property name="destination" ref="topicDestination" />
		<property name="messageListener" ref="topicMessageListener" />
		<property name="subscriptionDurable" value="true"/>
        <property name="clientId" value="osmusic"/>
        <property name="durableSubscriptionName" value="www.baidu.com"/>
	</bean> -->
    <!-- client-id="www" 必须和服务端的client-id保持一致 -->
	<jms:listener-container client-id="osmusic" connection-factory="connectionFactory" concurrency="1"  destination-type="topic">
		<jms:listener destination="topicDestination" subscription="wuqiwei" ref="topicMessageListener" />
		<!-- <jms:listener destination="Topic-A" ref="topicListenerB" /> -->
	</jms:listener-container>
    
4.编写生产者
	@Component  
	public class ProducerService {  
   
	@Resource
    private JmsTemplate jmsTemplate;  
      
    public void sendMessage(Destination destination, final String message) {  
        System.out.println("服务端发送消息:" + message);  
        jmsTemplate.send(destination, new MessageCreator() { 
        	TextMessage textMessage;
        	@Override
            public Message createMessage(Session session){  
                 try {
                	 textMessage = session.createTextMessage(message);
				} catch (JMSException e) {
					e.printStackTrace();
				}
                return textMessage;
            }  
        });
    }    
}  

5.编写消费者
 public class ConsumerMessageListener implements MessageListener {  
   
    public void onMessage(Message message) {  
        //这里我们知道生产者发送的就是一个纯文本消息，所以这里可以直接进行强制转换  
        TextMessage textMsg = (TextMessage) message;  
        try {  
            System.out.println("客户端获取消息：" + textMsg.getText());  
        } catch (JMSException e) {  
            e.printStackTrace();  
        }  
    }  
   
}  

6.ActiveMQ中Queue与Topic的比较
	Queue：
  		  一条消息仅能被一个 consumer收到。如果在message发送的时候没有可用的consumer，那么它将被保存一直
   	 	到能处理该message的consumer可用。如果一个consumer收到一条message后却不响应它，那么这条消
		息将被转到另一个consumer那儿。一个Queue可以有很多 consumer，并且在多个可用的consumer中负载均衡
	Topic
		一条消息被publish时，它将发到所有感兴趣的订阅者，所以零到多个subscriber将接收到消息的一个拷贝。但是
		在消息代理接收到消息时，只有激活订阅的subscriber能够获得消息的一个拷贝。

