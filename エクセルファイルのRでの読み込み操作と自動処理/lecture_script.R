
#LEC:01-01 本コースの全体像==================

#SLIDE:1-4

#LEC:01-02 プロジェクトの作成=================

#SLIDE:5-7

#LEC:01-03 データの準備=======================

#SLIDE:8-9

#LEC:01-04 STEP1保存先ディレクトリの作成―全体像―　===============

#SLIDE:11-16

#LEC:01-05 STEP1保存先ディレクトリの作成―ディレクトリの有無を確認(dir.exists)―　===============

## dir.exists():ディレクトリの有無を確認する

#まずはスライドにもあったように、出力したいフォルダを決めましょう。
#今回は、.Rprojがあるディレクトリにあるoutputという
#名前のフォルダに出力していくとします。

#一応、現在のワーキングディレクトリがどこにあるのかを
#調べておきましょう

getwd()

#では、フォルダがあるかを
#しらべましょう（今は「ない」ので）

dir.exists("output")
#はFALSEが返ってくるはずです。

#dir.exists関数で、
#outputという名前のディレクトリ(フォルダ)は
#「ない」（FALSE)という結果が返って
#きました。

#ちなみに、ダウンロードしたデータがある
#demodataフォルダはどうでしょうか？

dir.exists("demodata")

#demodataフォルダは「ある」ので、
#file.exist関数はTRUEを返し、

#outputフォルダは「ない」ので、
#file.exists関数はFALSEを返しました。

#簡単ですね？

#注：ここで、
#「関数」の意味が分からない、
#「ディレクトリ」の意味がわからない
#TRUE、FALSEってなに？という方は
#「医師が教えるR言語での医療データ分析入門」を見てください。

#この次の動画では、この関数を利用して、
#Rでの条件分岐の考え方を説明します。

#LEC:01-06 STEP1保存先ディレクトリの作成―条件分岐の考え方(if(){}else{})―　===============

#SLIDE:14

#ここでは条件分岐について説明します。

#まずは書き方をみてみましょう
logical_value <- TRUE

if (logical_value){
  #TRUEな場合の処理
}else{
  #FALSEな場合の処理
}

#複雑にみえますね？

#次に簡単な動きを見てみましょう

print("プリント関数の中身はコンソールにプリントされるよ")

#このようにprint関数を使うと、
#そのスクリプトが動作したかをコンソール画面で
#確認することができるので、これを使ってif elseの
#動作を確認してみましょう。


if(FALSE){
  print("最初の｛　｝内が実行されているよ")
}else{
  print("次の｛　｝内が実行されているよ")
}


if(TRUE){
  print("TRUEならこっちが動く")
}else{
  print("TRUEなのでこちらは動かない")
}

nanika <- FALSE

if(nanika){
  print("nanikaはTRUEなのでこっちが動きます")
}else{
  print("nanikaはFALSEなので、こっちが動きました")
}

#nanika <- FALSE で再度実行してみると。。。

#いかがでしょうか？if else の記載方法について理解できましたか？
#それではミニ課題です

#次の動画に進む前に、
#「WDにoutputというフォルダがある場合、
#　　コンソール画面に：outputフォルダがあるよ」
#ない場合に、　　　　：outputフォルダはないよ
#と表示するスクリプトを書いてみてください
#できますか？

#LEC:01-07 STEP1保存先ディレクトリをRで作成―ミニ課題の解答―　===============

## 条件分岐のミニ課題解答
#できましたか？答えは次のような感じです。









if( file.exists("output") ){
  print("outputフォルダがあるよ")
}else{
  print("outputフォルダはないよ")
}

#ここでは、file.exists()関数を実行した場合の
#返り値としてTRUEかFALSEが返ってくるということが
#ポイントとなります。

#TRUEかFALSEと「解釈できる」もの以外を入れた場合はエラー
#がおこります

#どんなエラーが返ってくるかも新しい関数を見た場合に
#実験しておくのはよいプラクティスだと思うので、
#一度見ておきましょう

if( "I'm character" ){
  print("one")
}else{
  print("two")
}

#エラーがおこりました。
#文章を読むと「アーギュメントはロジカル型として
#解釈できません」と怒られています。

#では、いろいろと実験してみましょう

if( "TRUE" ){
  print("one")
}else{
  print("two")
}

#！？動く！？　実は、文字列型で"TRUE"と"FALSE"とした場合は動きます

if( "FALSE" ){ print("one") }else{ print("two") }

if("F"){print("TTTTT")}else{print("NOT T")}

#他にも
if(  0 ){ print("one") }else{ print("two") }
if(  1 ){ print("one") }else{ print("two") }
if(  2 ){ print("one") }else{ print("two") }
if(  3 ){ print("one") }else{ print("two") }
if( -1 ){ print("one") }else{ print("two") }


# という風に、数字が0の場合はFALSEと扱われますが、
# 0以外の数字であればすべてTRUEと扱われるので注意が必要です

if( 0.001 ){ print("one") }else{ print("two") }

#もちろん、0に近い数字でも、0でなければTRUEです。

#ちょっとトリッキーな動きをするので、文字列型はたいていエラー
#それ以外だと、ほとんどTRUE
#FALSEとなるのは、
#　ロジカル型　FALSE
#　文字列型　　”FALSE”　もしくは　"F"
#　数字型　　　0
#という認識をしていただくとよいです



#LEC:01-08 STEP1保存先ディレクトリをRで作成―ディレクトリの作成― ======

#ディレクトリを作成するのは、dir.create関数です。

#練習
dir.exists("practice")
dir.create("practice")
dir.exists("practice")

#このようなコードで、
#「あるフォルダがあるかどうかを調べて、
#なければ作る」という機能をもつスクリプトを
#書くことができます

#ミニ課題：
#それでは、ひとつ前の動画のif else と組み合わせて、
#outputフォルダがなければ作り、あれば何もしない
#というスクリプトを書いてみましょう。













#答え：
if( dir.exists("output") ){
  #do nothing
}else{
  dir.create("output")
}

#ちなみに、次のどれも同じことを実行します

#!でTRUEFALSEを反転させてみる
#
#！記号をTRUEやFALSEの前につけることで、反転させることが
#できます

TRUE
!TRUE

FALSE
!FALSE

buf <- TRUE
!buf

#ということで

if( !dir.exists("output") ){
  dir.create("output")
}else{
  #do nothing
}

#できましたか？
#次の動画ではdir.createの挙動について色々と実験しておきます

#LEC:01-08 STEP1保存先ディレクトリをRで作成―ディレクトリの作成― =====
#
#ここではdir.createの挙動をいろいろと実験してみます
#新しい関数を学んだら、どんなことができるのかを
#確認しておくと引き出しが広がり、やりたいこと
#をより楽にできるようになる可能性があがります
#
#それではまずは、helpを読みましょう
 ?dir.create

#Argumentsはpath paths showWarnings recursive mode use_unmask
#です
#Detailを読むと
#　dir.createはpathの最後のエレメントを作成
#　ただし、recursive = TRUE なら別
#　パスは相対的なパスで解釈される
#　なお、modeはWindowsでは無視されます
#　
#　Windowsの問題としてはG.s.というディレクトリを
#　作成しようとすると、成功と表示されるが
#　G.sという名前（別の名前のディレクトリ)が
#　作成されることがあるので注意が必要
#　スペースが前後にある名前は避けましょう
#　（"dirname  "のような名前)
#　
#　のこりはmodeの話なのと読み込みのみに限定するような
#　話なので略
#　
#ながながと説明をしましたが、
#こんな感じでhelpファイルを読み込めるようになると
#良い感じです。
#
#さて、

