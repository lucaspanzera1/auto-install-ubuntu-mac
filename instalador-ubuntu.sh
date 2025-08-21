#!/bin/bash

# Script de Instalação Interativo - SYDLE
# Permite selecionar programas específicos para instalação

# Cores para melhor visualização
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# Função para exibir o cabeçalho
show_header() {
    clear
    echo -e "${NC}"
    echo -e "${CYAN}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${WHITE}${BOLD}       INSTALADOR DE PROGRAMAS - MAC -  Lucas Panzera${NC}"
    echo -e "${CYAN}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
}

# Função para exibir o menu
show_menu() {
    echo -e "${WHITE}${BOLD}┌─────────────────────────────────────────────────────────────────────────────┐${NC}"
    echo -e "${WHITE}${BOLD}│                           PROGRAMAS DISPONÍVEIS                             │${NC}"
    echo -e "${WHITE}${BOLD}├─────────────────────────────────────────────────────────────────────────────┤${NC}"
    echo -e "${WHITE}${BOLD}│                                                                             │${NC}"
    echo -e "${WHITE}${BOLD}│  1 - VS Code               │  14 - KolourPaint          │  23 - Docker      │${NC}"
    echo -e "${WHITE}${BOLD}│  2 - IntelliJ IDEA         │  15 - OBS Studio           │  24 - VirtualBox  │${NC}"
    echo -e "${WHITE}${BOLD}│  3 - GitKraken             │  16 - VLC                  │  25 - NVM/Node    │${NC}"
    echo -e "${WHITE}${BOLD}│  4 - Dia                   │  17 - GraalVM JDK 21       │  26 - Peek        │${NC}"
    echo -e "${WHITE}${BOLD}│  5 - Postman               │  18 - VisualVM             │  27 - Obsidian    │${NC}"
    echo -e "${WHITE}${BOLD}│  6 - Insomnia              │  19 - P7zip                │  28 - Oh-My-Zsh   |${NC}"
    echo -e "${WHITE}${BOLD}│  7 - Firefox               │  20 - Flameshot            │  29 - Pip3        │${NC}"
    echo -e "${WHITE}${BOLD}│  8 - Chromium              │  21 - Notepadqq            │  30 - LazyGit     │${NC}"
    echo -e "${WHITE}${BOLD}│  9 - Brave                 │  22 - Spotify              │  31 - Diodon      │${NC}"
    echo -e "${WHITE}${BOLD}│ 10 - Discord               │                            │  32 - FileZIlla   │${NC}"
    echo -e "${WHITE}${BOLD}│ 11 - Ryver                 │                            │                   │${NC}"
    echo -e "${WHITE}${BOLD}│ 12 - GIMP                  │                            │                   │${NC}"
    echo -e "${WHITE}${BOLD}│ 13 - OpenBoard             │                            │                   │${NC}"
    echo -e "${WHITE}${BOLD}│                                                                             │${NC}"
    echo -e "${WHITE}${BOLD}├─────────────────────────────────────────────────────────────────────────────┤${NC}"
    echo -e "${WHITE}${BOLD}│ Digite os números separados por espaço (ex: 1 5 10 22)                      │${NC}"
    echo -e "${WHITE}${BOLD}│ ou digite 'all' para instalar tudo                                          │${NC}"
    echo -e "${WHITE}${BOLD}└─────────────────────────────────────────────────────────────────────────────┘${NC}"
    echo ""
    echo -n -e "${WHITE}${BOLD}Sua escolha: ${NC}"
}

# Função para mostrar progresso
show_progress() {
    local text="$1"
    echo -e "\n${BLUE}${BOLD}[INFO]${NC} ${text}"
}

# Função para mostrar sucesso
show_success() {
    local text="$1"
    echo -e "${GREEN}${BOLD}[✓]${NC} ${text}"
}

# Função para mostrar erro
show_error() {
    local text="$1"
    echo -e "${RED}${BOLD}[✗]${NC} ${text}"
}

# Funções de instalação
install_vscode() {
    show_progress "Instalando VS Code..."
    wget -O vscode.deb https://go.microsoft.com/fwlink/?LinkID=760868 &> /dev/null
    sudo apt-get install ./vscode.deb -y &> /dev/null
    rm vscode.deb
    show_success "VS Code instalado com sucesso!"
}

