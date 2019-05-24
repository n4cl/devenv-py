devenv-py
==
Pycharm + docker で Python お手軽開発環境構築

### コンテナの作成
```
docker build ./ -t devenv-py:1.0
docker run -d --rm --name [CONTAINER NAME] -p 2222:22 devenv-py:1.0
```

### Pycharm のリモート設定
1. リモートで利用するPythonの設定
![pycharm01](https://user-images.githubusercontent.com/5583062/58305133-ef9c3580-7e31-11e9-897e-4c71aeb4a822.png)
2. リポジトリのデプロイ設定
![pycharm02](https://user-images.githubusercontent.com/5583062/58305385-db0c6d00-7e32-11e9-97a7-ea72a6cf73af.jpg)
![pycharm03](https://user-images.githubusercontent.com/5583062/58305435-0f802900-7e33-11e9-8e5c-33f29c6f9e5d.jpg)