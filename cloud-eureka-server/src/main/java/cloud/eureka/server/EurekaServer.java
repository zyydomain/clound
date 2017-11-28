
package cloud.eureka.server;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;
/**
 * Eureka服务器
 * @author zhouyuyou
 * 2017年11月28日
 */
@SpringBootApplication
@EnableEurekaServer//只需要使用@EnableEurekaServer注解就可以让应用变为Eureka服务器
public class EurekaServer {
	public static void main(String[] args) {
		SpringApplication.run(EurekaServer.class, args);
		@SuppressWarnings("unused")
		String errorString = "emergency! eureka may be incorrectly claiming instances are up when they're not. renewals are lesser than threshold and hence the instances are not being expired just to be safe.";
		errorString = "the self preservation mode is turned off.this may not protect instance expiry in case of network/other problems.";
	}
}
