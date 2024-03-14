video = video_open(material);
video_enable_loop(false);

var _videoData = video_draw();
var _videoStatus = _videoData[0];
var videoWidth = 700; // Largura desejada para o vídeo
var videoHeight = 700; // Altura desejada para o vídeo
videoPlaying = false;


if (_videoStatus == 0) {
    draw_surface(_videoData[1], 50, 20);
    //draw_surface_part(_videoData[1], 8, 8, 500, -700, videoWidth, videoHeight);
}
