// DOMが読み込まれたタイミングで実行
document.addEventListener("DOMContentLoaded", () => {
  const form = document.getElementById("charge-form");
  if (!form) return;

  // Payjpを初期化（公開鍵）
  const payjp = Payjp("pk_test_361804dc4aa15802e70879b8"); //公開鍵を入れる

  // PayjpのElementを生成
  const elements = payjp.elements();

  
  // mount済みなら処理をスキップ
  if (document.querySelector("#number-form iframe")) return;

  // カード情報入力欄を作成
  const numberElement = elements.create("cardNumber"); // カード番号
  const expiryElement = elements.create("cardExpiry"); // 有効期限
  const cvcElement = elements.create("cardCvc");       // CVC

  document.getElementById("number-form") && numberElement.mount("#number-form");
  document.getElementById("expiry-form") && expiryElement.mount("#expiry-form");
  document.getElementById("cvc-form") && cvcElement.mount("#cvc-form");

  // フォーム送信時の処理
  form.addEventListener("submit", (e) => {
    e.preventDefault(); // デフォルト送信を止める

  // カード情報をPayjpに送ってトークン生成
    payjp.createToken(numberElement).then((response) => {
      if (response.error) {
        // エラーがあればアラート表示
        alert(response.error.message);
        return;
      }

      // トークンをhidden inputとしてフォームに追加
      const token = response.id;
      const tokenInput = document.getElementById("card-token");
      tokenInput.value = token;

      // セキュリティのためカード情報入力欄を削除
      document.getElementById("number-form")?.remove();
      document.getElementById("expiry-form")?.remove();
      document.getElementById("cvc-form")?.remove();

      // トークン付でフォームを送信
      form.submit();
    });
  });
});