#すでにあるディレクトリを作成しようとすると？
a <- dir.create("practice")

a
#FALSEという値が返ってきました

#ということは、
cars

write.csv(cars, "practice/cars.csv")
#という風にCSVファイルを置いている場合に
#新しいディレクトリを作成しようとしても

dir.create("practice")
#置き換えられたりはしません。

#ということで、実はわざわざif elseであるかないかを
#調べて実行しなくても、
#あったら警告のみ、なければ作るという挙動を示すので

dir.create("practice", showWarnings = TRUE)

#としておいても結果は変わりません！
#if elseの詳細な説明と理解のために
#あえて調べて行うという形での解説を行いました
#今後は、dir.createでわざわざ調べて作成するという
#風には記載しません

#後、recursiveの説明をしてこの動画を終わります
#
#ディレクトリを作成する場合によくやりたいことと
#して、深い層にディレクトリをつくりたいという
#場合があります

#例えば、practice2/20190106/jikken1
#のように結果を日付別のフォルダに保存する
#というような利用例です

dir.create("practice2/20190106/jikken1")

#つくれませんというエラーがでて怒られました
#これは、ヘルプファイルにもあった通り、
#jikken1というフォルダを作ろうとしたけど
#practice/20190106というディレクトリがない
#ため、見つかりませんと返しています
#
#そのため、

dir.create("practice2/20190106/jikken1", 
           recursive = TRUE)

#としてあげることで、深いフォルダも問題なく作ること
#ができました！
#
#以上で、dir.createの使い方の説明を終了します
#次からは、STEP2へと進んでいきます！！


#LEC:01-09 STEP2ファイル読み込み―スライドの解説― =====

# 

#LEC:01-11 STEP2ファイル読み込み―list.filesの説明― =====

#ここではフォルダにおいてあるファイル名をすべて取得する方法について解説していきます。

list.files()
#でフォルダにあるファイル名をすべて取得できます。特に引数を指定しない場合は、ワーキングディレクトリにある情報を取得できます
#
?list.files

#で色々と抽出する際の条件を確認できますが
#よく使うものを中心に、まずは簡単にご説明いたします

#パターンマッチング:
#　特定の名前や拡張子がついたファイルだけを取得したい!

list.files(pattern="\\.R$")

# patternというアーギュメントに「\\.拡張子$」という正規表現を与えてあげることで最後の文字列が拡張子であるものを拾うことができます。
# 
# 細かく解説すると
# \\. で「.」(\\がついていないと、「.」単独はどんな文字でも正規表現としてあたります)
# R$で、末尾にRという文字があること、
# という指定になります
# 他、.csvを当てたければ
# 　　「\\.csv$」
# という感じです。
# 
# （正規表現については「医師が教えるR言語によるデータ分析入門」にて説明しています。はじめて聞いたという方は是非参考にしてみてください）

#では続けていきましょう。

filelist <- list.files("demodata")

filelist
head(filelist)

#このような形でファイルを取り出すことに成功しました
#次の動画からは、[]を利用して要素にアクセスする方法
#について解説していきます

#LEC:01-12 STEP2ファイル読み込み―[]を利用した要素へのアクセス1― =====
#
## []でのベクトルからの文字列取り出し-----------------
# 現在、filelistには多数のファイル名が
#保存されています。
# このファイル名は文字列のベクトルとして保存されて
# おり、このベクトルから一つ目のファイル名を
# とりだすには、

filelist[1]

#という記載でとりだせます。

filelist[1:3] #これで1番目から3番目
filelist[3:4] #これで3番目から4番目
filelist[-1:-2] #マイナスをつけると除外です。

#ベクトルがかえってくるので、次のように組み合わせることも
#できます。
filelist[5:8]
filelist[5:8][2:3]

#わかりにくければ、
a <- filelist[5:8]
a[2:3]

#同じ結果ですね？

#[]の中には、数字のベクトルであれば何でもOKなので、
filelist[c(1,3,10)]

## []でのベクトルからの文字列取り出し2-----------------
#[]の中には数字以外にもロジカルなベクトルを入れても
#動作します

v <- c(1:5)
v

#    1     2     3     4     5
v[ c(TRUE ,TRUE ,TRUE ,TRUE ,TRUE ) ]
v[ c(TRUE ,TRUE ,FALSE,TRUE ,TRUE ) ]
v[ c(TRUE ,FALSE,TRUE ,TRUE ,TRUE ) ]

#ところで、ベクトルは「勝手に穴埋めしてくれる」ので
v[ c(TRUE ,TRUE ,TRUE ,TRUE ,TRUE ) ]　#これと
v[TRUE]　　　　　　　　　　　　　　　　#これは同じです！

#他にも、
v[ c(TRUE ,FALSE,TRUE ,FALSE,TRUE ) ]
v[ c(TRUE ,FALSE)]
#    TRUE  FALSE TRUE  FALSE TRUE FALSE ... と穴埋め

v[ c(FALSE,TRUE ,FALSE,TRUE ,FALSE) ]
v[ c(FALSE,TRUE )]
#    FALSE TRUE  FALSE TRUE  FALSE TRUE  FALSE ...と穴埋め

v[ c(TRUE, FALSE, FALSE)]

#このベクトルの特性の何が嬉しいのかというと、

#ロジカルなベクトルと組み合わせるという話から、
#stringrパッケージとの併用も考えられます。
#
#次の動画では引き続き[]の利用についてと、理解するとかなり有用な%in%という書き方について解説していきます。

#LEC:01-12 STEP2ファイル読み込み―[]を利用した要素へのアクセス3 
#　と　%in% の利用― =====

#引き続き、[]の解説です。ここでは、
#LETTERSというRに組み込まれている変数を使ってみましょう。
v2 <- LETTERS
?LETTERS

v2
#ということでv2には、アルファベットが収納されています
library(tidyverse)
#(str_～～関数については、前のコースで説明してあるのでわからない
#方は前のコースへ）

str_detect(v2, "^A$|^B$|^X$")　#AかBかXであればTRUEを返す

v2[ str_detect(v2, "^A$|^B$|^X$") ]


#まあ、このように抜き出したい文字列を指定する場合
#わざわざstr_detectを使わないでも、 %in% を
#利用すると楽です
#
#%in%は左側のベクトルの要素が右側にあるかを調べて、あればTRUE、なければFALSEをかえしてくれます。

v2 %in% c("A","B","G")

v2[v2 %in% c("A","B","G")]

c("A","B","G") %in% LETTERS
# %in% は左側の要素の数のTRUE FALSEが返ってくると
# イメージしておけばどっちがどっちかを忘れにくく
# なるのでお勧めです。

#次の動画からは、（スライド19へ）を実効するための手順を説明します。

#LEC:01-13 STEP2ファイルの読み込み―文字列の結合― =====

## データの取得/加工とデータ内容の蓄積（文字列の結合)-----------------------

#それでは、1番目のファイルのデータを取り込みます。
library(tidyverse)
library(readxl)

#もし、tidyverse、readxlがインストールされていない場合は

#install.packages("tidyverse")
#install.packages("readxl")

#でインストールしてください。

#取り込みたいファイルへのパス（場所）をつくります。
filelist     <- list.files("demodata")
targetfile   <- filelist[1]　#（一つ前の動画の知識です）
path_to_file <- file.path("demodata",targetfile)


#path_to_fileに、取り込みたいふファイルへのパスが作成されました！
#

