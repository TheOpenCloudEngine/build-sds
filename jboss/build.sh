if [ -z "$1" ]; then
    echo "Please select a guest os type."
    echo "Usage: build.sh [Guest OS Type]"
    exit 1;
fi
# Copy setting files due to Dockerfile cannot see parent directory file
sudo cp supervisord.conf td-agent.client.conf ./"$1"/
sudo docker build -t jboss ./"$1"
