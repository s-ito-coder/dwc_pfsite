//Skipprの初期化
$("document").ready(function() {
    // オプションを指定してSkipprの実行
    $(".theTarget").skippr({
        // スライドショーの変化（"fade" or "slide"）
        transition : 'slide',
        // easingの種類
        easing : 'easeOutQuart',
        // ナビゲーションの形（"block" or "bubble"）
        navType : 'block',
        // 子要素の種類（"div" or "img"
        childrenElementType : 'div',
        // ナビゲーション矢印の表示（trueで表示）
        arrows : false,
        // スライドショーの自動再生（falseで自動再生なし）
        autoPlay : true,
        // 自動再生時のスライド切替間隔（ミリ秒）
        autoPlayDuration : 5000,
        // キーボードの矢印キーによるスライド送りの設定（trueで有効）
        keyboardOnAlways : false,
        // 1枚目のスライド表示時に戻る矢印を表示するかどうか（falseで非表示）
        hidePrevious : false
    });
});
