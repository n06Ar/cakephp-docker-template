# CakePHP Docker template

## これはなんですか？

Dockerを使ったCakePHPが動作する環境です。

Nginxは別途用意する想定です。  
使う方は適宜追加してください。

## How to use?

### CakePHPのインストール

CakePHPをインストールする場合は、VERSIONを指定して次のコマンドを実行してください。

VERSIONは入力しないと、4系がインストールされます。  
3.8系を利用する場合は`VERSION=3.8.*`と入力してください。
初期値は、4系がインストールされるようになっています。

```bash
$ make cakephp/install VERSION={version}
```
### Composerでライブラリのインストール

もしライブラリをインストールする場合は、下記のコマンドを実行してください。

```bash
$ make composer/install
```

### CakePHPのbuild in serverの起動

CakePHPのbuild in serverの起動をする時は、下記のコマンドを実行してください。  
このコマンドでMySQLサーバも立ち上がるので、純粋に起動したい場合はこちらを基本的に使用してください。

```bash
$ make cakephp/server/start
```

### Dockerのイメージの終了

Dockerイメージを終了する場合は、次のコマンドを実行してください。

```bash
$ make down
```

### Migrateの実行

Migrateを実行する場合は、下記のコマンドを実行してください。

```bash
$ make cakephp/migrate
```

### 起動しているDockerのイメージを操作

起動しているDockerのイメージを操作する場合は、次の二つのどちらかを使用してください。  
必要であればSERVICEとCOMMANDも入力してください。

未入力時の場合
- SERVICE = php
- COMMAND = bash

```bash
$ make exec SERVICE={php or mysql} COMMAND={command}
```

```bash
$ make run SERVICE={php or mysql} COMMAND={command}
```
