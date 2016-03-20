Gui,Add,Text,x22 y50 w430 h20 ,保存先パス                         ;ラベルを追加
Gui,Add,Edit,x100 y50 vTarget w350,                ;入力欄を追加

Gui,Add,Text,x22 y365 w430 h20 ,待機時間400~2000                         ;ラベルを追加
Gui,Add,Edit,x130 y360 vTargetWait w50, 400                ;入力欄を追加

Gui, Add, Tab, x2 y0 w470 h390 , Main|Sub

Gui, Tab, Main

picture = data\voiceroidmanagerV++logo.png





Gui, Add, GroupBox, x22 y80 w240 h180 , 正規表現
Gui,Add,Checkbox,x32 y100 w100 h40 vC1 Checked1,URI         ;チェックボックスを追加
Gui,Add,Checkbox,x32 y140 w100 h40 vC2 ,wikipedia`n周辺データ         ;チェックボックスを追加
Gui,Add,Checkbox,x32 y180 w100 h40 vC3 ,TwimeMachine`nメタデータ         ;チェックボックスを追加
Gui,Add,Checkbox,x162 y180 w100 h40 vC32 ,TwimeMachine`nリプライ         ;チェックボックスを追加
Gui,Add,Checkbox,x32 y220 w100 h40 vC4 ,tumblr/2ch/したらば`nメタデータ         ;チェックボックスを追加
;同様にオプションのチェックボックスを追加

Gui, Add, GroupBox, x282 y85 w120 h130 , 起動するソフト
Gui, Add, Radio, x302 y100 w90 h30 gCheck vRadioGroup1, 結月ゆかり(&a)　
Gui, Add, Radio, x302 y130 w90 h30 gCheck vRadioGroup2, 弦巻マキ(&b)
Gui, Add, Radio, x302 y160 w90 h30 gCheck vRadioGroup3, 琴葉茜(&c)
Gui, Add, Radio, x302 y190 w90 h30 gCheck vRadioGroup4, 琴葉葵(&d)



Gui,Add,Button,gExec x162 y260 w150 h50,&クリップボードを再生                  ;実行ボタンを追加
Gui,Add,Button,gExec2 x162 y320 w150 h30,&クリップボードを保存                  ;実行ボタンを追加


Gui,Add,Button,gExec4 x32 y320 w100 h30,停止                  ;実行ボタンを追加
Gui,Add,Button,gExec14 x32 y260 w100 h50,再生/一時停止                  ;実行ボタンを追加

Gui, Add, Picture, x330 y250 w100 h100 , %picture%


;Gui, Add, Progress, x152 y210 w140 h10 , 25


Gui, Tab, Sub

Gui, Add, GroupBox, x12 y250 w450 h110 , フォルダまるごと音声化
Gui,Add,Text,x22 y270 w140 h20,音声化するフォルダ
Gui,Add,Checkbox,x22 y310 w100 h40 vC21 ,ファイル頭に番号         ;チェックボックスを追加
Gui,Add,Edit,x160 y270 w280 h40 vTarget2 ,               ;入力欄2を追加
Gui,Add,Button,gExec3 x300 y310　w120 h30,&フォルダ内をすべて音声化                  ;実行ボタンを追加



Gui, Add, Text, x22 y150 w130 h40 , 分割するテキストファイル
Gui, Add, Edit, x160 y150 w280 h40 vtarget21, テキストファイルのパスを入力もしくはドラッグ・アンド・ドロップ 
Gui, Add, GroupBox, x12 y120 w450 h110 , テキスト分割出力TXTもしくはWAV
Gui, Add, Button,gExec5 x120 y210 w100 h20 , txt分割出力

Gui, Add, Button,gExec52 x360 y210 w100 h20 , wav分割出力
Gui,Add,Checkbox,x360 y190 w110 h20 vC33 ,名前+番号(TWS)         ;
Gui, Add, Text, x22 y190 w130 h20 , 分割テキストファイル文字数
Gui, Add, Edit, x162 y190 w60 h20 vtarget22, 15000

Gui, Show, x714 y688 h400 w480, VOICEROID Manager V++

;Gui,Show                                            ;ウィンドウを表示
Return                                              ;スクリプト起動時の処理を終了








