### データ構造
#### Userモデル
|カラム名|データ型|
|:--:|:--:|
|id|integer|
|name|string|
|e-mail|string|
|password_digest|string|
#### Taskモデル
|カラム名|データ型|
|:--:|:--:|
|id|integer|
|user_id(FK)|references|
|title|string|
|content|text|
|deadline|date|
|priority|string|
|status|string|
___
### herokuを使ったデプロイ
[herokuを簡単にまとめてみた！](https://tetoracode.hatenablog.com/entry/2020/01/14/004248?_ga=2.45261732.1405383801.1579141739-1727489939.1578576078)
