// DOMが読み込まれたタイミングで実行
document.addEventListener("DOMContentLoaded", () => {
  // Payjpを初期化（環境変数または直接テスト公開鍵を使用）
  const payjp = Payjp(process.env.PAYJP_PUBLIC_KEY || 'pk_test_xxxxxxxxxxxxxxxxxx');

  // PayjpのElementを生成
  const elements = payjp.elements();

  // カード情報入力欄を作成
  const numberElement = elements.create("cardNumber"); // カード番号
  const expiryElement = elements.create("cardExpiry"); // 有効期限
  const cvcElement = elements.create("cardCvc");       // CVC

  // フォーム上のdivにマウント（フォームのIDに合わせる）
  numberElement.mount("#number-form");
  expiryElement.mount("#expiry-form");
  cvcElement.mount("#cvc-form");

  // フォーム送信時の処理
  const form = document.getElementById("charge-form");
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
      const tokenInput = document.createElement("input");
      tokenInput.setAttribute("type", "hidden");
      tokenInput.setAttribute("name", "token");
      tokenInput.setAttribute("value", response.id);
      form.appendChild(tokenInput);

      // セキュリティのためカード情報入力欄を削除
      document.getElementById("number-form").remove();
      document.getElementById("expiry-form").remove();
      document.getElementById("cvc-form").remove();

      // トークン付でフォームを送信
      form.submit();
    });
  });
});
