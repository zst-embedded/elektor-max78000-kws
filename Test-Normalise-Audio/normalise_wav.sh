
TARGET_PATH="./alexa/"
OUTPUT_PATH="./alexa_process/"
mkdir $OUTPUT_PATH
for file in $TARGET_PATH/*.wav
do
    name=${file##*/}
    base=${name%.wav}
    # remove metadata
    # Signed 16 bit PCM Little Endian
    # Exactly 16kHz sampling
    # Exactly 128kbit/s bit rate
    ffmpeg -i $TARGET_PATH/$name -map_metadata -1 -acodec pcm_s16le -ac 1 -ar 16000 -ab 128k -ss 0.00 -to 1.00 -f wav -y $OUTPUT_PATH/$name
    echo "$name"
done