install_intellij() {
    show_progress "Instalando IntelliJ IDEA Community..."
    wget -O intellij.tar.gz https://download.jetbrains.com/idea/ideaIC-2024.3.3.tar.gz &> /dev/null
    sudo tar -xzf intellij.tar.gz -C /opt &> /dev/null
    sudo mv /opt/idea-IC-* /opt/intellij-idea &> /dev/null
    sudo tee /usr/share/applications/intellij-idea.desktop > /dev/null <<EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=IntelliJ IDEA Community
Icon=/opt/intellij-idea/bin/idea.svg
Exec=/opt/intellij-idea/bin/idea.sh %f
Comment=Capable and Ergonomic IDE for JVM
Categories=Development;IDE;
Terminal=false
StartupWMClass=jetbrains-idea
EOF
    rm intellij.tar.gz
    show_success "IntelliJ IDEA Community instalado com sucesso!"
}

install_gitkraken() {
    show_progress "Instalando GitKraken..."
    wget https://release.gitkraken.com/linux/gitkraken-amd64.deb -O gitkraken.deb &> /dev/null
    sudo apt install -y ./gitkraken.deb &> /dev/null
    rm gitkraken.deb
    show_success "GitKraken instalado com sucesso!"
}

install_dia() {
    show_progress "Instalando Dia..."
    sudo apt-get install dia -y &> /dev/null
    show_success "Dia instalado com sucesso!"
}
install_peek(){
    show_progress "Instalando peek..."
    sudo add-apt-repository ppa:peek-developers/stable
    sudo apt update -y &> /dev/null
    sudo apt install peek -y &> /dev/null
}

install_postman() {
    show_progress "Instalando Postman..."
    wget -O postman.tar.gz https://dl.pstmn.io/download/latest/linux_64 &> /dev/null
    tar -xvzf postman.tar.gz &> /dev/null
    sudo mv ./Postman /opt/
    sudo tee /usr/share/applications/postman.desktop > /dev/null <<EOF
[Desktop Entry]
Encoding=UTF-8
Name=Postman
Exec=/opt/Postman/app/Postman %U
Icon=/opt/Postman/app/resources/app/assets/icon.png
Terminal=false
Type=Application
Categories=Development;
EOF
    rm postman.tar.gz
    show_success "Postman instalado com sucesso!"
}

install_insomnia() {
    show_progress "Instalando Insomnia..."
    wget -O insomnia.deb https://updates.insomnia.rest/downloads/ubuntu/latest?&app=com.insomnia.app&source=website &> /dev/null
    sleep 4
    sudo apt install -y ./insomnia.deb &> /dev/null
    rm insomnia.deb
    show_success "Insomnia instalado com sucesso!"
}

install_firefox() {
    show_progress "Instalando Firefox..."
    sudo install -d -m 0755 /etc/apt/keyrings &> /dev/null
    wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null
    echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null
    echo 'Package: *
Pin: origin packages.mozilla.org
Pin-Priority: 1000' | sudo tee /etc/apt/preferences.d/mozilla &> /dev/null
    sudo apt-get update &> /dev/null
    sudo apt-get install firefox firefox-l10n-pt-br -y &> /dev/null
    show_success "Firefox instalado com sucesso!"
}

install_chromium() {
    show_progress "Instalando Chromium..."
    sudo apt install -y chromium-browser chromium-codecs-ffmpeg &> /dev/null
    show_success "Chromium instalado com sucesso!"
}

install_brave() {
    show_progress "Instalando Brave..."
    curl -fsS https://dl.brave.com/install.sh | sh &> /dev/null
    show_success "Brave instalado com sucesso!"
}

install_discord() {
    show_progress "Instalando Discord..."
    wget -O discord.deb https://discord.com/api/download?platform=linux&format=deb &> /dev/null
    sleep 20
    sudo apt install -y ./discord.deb &> /dev/null
    rm discord.deb

    sudo bash -c 'cat >> /usr/local/bin/update-system.sh <<EOF

    # Instalação do Discord
    wget -O discord.deb https://discord.com/api/download?platform=linux&format=deb
    sleep 20
    sudo apt install -y ./discord.deb
EOF'

    show_success "Discord instalado com sucesso!"
}

