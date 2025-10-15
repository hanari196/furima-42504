// DOMが読み込まれたタイミングで実行
document.addEventListener("DOMContentLoaded", () => {
  const form = document.getElementById("charge-form");
  if (!form) return;

  // Payjpを初期化（公開鍵）
  const payjp = Payjp("pk_test_361804dc4aa15802e70879b8"); //公開鍵を入れる

  // PayjpのElementを生成
  const elements = payjp.elements();
 
  // カード情報入力欄を作成
  const numberElement = elements.create("cardNumber"); // カード番号
  const expiryElement = elements.create("cardExpiry"); // 有効期限
  const cvcElement = elements.create("cardCvc");       // CVC

  numberElement.mount("#number-form");
  expiryElement.mount("#expiry-form");
  cvcElement.mount("#cvc-form");

  // フォーム送信時の処理
  form.addEventListener("submit", (e) => {
    e.preventDefault(); // デフォルト送信を止める

  // カード情報をPayjpに送ってトークン生成
    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
      } else {
        const token = response.id;
      }

      numberElement.clear();
      expiryElement.clear();
      cvcElement.clear();
      document.getElementById("charge-form").submit();

      // トークンをhidden inputとしてフォームに追加
      const token = response.id;
      const renderDom = document.getElementById("charge-form");
      const tokenObj = `<input value=${token} type="hidden" name='token'>`;
      renderDom.insertAdjacentHTML("beforeend", tokenObj);
      
      // セキュリティのためカード情報入力欄を削除
      document.getElementById("number-form")?.remove();
      document.getElementById("expiry-form")?.remove();
      document.getElementById("cvc-form")?.remove();

      // トークン付でフォームを送信
      form.submit();
    });
  });
});

window.addEventListener("turbo:load", pay)
