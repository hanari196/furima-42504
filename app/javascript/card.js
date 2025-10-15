const pay = () => {
  const form = document.getElementById("charge-form");
  if (!form) return;
  if (document.getElementById("number-form")?.children.length > 0) return;

  const payjp = Payjp("pk_test_361804dc4aa15802e70879b8"); //公開鍵を入れる
  const elements = payjp.elements();  // PayjpのElementを生成
  
  const numberElement = elements.create("cardNumber"); // カード番号
  const expiryElement = elements.create("cardExpiry"); // 有効期限
  const cvcElement = elements.create("cardCvc");       // CVC

  numberElement.mount("#number-form");
  expiryElement.mount("#expiry-form");
  cvcElement.mount("#cvc-form");

  // フォーム送信時の処理
  form.addEventListener("submit", (e) => {
  e.preventDefault();

  // カード情報をPayjpに送ってトークン生成
    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
      } else {
        const token = response.id;

        const tokenObj = `<input value="${token}" type="hidden" name="order_address[token]">`;
        form.insertAdjacentHTML("beforeend", tokenObj);
      }
      
      // セキュリティのためカード情報入力欄を削除
      document.getElementById("number-form")?.remove();
      document.getElementById("expiry-form")?.remove();
      document.getElementById("cvc-form")?.remove();

      // トークン付でフォームを送信
      form.submit();
    
      numberElement.clear();
      expiryElement.clear();
      cvcElement.clear();
    });
  }, { once: true }); // submitイベントは1回だけ実行
};

document.addEventListener('turbo:load', pay);
document.addEventListener('turbo:render', pay);