FROM openjdk:17-slim
WORKDIR /app
ADD build.gradle /app/
RUN /app/gradlew build -x test --parallel --continue > /dev/null 2>&1 || true

# 이것은 테스트 브랜치에서만 보입니다.

COPY . /app
RUN /app/gradlew clean build --no-daemon
CMD java -jar build/libs/*.jar