Check:
    Gui, Submit, NoHide   ;チェックボックスを変数に反映
	
	

        If ( RadioGroup1 ) {
            kidouroid := 1
			roid = VOICEROID＋ 結月ゆかり EX
			voiceroidname = yukari
				IfWinNotExist, VOICEROID＋ 結月ゆかり EX
				{
				Run, C:\Program Files (x86)\AHS\VOICEROID+\YukariEX\VOICEROID.exe,,Min
				}
        }
 
 
         If ( RadioGroup2 ) {
            kidouroid := 2
			roid = VOICEROID＋ 民安ともえ EX
			voiceroidname = maki
				IfWinNotExist, VOICEROID＋ 民安ともえ EX
				{
				Run, C:\Program Files (x86)\AHS\VOICEROID+\TamiyasuEX\VOICEROID.exe,,Min
				}			
        }
		
		
        If ( RadioGroup3 ) {
            kidouroid := 3
			roid = VOICEROID＋ 琴葉茜  ;以下ボイスロイドを操作
			voiceroidname = akane
				IfWinNotExist, VOICEROID＋ 琴葉茜
				{
				Run, C:\Program Files (x86)\AHS\VOICEROID+\Akane\VOICEROID.exe,,Min
				}				
        }

        If ( RadioGroup4 ) {
            kidouroid := 4
			roid = VOICEROID＋ 琴葉葵  ;以下ボイスロイドを操作						
			voiceroidname = aoi
				IfWinNotExist, VOICEROID＋ 琴葉葵
				{
				Run, C:\Program Files (x86)\AHS\VOICEROID+\Aoi\VOICEROID.exe,,Min
				}
        }		
Return

























Exec:                                               ;再生処理

Gui,Submit,NoHide                                   ;フォームの内容を変数に反映






	If kidouroid =         ;ボイスロイド選択を求める
	{
	MsgBox 利用するボイスロイドを選んでください。
	return
	}	







newtext = %clipboard%

If (C1 = 1) ;チェックボックス一つ目
{

;URLを省略

newtext := RegExReplace( NewText, "http.*?\s", "URL略")
newtext := RegExReplace( NewText, "ttp.*?\s", "URL略")

sleep, 100
}



If (C2 = 1) ;チェックボックスニつ目
{

;脚注以下を削除
newtext := RegExReplace( NewText, "s)脚注\[編集\].*", "脚注以下を省略")
;案内メニュー以下を削除
newtext := RegExReplace( NewText, "s)案内メニュー\[編集\].*", "案内メニュー以下を省略")
;参考文献以下を削除
newtext := RegExReplace( NewText, "s)参考文献\[編集\].*", "参考文献以下を省略")
;外部リンク以下を削除
newtext := RegExReplace( NewText, "s)外部リンク\[編集\].*", "外部リンク以下を省略")
;脳科学辞典参考文献以下を削除
newtext := RegExReplace( NewText, "s)参考文献.+?元の位置に戻る ↑.*", "参考文献以下を省略")


;目次を削除する
newtext := RegExReplace( NewText, "s)目次\n.*概要", "目次省略、概要")
;概要がない場合目次を削除する(無欲)
newtext := RegExReplace( NewText, "s)目次\n.*?\[編集\]", "目次省略、概要")
;[]で囲まれた部分を削除する。
newtext := RegExReplace( NewText, "\[.*?\]", " ")
;テンプレートを表示を削除する
newtext := RegExReplace( NewText, "テンプレートを表示", "画像終わり")

;出展を省略
;newtext := RegExReplace( NewText, "s)Question.book-4.svg.*?信頼性向上にご協力ください。", "出展が不明確です")

sleep, 100
}



If (C3 = 1) ;チェックボックス3つ目
{

;URLを省略
;newtext := RegExReplace( NewText, "Sun\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Mon\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Tue\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Wed\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Thu\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Fri\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Sat\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d", "日付略")
;newtext := RegExReplace( NewText, "\n@.+?日付略", "リプライ")
;newtext := RegExReplace( NewText, "RT\s@.+?:", "リツイート")

newtext := RegExReplace( NewText, "Sun\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Mon\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Tue\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Wed\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Thu\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Fri\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Sat\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d", "次のツイート")
newtext := RegExReplace( NewText, "\n@.+?次のツイート", " ")
newtext := RegExReplace( NewText, "RT\s@.+?:", "リツイート")
newtext := RegExReplace( NewText, "s)TwimeMachine.+?Back\sto\sTop", "")
sleep, 100
}
Else
{
}


