# Use a base image with Java and Hadoop installed
FROM openjdk:8-jdk

# Set up environment variables
ENV JAVA_HOME /Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
ENV HADOOP_HOME /opt/my-hadoop
ENV PATH $PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin

# Create a directory in the image for Hadoop and set it as the working directory
WORKDIR $HADOOP_HOME

# Copy your Hadoop configuration directory into the image
# COPY /opt/homebrew/Cellar/hadoop/3.3.6/libexec/etc/hadoop $HADOOP_HOME/etc/hadoop
COPY . /opt/my-hadoop/

# Expose Hadoop ports if necessary
EXPOSE 9870 19888 8088

# Copy entrypoint script
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

