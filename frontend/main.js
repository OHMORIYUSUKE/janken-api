function gu() {
    api(0);
}
function tyoki() {
    api(1);
}
function pa() {
    api(2);
}

// apiにデータを送信
function api(jibun) {
    const data = {"jibun": jibun};
    fetch('http://localhost/janken', { // 送信先URL
        method: 'post', // 通信メソッド
        header: {
            'Content-Type': 'application/json' // JSON形式のデータのヘッダー
        },
        body: JSON.stringify(data) // JSON形式のデータ
    })
    .then(response => response.json()) // レスポンスをjsonに変換
    .then(data => {
        // ログを出力
        console.log(data);

        // 画像を変化させる処理
        document.getElementById("cpuHand").src = "./images/"+data.aite+".png";
        document.getElementById("youHand").src = "./images/"+data.jibun+".png";

        // アラートを出す処理
        // 勝ち負けを表示
        if (data.hantei == 0){
            window.alert("あなたの勝ち");
        }else if(data.hantei == 1){
            window.alert("CPUの勝ち");
        }else{
            window.alert("引き分け");
        }
    })
    .catch(err => {
        // エラー処理
        window.alert("エラーです");
        console.log(JSON.stringify(err));
    });
}