#file.path関数はファイルの場所等のディレクトリを指定する文字列をくっつけるための関数です。

#文字列操作を行う場合にTidyverseの中では、stringrパッケージを頻繁に利用しますが、標準機能(base)にもいろいろな方法があります

#ここでは、baseとstringrの違いを少しみておきましょう。
#(この知識は、疑問点をネット等で検索するときに役立つかも
# しれないのでここで少し説明させてください。)

#stringr::
str_c("a","b","c") #文字列をくっつける
str_c("a","b","c", sep=" ") #sepで文字を間に入れることができます
str_c("a","b","c", sep="--") #sepで好きな文字を指定できます

#base::
paste( "dango1", "dango2") #base:勝手に間にスペースを入れる
paste( "O", "O", sep = "--") #sepでスペース以外へ
paste0("apple", "pen") #base：スペース0の関数
paste("apple","pen", sep="") #で同様の効果

#等の関数もよくつかわれます。

#さて、ここではあえてstr_cやpaste関数を利用しないでパス名をくっつけました。

#今回利用した
?file.path
#は、str_cやpasteにない利点があります。

.Platform$file.sep

#この実行結果はWindowsとMacで違います。
#もし、WindowsとMacで共有するようなスクリプトを書く場合に、Windowsでファイルを分ける記号「/」を利用して、

str_c("dir1","dir2", sep="/")
#などとすると、Mac等のLinux系の環境で実行すると
#エラーがでます。
#なので、その可能性があるスクリプトを書く場合は
#file.pathで文字列をくっつける方法を心がけるとエラー
#が少なくてよいと思います。


#ちなみに、ベクトルの要素同士をくっつけたい
#場合は、

str_c(LETTERS) # だとうまくいきません

str_c(LETTERS, collapse="_") #collapseを指定することで可能に！
str_c(LETTERS, collapse="" )
str_c(LETTERS, collapse=" ")

paste(LETTERS, collapse="@") #pasteでも同じようにできます

#本コースや、今後私が作成するコースでは
#基本的にTidyverseの関数を利用することが
#主になるため、paste関数は出てくる可能性は
#低いですが、好みの関数をご利用ください

#LEC:01-14 STEP2ファイルの読み込み―データの取り込み:read_excel()― =====

#では、ここでは、excelファイルが置いてあるフォルダからエクセルファイルを読み込んでいきましょう
#
#エクセルファイルの読み込みには、

?readxl::read_excel

#関数を利用します。
#
#ヘルプファイルにあるようにsheetのアーギュメントでどのシートから読み込むかを決めたり、基本的にはread_csvと似たような動作でデータを読み込むことが可能です。

# 実際に読み込んでみましょう。

path_to_file
dat <- read_excel(path_to_file)

dat
#これだけで、エクセルファイルのデータを取り込めました

#今回は加工が必要ありませんが、例えばファイル名を列
#として付け加えたいなら、
dat %>% 
  mutate(filename = targetfile)
#とかこんな感じでデータを加工できます。
#ただし、まとめて加工する方が効率よいので
#このステップで加工するかどうかはよく考えて
#全体に対しての操作でもよいならそのタイミングで行いましょう。

# 次は、データ同士をくっつける方法を考えていきます。
# 
##LEC:01-14 STEP2ファイルの読み込み―データの取り込み:bind_rows― =====


#読み込んだデータくっける方法を考えていきます。

#それには、bind_rowsを利用します。

#実験
data1 <- tibble(a = 1 :3 ,
                b = 11:13 )

data2 <- tibble(a = 4 :8 ,
                b = 14:18 )

data1
data2

bind_rows(data1, data2) #くっつきました！

data3 <- tibble(a = 4:8,
                c = 4:8 )

data1
data3

bind_rows(data1, data3) #列がない場合は、
                        #NAで互いが埋まります


data4 <- tibble(a = LETTERS[1:3],
                b = LETTERS[4:6] )

data1
data4

#ここでは、data1とdata4の各列の型に注目してください。
#int型とchr型で方が違っていますね？
#そういう場合は、

bind_rows(data1, data4)

#エラー！

#列同士は、同じ「型」である必要があります。
#これは、ベクトルも同じで、
c(1,2,3)
c(1,2,"a")
#ベクトルは自動的に文字列が紛れ込んでいた場合に
#他の数字も文字列に変えてしまうのでエラーは生じませんが、かってに変換されるという挙動を示すので注意が必要です。

#データの型を調べたいのであればstr()関数などで事前に確認するという方法もとれます。
bind_rows(data1, data4)
str(data1)
str(data4)

#このように、

#     data1 data4
#  a  int   chr
#  b  int   chr

#とくっつける型が違う場合に怒られます。

#回避する方法は色々とあります。
#ポイントは、「型」をいつ変換するかにかかっています。
#
#引き続き、次のビデオで解説を続けます。


#LEC:01-15 STEP2ファイルの読み込み―データの取り込み:bind_rowsと型の問題 =====

#bind_rowsでは型が違っている場合に怒られます。
#Rでは知らない間に勝手に型変換をしてしまっている
#（してくれている）
#ことがあるため、意識していないと型が合わない
#というエラーが頻繁に発生します。

#型への対応方法はいろいろなやり方があり、
#このコースで説明する方法以外にも、良いやり方が
#あれば、是非Q&A等にも投稿してみてください

#では、問題のデータに取り組みましょう
str(data1)
str(data4)

# 一つ前の動画でも説明しましたが、このdata1とdata4は型がことなるためbind_rowsでくっつけることができません。

#一番よいのは列毎に型を指定してあげてそれをくっつけるという方法ですが、今回のようにデータを読み込んで結合するというプロセスをとる場合には、数字だと思っていたのに途中に実はゼロでなくて、オーが入力(0でなくてo)というケースがあったりするため、実践的な分析プロセスにおいては、すべてを文字列型にしてからくっけるという手をよく使います。

#文字列型にしておくことで、型変換時のデータの欠損をさけることができます。具体的には、
#
vec <- c("1", "2", "3", "a", "2014-5-1", "TRUE", "0", "1.5")

vec　#すべて文字列として保存されています
as.integer(vec) #小数点以下が切り落とされます
as.double(vec)
lubridate::ymd(vec) #日付型に変換可能な文字列以外残りません。
as.logical(vec) #TRUE FALSE以外のこりません
as.factor(vec) #全部残るは残りますが、
as.numeric(as.factor(vec)) #因子としてのデータのラベルが文字列型のままですが、本体は数字となるため、別の型への変換時に工夫が必要となる場合があります


#まとめると：
#            "1" "2" "3" "a" "2014-5-1"   "TRUE" "0" "1.5"
#as.integer   1   2   3   NA  NA           NA     0   1
#as.double    1.0 2.0 3.0 NA  NA           NA     0.0 1.5
#ymd          NA  NA  NA  NA  "2014-05-01" NA     NA  NA
#as.logical   NA  NA  NA  NA  NA           TRUE   NA  NA
#as.factor   ****************略************************


#逆に、他のデータ型　から　文字列型への変換ではデータの
#欠損は生じません

int_vec <- c(1:4)
int_vec
as.character(int_vec)

doub_vec <- c(1:4)/4
doub_vec
as.character(doub_vec)

date_vec <- lubridate::as_date(10000:10004)
date_vec
as.character(date_vec)

#そのため、とりあえずデータを結合するステップでは全て文字列型にしておくという手段をとることで型が違うために結合できないというエラーを回避することができるようになります。

#LEC:01-16 STEP2ファイルの読み込み―mutate_all=====

