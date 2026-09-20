# Stage 1: Build Frontend (Vue 3 + Vite)
FROM node:20-alpine AS frontend-builder
WORKDIR /app/jiejie-ui

# Install dependencies
COPY jiejie-ui/package*.json ./
RUN npm install

# Build frontend to jiejie-starter/src/main/resources/static
COPY jiejie-ui/ ./
RUN npm run build

# Stage 2: Build Backend (Maven + Eclipse Temurin 17)
FROM maven:3.9-eclipse-temurin-17-alpine AS backend-builder
WORKDIR /app

# Copy maven definition and source files
COPY pom.xml ./
COPY jiejie-common ./jiejie-common
COPY jiejie-infra ./jiejie-infra
COPY jiejie-core ./jiejie-core
COPY jiejie-api ./jiejie-api
COPY jiejie-job ./jiejie-job
COPY jiejie-starter ./jiejie-starter

# Copy freshly built frontend static assets
COPY --from=frontend-builder /app/jiejie-starter/src/main/resources/static ./jiejie-starter/src/main/resources/static

# Package fat jar
RUN mvn clean package -DskipTests -pl jiejie-starter -am

# Stage 3: Runtime
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

# Set timezone
ENV TZ=Asia/Shanghai
RUN apk add --no-cache tzdata && cp /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Copy fat jar
COPY --from=backend-builder /app/jiejie-starter/target/jiejie-starter.jar app.jar

# JVM options optimized for Render 512MB RAM free tier
ENV JAVA_OPTS="-Xms128m -Xmx300m -XX:+UseSerialGC -XX:MaxMetaspaceSize=128m -Xss512k -Djava.security.egd=file:/dev/./urandom"
ENV SPRING_PROFILES_ACTIVE=prod
ENV PORT=8080

EXPOSE 8080

ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar --server.port=${PORT}"]
