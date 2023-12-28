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

mkdir -p "$1/assets/minecraft/lang"
json-funny $3 benti $1/assets/minecraft/lang/en-us.json --skip "language.code"

echo "{\"pack\":{\"pack_format\": $2, \"description\": \":b:3nti xdxd\"}}" > $1/pack.mcmeta

cd "$1"; zip -r "../$1.zip" .; cd ..
