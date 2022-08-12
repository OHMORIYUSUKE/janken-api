use Mojolicious::Lite;

# ルーティングのパターンの指定
post '/' => sub {
  my $self = shift;
  
  # パラメーターの受け取り
  my $req = $self->req;
  my $data = $req->json;
  my $jibun = $data->{"jibun"};
  
  # グー: 0, チョキ: 1, パー: 2
  my $aite = 1;
  $aite = my $num = int(rand(3));
  # 勝ち:2 , 負け: 1, あいこ: 0
  my $hantei = 1;
  $hantei = ($jibun - $aite + 3) % 3;

  my $data_res = {hantei => $hantei, jibun => $jibun, aite => $aite};

  $self->render(json => $data_res);
};

app->start;