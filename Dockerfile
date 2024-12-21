# Use the Amazon Linux 2 base image
FROM amazonlinux:2

# Define the maintainer
LABEL maintainer="Nadia <nadiasultana6281@gmail.com>"

# Set the working directory inside the container
WORKDIR /home/ec2-user

# Update the package manager and install required dependencies (Java 11 and Maven)
RUN yum update -y && \
    yum install -y java-11-amazon-corretto maven

# Copy the Maven configuration file (pom.xml)
COPY pom.xml ./

# Pre-download Maven dependencies to improve build times
RUN mvn dependency:resolve

# Copy the rest of the project files into the container
COPY . .

# Default command (optional, useful for testing)
CMD ["mvn", "clean", "install"]

