FROM debian:bookworm-slim

RUN apt clean && apt update && apt upgrade -y

RUN apt install -y curl \
                   openjdk-17-jdk \
                   unzip

COPY ./pet-health-app-client /home/pet-health-app-client

# Gradle の設定
WORKDIR /opt/gradle

RUN curl -OL http://services.gradle.org/distributions/gradle-8.4-bin.zip && \
    unzip gradle-8.4-bin.zip

ENV GRADLE_HOME=/opt/gradle/gradle-8.4
ENV PATH=${GRADLE_HOME}/bin:${PATH}

# Android Studio コマンドラインツール
WORKDIR /opt/AndroidStudio

RUN curl -o ./cmdline-tools.zip  https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip && \
    unzip cmdline-tools.zip
ENV ANDROID_HOME=/opt/AndroidStudio/cmdline-tools
ENV PATH=${ANDROID_HOME}/bin:${PATH}

COPY ./init.sh /home
RUN chmod +x /home/init.sh
CMD ["/home/init.sh"]
#CMD ["tail","-f","/dev/null"]