#さて、今回解説に利用している
data1
data4

#のすべての列を文字列型に変えていきましっょう。
#やってみてください！










#できましたか？これまでの知識からは、
#次のような形になっているはずです

data1
data1 %>% 
  mutate(a = as.character(a),
         b = as.character(b) )

#それでは、次のようなデータのすべての列を同様に変換できますか？

data5 <- tibble(col = letters[1:10], val = 1) %>% 
  spread(key = col, value = val)

#このうように横に長いデータの場合に、すべてを文字列に変換するのは手間が大きいです。mutateのみで行う場合は列の数だけスクリプトの行数がかかります

#こういう場合に、複数の列に対して同じ操作を繰り返し行いたいケースでは、mutate_all関数やmutate_at関数を利用します。

str(data5)

data5chr <- data5 %>% 
  mutate_all(.funs = as.character)

str(data5chr)

#あるいは、

data5chr2 <- data5 %>% 
  mutate_all(.funs = ~{　as.character(.)　})

str(data5chr2)

#一つ目の書き方は.funsに対して()なしの関数を与えてあげることでその関数をすべての列に適応することができます
#二つ目の書き方は、~{}の中に列名を「.」として処理を書くというものです。
#どちらを覚えるとよいかというと、とりあえず、二つ目の書き方の方が応用範囲が広いので、二つ目のみでもかまいません。

#mutate_allを利用すれば、すべての列の数字を二倍してから文字列型に変更するというようなことも、簡単に実現できます

data5 %>% 
  mutate_all(.funs = ~{ as.character(. * 2) }) #あるいは

data5 %>% 
  mutate_all( ~{
    
    val <- .
    
    (val * 2) %>% 
      as.character()
    
  })

#書き方の法則見えまていますか？

#ということで、

data1_chr <- data1 %>% 
  mutate_all(as.character)

str(data1)
str(data1_chr)

#としてあげて

str(data4)

#ふたつのデータがすべて文字列型になっている状態で

#くっつけましょう
bind_rows(data1, data4)        #エラー
bind_rows(data1_chr, data4)　　#成功！

#できました！

#長々と型変換の話を続けてきましたが、もうすこしだけ、mutate_atの解説を行ってから次に進みます。


#LEC:01-17 STEP2ファイルの読み込み―mutate_at=====

data6 <- tibble(id = c(1,2,3),
                col1 = c(1,2,3),
                val1 = c(1,4,9),
                col2 = c(1,8,27) )

#mutate_allと同じような使い方で、適応する処理を特定の列にだけ指定するという関数がmutate_atです
#
#mutate_atは、処理の指定の仕方はmutate_allと同じです。それに、列の指定をしてあげることで、特定の列にのみに処理を適応するということが可能になります。

#例えば、col1, val1, col3に対して文字列型への変更を行いたい場合、

data6 %>% mutate_at(.vars = vars(col1,val1,col2),
                    .funs = ~{ as.character(.) })

#どうでしょうか？mutate_allから変更のあった部分は、.vars = vars(------)の部分だけです。

#vars()はselect()とまったく同じというイメージです

data6 %>% select(col1, val1, col2)
data6 %>% select( starts_with("col") )
data6 %>% select( matches("1$") )

data6 %>% mutate_at(vars( starts_with("col") ),
                    ~{ as.character(.) } )

data6 %>% mutate_at(vars( matches("1$") ),
                    ~{ as.character(.) } )

#どうでしょうか？selectでの列の指定のやり方と、mutate_allでの変換処理の書き方が理解できていれば、mutate_atはその応用です。この関数はアンケートデータの処理などにおいて、変数名に法則性を持たせてつけておくと、比較的簡単に処理をまとめて書くことができるため、使いこなせるとかなり有用な関数となります
#


#型の説明でだいぶ回り道をしましたが、次の動画からはエクセルファイルから読み込んだデータの結合へ話を戻しましょう


#LEC:01-18 STEP2ファイルの読み込み―実践=====

#では、前の動画で作成した、実際に読み込んだデータを結合していく作業を行っていきます。
library(tidyverse)
library(readxl)

filelist     <- list.files("demodata")
targetfile   <- filelist[1]
path_to_file <- file.path("demodata",targetfile)

dat <- read_excel(path_to_file)

dat <- dat %>% 
  mutate(filename = targetfile)

finaldat <- tibble(
  id     = character(),
  date   = character(),
  kensa1 = character(),
  kensa2 = character(),
  filename = character()
)

finaldat
dat

finaldat <- bind_rows(finaldat, dat)

#問題発生！
# Error in bind_rows_(x, .id) : 
#   Column `id` can't be converted from character to numeric

#課題：このエラーの原因、わかりますか？どう回避しますか？









#答え
str(finaldat)
str(dat)

#str で対象を確認してみると、型が違っています
#ひとまず、dat側のデータを文字列型へ変換しておきましょう
dat <- dat %>% 
  mutate_all(as.character)
str(dat)

finaldat <- bind_rows(finaldat, dat)
str(finaldat)

#どうですか？これで、読み込んだファイルを結合できましたね。それでは、残りのdemodataフォルダにある100個のエクセルファイルをすべてくっつけてるための知識を次の動画から説明していきます。

#LEC:01-19 STEP3ループ―イメージで理解する=====

#スライドでループの説明:スライド20-

#LEC:01-20 STEP3ループ―Rで実験―=====

#いよいよ繰り返し処理についての話題です。
#これが理解できると、定型処理をコンピューターに
#自動的に繰返してやらせるということが実現します

#ループにはいろいろな種類がありますが、
#本コースでは、forループと呼ばれるもの「のみ」
#とりあげます。

#例
print("今日のすしネタは")
print("ネタ:まぐろ")
print("ネタ:さーもん")
print("ネタ:甘エビ")
print("ネタ:いか")
print("ネタ:卵")
print("ネタ:うなぎ")
print("ネタ:はまち")
print("を用意しています。")

#全部実行してみると・・・

#さて、これを簡潔に出力する場合はどうすればよいでしょうか？
sushi_neta <- c("まぐろ","さーもん","甘エビ","いか",
                "卵","うなぎ","はまち")

sushi_neta

#ベクトルに、7個の文字列が含まれています。
sushi_neta[1]
sushi_neta[3]

#と要素一つ一つにアクセスすることで
#その文字列を取り出すことが可能です。

#例えば、

str_c("ネタ:",sushi_neta[1])

#とすれば、ネタ:という文字列を各要素の文字列にくっつける
#ことができるので、

print("今日のすしネタは")
print(str_c("ネタ:",sushi_neta[1]))
print("を用意しています。")

#の真ん中部分をループすることができれば最初の文字列を
#再現できます。

#そこで、2種類の方法でforループをまわしていきます！

#LEC:01-20 STEP3ループ―Rで実験:方法1―=====

#その1：要素を直接取り出す

sushi_neta

#には7つの要素がありました。
#forループは一つ一つ取り出して処理を行うことが可能です。

#if(){}else{}の書き方と似ています。

for(tanpin in sushi_neta){
  print(tanpin)
}

#これを実行してみましょう

#出力されましたね？

#tanpinという名前はは好きに決めてもらってよいです。

for(nanika in sushi_neta){
  print(nanika)
}

#おなじ結果がでてきます

#for(A in VECTOR){
# print(A)  
#}

#とすることで、VECTORの要素を1つとりだして、
#｛｝内の処理を行うことができます。

#もちろん、Aを使わなくてもよいので、

for(nanika in sushi_neta){
  print("定型文字列")
}

