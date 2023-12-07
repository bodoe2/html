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
  video.controls = false; 
  video.style.width = "100%";
  video.style.height = "100%";
  document.body.innerHTML = "";
  document.body.appendChild(video);

  video.addEventListener("loadedmetadata", function () {
    document.documentElement.style.overflow = "hidden"; 
  });

  document.addEventListener("fullscreenchange", function () {
    if (!document.fullscreenElement) {
      document.documentElement.style.overflow = "auto";
      isFullScreen = false;
    }
  });

  video.addEventListener("ended", function () {
    window.close();
  });
}

document.addEventListener("keydown", function (e) {
  if (e.key === "F11" || e.key === "Escape") {
    e.preventDefault();
    if (isFullScreen) {
      document.exitFullscreen();
      isFullScreen = false;
    }
  }
});
