FROM lscr.io/linuxserver/webtop:ubuntu-mate

# Install OpenJDK 21 (or your required version)
RUN sudo apt-get update && \
    sudo apt-get install -y openjdk-21-jre expect && \
    sudo apt-get clean && \
    sudo rm -rf /var/lib/apt/lists/*

# Add ThinkSwim installer
RUN curl -o /tmp/thinkorswim_installer.sh https://tosmediaserver.schwab.com/installer/InstFiles/thinkorswim_installer.sh
RUN chmod +x /tmp/thinkorswim_installer.sh

# Automate ThinkOrSwim installation
ADD thinkorswim_expect_script.sh /tmp
RUN chmod +x /tmp/thinkorswim_expect_script.sh
ADD tos.desktop /etc/xdg/autostart
RUN sudo chmod +x /etc/xdg/autostart/tos.desktop
# RUN sudo chown 1000:1000 /etc/xdg/autostart/tos.desktop