#このように、要素の個数だけ繰り替えすこともできます。

#もともとは、この処理の真ん中を繰り返したい
#という課題でしたね？

print("今日のすしネタは")
print(str_c("ネタ:",sushi_neta[1]))
print("を用意しています。")

#やりましょう！

print("今日のすしネタは")

for(nanika in sushi_neta){
  print(str_c("ネタ:",nanika))
}

print("を用意しています")

#できました！

#LEC:01-22 STEP3ループ―Rで実験:方法2―=====

#forループの使い方その2です。
#一つ前は、
for(A in sushi_neta){print(A)}
#のような形で利用しましたが、

for(A in sushi_neta){print("KOTEI")}
#という形で要素の数だけforループを回すという
#テクニックを応用すれば、

for(i in 1:10){
  print(i)
}

for(i in 1:10){
  print("teikei")
}

#という感じでループを回せます。
#要素の長さを調べて、
length_neta <- length(sushi_neta) #7

1:length_neta

#なので、

for(i in 1:length_neta){
  print(sushi_neta[i])
}

#とすることで、ちょっと遠回りしますが、要素を取り出すことができます。

#このテクニックを応用すると、
for (i in 1:length_neta) {
  print(str_c("ネタ",i,":",sushi_neta[i]))
}

#と、数字で数えつつ出力するようなことも可能です。
#forループを使って複数の結果を連番をつけて出力する
#ような場合に応用できます。

#お疲れ様でした。以上でループの基本的な説明を終わります
#多分多くのプログラミング言語を説明する書籍等では、ループが初級編にでてこなくて、脱初心者コースで初めて解説されることはかなり珍しいと思います。
#
#Rではこのようなforループの使用が実は推奨されていません。ただし、使える必要があることも多々あるので、ここで紹介させていただきました。
#
#次は、目的達成のために、
#ファイルを読み込んで、加工して、まとめる
#作業をforループを使ってやっていきます。

#LEC:01-23 STEP3ループ―実践―=====

#復習です
#それぞれの行が何をしているか思い出せますか？

filelist <- list.files("demodata") #1

targetfile <- filelist[1]　#2

path_to_file <- str_c("demodata/",targetfile)　#3

dat <- read_excel(path_to_file) #4

dat <- dat %>% 
  mutate(filename = targetfile) #5

finaldat <- tibble() #6

finaldat <- bind_rows(finaldat, dat) #7

#どれをループ化しますか？
#また、forループの中身が毎回実行される
#特徴を踏まえると、1行場所を変えないと
#思い通りの効果がでてこないのですが、どこかわかりますか？

filelist <- list.files("demodata") #1
targetfile <- filelist[1]　#2
path_to_file <- str_c("demodata/",targetfile)　#3
dat <- read_excel(path_to_file) #4
dat <- dat %>% 
  mutate(filename = targetfile) #5
finaldat <- tibble() #6
finaldat <- bind_rows(finaldat, dat) #7

# #2です・#2では、
filelist[1]
#とファイルが限定されているのでここをまず変化させて
#いかないとなりません


#では、とりあえずforループにしてみましょう。

filelist <- list.files("demodata") #1

for (targetfile in filelist) {
  #targetfile <- filelist[1]　#2
  path_to_file <- str_c("demodata/",targetfile)　#3
  dat <- read_excel(path_to_file) #4
  dat <- dat %>% 
    mutate(filename = targetfile) #5
  finaldat <- tibble() #6
  finaldat <- bind_rows(finaldat, dat) #7
}

#こうすることで、#2の処理がforループでfileistに含まれている要素の個数分繰り返されることになります

#実行してみましょう

#実行した結果、どうなっているでしょうか？

View(finaldat)

#????最後のファイルしか読み込まれていない・・・
#なぜだかわかりますか？










# #6をみてください
# #6ではfinaldatが初期化されています
#これが毎回実行されるので思いどおりの結果になりませんでした。毎回実行されたくない処理はループの外にだしてあげましょう

filelist <- list.files("demodata") #1
finaldat <- tibble() #6

for (targetfile in filelist) {
  #targetfile <- filelist[1]　#2
  path_to_file <- str_c("demodata/",targetfile)　#3
  dat <- read_excel(path_to_file) #4
  dat <- dat %>% 
    mutate(filename = targetfile) #5
  
  finaldat <- bind_rows(finaldat, dat) #7
}

#うまくいきました
nrow(finaldat)

#LEC:01-23 STEP4データの書き込み―スライドによる説明―=====
#スライド29

#LEC:01-24 STEP4データの書き込み―rds形式での保存―=====

library(tidyverse)
#rds形式はRの「オブジェクト」をそのまま保存できる形式で
#Rの解析結果やデータを簡単に保存できます。

#実験してみましょう
test <- ggplot(diamonds) + geom_bar(aes(x=carat))
test

#このグラフを保存したいとします
write_rds(test,"graph.rds")

#Filesペーンでrdsファイルが作成されていますね？
#RStudioはファイルをクリックするだけで読み込むことが
#できます

#やってみましょう

test

#Rのオブジェクトは容量が大きいことも多いので、
#基本的には、次の圧縮用のオプションをつけてあげると
write_rds(test, "graph2.rds", compress = "gz")

#容量を節約できます
?write_rds

#compressのオプションはnone gz bz xzの4種類あり
write_rds(test, "graph2_none.rds", compress = "none")
write_rds(test, "graph2_gz.rds"  , compress = "gz"  )
write_rds(test, "graph2_bz.rds"  , compress = "bz"  )
write_rds(test, "graph2_xz.rds"  , compress = "xz")

#とりあえず,none以外を指定しておけば、容量の節約になります。

#容量の節約度合いと圧縮スピードはトレードオフの関係にあるのでより圧縮できる形式であると保存に時間はかかります。私はgzで保存することが多いです。


#rdsはEnvironmentに表示されているもの（オブジェクト）
#であれば何でも保存できます。
#なので、list()という形式を利用するとグラフに説明文を
#つけて保存するというようなことも可能ですし
#まとめて結果を保存することもできます


test_graph <- list() #listを作成
test_graph$graph <- test
test_graph$explanation <- "このグラフは実験用でとくに今後使う予定はありません"

test_graph

write_rds(test_graph,"graphlist1.rds", compress="gz")

#クリックの方法以外で読み込むには、read_rds関数を利用します
aaa <- read_rds("graphlist1.rds")

aaa$explanation
aaa$graph

test_graph2 <- list()
test_graph2$graph1 <- test + labs(title="いち")
test_graph2$graph2 <- test + labs(title="に")
test_graph2$graph3 <- test + labs(title="さん")


write_rds(test_graph2,"graphlist2.rds", compress="gz")
aaa <- read_rds("graphlist2.rds")

aaa$graph1
aaa$graph2
aaa$graph3

#このような感じで、
# <好きな変数名>$ という書き方でリストの各要素に
# アクセスできるため、解析結果を一時的に保存したり
# なにかをまとめて保存したいようなケースでは有用です
# listの使い方は他にも色々ありますが、ここでは
# 上記のような使い方ができればOKです。

# #LEC:01-25 STEP4データの書き込み―結果の保存―=====

#それでは、finaldatをoutputフォルダに保存してみてください！
library(tidyverse)
library(readxl)

filelist <- list.files("demodata") #1
finaldat <- tibble() #6

for (targetfile in filelist) {
  #targetfile <- filelist[1]　#2
  path_to_file <- str_c("demodata/",targetfile)　#3
  dat <- read_excel(path_to_file) #4
  dat <- dat %>% 
    mutate(filename = targetfile) #5
  
  finaldat <- bind_rows(finaldat, dat) #7
}

