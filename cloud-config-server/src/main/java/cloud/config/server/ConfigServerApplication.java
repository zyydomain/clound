
package cloud.config.server;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.config.server.EnableConfigServer;
import org.springframework.context.annotation.Configuration;

/**
 * 服务的注册与发现启动类
 * @author zhouyuyou
 * 2017年11月28日
 */

@Configuration
@EnableAutoConfiguration
@EnableDiscoveryClient
@EnableConfigServer//只需要用@EnableConfigServer激活该应用为配置文件服务器即可
public class ConfigServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(ConfigServerApplication.class, args);
    }
}
