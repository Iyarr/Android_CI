# AndroidにおけるCI環境の構築

Github ActionsによるAndroid Studioで開発したアプリのテストをするための環境を構築する
また、ビルドやプラグインなど開発で使われるツールの仕組みなども知っておきたい

## Gradle

## Android SDK

Android OS のバージョンごとにあるAPIのキット
スマホアプリと本体の間で通信をやり取りしたり、本体の機能を使うためのツールなどが含まれている
開発の際にはどのバージョンまで対応するかを決める。新しいOSは古いAPIでもある程度は対応する
しかし古いOSは新しいAPIには対応していないため、APIが新しすぎると古いOSのAndroidに対応しなくなってしまう

## JDK

Javaをビルドするためのキット


## 使用するDockerコマンド

### build

```bash
docker build . -t androidci --progress=plain
```

### run

```bash
docker run --name androidci -d androidci
```


