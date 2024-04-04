/**
 * 
 */

  const button = document.getElementById('click');
  const image = document.getElementById('image');
  const researchUrl=document.getElementById('researchUrl');
  
    //webapiから画像をランダム表示
  button.addEventListener('click', () => {
        fetch('https://shibe.online/api/shibes?count=1&urls=true&httpsUrls=true') // APIのURL
        .then(response => {
            return response.json();
        })
        .then(myJson => {
         // imgタグに取得したURL画像を入れる
            image.src = myJson;
            researchUrl.value=myJson;
            
            button.innerText = 'いぬだ！'
        });
    });   
   
   //トグル 
    $("#btn").click(() => {
		$("#toggle").slideToggle();
	});
	
	
	
	
	
	// 問題内容、答え、画像ファイル名を配列で用意
const animals = [
    ['ぞう', 'elephant', 'elephant.png'],
    ['しろくま', 'polarbear', 'polarbear.png'],
    ['くじら', 'whale', 'whale.png'],
    ['ペンギン', 'penguin', 'penguin.png'],
    ['ライオン', 'lion', 'lion.png'],
    ['カンガルー', 'kangaroo', 'kangaroo.png'],
    ['ひと', 'human', 'human.png'],
    ['いぬ', 'dog', 'dog.png'],
    ['ねこ', 'cat', 'cat.png'],
    ['あり', 'ant', 'ant.png'],
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
        msg = `不正解!${animals[index][0]}の英単語は${animals[index][1]}`;
    }

    // 問題番号が用意した問題数と同じになったら
    if (index == animals.length - 1) {
        msg += `<br>全${animals.length}問中,${correct}問正解`;
        index = -1;
				correct = 0;
    }

    // 解答結果を表示（1.5秒経過で表示が消える）
    result.innerHTML = msg;
    result.classList.remove("fade");
    setTimeout(() => {
        result.classList.add("fade");
    }, 1500);

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
	
   