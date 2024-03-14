var _status = video_get_status();

if (keyboard_check_pressed(vk_space))
{
    if (_status == video_status_playing)
    {
        video_pause();
    }
    else if (status == video_status_paused)
    {
        video_resume();
    }
}