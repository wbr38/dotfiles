ffmpeg \
    -i "$1 (Source 1).mp4" \
    -i "$1 (Source 2).mp4" \
    -filter_complex "[0:v][1:v]hstack=inputs=2[v]" \
    -map "[v]" \
    -map 0:a \
    -c:v libx264 \
    -preset ultrafast \
    -crf 30 \
    -c:a copy \
    -shortest \
    "$1.mp4"
