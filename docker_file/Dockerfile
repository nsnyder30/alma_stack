FROM almalinux:latest
COPY build_files/launcher.sh /usr/bin/launcher.sh
WORKDIR /app

RUN dnf module enable nodejs:20 -y || echo "ERROR: Failed to enable noejs module version 20" \
	&& dnf install nodejs vim git net-tools -y || echo "ERROR: Failed to install required packages" \
	&& dnf install dnf-plugins-core wget gnupg2 -y || echo "ERROR: Failed to install packages required for chrome installation" \
	&& wget -q -O /tmp/google_linux_signing_key.pub https://dl.google.com/linux/linux_signing_key.pub || echo "ERROR: Failed to download goolge's public signing key for linux" \
	&& gpg --import /tmp/google_linux_signing_key.pub || echo "ERROR: Failed to import signing key to gpg" \
	&& gpg --export -armor $(gpg --list-keys --with-colons | grep '^pub' | cut -d':' -f5) > /etc/pki/rpm-gpg/google-chrome.gpg || echo "ERROR: Failed to export signiing key" \
	&& rpm --import /etc/pki/rpm-gpg/google-chrome.gpg || echo "ERROR: Failed to import chrome signing key to rpm" \
	&& dnf config-manager --add-repo=http://dl.google.com/linux/chrome/rpm/stable/x86_64 || echo "ERROR: Failed to add chrome repo" \
	&& dnf install -y google-chrome-stable || echo "ERROR: Failed to install google chrome" \
	&& dnf clean all \
	&& git config --global user.name "Neil Snyder"  || echo "ERROR: Failed to configure default git username" \
	&& git config --global user.email "neil.r.snyder@gmail.com" || echo "ERROR: Failed to configure default git email" \
	&& npm install -g @angular/cli || echo "ERROR: Failed to enable angular globally"
RUN chmod +x /usr/bin/launcher.sh
