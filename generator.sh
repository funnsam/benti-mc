if [ $# != 3 ]; then
	echo "Usage:"
	echo "./generator.sh <MC_VERSION> <RES_VERSION> <EN_US_LOCATION>"
	exit 1
fi

if ! command -v json-funny &> /dev/null; then
	echo "Install \`json-funny\` first"
    exit 1
fi

if ! command -v zip &> /dev/null; then
	echo "Install \`zip\` first"
    exit 1
fi

rm "$1" "$1.zip" -rf || true
mkdir -p "$1/assets/minecraft/lang" "$1/assets/minecraft/font" "$1/assets/minecraft/textures/font"
cp "./special.png" "$1/assets/minecraft/textures/font/special.png"
cp "./font.json" "$1/assets/minecraft/font/default.json"
json-funny $3 benti $1/assets/minecraft/lang/en_us.json --skip "language.code" --minecraft

echo "{\"pack\":{\"pack_format\": $2, \"description\": \":b:3nti xdxd\"}}" > $1/pack.mcmeta

cd "$1"; zip -r "../$1.zip" .; cd ..