If (C32 = 1) ;チェックボックス32つ目
{

;URLを省略
;newtext := RegExReplace( NewText, "Sun\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Mon\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Tue\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Wed\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Thu\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Fri\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Sat\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d", "日付略")
;newtext := RegExReplace( NewText, "\n@.+?日付略", "リプライ")
;newtext := RegExReplace( NewText, "RT\s@.+?:", "リツイート")

newtext := RegExReplace( NewText, "Sun\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Mon\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Tue\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Wed\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Thu\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Fri\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Sat\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d", "次のツイート")
newtext := RegExReplace( NewText, "\n@.+?次のツイート", " ")
newtext := RegExReplace( NewText, "RT\s@.+?:", "リツイート")
newtext := RegExReplace( NewText, "s)リツイート.*?次のツイート", "")
newtext := RegExReplace( NewText, "s)TwimeMachine.+?Back\sto\sTop", "")
sleep, 100
}










If (C4 = 1) ;チェックボックス4つ目
{



;2chのメタデータを省略
newtext := RegExReplace( NewText, "20\d\d\/\d\d\/\d\d.*?ID:\w*", "")

;したらば掲示板のメタデータを省略
newtext := RegExReplace( NewText, "m)\：20\d\d/\d\d/\d\d\(.\)\s\d\d\:\d\d\:\d\d\sID\:.+?$", "　")

;tumblrのメタデータを省略
newtext := RegExReplace( NewText, "(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)\s\d{1,2}\,\s20\d\d", "次")
newtext := RegExReplace( NewText, "\d+\sリアクション", "")
newtext := RegExReplace( NewText, "\d+?\,\d+\sリアクション", "")

;MsgBox %newtext%が変数の内容です
}
Else
{
}





        If ( kidouroid = 1 ) {
			WinWait, VOICEROID＋ 結月ゆかり EX, , 10
			;MsgBox %kidouroid%を起動
			
			Sleep, 200
        }
 
 
         If ( kidouroid = 2 ) {
			WinWait, VOICEROID＋ 民安ともえ EX, , 10
			;MsgBox %kidouroid%を起動			
			Sleep, 200			
        }
		
		
        If ( kidouroid = 3 ) {
			WinWait, VOICEROID＋ 琴葉茜, , 10
			;MsgBox %kidouroid%を起動			
			Sleep, 200			
        }

        If ( kidouroid = 4 ) {
			WinWait, VOICEROID＋ 琴葉葵, , 10
			;MsgBox %kidouroid%を起動			
			Sleep, 200
        }		











;停止ボタンを押す
ControlSend, WindowsForms10.BUTTON.app.0.378734a2,{space}, %roid%
Sleep, 100

ControlSetText, WindowsForms10.RichEdit20W.app.0.378734a1, %newtext%,
Sleep, 100

;再生ボタンを押す
ControlSend, WindowsForms10.BUTTON.app.0.378734a1,{space}, %roid%



Return



Exec2:

Gui,Submit,NoHide                                   ;フォームの内容を変数に反映

SplitPath, target ,,,fileextension,,  ;入力情報から拡張子により分岐
	If fileextension =         ;ボイスロイド選択を求める
		{
	}
	else
		{
		MsgBox 保存先はファイルではなくフォルダのみが有効です。	
		return
	}






newtext = %clipboard%

If (C1 = 1) ;チェックボックス一つ目
{

;URLを省略

newtext := RegExReplace( NewText, "http.*?\s", "URL略")
newtext := RegExReplace( NewText, "ttp.*?\s", "URL略")

;MsgBox %newtext%が変数の内容です
}
Else
{
}