install_ryver() {
    show_progress "Instalando Ryver..."
    wget -O ryver.deb https://downloads.ryver.com/linux/stable &> /dev/null
    sudo apt-get install ./ryver.deb -y &> /dev/null
    rm ryver.deb
    show_success "Ryver instalado com sucesso!"
}

install_gimp() {
    show_progress "Instalando GIMP..."
    sudo apt install -y gimp &> /dev/null
    show_success "GIMP instalado com sucesso!"
}

install_openboard() {
    show_progress "Instalando OpenBoard..."
    sudo apt install openboard -y &> /dev/null
    show_success "OpenBoard instalado com sucesso!"
}

install_kolourpaint() {
    show_progress "Instalando KolourPaint..."
    sudo apt install -y kolourpaint &> /dev/null
    show_success "KolourPaint instalado com sucesso!"
}

install_obs() {
    show_progress "Instalando OBS Studio..."
    sudo add-apt-repository -y ppa:obsproject/obs-studio &> /dev/null
    sudo apt update &> /dev/null
    sudo apt install -y obs-studio &> /dev/null
    
    # Desativa o Wayland no GDM
    GDM_CONFIG="/etc/gdm3/custom.conf"
    if grep -q "^#WaylandEnable=false" "$GDM_CONFIG"; then
        sudo sed -i 's/^#WaylandEnable=false/WaylandEnable=false/' "$GDM_CONFIG"
    elif ! grep -q "^WaylandEnable=false" "$GDM_CONFIG"; then
        sudo sed -i '/^\[daemon\]/a WaylandEnable=false' "$GDM_CONFIG"
    fi
    
    show_success "OBS Studio instalado com sucesso! (Wayland desativado - reinicie o sistema)"
}

install_vlc() {
    show_progress "Instalando VLC..."
    sudo apt install vlc -y &> /dev/null
    show_success "VLC instalado com sucesso!"
}

install_graalvm() {
    show_progress "Instalando GraalVM JDK 21..."
    wget -O graalvm-jdk-21.0.3.tar.gz https://download.oracle.com/graalvm/21/archive/graalvm-jdk-21.0.3_linux-x64_bin.tar.gz &> /dev/null
    sudo mkdir -p /usr/lib/jvm &> /dev/null
    sudo tar -xzf graalvm-jdk-21.0.3.tar.gz -C /usr/lib/jvm &> /dev/null
    rm graalvm-jdk-21.0.3.tar.gz
    sudo echo 'export PATH=/usr/lib/jvm/graalvm-jdk-21.0.3+7.1/bin:$PATH' >> /etc/bash.bashrc
    show_success "GraalVM JDK 21 instalado com sucesso!"
}

install_visualvm() {
    show_progress "Instalando VisualVM..."
    sudo apt install visualvm -y &> /dev/null
    show_success "VisualVM instalado com sucesso!"
}

install_p7zip() {
    show_progress "Instalando P7zip..."
    sudo apt-get install p7zip-full -y &> /dev/null
    show_success "P7zip instalado com sucesso!"
}

install_flameshot() {
    show_progress "Instalando Flameshot..."
    sudo apt install flameshot -y &> /dev/null
    show_success "Flameshot instalado com sucesso!"
}

install_notepadqq() {
    show_progress "Instalando Notepadqq..."
    sudo add-apt-repository ppa:notepadqq-team/notepadqq -y &> /dev/null
    sudo apt-get update &> /dev/null
    sudo apt-get install notepadqq -y &> /dev/null
    show_success "Notepadqq instalado com sucesso!"
}

install_spotify() {
    show_progress "Instalando Spotify..."
    curl -sS https://download.spotify.com/debian/pubkey_C85668DF69375001.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg &> /dev/null
    echo "deb https://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list &> /dev/null
    sleep 4
    sudo apt-get update &> /dev/null
    sudo apt-get install spotify-client -y &> /dev/null
    show_success "Spotify instalado com sucesso!"
}

install_docker() {
    show_progress "Instalando Docker..."
    sudo apt-get update &> /dev/null
    sudo apt-get install ca-certificates curl -y &> /dev/null
    sudo install -m 0755 -d /etc/apt/keyrings &> /dev/null
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc &> /dev/null
    sudo chmod a+r /etc/apt/keyrings/docker.asc &> /dev/null
    
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    
    sudo apt-get update &> /dev/null
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y &> /dev/null
    sudo docker run hello-world &> /dev/null
    show_success "Docker instalado com sucesso!"
}

