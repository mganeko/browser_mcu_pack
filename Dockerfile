# Browser MCU and node
#   headless browser and signaling server on node.js
#
#   thanks to justinribeiro/chrome-headless

FROM node:latest

RUN mkdir /tmp/server && cd /tmp/server \
 && git clone --recursive https://github.com/mganeko/browser_mcu_server.git \
 && npm install ws express

COPY options_default.js /tmp/server/browser_mcu_server/

# Install deps + add Chrome Stable + purge all the things
RUN apt-get update && apt-get install -y \
	apt-transport-https \
	ca-certificates \
	curl \
  gnupg \
	--no-install-recommends \
	&& curl -sSL https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
	&& echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list \
	&& apt-get update && apt-get install -y \
	google-chrome-stable \
	--no-install-recommends

#	--no-install-recommends \
#	&& apt-get purge --auto-remove -y curl gnupg \
#	&& rm -rf /var/lib/apt/lists/*

# Add Chrome as a user
RUN groupadd -r chrome && useradd -r -g chrome -G audio,video chrome \
    && mkdir -p /home/chrome && chown -R chrome:chrome /home/chrome

# Run Chrome non-privileged
USER chrome

# Expose port 9222
EXPOSE 9222 3000

# single_server
#ENTRYPOINT [ "node"  ]
WORKDIR /tmp/server/browser_mcu_server/
CMD [ "node", "single_server.js" ]

