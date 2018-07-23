-----------Begin:使用maven test进行单元测试,方法名必须要以test开头------------------
1.maven 执行特定的测试类所有方法
	mvn clean compile test -Dtest=[ClassName]
	
2.maven可以使用通配符进行单元测试
	mvn clean compile test -Dtest=MyCla*Name
	
3.maven 使用,号测试多个类
	mvn clean compile test -Dtest=[ClassName1],[ClassName2]
	
4.maven使用#号对某一个方法进行测试
	mvn clean compile test -Dtest=[ClassName]#[MethodName]
	
5.maven对方法进行测试同样支持通配符
	mvn test -Dtest=MyClassTest#*test*	
------------End:使用maven进行单元测试----------------------------------------------

使用maven命令：mvn dependency:sources 下载依赖包的源代码 
使用maven下载文档  mvn eclipse:eclipse -DdownloadSources -DdownloadJavadocs 