install_virtualbox() {
    show_progress "Instalando VirtualBox..."
    sudo apt install virtualbox -y &> /dev/null
    show_success "VirtualBox instalado com sucesso!"
}

install_nvm() {
    show_progress "Instalando NVM & Node.js..."
    sudo apt install nodejs npm -y &> /dev/null
    sudo apt install build-essential libssl-dev -y &> /dev/null
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash &> /dev/null
    show_success "NVM instalado com sucesso! (Reinicie o terminal para usar)"
}
install_obsidian(){
    show_progress "Instalando Obsidian..."
    wget -O obsidian.deb https://github.com/obsidianmd/obsidian-releases/releases/download/v1.8.10/obsidian_1.8.10_amd64.deb &> /dev/null
    sleep 20
    sudo apt install ./obsidian.deb &> /dev/null
    show_success "Obsidian instalado com sucesso!"
}
install_zsh(){
    show_progress "Instalando Oh-My-Zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" &> /dev/null
    show_success "Oh-My-Zsh instalado com sucesso!"
}
install_pip3(){
    show_progress "Instalando Pip3"
    sudo apt install python3-pip &> /dev/null
    show_success "Pip3 instalado com sucesso!"
}
install_lazygit(){
    show_progress "Instalando LazyGit"
    wget -O lazygit.tar.gz https://github.com/jesseduffield/lazygit/releases/download/v0.52.0/lazygit_0.52.0_Linux_x86_64.tar.gz &> /dev/null
    sudo tar -xzf lazygit.tar.gz lazygit &> /dev/null
    sudo mv lazygit /usr/local/bin &> /dev/null
    show_success "LazyGit instalado com sucesso!"
}
install_diodon(){
    show_progress "Instalando Diodon"
    wsudo add-apt-repository ppa:diodon-team/stable &> /dev/null
    sudo apt-get update &> /dev/null
    sudo apt-get install diodon &> /dev/null
    show_success "Diodon instalado com sucesso!"
}
install_filezilla(){
    show_progress "Instalando FileZIlla"
    sudo apt install filezilla  &> /dev/null
    show_success "FileZIlla instalado com sucesso!"
}

# Função principal
main() {
    # Atualizar repositórios
    show_progress "Atualizando repositórios do sistema..."
    sudo apt update &> /dev/null
    show_success "Repositórios atualizados!"
    
    show_header
    show_menu
    
    read -r choices
    
    echo ""
    echo -e "${CYAN}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${WHITE}${BOLD}                    INICIANDO INSTALAÇÃO${NC}"
    echo -e "${CYAN}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    
    if [[ "$choices" == "all" ]]; then
        choices="1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29"
    fi
    
    for choice in $choices; do
        case $choice in
            1) install_vscode ;;
            2) install_intellij ;;
            3) install_gitkraken ;;
            4) install_dia ;;
            5) install_postman ;;
            6) install_insomnia ;;
            7) install_firefox ;;
            8) install_chromium ;;
            9) install_brave ;;
            10) install_discord ;;
            11) install_ryver ;;
            12) install_gimp ;;
            13) install_openboard ;;
            14) install_kolourpaint ;;
            15) install_obs ;;
            16) install_vlc ;;
            17) install_graalvm ;;
            18) install_visualvm ;;
            19) install_p7zip ;;
            20) install_flameshot ;;
            21) install_notepadqq ;;
            22) install_spotify ;;
            23) install_docker ;;
            24) install_virtualbox ;;
            25) install_nvm ;;
            26) install_peek ;;
            27) install_obsidian ;;
            28) install_zsh ;;
            29) install_pip3 ;;
            30) install_zsh ;;
            31) install_diodon ;;
            32) install_filezilla ;;
            *) show_error "Opção inválida: $choice" ;;
        esac
    done
    
    echo ""
    echo -e "${CYAN}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${GREEN}${BOLD}                  INSTALAÇÃO CONCLUÍDA!${NC}"
    echo -e "${CYAN}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${WHITE}Todos os programas selecionados foram instalados com sucesso!${NC}"
    echo -e "${MAGENTA}Alguns programas podem necessitar de reinicialização do sistema.${NC}"
    echo ""
}

# Executar função principal
main