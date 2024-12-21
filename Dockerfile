# Specify the base image
FROM amazonlinux:2

# Define the maintainer of this Dockerfile
LABEL maintainer="Sumera <syedasumera366y@gmail.com>"

# Set the working directory inside the container
WORKDIR /var/lib/jenkins/workspace/jenkinsjob2

# Copy the Maven configuration file
COPY pom.xml ./

# Pre-download Maven dependencies to improve build times
RUN mvn dependency:resolve

# Update all installed packages
RUN yum update -y && \
    yum install -y java-11-amazon-corretto maven

# Install Java 11 (Amazon Corretto version)
RUN yum install java-11-amazon-corretto -y

# Copy all project files into the container
COPY . .

# Install Maven
RUN yum install maven -y
