# i3-config

My **work-in-progress** [i3-wm](https://i3wm.org/docs/userguide.html)

## Features

- keyboard volume control
- keyboard media control

## Dependencies

- i3
- i3blocks
- i3lock-fancy
- [i3-volume]("https://github.com/hastinbe/i3-volume")
- dmenu (suckless-tools)
- picom
- nitrogen
- light
- nm-applet
- lm-sensors
- playerctl
- redshift
- pavucontrol

## Installation

```console
sudo apt install i3 i3blocks i3lock-fancy lm-sensors pavucontrol picom nitrogen light playerctl redshift -y && \
cd .config && \
git clone "https://github.com/hastinbe/i3-volume"
```

Choose public or private repo

```console
git clone --recursive git@github.com:bramtechs/linux-dotfiles.git temp

git clone https://github.com/bramtechs/linux-dotfiles.git temp
```

```console
cd temp && \
cp -r .git .gitmodules * .. && \
rm -rf temp
```

## Make screen brightness work

Ádd your user to the 'video' group.

```console
sudo usermod -a -G video $USER
```

## Applications with keybinding

- firefox
- ranger
- xfce4-terminal

### Ranger

```console
sudo apt install libx11-dev libxtst-dev python3-docopt python3-xlib python3-pil python3-attr
pip install ueberzug
echo "set preview_images true" >> ~/.config/ranger/rc.conf
echo "set preview_images_method ueberzug" >> ~/.config/ranger/rc.conf
```

## Cloning dotfiles

```console

```

## Updating bashrc

```console
echo 'PATH="$PATH:/home/bram/.local/bin:/home/bram/scripts:/home/bram/scripts/private"' >> ~/.bashrc
```

## Neovim

### Install vim-plug

```console
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

## Specific for my laptop hardware (Debian 11)

### Install rtl8821ce Wifi driver

```console
sudo apt install bc module-assistant build-essential dkms && \
mkdir -p dev && \
cd dev && \
git clone https://github.com/tomaspinho/rtl8821ce.git && \
cd rtl8821ce  && \
sudo ./dkms-install.sh
```

### Get bluetooth audio working

```console
sudo apt install pulseaudio-module-bluetooth -y && \
sudo systemctl restart bluetooth
```

### Get rid of that deafening buzzer

For this sesssion:

```console
sudo rmmod pcspkr
```

Persistent after reboot:

```console
sudo -s
echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf
```