If (C2 = 1) ;チェックボックスニつ目
{

;脚注以下を削除
newtext := RegExReplace( NewText, "s)脚注\[編集\].*", "脚注以下を省略")
;案内メニュー以下を削除
newtext := RegExReplace( NewText, "s)案内メニュー\[編集\].*", "案内メニュー以下を省略")
;参考文献以下を削除
newtext := RegExReplace( NewText, "s)参考文献\[編集\].*", "参考文献以下を省略")
;外部リンク以下を削除
newtext := RegExReplace( NewText, "s)外部リンク\[編集\].*", "外部リンク以下を省略")
;脳科学辞典参考文献以下を削除
newtext := RegExReplace( NewText, "s)参考文献.+?元の位置に戻る ↑.*", "参考文献以下を省略")


;目次を削除する
newtext := RegExReplace( NewText, "s)目次\n.*概要", "目次省略、概要")
;概要がない場合目次を削除する(無欲)
newtext := RegExReplace( NewText, "s)目次\n.*?\[編集\]", "目次省略、概要")
;[]で囲まれた部分を削除する。
newtext := RegExReplace( NewText, "\[.*?\]", " ")
;テンプレートを表示を削除する
newtext := RegExReplace( NewText, "テンプレートを表示", "画像終わり")

;出展を省略
newtext := RegExReplace( NewText, "s)Question.book-4.svg.*?信頼性向上にご協力ください。", "出展が不明確です")

;MsgBox %newtext%が変数の内容です
}
Else
{
}



If (C3 = 1) ;チェックボックス3つ目
{

;URLを省略
;newtext := RegExReplace( NewText, "Sun\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Mon\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Tue\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Wed\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Thu\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Fri\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Sat\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d", "日付略")
;newtext := RegExReplace( NewText, "\n@.+?日付略", "リプライ")
;newtext := RegExReplace( NewText, "RT\s@.+?:", "リツイート")

newtext := RegExReplace( NewText, "Sun\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Mon\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Tue\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Wed\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Thu\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Fri\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Sat\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d", "次のツイート")
newtext := RegExReplace( NewText, "\n@.+?次のツイート", " ")
newtext := RegExReplace( NewText, "RT\s@.+?:", "リツイート")
newtext := RegExReplace( NewText, "s)TwimeMachine.+?Back\sto\sTop", "")
;MsgBox %newtext%が変数の内容です
}
Else
{
}


If (C32 = 1) ;チェックボックス32つ目
{

;URLを省略
;newtext := RegExReplace( NewText, "Sun\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Mon\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Tue\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Wed\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Thu\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Fri\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Sat\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d", "日付略")
;newtext := RegExReplace( NewText, "\n@.+?日付略", "リプライ")
;newtext := RegExReplace( NewText, "RT\s@.+?:", "リツイート")

newtext := RegExReplace( NewText, "Sun\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Mon\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Tue\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Wed\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Thu\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Fri\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Sat\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d", "次のツイート")
newtext := RegExReplace( NewText, "\n@.+?次のツイート", " ")
newtext := RegExReplace( NewText, "RT\s@.+?:", "リツイート")
newtext := RegExReplace( NewText, "s)リツイート.*?次のツイート", "")
newtext := RegExReplace( NewText, "s)TwimeMachine.+?Back\sto\sTop", "")
;MsgBox %newtext%が変数の内容です
}










If (C4 = 1) ;チェックボックス4つ目
{



;2chのメタデータを省略
newtext := RegExReplace( NewText, "20\d\d\/\d\d\/\d\d.*?ID:\w*", "名無し")

;したらば掲示板のメタデータを省略
newtext := RegExReplace( NewText, "m)\：20\d\d/\d\d/\d\d\(.\)\s\d\d\:\d\d\:\d\d\sID\:.+?$", "　")

;tumblrのメタデータを省略
newtext := RegExReplace( NewText, "(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)\s\d{1,2}\,\s20\d\d", "次")
newtext := RegExReplace( NewText, "\d+\sリアクション", "")
newtext := RegExReplace( NewText, "\d+?\,\d+\sリアクション", "")
;MsgBox %newtext%が変数の内容です
}
Else
{
}




        If ( kidouroid = 1 ) {
			WinWait, VOICEROID＋ 結月ゆかり EX, , 10
			Sleep, 200
        }
 
 
         If ( kidouroid = 2 ) {
			WinWait, VOICEROID＋ 民安ともえ EX, , 10
			Sleep, 200			
        }
		
		
        If ( kidouroid = 3 ) {
			WinWait, VOICEROID＋ 琴葉茜, , 10
			Sleep, 200			
        }

        If ( kidouroid = 4 ) {
			WinWait, VOICEROID＋ 琴葉葵, , 10
			Sleep, 200
        }		











;停止ボタンを押す
ControlSend, WindowsForms10.BUTTON.app.0.378734a2,{space}, %roid%
Sleep, 200

ControlSetText, WindowsForms10.RichEdit20W.app.0.378734a1, %newtext%,
Sleep, 200



