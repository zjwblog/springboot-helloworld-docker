package com.zjw;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.Banner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * Created by zjwblog<co.zjwblog@gmail.com> on 2021/8/5
 */
@SpringBootApplication
public class HelloWorldApplication {

  //记录器
  private final static Logger logger = LoggerFactory.getLogger(HelloWorldApplication.class);

  public static void main(String[] args) {
    logger.trace("这是trace日志...");
    logger.debug("这是debug日志...");
    logger.info("这是info日志...");
    logger.warn("这是warn日志...");
    logger.error("这是error日志...");

    SpringApplication application = new SpringApplication(HelloWorldApplication.class);
    application.setBannerMode(Banner.Mode.OFF);
    application.run(args);
  }

}
