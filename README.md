# Browser MCU Pack

* Browser MCU Pack is Docker container for [Bowser MCU Server](https://github.com/mganeko/browser_mcu_server) and headless browser MCU
* Browser MCU Pack is using [Browser MCU Core](https://github.com/mganeko/browser_mcu_core) library 
* Browser MCU Pack is using Chrome s headless browser, running in docker container
* Browser MCU Pack is using Dockerfile of [justinribeiro/chrome-headless](https://hub.docker.com/r/justinribeiro/chrome-headless/)
* Browser MCU Pack is simple example of multi participants meeting with single room, with headle browser MCU
* Browser MCU Pack is a part of [Browser MCU Series](https://github.com/mganeko/browser_mcu)
* --
* Browser MCU Pack は[Bowser MCU Server](https://github.com/mganeko/browser_mcu_server)とヘッドレスブラウザを使ったMCUをセットにしたDockerコンテナです
* Browser MCU Pack は[Browser MCU Core](https://github.com/mganeko/browser_mcu_core) ライブラリを利用しています
* Browser MCU Pack は Chromeのヘッドレスブラウザーモードを利用しています
* Browser MCU Pack は [justinribeiro/chrome-headless](https://hub.docker.com/r/justinribeiro/chrome-headless/) のDockerfileの記述を利用しています
* Browser MCU Pack は複数人の会議室を1つだけ持つサンプルを、手軽に実行できるようにしたものです
* Browser MCU Pack は [Browse MCU シリーズ](https://github.com/mganeko/browser_mcu)の一部です

## Confirmed Environment / 動作確認環境

* Docker 17.06


## Preparation / 準備

#### Install / インストール

```
$git clone https://github.com/mganeko/browser_mcu_pack.git
$docker build -t mganeko/browser_mcu_pack .　
```

or 

```
$docker pull mganeko/browser_mcu_pack
```


## run / 実行

### without Chorme reomote debug  / Chromeのリモートデバッグを無効にする場合

```
docker run -d -p 3000:3000 --cap-add=SYS_ADMIN mganeko/browser_mcu_pack
```

node process for web/signaling server, and headless browser process will start


### with Chorme reomote debug  / Chromeのリモートデバッグを有効にする場合

```
docker run -d -p 9222:9222 -p 3000:3000 --cap-add=SYS_ADMIN mganeko/browser_mcu_pack
```

node process for web/signaling server, and headless browser process will start


* WARNING: Remote debug from any ip address is possible. PLEASE DO NOT use in public network
* 注意: あらゆるIPアドレスのマシンからリモートデバッグに接続可能です。公開された環境では利用しないでください


### Access from Client Browser / ブラウザからの接続

* open http://localhost:3000/ with Chrome/Firefox
* click [Start Video] button to access Camera/Microphone
* click [Connect] button to connect to MCU, and join the meeting
* click [Disconnect] button to leave the meeting
* click [Stop Video] button to stop Camera/Microphone
* --
* Chrome/Firefoxブラウザで、http://localhost:3000/ を開きます
* [Start Video]ボタンをクリックし、カメラ/マイクを取得します
* [Connect]ボタンをクリックすると、MCUに接続し会議に参加できます
* [Disconnect]ボタンをクリックすると、会議から退出します
* [Stop Video]ボタンをクリックすると、カメラ/マイクを停止します


## License / ライセンス

* Browser MCU Pack is under the MIT license
* Browser MCU Pack はMITランセンスで提供されます

## To Do
