document.addEventListener("turbo:load", () => {
  const image = document.getElementById("bananaimage");
  const content = document.querySelector("#content");
  const duration = Number(content.dataset.duration);
  const answerBtn = document.getElementById("answer_button");

  setTimeout(() => {
    image.style.opacity = 1;
    // スライドアニメーションを実行
    const animation = image.animate(
      [
        { transform: "translateX(-50px)" }, // 開始時の位置
        { transform: "translateX(-380px)" }, // 終了時の位置
      ],
      {
        fill: "forwards", // 再生後も最終状態を保持
        duration: duration, // アニメーションの時間
      }
    );

    // アニメーション終了時に非表示にする
    animation.onfinish = () => {
      image.style.opacity = 0; // 再び非表示に
      answerBtn.disabled = false;
    };
  }, 1500);
});
