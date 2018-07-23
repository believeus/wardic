1.mybatis总配置
 <?xml version="1.0" encoding="UTF-8"?>
	<!DOCTYPE configuration
    PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
    "http://mybatis.org/dtd/mybatis-3-config.dtd">
<configuration>
  <settings>
	<setting name="lazyLoadingEnabled" value="false" />
	<setting name="aggressiveLazyLoading" value="false" />
	<setting name="lazyLoadingEnabled" value="false" />
	<setting name="aggressiveLazyLoading" value="true" />
	<setting name="cacheEnabled" value="false" />
  </settings>
  <typeAliases>
		<!-- 使用包扫描,可以简化返回值 例如可以直接在resultType="admin" 不需要写完全的类名-->
		<package name="cn.believeus.model"/>
	</typeAliases>
  <mappers>
	<mapper resource="model-mapper-xml/admin-mapper.xml"/>
  </mappers>
</configuration>

2.spring配置
<bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
    <property name="dataSource" ref="dataSource" />
    <property name="configLocation" value="classpath:mybatis-config.xml" />
</bean>
<bean  class="org.mybatis.spring.mapper.MapperScannerConfigurer">
	<property name="sqlSessionFactory" ref="sqlSessionFactory" />
	<property name="basePackage" value="cn.believeus.service;" />
</bean>

3.编写映射文件,namespace命名必须和映射接口保持一致
<?xml version="1.0" encoding="UTF-8" ?>  
<!DOCTYPE mapper  
  PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"  
  "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
 <!-- 此处必须和接口的类名一致 -->
<mapper namespace="cn.believeus.mybatis.service.AdminServiceMapper">  
    <select id="findById" parameterType="int" resultType="admin">
    	select * from admin where id=#{id}
    </select>
</mapper> 

4.编写映射接口,映射接口必须和映射文件的namespace保持一致
package cn.believeus.service;

public interface MyBatisService {
	public Object findById(int id);
}
