use Mojolicious::Lite;

# ルーティングのパターンの指定
post '/janken' => sub {
  my $self = shift;
  # javascriptのためにおまじない
  $self->res->headers->header('Access-Control-Allow-Origin' => '*'); 
  
  # パラメーターの受け取り
  my $json = $self->req->json;
  # $jibunに0~2が入る
  my $jibun = $json->{"jibun"};
  
  # グー: 0, チョキ: 1, パー: 2
  my $aite = int(rand(3));
  # 人間の勝ち:2 , 負け: 1, あいこ: 0
  my $hantei = ($jibun - $aite + 3) % 3;

  # 勝ち負けのメッセージ(CPU視点)
  my $message = "";
  if($hantei == 2){
    $message = "負けたー";
  }elsif($hantei == 1){
    $message = "僕の勝ちー";
  }else{
    $message = "引き分けー";
  }

  # レスポンスのデータを作成
  my $data_res = {hantei => $hantei, message => $message, jibun => $jibun, aite => $aite};
  
  # jsonをレスポンスとして返す
  $self->render(json => $data_res);
};

app->start;