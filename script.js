let isFullScreen = false;

function toggleFullScreen() {
  const elem = document.documentElement;

  if (!isFullScreen) {
    elem.requestFullscreen().then(() => {
      playVideo();
      isFullScreen = true;
    });
  } else {
    document.exitFullscreen();
    isFullScreen = false;
  }
}

function playVideo() {
  const video = document.createElement("video");
  video.src = "gif/link.mp4";
  video.autoplay = true;
  video.controls = false; // 컨트롤 숨김
  video.style.width = "100%";
  video.style.height = "100%";
  document.body.innerHTML = "";
  document.body.appendChild(video);

  // 모바일에서 동영상 자동 재생을 위해 사용자 상호 작용을 체크
  const playPromise = video.play();
  if (playPromise !== undefined) {
    playPromise.catch(() => {
      // Autoplay was prevented.
      // This can happen on mobile devices.
      // Manually trigger the play button for the user to interact.
      video.addEventListener('click', () => {
        video.play();
      });
    });
  }

  // mp4 화면에서 스크롤 바 및 컨트롤 숨기기
  video.addEventListener("loadedmetadata", function () {
    document.documentElement.style.overflow = "hidden"; // 스크롤 바 숨김
  });

  // 전체화면에서 나올 때 컨트롤 및 스크롤 바 다시 보이기
  document.addEventListener("fullscreenchange", function () {
    if (!document.fullscreenElement) {
      document.documentElement.style.overflow = "auto"; // 스크롤 바 보이기
      isFullScreen = false;
    }
  });

  // 동영상이 종료되면 현재 페이지 닫기
  video.addEventListener("ended", function () {
    window.close();
  });
}

// F11, Esc 키 막기
document.addEventListener("keydown", function (e) {
  if (e.key === "F11" || e.key === "Escape") {
    e.preventDefault();
    if (isFullScreen) {
      document.exitFullscreen();
      isFullScreen = false;
    }
  }
});
