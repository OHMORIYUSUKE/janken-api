# janken-api

Perl 入学式の成果物のサンプルです。

## 動かす方法

`frontend/index.html`をそのまま開いてじゃんけんを行う。

適宜、自分の Perl のじゃんけん API に合わせて URL の変更を行う。

```js
fetch('http://localhost/janken', { // 送信先URL
```

## カスタマイズする場所

(例)

### API 側(じゃんけんのロジックを書く)

`backend/main.pl`のじゃんけんのロジックを改造する。

### ゲーム側(じゃんけんの演出を書く)

`frontend/index.html`を書き換える。勝ち負けによって演出を変える。
`frontend/main.css`でデザインを書く。
`frontend/main.js`でじゃんけんの演出を変える。

## `curl`で POST する例

```sh
$ curl -X POST -H "Content-Type: application/json" -d '{"jibun":"0"}' http://localhost/
{"aite":2,"hantei":1,"jibun":0}
```
