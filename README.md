# README

* 目的
  * web上にあるslim表記をerbファイルにコピペするのを助ける
* 説明
  * slim表記をerbに変換します
* 制限
  * [Class: Slim::ERBConverter](https://www.rubydoc.info/gems/slim/Slim/ERBConverter)を叩いているだけです。そのままで使えない場合があります。過大な期待せず適宜修正して使ってみてください。
* その他
  * 自由に改変して結構です

# 手順
```
docker-compose up -d
docker-compose exec web rails db:create
docker-compose exec web rails db:migrate
```

# 検証

[localhost:3000](http://localhost:3000)にアクセスして接続してください。フォームにslim表記を入力してsubmitするとerbに変換されます。


# 終了方法

```aidl
> docker-compose exrc web down
```

