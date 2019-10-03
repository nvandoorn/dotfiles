# Install ffmpeg first
# brew install ffmpeg --with-libvpx --with-libvorbis --with-fdk-aac --with-opus
echo "Usage ./transcode <input> <output>"
ffmpeg -an -i $1 -vcodec libx264 -pix_fmt yuv420p -profile:v baseline -level 3 $2
