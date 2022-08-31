use Mojolicious::Lite;

# ルーティングのパターンの指定
post '/janken' => sub {
  my $self = shift;
  # javascriptのためにおまじない
  $self->res->headers->header('Access-Control-Allow-Origin' => '*'); 
  
  # パラメーターの受け取り
  my $json = $self->req->json;
  # $jibunに0~2が入る
  # グー: 0, チョキ: 1, パー: 2
  my $jibun = $json->{"jibun"};
  
  # TODO
  # じゃんけんのロジックを書きましょう
  # ....

  # レスポンスのデータを作成
  # hantei 勝ちか負けか (例)人間の勝ち 0, CPUの勝ち 1, 引き分け 2
  # jibun 人間の手
  # aite CPUの手
  my $hantei = 1;
  my $aite = 1;
  my $data_res = {hantei => $hantei, jibun => $jibun, aite => $aite};
  
  # jsonをレスポンスとして返す
  $self->render(json => $data_res);
};

app->start;