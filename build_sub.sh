if [ -z "$1" ]; then
    echo "Please select a guest os type."
    echo "Usage: build.sh [Guest OS Type]"
    exit 1;
fi

GUEST_OS="$1"
echo "GUEST_OS = $GUEST_OS"

CURPATH=`pwd`

# Install Wildfly server and Fluentd client agent
cd $CURPATH/jboss
sudo sh -x build.sh "$GUEST_OS"

# Install Fluentd server (log collector)
cd $CURPATH/collector
sudo sh -x build.sh "$GUEST_OS"

# Install PostgreSQL
cd $CURPATH/postgresql
sudo sh -x build.sh "$GUEST_OS"

# Basic Configuration
cd $CURPATH
sudo sh -x configure.sh