finaldat










#できましたか？これはそれほど難しくありませんね。
dir.create("output")
write_rds(finaldat,"output/finaldat.rds", compress="gz")


#また、rds形式で保存してしまうと、R以外での利用が難しくなるのが難点です。ここでは、エクセルの他、各種統計ソフトで読み込める形式で出力する方法を紹介しておきます

#まずはCSV形式です。

write_csv(finaldat,"finaldat.csv")

# 簡単ですね。

#各種統計ソフトに対応したデータ形式での保存には、havenというパッケージにいろいろな関数が含まれています。

?haven::write_dta #STATA
?haven::write_sas #SAS: ただし、実験的な機能
?haven::write_sav #SPSS

#また、エクセルファイルとしての保存には、openxlsxパッケージというものがあります

?openxlsx::write.xlsx

openxlsx::write.xlsx(finaldat, "testexcel.xlsx")

#havenやopenxlsxによるデータの読み込み書き込み（Input と Outputで、よくI/Oなどと書かれたりします）を統一的に利用できるパッケージとしては、rio等もあります

?rio::export

#これらの関数を必要に応じて利用してデータを出力できれば、既存の仕事のワークフローに生かしやすいと思いますので、皆さんの環境に応じて取捨選択してみてください。



#おつかれさまでした。ここまでの知識で、一つのフォルダにあるエクセルファイルを読み込んで、すべて結合して、ひとつのファイルとして保存するということができるようになっているはずです。
#次のStep5からは、総まとめとしてゼロから一人で実現できるかなどの確認を行っていきます。

#LEC:01-26 STEP5総まとめ:課題と全体像=====
#スライド32


#LEC:01 STEP5総まとめ:考え方・ヒント=====

rm(list=ls()) 

#これで全てのオブジェクトを消してから課題に取り組んでください

#まずはノーヒントでやってみましょう
#　むり！というひとは続きをみてください。









#ヒント

#スライドの内容を文字に書き起こしてみました



#保存先のディレクトリがなければ作成する

#ループ

## フォルダにあるファイル名を取得

## データを取得加工

## 取り込んだファイルを別の保存先へ
## （file.copyを利用します）

## データの内容を蓄積

# データを最終ファイルに書き込む



#プログラムの作成になれていない場合、これから何をするかを自分で理解できる形で図示したり、ここで行ったように文章として書き起こすと見通しがよくなります

#
#上の文章の内容をスクリプトとして書き起こす形でかけるでしょうか？これでもできないという方は、最初はあたりまえなので、答えの動画を見てみてください。

#LEC:01-28 STEP5総まとめ:答え=====
#それでは答えです！

rm(list=ls()) #とりあえず、環境をキレイにしておきましょう。

library(tidyverse)

#保存先のディレクトリがなければ作成する
dir.create("output")

#取り込み済みのデータをうつす先のディレクトリを作成する
dir.create("demodata/done", recursive = TRUE)

#ループ
## フォルダにあるファイル名を取得
file_list <- list.files("demodata", pattern = "\\.xlsx$") 
  #doneディレクトリを除外

##蓄積用のTibbleを作る
datfinal <- tibble()

for( tgtfile in file_list ){
  print( str_c("Processing:", tgtfile) )
#対象のファイルのパスを作成
  tgtfile_path <- file.path("demodata",tgtfile)
## データを取得加工
  dat <- readxl::read_excel( tgtfile_path )

## 取り込んだファイルを別の保存先へ
  file.copy(from = tgtfile_path, 
            to   = file.path("demodata/done", tgtfile) )
  
##移動済みのファイルを削除
  file.remove(tgtfile_path)

## データの内容を蓄積
  datfinal <- bind_rows(datfinal, dat)
}


# データを最終ファイルに書き込む
write_rds(datfinal, "output/datfinal.rds", compress = "gz")


#以上です。実行してみましょう！

#処理に時間はかかりましたが、なんとか終わりました・・・

#スピードアップの方法については、次の動画以降で説明していきます

#LEC:01-29 STEP6高速化=====
#スライド35
#
#

#LEC:01-30 STEP6高速化:実行速度の測定方法====

#処理の実行速度を計測するためには、proc.timeという関数を利用します

?proc.time

#例えば、123の123乗を1億回計算するのにかかる時間は、

start <- proc.time()
for(i in 1:100000000){123^123}
proc.time() - start

#全部で  秒経過しました。

#このように、proc.timeで挟んで、その差をとってあげることで、経過時間の差がわかります。
#ここからは、tidyverse系の関数とbase系の関数を比較してtidyverseの優位性を少しだけお見せしていきます。
#

#LEC:01-31 STEP6高速化:bind_rows vs rbind ====


#まずはbase関数である、rbindを、data.frameを利用して計測してみましょう
test1 <- data.frame(a = c(1,2,3), b = c("one","two","three"))
res1 <- test1

s_time_rbind <- proc.time()
for(i in 1:10000){
  res1 <- rbind(res1, test1)
}
res_time_rbind <- proc.time() - s_time_rbind
  

#次に、tidyverseの関数である、bind_rowsを、tibbleを利用して計測してみましょう
test2 <- tibble(a = c(1,2,3), b = c("one","two","three"))
res2 <- test2

s_time_bindrows <- proc.time()
for(i in 1:10000){
  res2 <- res2 %>% bind_rows(test2)
}
res_time_bindrows <- proc.time() - s_time_bindrows

#体感的にも圧倒的に早いですね

res_time_rbind
res_time_bindrows

res_time_rbind[3]/res_time_bindrows[3]

#今回の実行結果からは、大体3倍くらいです。

#このように、tidyverseはbase関数に比べて速度が速いという特徴があることや、データの流れがわかりやすいpipe関数があるということから、基本的にはtidyverseの関数を利用することをおすすめします。
#
#なぜ早いのかという点については、本コースの範囲からはこえますが、簡単に説明すると、裏でC++という、より高速な言語が作動しているからです。
#プログラマ希望の方や、より高度なシミュレーション、数値計算を行う場合は、C++の習得も必要となると思います。


#LEC:01-32 STEP6高速化:forループ VS map ====
#
#さて、ひとつ前のtidyverseを利用したループですが、実はもう一か所tidyverse系の関数に置き換えれます。
#それが、map関数です。
#
#map関数はpurrrと呼ばれるパッケージの中の関数なのですが、
test2 <- tibble(a = c(1,2,3), b = c("one","two","three"))
res2 <- test2

s_time_bindrows <- proc.time()
for(i in 1:10000){
  res2 <- res2 %>% bind_rows(test2)
}
res_time_bindrows <- proc.time() - s_time_bindrows

#このスクリプトのforループを置き換えることができます。

test3 <- tibble(a = c(1,2,3), b = c("one","two","three"))
s_time_map <- proc.time()
res3 <- map_df(1:10000, ~{
  test3
})
res_time_map <- proc.time() - s_time_map

res_time_rbind
res_time_bindrows
res_time_map

#どうでしょうか？bind_rowsへの置き換えが遅いわけでは決してないのですが、forループをmap関数に置き換えることで、さらに

res_time_bindrows[3]/res_time_map[3]

# ＿＿＿倍もはやくなりました！

#tidyverse系の関数、特にmap関数は使いこなせると力になります

