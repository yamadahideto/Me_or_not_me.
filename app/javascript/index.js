document.addEventListener("turbo:load", () => {
  const slideBtn = document.getElementById("slideBtn");
  const image = document.getElementById("bananaimage");

  slideBtn.addEventListener("click", () => {
    // 画像を表示する
    image.style.opacity = 1;

    // スライドアニメーションを実行
    const animation = image.animate(
      [
        { transform: "translateX(-50px)" }, // 開始時の位置
        { transform: "translateX(-380px)" }, // 終了時の位置
      ],
      {
        fill: "forwards", // 再生後も最終状態を保持
        duration: 2000, // アニメーションの時間
      }
    );

    // アニメーション終了時に非表示にする
    animation.onfinish = () => {
      image.style.opacity = 0; // 再び非表示に
    };
  });
});
