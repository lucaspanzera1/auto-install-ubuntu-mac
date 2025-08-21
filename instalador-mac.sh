#!/bin/bash

# Script de Instalação Interativo para Macs

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
    echo -e "${WHITE}${BOLD}│ 1- Figma                                                                    │${NC}"
    echo -e "${WHITE}${BOLD}│ 2- GoogleDrive                                                              │${NC}"
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

# Função para mostrar   
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
install_figma() {
    show_progress "Instalando Figma..."
    curl -L -o Figma.dmg https://www.figma.com/download/desktop/mac &> /dev/null
    hdiutil attach Figma.dmg &> /dev/null
    cp -R "/Volumes/Figma/Figma.app" /Applications &> /dev/null
    hdiutil detach "/Volumes/Figma" &> /dev/null
    show_success "Figma instalado com sucesso!"
}
install_googledrive() {
    show_progress "Instalando GoogleDrive..."
    curl -L -o GoogleDrive.dmg https://dl.google.com/drive-file-stream/GoogleDrive.dmg &> /dev/null
    hdiutil attach GoogleDrive.dmg &> /dev/null
    cp -R "/Volumes/Install Google Drive/Google Drive.app" /Applications &> /dev/null
    hdiutil detach "/Volumes/Install Google Drive" &> /dev/null
    show_success "GoogleDrive instalado com sucesso!"
}
install_googlechrome() {
    show_progress "Instalando Google Chrome..."
    curl -L -o GoogleChrome.dmg https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg &> /dev/null
    hdiutil attach GoogleChrome.dmg &> /dev/null
    cp -R "/Volumes/Google Chrome/Google Chrome.app" /Applications &> /dev/null
    hdiutil detach "/Volumes/Google Chrome" &> /dev/null
    show_success "Google Chrome instalado com sucesso!"
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
        choices="1"
    fi
    
    for choice in $choices; do
        case $choice in
            1) install_figma ;;
            2) install_googledrive ;;
            3) install_googlechorme ;;
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