#補足:base関数でもmapに準じたapply系関数というものがあります。こちらを取り上げないのはアンフェアなので、取り上げてみます
test4 <- tibble(a = c(1,2,3), b = c("one","two","three"))
s_time_apply <- proc.time()
res4 <- lapply(1:10000, function(x){test4})
res4 <- do.call(rbind, res4)
res_time_apply <- proc.time() - s_time_apply

#これらのすべての結果を描画してみると、
tibble(
  name = c("base + for",
           "dplyr + for",
           "dplyr + map",
           "base + apply"),
  res = c(res_time_rbind[3], 
          res_time_bindrows[3], 
          res_time_map[3], 
          res_time_apply[3])
) %>% 
  ggplot() +
  geom_col(aes(x = reorder(name, res), y = res)) +
  coord_flip() +
  theme_classic() +
  labs(x = "", y = "1万回の処理にかかった秒数")

#いかがでしょうか？
#Rで「forループは使うな」という格言があったりしますが、
#この結果をみていただいたらなっとくいただけると思います。
#
#また、処理においても、tidyverse系の関数を利用するとmapやapplyなどの関数を利用した繰り返し処理を行わなくても相当な高速化が見込めるため、基本的にはtidyverse系の関数でのデータ処理を心がけるだけでよいという理解でよいと思います。
#
#apply系の関数も十分速いですが、purrr系の関数に慣れている私にとっては使いにくく感じますし、lapply sapply tapply 等の使い分けに混乱を生じることもあるので、purrr::mapを基本的にはFORループの変わりに使うという使い方で問題ないと考えます。
#
#次は、スライドにもどり、map関数をイメージで理解するための説明を行います。

#LEC:01-33 STEP6高速化:map関数をイメージでとらえる ====
#
#スライド40-48

#LEC:01-34 STEP6高速化:map関数の特徴―閉じた環境 ====
#スライド49-

#LEC:01-35 STEP6高速化:map関数の特徴―閉じた環境2 ====

#では、スライドで説明したことが実際に起こるか確認してみましょう

target <- "dog"
for(i in 1:5){
  target <- i
  print(target)
}
print(target)

target <- "cat"
map(1:5, ~{
  target <- .
  print(target)
})
print(target)

# おなじように繰り返し処理をしましたが、forループで最後にtargetをprintしたときと、map関数で最後にtargetをprintしたときでは大きく結果がことなりました。

#forループは繰り返し処理の中身がそのまま全体に影響を与えていますが、mapは、中身は中身以外の部分には影響を与えていません。


#プログラミングは命名作業が非常に大事になります

#例えば

temptemp <- 170.2
sonohoka <- 68.3
temptemp2 <- temptemp/100
koregakotaeda <- sonohoka/temptemp2^2

# というスクリプトを読んだ時に何をしているかぱっとわかりますか？


#これならどうでしょう？
height_in_cm <- 170.2
weight_in_kg <- 68.3
height_in_m <- height_in_cm/100
bmi <- weight_in_kg/height_in_m^2

#医療系の方なら、二つ目のスクリプトがBMIの計算式(体重[kg]/身長[m]の二乗)であることはぱっとわかると思いますが、一つ目のスクリプトは名前から推測することが不可能になります

#プログラムでシステムを作るときに、この名前の管理は非常に大切になるため、その名前が有効な範囲が厳密に決められています。

#その名前が有効な範囲について次の動画で説明を行っていきます。


#LEC:01-36 STEP6高速化:map関数の特徴―閉じた環3 Environment ====

#ここでは、変数の有効範囲について説明していきます
#まずは、変数をすべて除去しましょう

rm(list=ls())

fruits <- "apple"

#まず、ここで単純に次のスクリプトを実行した場合何がおきるでしょうか？
print(fruits)

#appleと印字されます。
#
#では、

func1 <- function(){
  print(fruits)
}

#この関数はどうでしょうか？
func1()

#このように、関数の外で定義されたものが印字されています
#つまり関数の外で定義された変数は、関数の中にまで影響を与えていることが観察できました。

func2 <- function(){
  fruits <- "orange"
  print(fruits)
}

#では、これは？
func2()

#関数の中で定義されたものがある場合は、中が優先されます。

#今度は逆パターンを試してみましょう。

func3 <- function(){
  animal <- "dog"
  fruits <- "banana"
  print(animal)
}

func3()

print(animal)
print(fruits)
#ここではanimalは見つかりませんと怒られます。
#また、fruitsの中身はfunc3内で定義されたものではありません
#このように、関数の中で定義された変数はその関数の外には影響を与えません。なので、関数を作成する場合、その中の名前のみに気を配ることができます。（うっかり関数の外で定義された重要な変数を上書きするという事故が防げます)

#ただし、
func4 <- function(){
  animal <<- "LION"
  fruits <<- "MELON"
  print(animal)
}

print(fruits)
func4()
print(fruits)

#このように<<- 二十小なり記号を利用した代入を行うと、関数の外に影響を与えます。
#このテクニックは小規模なスクリプトであれば問題にはなりにくいですが、複雑なスクリプトを作成する場合などは、思わぬエラーの原因になったりするため、基本的には利用しないことをおすすめいたします。

#ただ、これまでのやり方だと、うっかり外の環境で定義したものが関数の動作に影響を与える可能性があります。
#それを避けるために活用したいのが,アーギュメントつきの関数です。

fruits <- "Lemon"
animal <- "Elephant"

func5a <- function(fruits, 
                   animal){
  print(fruits)
  print(animal)
}

func5b <- function(fruits = "Strawberry", 
                   animal = "Hamster"){
  print(fruits)
  print(animal)
}

func5c <- function(){
  print(fruits)
  print(animal)
}

func5a()
func5b()
func5c()

# かなり似ている関数ですが、その結果には大きな影響がでています。5aはエラー、5bは最初に定義しているものとは全く別のもの、5cは最初に定義したものとなっています。
# 
# 5a、5bは、function()の中に、与えるべき変数を定義しています。5aは、定義されたものの初期値を設定せず、5bは設定しています。この違いが、それぞれの動作の違いとなりました。

#この変数が有効な範囲の理解については、かなり難しい印象なので、わからないという方は、ぜひ質問してください。

#なかなか本筋にたどり着きませんが、次はMAP関数の返り値の基本であるLISTの説明を行って、このセクションの最終課題に進んでいきます

#LEC:01-36 STEP6高速化:map関数の特徴―返り値がリスト1 ====

#スライド52

res <- map(1:3,~{ . * 3})

res

# mapが返すのは、リストです。リストは「なんでも収納できるベクトル」というイメージが適切だと思います。

#ベクトルは一つの型しか含むことはできませんでした。
vec <- c(1,2,"apple") #すべて文字列に
vec[1]
vec[2]
vec[3]

lis <- list(1,2,"apple")

lis[1]
lis[2]
lis[3]

#このように、リストには、数字型や文字列をそのままの形で保存することができます。

#リストに収納されたデータを取り出す方法はベクトルと少し違うので説明しておきます。

lis <- list(
  c(1,2,3),
  c("a","b","c","d","e"),
  c("dog", "cat", "snake", "bird")
)

lis

#このリストは、一つ目の要素に１から3の数字が、二つ目の要素にaからeまでのアルファベット、そして3番目の要素に言葉がはいっています。

#これから、例えば2番目の要素のcを取り出すにはどうすればよいでしょうか？


lis[[2]][3]

#こうです。
#このように、リストの要素を指定するのに、[[]]を利用してあげて、そのあと、その指定された要素から取り出したい物を取り出すという仕組みです。

lis[[2]][3]

tekitou <- lis[[2]]
tekitou[3]

