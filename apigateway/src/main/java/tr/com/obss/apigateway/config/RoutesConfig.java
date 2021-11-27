package tr.com.obss.apigateway.config;

import org.springframework.cloud.gateway.route.RouteLocator;
import org.springframework.cloud.gateway.route.builder.RouteLocatorBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class RoutesConfig {

  @Bean
  public RouteLocator gatewayRoutes(RouteLocatorBuilder builder) {
    return builder
        .routes()
        .route(p -> p.path("/recipients").uri("lb://google-calendar-service"))
        .route(p -> p.path("/meetings/*").uri("lb://meeting-manager-service"))
        .route(p -> p.path("/meeting-provider/*").uri("lb://meeting-manager-service"))
        .route(p -> p.path("/websocket/**").uri("lb://notification-service/"))
        .build();
  }
}
