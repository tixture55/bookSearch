require 'open-uri'
require 'nokogiri'

#スクレイピング先のURL
url = 'http://finance.yahoo.com/q/cf?s=KO+Cash+Flow&annual'#米コカコーラ

charset = nil
html = open(url) do |f|
charset = f.charset #文字種別を取得
f.read #htmlを読み込んで変数htmlに渡す
end

#htmlをパース(解析)してオブジェクトを作成
doc = Nokogiri::HTML.parse(html, nil, charset)
#抽出したいデータノードを取り出す
	mainNode = doc.css("table#yfncsumtab")
##ループの行が長くなるので代入
	trs = mainNode.css('tr > td > table > tr > td > table > tr')

#抽出後のデータ格納
	cashHash = trs.inject({}) do |hash, tr|

##tr.textが空文字列であれば次のループへ
	next hash if tr.text.empty?

	dataAry = tr.css('td').map do |td|
#データ配列に追加
	data = td.text.gsub(/[\u00A0\n]/, '').strip
	end
##暫定的にdataAry[0]に突っ込んでいたkeyNmを取り出す
	keyNm = dataAry.shift
#ハッシュに追加後にキーで取り出して使う予定
	hash[keyNm] = dataAry

	hash
	end

#データ確認
	cashHash.each do |key, value|
	puts "---------------------"
	puts key
	puts "---------------------"
	value.each do |data|
	puts data 
	end
	end
