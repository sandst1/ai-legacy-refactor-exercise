# Base image with Java 8 and Tomcat
FROM tomcat:8-jdk8

# Set working directory
WORKDIR /app

# Update GPG keys and configure apt
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get update --allow-insecure-repositories && \
    apt-get install -y --allow-unauthenticated ca-certificates gnupg default-mysql-client && \
    apt-key update && \
    apt-get update --allow-insecure-repositories

# Install Ant with authentication bypassed
RUN apt-get install -y ant && \
    rm -rf /var/lib/apt/lists/*

# Copy application files
COPY . /app

# Copy and make wait-for-it.sh executable
COPY wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh

# Create lib directory and copy dependencies
RUN mkdir -p /app/lib && \
    wget -P /app/lib https://repo1.maven.org/maven2/org/apache/struts/struts-core/1.3.10/struts-core-1.3.10.jar && \
    wget -P /app/lib https://repo1.maven.org/maven2/org/apache/struts/struts-taglib/1.3.10/struts-taglib-1.3.10.jar && \
    wget -P /app/lib https://repo1.maven.org/maven2/javax/servlet/javax.servlet-api/3.1.0/javax.servlet-api-3.1.0.jar && \
    wget -P /app/lib https://repo1.maven.org/maven2/commons-beanutils/commons-beanutils/1.9.4/commons-beanutils-1.9.4.jar && \
    wget -P /app/lib https://repo1.maven.org/maven2/commons-logging/commons-logging/1.2/commons-logging-1.2.jar && \
    wget -P /app/lib https://repo1.maven.org/maven2/commons-digester/commons-digester/2.1/commons-digester-2.1.jar && \
    wget -P /app/lib https://repo1.maven.org/maven2/commons-chain/commons-chain/1.2/commons-chain-1.2.jar && \
    wget -P /app/lib https://repo1.maven.org/maven2/commons-collections/commons-collections/3.2.2/commons-collections-3.2.2.jar && \
    wget -P /app/lib https://repo1.maven.org/maven2/mysql/mysql-connector-java/5.1.49/mysql-connector-java-5.1.49.jar && \
    wget -P /app/lib https://repo1.maven.org/maven2/javax/servlet/jstl/1.2/jstl-1.2.jar && \
    wget -P /app/lib https://repo1.maven.org/maven2/taglibs/standard/1.1.2/standard-1.1.2.jar && \
    wget -P /app/lib https://repo1.maven.org/maven2/commons-validator/commons-validator/1.3.1/commons-validator-1.3.1.jar

# Build the application inside the Docker image
RUN ant -debug -verbose -f build.xml

# Optional: Verify that the WAR file exists
RUN ls -l /app/dist/

# Deploy the WAR file within the Docker image
RUN cp /app/dist/*.war /usr/local/tomcat/webapps/

# Expose port
EXPOSE 8080

# Override the default CMD to use wait-for-it
CMD ["/wait-for-it.sh", "db", "catalina.sh", "run"]
