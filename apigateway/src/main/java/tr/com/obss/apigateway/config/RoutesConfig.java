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
        .route(p -> p.path("/google-account-manager/**").uri("lb://google-calendar-service"))
        .route(p -> p.path("/meeting-manager/**").uri("lb://meeting-manager-service"))
        .route(p -> p.path("/zoom-account-manager/**").uri("lb://zoom-service"))
        .route(p -> p.path("/provider-manager/**").uri("lb://meeting-manager-service"))
        .route(p -> p.path("/meeting-provider/**").uri("lb://meeting-manager-service"))
        .route(
            p ->
                p.path("/websocket/**")
                    .filters(
                        f -> f.dedupeResponseHeader("Access-Control-Allow-Origin", "RETAIN_UNIQUE"))
                    .uri("lb://notification-service"))
        //        .route(
        //            p ->
        //                p.path("/websocket/info/**")
        //                    .filters(
        //                        f -> f.dedupeResponseHeader("Access-Control-Allow-Origin",
        // "RETAIN_UNIQUE"))
        //                    .uri("lb://notification-service"))
        .build();
  }
}
