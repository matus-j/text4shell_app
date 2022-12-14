# Text4Shell
### Vulnerable dockerized Spring Boot Application

This is a vulnerable Spring Boot application that is used to demonstrate the Text4Shell vulnerability. <br>
Run the application using the following command:

```bash
docker build -t text4shell_app .
docker run -p 8080:8080 text4shell_app
```

The image is based on:
- [Alpine Linux](https://alpinelinux.org/)
- [OpenJDK 11](https://openjdk.java.net/)

The application is based on:
- [Spring Boot](https://spring.io/projects/spring-boot)
- [Apache Commons Text](https://commons.apache.org/proper/commons-text/)

Netcat and bash are used to simulate a reverse shell scenario.