#この二つは同じです！

#なた、リストの要素に名前をつけることもできるので、

lis <- list(
  number = c(1:4),
  alphabet = letters,
  words = c("dog","cat","bird")
)

lis$number
lis$words

#のように取り出すこともできますし、

lis[["number"]]
#のように文字列で指定してとりだしてあげることもできます。
#Rのオブジェクトならほぼ何でも収納できるので、

temp_data <- cars
temp_graph <- ggplot(cars) + geom_point(aes(speed,dist))
temp_model <- lm(speed~dist, cars)

bunseki <- list(
  data = temp_data,
  graph = temp_graph,
  model = temp_model
)

bunseki$graph
summary(bunseki$model)

#などのことができます。
#また、rds形式でリストを保存することもできるので、
#分析結果をひとまとめにして一つのオブジェクトとして保存することも可能です。



#次の動画では、map関数で返ってくるリストを取り扱う際に役立つreduce関数を解説します

#LEC:01-37 STEP6高速化:map関数の特徴―返り値がリスト2 reduce関数 ====

#ひとつ前の動画ではリストの特徴について解説しました。ここでは、map関数が返すリストを処理する場合に役立つReduce関数を解説します。
#
#まずはスライドへ！
#

#LEC:01-38 STEP6高速化:map関数の特徴―返り値がリスト2 reduce関数2 ====
#
#スライドでイメージをつかんでもらったところで、実際の動きをみていきましょう
#
#一点注意ですが、~{}関数を、mapの場合は、繰り返される対象を、「.」で表していましたが、reduce関数のように、二つの要素をとりだして、関数に与える場合は、最初の要素を「.x」, あとの要素を「.y」で表します。スライドのアニメーションでいえば、薄緑色の丸が、.x, これまで使われていない要素が.yとなります。

#この関数の結果を予測できますか？
reduce( 1:10, ~{ c(.x, .y) } )
#まず、　1      と2がとりだされて、c( 1     , 2 ) 
#　　　　c(1,2) と3がとりだされて、c( c(1,2), 3 )
#　　　　という風に繰り返されます。
c( c(1,2), 3) #は結局　c(1,2,3)と変わりません

reduce( 1:10, ~{ c(.x, .y) } )


#ちなみに、何も指定しなければ一つ目、二つ目は順番通りに関数に与えられるので、
reduce(1:10, c)

# と書いても全く同じ処理が行われます。
reduce(1:10, c() )
#~{}を使わない場合は、()をつけるとエラーになるので注意が必要です。

#さて、かなり大回りをしてmapとreduceの基本をお伝えしてきました。本コースではこれ以上の説明は行いませんが、mapとreduceが属するpurrrパッケージは、Rで繰り返し処理を行う場合に、知っているのと知らないのではかなりの差がつくパッケージなので、

val <- list(c(1,2,3),c(100,200,300), c(123,345,456,567))
val

map(val,mean)

map_dbl(val, mean)

map(val, ~{
  tempmean <- mean(.)
  if(tempmean > 100){
    res <- "大きな平均値!"
  }else{
    res <- "あまり大きい平均値ではない！"
  }
  return(res)
})

map_chr(val, ~{
  tempmean <- mean(.)
  if(tempmean > 100){
    res <- "大きな平均値!"
  }else{
    res <- "あまり大きい平均値ではない！"
  }
})

map(1:3, print)
walk(1:3, print)

singleRow <- tibble(name = "one", val = 1)
singleRow

map(1:10, ~{singleRow}) %>% reduce(bind_rows)
map_df(1:10, ~{singleRow})

#という処理について、一度考えてみてもよいかもしれません。(尚、purrrのチートシートがあり、それを見れば上記の関数は大半が説明されています。載ってないものはhelpファイルをみてください。)
#
# それでは、最終課題に進みましょう！！！
# 知識編はここまでです。お疲れさまでした！
# あとは実践です

#LEC:01-39 STEP6高速化:実践課題 ====

#さてstep5で作成したスクリプトは次のようなものになっています、

#ここから〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇
library(tidyverse)
dir.create("output")
dir.create("demodata/done", recursive = TRUE)

file_list <- list.files("demodata", pattern = "\\.xlsx$") 
datfinal <- tibble()
for( tgtfile in file_list ){
  print( str_c("Processing:", tgtfile) )
  tgtfile_path <- file.path("demodata",tgtfile)
  dat <- readxl::read_excel( tgtfile_path )
  file.copy(from = tgtfile_path, 
            to   = file.path("demodata/done", tgtfile) )
  file.remove(tgtfile_path)
  datfinal <- bind_rows(datfinal, dat)
}
write_rds(datfinal, "output/datfinal.rds", compress = "gz")
#〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇〇

#課題:このスクリプトを、read_and_process.r というファイル名でスクリプトファイルとして保存してください。

#課題：このスクリプトが100個のファイルを処理する時間を計測してみましょう。

#課題：新しいスクリプトをforループを使わずに書いて時間を測定してみましょう


#LEC:01-40 STEP6高速化:課題：スクリプトの呼び出しと時間の計測 ====

#まずは、demodataフォルダにエクセルファイルを戻しておきましょう

#計測はどのようにされましたでしょうか？
#ファイルを開いて実行していた場合、すでに単体で実行することで処理が終わるファイルがあるのであれば、source関数を利用してみるのもよいと思います。

time_start_for <- proc.time()
source("read_and_process.r", encoding="UTF-8")
total_time_for <- proc.time() - time_start_for

total_time_for

#こんな感じです。
#では、次は高速化を行いましょう

#LEC:STEP6高速化:課題解答：forループの置き換え ====



#LEC:STEP6高速化:課題解答：高速なVerの時間計測 ====

#この動画では、faster_read_and_process.rで解説を行います。

#では、faster_read_and_process.rの時間測定をしてみましょう

time_start_map <- proc.time()
source("faster_read_and_process.r", encoding="UTF-8")
total_time_map <- proc.time() - time_start_map

#最後に、その差を可視化しておきます。

tibble(
  name = c("for", "map"),
  val = c(
    total_time_for[3],
    total_time_map[3]
  )
) %>% 
  ggplot() +
  geom_col(aes(x = name, y = val))

#という形で、mapを利用することで実行時間は

total_time_map[3]/total_time_for[3]

#倍になりました。




#お疲れさまでした！以上で最初のセクションはおしまいです。
#ここでは、

#Rによるファイルの操作
#エクセルファイルの読み込み、書き込み
#forループの使い方
#rds形式の理解
#map関数
#reduce関数
#の学習を通して、複数のエクセルファイルをまとめて一つにするという課題に挑戦しました。
#
#本セクションの最後に作成したfaster_read_and_process.Rの内容がスラスラ読めて処理が理解できるようになっていて、そこで使われている関数群を自身のデータに対して適応できるようになぅていれば、このセクションの目的達成です。
#
#ただ、特にmap関数やreduce関数などの関数の理解は相当難しい部類に入るとおもいますので、一度動画をみただけでわからなくても普通のことだと思います。
#
#繰り返して、「うまくいかない」ことを自身のデータ分析の中で経験することで「普通に」つかえるようになるはずです
#
#また、mapの速度改善効果は素晴らしいですが、理解できなくて利用できないのであればforループを書いて処理をしても問題ありません。10分の処理が3分に短縮されたとしても、その差7分でコーヒーでもいれて待てばよいと私は考えます。
#
#是非、楽しくR言語でデータ処理をしていただければ嬉しく思います。
#
#それでは、次のセクションでお会いしましょう！
  