;音声保存ボタンを押すコレ以下が異なる
ControlSend, WindowsForms10.BUTTON.app.0.378734a3,{space}, %roid%
Sleep, 100
;タイトルを入力

StringReplace, newtext, newtext, `r`n, , All  ;改行を消す
StringLeft, savefiletitle, newtext, 10  ;頭の20文字を抽出タイトルに

voicefilename = %Target%\%voiceroidname%_%savefiletitle%.wav


Sleep, 100
WinWait, 音声ファイルの保存,,10
sleep, %TargetWait%
sleep, %TargetWait%

ControlSetText, Edit1, %Voicefilename%, 音声ファイルの保存  ;保存処理
ControlClick, Button1, 音声ファイルの保存, 保存(&S),LEFT ,1

sleep, %TargetWait%

	IfWinExist, 音声ファイルの保存,置き換えますか
	{
	ControlClick, Button1, 音声ファイルの保存, はい(&Y),LEFT ,2
	}

sleep, %TargetWait%
	IfWinExist, 音声ファイルの保存,置き換えますか
	{
	ControlClick, Button1, 音声ファイルの保存, はい(&Y),LEFT ,2
	}


sleep, %TargetWait%

	IfWinExist, 音声保存
	{
	WinWaitClose ;ウィンドウが閉じるまで待機
	}



	IfWinExist, エラー, 
	{
	MsgBox VOICEROIDにエラーが発生したので処理を中断します
	return
	}	
	
	
Return



Exec3:
Gui,Submit,NoHide                                   ;フォームの内容を変数に反映


SplitPath, target2 ,,,fileextension,,  ;入力情報から拡張子により分岐
	If fileextension =         ;音声化条件分岐
		{
	}
	else
		{
		MsgBox 音声化はファイルではなくくフォルダのみが有効です。	
		return
	}


	
	
	
SplitPath, target ,,,fileextension,,  ;入力情報から拡張子により分岐
	If fileextension =         ;ボイスロイド選択を求める
		{
	}
	else
		{
		MsgBox 保存先はファイルではなくフォルダのみが有効です。	
		return
	}
	



	
	
	
	



	If Target2 =         ;テキスト入力を求める
	{
	MsgBox 音声化するフォルダを入力してください。
	return
	}

	If kidouroid =         ;ボイスロイド選択を求める
	{
	MsgBox 利用するボイスロイドを選んでください。
	return
	}	
	

	if kidouroid = 1
		{
		SoundPlay, data\yukari_処理を開始します.wav
	}
	if kidouroid = 2
		{
		SoundPlay, data\maki_処理を開始します.wav
	}
	if kidouroid = 3
		{
		SoundPlay, data\akane_処理を開始します.wav
	}
	if kidouroid = 4
		{
		SoundPlay, data\aoi_処理を開始します.wav
	}

;MsgBox ループ開始


looptarget = %Target2%\*.txt
Loop, %looptarget%
{  
FileRead, OutputVar, %A_LoopFileFullPath%



;MsgBox 停止ボタン
;停止ボタンを押す
ControlSend, WindowsForms10.BUTTON.app.0.378734a2,{space}, %roid%

NewText2 = %OutputVar%
Clipboard = %A_LoopFileName%

;MsgBox %NewText2%
ControlSetText, WindowsForms10.RichEdit20W.app.0.378734a1, %NewText2%, %roid%

Sleep, %TargetWait%


;音声保存ボタンを押す
ControlSend, WindowsForms10.BUTTON.app.0.378734a3,{space}, %roid%
Sleep, %TargetWait%
;MsgBox 音声保存ボタン
;タイトルを入力
SplitPath, A_LoopFileName ,,,,titleonly,  ;タイトルのみ





	If (C21 = 1) ;頭に番号にチェックが入っている場合
		{
		voicefilename = %Target%\%A_Index%_%voiceroidname%_%titleonly%.wav
	}
	else
		{
		voicefilename = %Target%\%voiceroidname%_%titleonly%.wav
	}

WinWait, 音声ファイルの保存,,10
sleep, %TargetWait%
sleep, %TargetWait%

ControlSetText, Edit1, %voicefilename%, 音声ファイルの保存  ;保存処理
ControlClick, Button1, 音声ファイルの保存, 保存(&S),LEFT ,1

sleep, %TargetWait%

	IfWinExist, 音声ファイルの保存,置き換えますか
	{
	ControlClick, Button1, 音声ファイルの保存, はい(&Y),LEFT ,2
	}

sleep, %TargetWait%

	IfWinExist, 音声保存
	{
	WinWaitClose ;ウィンドウが閉じるまで待機
	}	


	IfWinExist, エラー, 
	{
	MsgBox VOICEROIDにエラーが発生したので処理を中断します
	return
	}
}


	if kidouroid = 1
		{
		SoundPlay, data\yukari_処理が完了しました.wav
	}
	if kidouroid = 2
		{
		SoundPlay, data\maki_処理が完了しました.wav
	}
	if kidouroid = 3
		{
		SoundPlay, data\akane_処理が完了しました.wav
	}
	if kidouroid = 4
		{
		SoundPlay, data\aoi_処理が完了しました.wav
	}



