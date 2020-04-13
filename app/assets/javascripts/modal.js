// モーダルウィンドウ用
document.addEventListener(
  "DOMContentLoaded", e => {
    let modal_open = document.getElementById("modal-open-btn");
    // クリック時にウィンドウを表示する
    modal_open.onclick = function () {
      $('#overlay').fadeIn();
      // ボタン押下用のアクション
      document.getElementById('modal-close-btn').onclick = function () {
        $('#overlay').fadeOut();
      };
      document.getElementById("item-bought-btn").onclick = function () {
        document.getElementById("item-buy-btn").click();
      };
    };
  },
  false
);