from winsdk.windows.media.control import GlobalSystemMediaTransportControlsSessionManager
from winsdk.windows.storage.streams import InputStreamOptions, Buffer
import traceback
import datetime
import asyncio
import time

async def get_sessions():
    sessions = await GlobalSystemMediaTransportControlsSessionManager.request_async()
    return sessions

async def get_song_info(session):
    if session:
        media_info = await session.try_get_media_properties_async()
        playback_info = session.get_playback_info()
        timeline_info = session.get_timeline_properties()

        # Get thumbnail
        # stream = await media_info.thumbnail.open_read_async()
        # thumbnail_buffer = Buffer(stream.size)
        # await stream.read_async(thumbnail_buffer, stream.size, InputStreamOptions.NONE)

        # Construct song info string
        media_str_full = media_info.artist + "  " + media_info.title
        if len(media_str_full) > 42:
            media_str_full = media_str_full[:40] + "..."
        # Split based on timeline position
        try:
            split_index = int(timeline_info.position.total_seconds() / timeline_info.end_time.total_seconds() * len(media_str_full))
        except ZeroDivisionError:
            split_index = 0
        media_str_1 = media_str_full[:split_index]
        media_str_2 = media_str_full[split_index:]

        # Get if song is playing
        playing = playback_info.playback_status == 4

        # return media_str_1, media_str_2, thumbnail_buffer, playing
        return media_str_1, media_str_2, Buffer(0), playing

    # Nothing is playing
    # return "¯\\_(ツ)_/¯", "", Buffer(0), False
    return "No Song Playing", "", Buffer(0), False

if __name__ == "__main__":
    try:
        sessions = asyncio.run(get_sessions())
        while True:
            time.sleep(0.5)

            try:
                current_session = sessions.get_current_session()
                data = asyncio.run(get_song_info(current_session))
                song_info_1, song_info_2, thumbnail_buffer, playing = data
            except OSError:
                continue

            try:
                with open("song_info_1.txt", "w", encoding="utf-8") as file:
                    file.write(song_info_1)
                with open("song_info_2.txt", "w", encoding="utf-8") as file:
                    file.write(song_info_2)
                with open("song_playing.txt", "w", encoding="utf-8") as file:
                    file.write("󰎈" if playing else "󰎊")
                # with open("song_thumbnail.png", "wb") as file:
                #     file.write(thumbnail_buffer)
            except PermissionError:
                continue

    except Exception as e:
        with open("python_errors.txt", "a") as file:
            file.write(f"[{datetime.datetime.now()}]\n{str(e)}\n{traceback.format_exc()}\n\n")
        raise e