Return


















;テキストを分割出力
Exec5:

Gui, Submit, NoHide   ;チェックボックスを変数に反映




SplitPath, target21 ,,,fileextension,,  ;入力情報から拡張子により分岐

	If fileextension =  txt       ;ボイスロイド選択を求める
	{
	}
	else
	{
		MsgBox 分割はテキストファイルのみが有効です。	
		return
	}




SplitPath, target ,,,fileextension,,  ;入力情報から拡張子により分岐
	If fileextension =         ;ボイスロイド選択を求める
		{
	}
	else
		{
		MsgBox 保存先はファイルではなくフォルダのみが有効です。	
		return
	}
	
	
	
	
	
	
	




stringsize := target22
;msgbox %stringsize%
stringstartpoint := 1
SplitPath, target21 ,,,,filename,  ;ファイル名をパスから抽出

msgbox %filename%
;filename = dt000_tumblr全テータ
FileRead, textbunch, %target21%

Loop 1000
{

StringMid, hackedstring, textbunch, %stringstartpoint%, %stringsize%
;msgbox %hackedstring%
FileAppend , %hackedstring%, %target%\%Filename%%A_Index%.txt


if hackedstring = 
{
break
}

stringstartpoint := stringsize * A_Index + 1
;msgbox %stringstartpoint%
}




SoundPlay, data\akane_処理が完了しました.wav
return

























;■無変換キーで選択範囲をVoiceroid再生
+r::
vk1Dsc07B::

Gui,Submit,NoHide                                   ;フォームの内容を変数に反映
clip_bk = %ClipboardAll%
clipboard = 
Send,^c
ClipWait, 2
newtext = %clipboard%
Clipboard = %clip_bk%


	If kidouroid =         ;ボイスロイド選択を求める
	{
	MsgBox 利用するボイスロイドを選んでください。
	return
	}	









If (C1 = 1) ;チェックボックス一つ目
{

;URLを省略

newtext := RegExReplace( NewText, "http.*?\s", "URL略")
newtext := RegExReplace( NewText, "ttp.*?\s", "URL略")

;MsgBox %newtext%が変数の内容です
}


If (C2 = 1) ;チェックボックスニつ目
{

;案内メニュー以下を削除
newtext := RegExReplace( NewText, "s)案内メニュー[編集].*", "案内メニュー以下を省略")
;参考文献以下を削除
newtext := RegExReplace( NewText, "s)参考文献[編集].*", "参考文献以下を省略")
;外部リンク以下を削除
newtext := RegExReplace( NewText, "s)外部リンク[編集].+", "外部リンク以下を省略")
;脳科学辞典参考文献以下を削除
newtext := RegExReplace( NewText, "s)参考文献.+?元の位置に戻る ↑.+", "参考文献以下を省略")


;目次を削除する
newtext := RegExReplace( NewText, "s)目次.*概要", "目次省略、概要")
;概要がない場合目次を削除する(無欲)
newtext := RegExReplace( NewText, "s)目次.*?\[編集\]", "目次省略、概要")
;[]で囲まれた部分を削除する。
newtext := RegExReplace( NewText, "\[.*?\]", " ")
;テンプレートを表示を削除する
newtext := RegExReplace( NewText, "テンプレートを表示", "画像終わり")

;出展を省略
newtext := RegExReplace( NewText, "s)Question.book-4.svg.*?信頼性向上にご協力ください。", "出展が不明確です")

;MsgBox %newtext%が変数の内容です
}
Else
{
}



