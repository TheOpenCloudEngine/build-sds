if [ -z "$1" ]; then
    echo "Please select a guest os type."
    echo "Usage: build.sh [Guest OS Type]"
    exit 1;
fi
sudo docker build -t collector ./"$1"
