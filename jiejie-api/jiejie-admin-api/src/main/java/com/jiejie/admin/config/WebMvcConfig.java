package com.jiejie.admin.config;

import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.resource.PathResourceResolver;

import java.io.IOException;

/**
 * Web MVC 配置
 * 处理前端 SPA 路由，将所有非静态资源、非API请求转发到 index.html
 */
@Configuration
@RequiredArgsConstructor
public class WebMvcConfig implements WebMvcConfigurer {

    private final DemoModeInterceptor demoModeInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 注册演示模式拦截器
        registry.addInterceptor(demoModeInterceptor)
                .addPathPatterns("/api/**")
                .order(0);  // 优先级最高
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // 1. 针对 Vite 产物 (/assets/** 带内容 Hash)，配置 365 天不可变强缓存 (Cache-Control: public, max-age=31536000, immutable)
        // 配合 Cloudflare CDN 边缘节点，将实现 HIT 秒级近邻分发
        registry.addResourceHandler("/assets/**")
                .addResourceLocations("classpath:/static/assets/")
                .setCacheControl(org.springframework.http.CacheControl.maxAge(365, java.util.concurrent.TimeUnit.DAYS).cachePublic().immutable())
                .resourceChain(true);

        // 2. 针对普通静态图片、图标配置 7 天缓存
        registry.addResourceHandler("/favicon.ico", "/vite.svg", "/logo.svg")
                .addResourceLocations("classpath:/static/")
                .setCacheControl(org.springframework.http.CacheControl.maxAge(7, java.util.concurrent.TimeUnit.DAYS).cachePublic())
                .resourceChain(true);

        // 3. 配置通用静态资源及前端 SPA 路由（针对 index.html 设置 no-cache，确保发布新版本时用户秒级加载最新资源）
        registry.addResourceHandler("/**")
                .addResourceLocations("classpath:/static/")
                .setCacheControl(org.springframework.http.CacheControl.noCache())
                .resourceChain(true)
                .addResolver(new PathResourceResolver() {
                    @Override
                    protected Resource getResource(String resourcePath, Resource location) throws IOException {
                        Resource requestedResource = location.createRelative(resourcePath);
                        
                        // 如果请求的资源存在，直接返回
                        if (requestedResource.exists() && requestedResource.isReadable()) {
                            return requestedResource;
                        }
                        
                        // 如果是 API 请求、WebSocket、文件上传或 Warm-Flow 路径，不处理（交给 Controller）
                        if (resourcePath.startsWith("api/")
                                || resourcePath.startsWith("ws/")
                                || resourcePath.startsWith("uploads/")
                                || resourcePath.startsWith("warm-flow/")
                                || resourcePath.startsWith("warm-flow-ui/")) {
                            return null;
                        }
                        
                        // 其他请求返回 index.html（SPA 路由）
                        return new ClassPathResource("/static/index.html");
                    }
                });
    }
}