If (C3 = 1) ;チェックボックス3つ目
{

;URLを省略
;newtext := RegExReplace( NewText, "Sun\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Mon\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Tue\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Wed\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Thu\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Fri\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Sat\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d", "日付略")
;newtext := RegExReplace( NewText, "\n@.+?日付略", "リプライ")
;newtext := RegExReplace( NewText, "RT\s@.+?:", "リツイート")

newtext := RegExReplace( NewText, "Sun\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Mon\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Tue\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Wed\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Thu\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Fri\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Sat\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d", "次のツイート")
newtext := RegExReplace( NewText, "\n@.+?次のツイート", " ")
newtext := RegExReplace( NewText, "RT\s@.+?:", "リツイート")
newtext := RegExReplace( NewText, "s)TwimeMachine.+?Back\sto\sTop", "")
;MsgBox %newtext%が変数の内容です
}

If (C32 = 1) ;チェックボックス32つ目
{

;URLを省略
;newtext := RegExReplace( NewText, "Sun\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Mon\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Tue\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Wed\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Thu\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Fri\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Sat\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d", "日付略")
;newtext := RegExReplace( NewText, "\n@.+?日付略", "リプライ")
;newtext := RegExReplace( NewText, "RT\s@.+?:", "リツイート")

newtext := RegExReplace( NewText, "Sun\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Mon\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Tue\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Wed\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Thu\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Fri\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d|Sat\s\w\w\w\s\d\d\s\d\d:\d\d:\d\d\s\+0000\s20\d\d", "次のツイート")
newtext := RegExReplace( NewText, "\n@.+?次のツイート", " ")
newtext := RegExReplace( NewText, "RT\s@.+?:", "リツイート")
newtext := RegExReplace( NewText, "s)リツイート.*?次のツイート", "")  ;リツイート消去
newtext := RegExReplace( NewText, "s)TwimeMachine.+?Back\sto\sTop", "")
;MsgBox %newtext%が変数の内容です
}











If (C4 = 1) ;チェックボックス4つ目
{



;2chのメタデータを省略
newtext := RegExReplace( NewText, "20\d\d\/\d\d\/\d\d.*?ID:\w*", "")

;したらば掲示板のメタデータを省略
newtext := RegExReplace( NewText, "m)\：20\d\d/\d\d/\d\d\(.\)\s\d\d\:\d\d\:\d\d\sID\:.+?$", "　")


;tumblrのメタデータを省略
newtext := RegExReplace( NewText, "(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)\s\d{1,2}\,\s20\d\d", "次")
newtext := RegExReplace( NewText, "\d+\sリアクション", "")
newtext := RegExReplace( NewText, "\d+?\,\d+\sリアクション", "")
;MsgBox %newtext%が変数の内容です
}
Else
{
}

sleep 100


WinWait, %roid%, , 10
;MsgBox %roid%を起動











;停止ボタンを押す
ControlSend, WindowsForms10.BUTTON.app.0.378734a2,{space}, %roid%
Sleep, %TargetWait%

ControlSetText, WindowsForms10.RichEdit20W.app.0.378734a1, %newtext%,
Sleep, %TargetWait%

;再生ボタンを押す
ControlSend, WindowsForms10.BUTTON.app.0.378734a1,{space}, %roid%



return















;GUIによる停止ボタンの操作
Exec4:               
Gui,Submit,NoHide                                   ;フォームの内容を変数に反映
ControlSend, WindowsForms10.BUTTON.app.0.378734a2,{space}, %roid%
return


;GUIによる再生一時停止ボタン
vk1Csc079::
Exec14:

	Gui,Submit,NoHide                                   ;フォームの内容を変数に反映
	ControlSend, WindowsForms10.BUTTON.app.0.378734a1,{space}, %roid%
return






GuiDropFiles:                                       ;ウィンドウにファイルがドロップされたときに実行される

if A_GuiY < 135
{
StringSplit,fn,A_GuiEvent,`n                        ;ファイル名の一覧を一つずつに分割
GuiControl,,Target,%fn1%                            ;エディットボックスに一つめのファイル名を設定

;Msgbox X座標は %A_GuiX% Y座標は %A_GuiY%
}



if  (A_GuiY >= 135) and (A_GuiY < 280)
{
StringSplit,fn,A_GuiEvent,`n                        ;ファイル名の一覧を一つずつに分割
GuiControl,,target21,%fn1%                            ;エディットボックスに一つめのファイル名を設定

;Msgbox X座標は %A_GuiX% Y座標は %A_GuiY%
}


