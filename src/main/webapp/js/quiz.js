/**
 * 
 */

 	
	'use strict';
	// 問題内容、答え、画像ファイル名を配列で用意
window.onload=()=>{
	const animals=[
    ['Q.柴犬は日本のどこの地域が原産と言われている？', '本州地方', 'shibe01.jpg'],
    ['Q.柴犬の祖先と言われているのは何々犬？', '縄文犬', 'shibe02.jpg'],
    ['Q.柴犬の一般的な特徴は？', '短毛・立ち耳・巻き尾', 'shibe03.jpg'],
    ['Q.柴犬の毛色の種類は何色ある？', '4色', 'shibe04.jpg'],
    ['Q.柴犬の種類は？', '5種類', 'shibe05.jpg'],
    ['Q.柴犬の顔タイプは何顔と何顔？', 'キツネ顔とタヌキ顔', 'shibe06.jpg'],
    ['Q.巻かずに背上に差している尾のことをなんという？', '差尾', 'shibe07.jpg'],
    ['Q.日本の天然記念物に指定されたのは昭和何年？', '昭和11年', 'shibe08.jpg'],
    ['Q.柴犬の「柴」はどういう意味？', '小さい', 'shibe09.jpg'],
    ['Q.柴犬と豆柴の違いは？', '大きさだけ', 'shibe10.jpg'],
];

// 必要なHTML要素を取得
const ja = document.getElementById("ja");
const entry = document.getElementById("entry");
const img = document.getElementById("img");
const btn = document.getElementById("btn");
const result = document.getElementById("result");

let index = 0; // 問題番号
let correct = 0; // 正解数

// ボタンクリック時の処理
btn.addEventListener("click", () => {
    let ans = entry.value.toLowerCase();
    let msg = "";

    // 入力した解答と答えを比較。正解、不正解時の文字を用意
    if (ans == animals[index][1]) {
        correct++;
        msg = "正解!";
    } else {
        msg = `不正解!<br>こたえは${animals[index][1]}`;
    }

    // 問題番号が用意した問題数と同じになったら
    if (index == animals.length - 1) {
        msg += `<br>全${animals.length}問中,${correct}問正解`;
        index = -1;
		correct=0;	
    }

    // 解答結果を表示（1.5秒経過で表示が消える）
    result.innerHTML = msg;
    result.classList.remove("fade");
//    setTimeout(function(){
//        result.classList.add("fade");
//    }, 9500);

    // 次の問題へ
    setItem(++index);
    entry.focus();
});

// 最初の問題を設定
setItem(index);


/* ここから下は関数定義 */
// 入力欄を空にして、問題文と画像を設定する
function setItem(index) {
    entry.value = "";
    ja.textContent = animals[index][0];
    img.src = "images/" + animals[index][2];
}
}
	
