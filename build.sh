if [ -z "$1" ]; then
    echo "Please select a guest os type."
    echo "Usage: build.sh [Guest OS Type]"
    exit 1;
fi

GUEST_OS="$1"
echo "GUEST_OS = $GUEST_OS"

sudo sh -x "$GUEST_OS".sh