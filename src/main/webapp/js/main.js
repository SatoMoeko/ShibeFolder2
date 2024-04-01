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
   