if  A_GuiY > 280
{
StringSplit,fn,A_GuiEvent,`n                        ;ファイル名の一覧を一つずつに分割
GuiControl,,target2,%fn1%                            ;エディットボックスに一つめのファイル名を設定

;Msgbox X座標は %A_GuiX% Y座標は %A_GuiY%
}






Return                                              ;サブルーチンを終了




GuiClose:
ExitApp

GuiEscape:
ExitApp




;改行で区切れるサンプルスクリプト
Exec52:


Gui, Submit, NoHide   ;チェックボックスを変数に反映


FileRead, newtext, %target21% ;ファイル読み込み

yukaritext = yukari_
makitext = maki_
aoitext = aoi_
akanetext = akane_

Loop, Parse, newtext, `n|`,, `r`n
	{
	IfInString, A_LoopField, %yukaritext%
		{
		kidouroid := 1
		roid = VOICEROID＋ 結月ゆかり EX
		voiceroidname = yukari
		
		
		StringReplace, newtext2, A_LoopField ,%yukaritext%
		;MsgBox,  %a_index% yukariiiin %newtext2%.
		}

	IfInString, A_LoopField, %makitext%
		{
		kidouroid := 2
		roid = VOICEROID＋ 民安ともえ EX
		voiceroidname = maki
		
		
		
		
		StringReplace, newtext2, A_LoopField ,%makitext%,
		;MsgBox,  %a_index% makiiii %newtext2%.
		}
		
	IfInString, A_LoopField, %akanetext%
		{
		kidouroid := 3
		roid = VOICEROID＋ 琴葉茜  ;以下ボイスロイドを操作
		voiceroidname = akane
		
		
		
		
		
		StringReplace, newtext2, A_LoopField ,%akanetext%,
		;MsgBox,  %a_index% akaneee %newtext2%.
		}
		
	IfInString, A_LoopField, %aoitext%
		{
		kidouroid := 4
		roid = VOICEROID＋ 琴葉葵  ;以下ボイスロイドを操作						
		voiceroidname = aoi
		
		
		
		
		
		StringReplace, newtext2, A_LoopField ,%aoitext%,
		;MsgBox,  %a_index% aoiii %newtext2%.
		}
		
		If !RegExMatch(A_LoopField,"yukari_|maki_|akane_|aoi_")
		{
		newtext2 = %A_LoopField%
		;MsgBox,  %a_index% is %newtext2%.
		}
		
		
		
		
		
		
		
		
;停止ボタンを押す
ControlSend, WindowsForms10.BUTTON.app.0.378734a2,{space}, %roid%


ControlSetText, WindowsForms10.RichEdit20W.app.0.378734a1, %NewText2%, %roid%

Sleep, %TargetWait%


;音声保存ボタンを押す
ControlSend, WindowsForms10.BUTTON.app.0.378734a3,{space}, %roid%
Sleep, %TargetWait%
;MsgBox 音声保存ボタン
;タイトルを入力

if (C33 = 1)
{
voicefilename = %Target%\%voiceroidname%_%A_Index%_%newtext2%.wav
}
else
{
voicefilename = %Target%\%voiceroidname%_%newtext2%.wav
}
		
		
WinWait, 音声ファイルの保存,,10
sleep, %TargetWait%
sleep, %TargetWait%


ControlSetText, Edit1, %voicefilename%, 音声ファイルの保存  ;保存処理
ControlClick, Button1, 音声ファイルの保存, 保存(&S),LEFT ,1

sleep, %TargetWait%

	IfWinExist, 音声ファイルの保存,置き換えますか
	{
	ControlClick, Button1, 音声ファイルの保存, はい(&Y),LEFT ,2
	}

sleep, %TargetWait%
	IfWinExist, 音声ファイルの保存,置き換えますか
	{
	ControlClick, Button1, 音声ファイルの保存, はい(&Y),LEFT ,2
	}



	IfWinExist, 音声保存
	{
	WinWaitClose ;ウィンドウが閉じるまで待機
	}	


	IfWinExist, エラー, 
	{
	MsgBox VOICEROIDにエラーが発生したので処理を中断します
	return
	}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
Return

