FROM debian:bookworm-slim

RUN apt clean && apt update && apt upgrade -y

RUN apt install -y curl \
                   openjdk-17-jdk \
                   unzip \
                   dos2unix

COPY ./pet-health-app-client /home/pet-health-app-client
RUN dos2unix /home/pet-health-app-client/gradlew

# Gradle のセットアップ
WORKDIR /opt/gradle

RUN curl -OL http://services.gradle.org/distributions/gradle-8.4-bin.zip && \
    unzip gradle-8.4-bin.zip

ENV GRADLE_HOME=/opt/gradle/gradle-8.4
ENV PATH=${GRADLE_HOME}/bin:${PATH}

# Android Studio コマンドラインツール のセットアップ
ENV ANDROID_HOME=/opt/cmdline-tools

RUN curl -o cmdline-tools.zip  https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip && \
    mkdir -p /opt/cmdline-tools && \
    unzip cmdline-tools.zip -d ${ANDROID_HOME} && \
    mv ${ANDROID_HOME}/cmdline-tools ${ANDROID_HOME}/latest
ENV PATH=${ANDROID_HOME}/latest/bin:${PATH}

COPY ./init.sh /home
RUN chmod +x /home/init.sh
CMD ["/home/init.sh"]
#CMD ["tail","-f","/dev/null"]