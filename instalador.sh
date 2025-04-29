#!/bin/bash
# Instalador Completo de Ferramentas para Kali Linux
# Desenvolvido por: TgDrmmR (GitHub.com/TgDrmmR) 🚀

# Cores
verde="\033[1;32m"
vermelho="\033[1;31m"
amarelo="\033[1;33m"
azul="\033[1;34m"
roxo="\033[1;35m"
normal="\033[0m"

# Arquivo de log
logfile="log_instalador.txt"

# Limpar a tela
clear

# Função para mostrar cabeçalho
mostrar_cabecalho() {
  echo -e "${roxo}==============================================="
  echo -e "          Instalador de Ferramentas Kali        "
  echo -e "        Criado por: ${amarelo}TgDrmmR${roxo} (GitHub.com/TgDrmmR)        "
  echo -e "===============================================${normal}"
}

# Função para mostrar o menu
mostrar_menu() {
  echo ""
  echo -e "${amarelo}Selecione uma ferramenta para instalar:${normal}"
  echo "1) Nmap"
  echo "2) Metasploit Framework"
  echo "3) SQLMap"
  echo "4) Hydra"
  echo "5) Nikto"
  echo "6) John the Ripper"
  echo "7) Aircrack-ng"
  echo "8) Netcat"
  echo "9) Wifite"
  echo "10) TheHarvester"
  echo "11) Apache2"
  echo "12) BTop"
  echo "13) Instalar Tudo"
  echo "14) Atualizar Sistema"
  echo "0) Sair"
  echo ""
}

# Função para instalar por APT
instalar_apt() {
  ferramenta=$1
  pacote=$2

  if command -v $ferramenta >/dev/null 2>&1; then
    echo -e "${verde}[*] $ferramenta já está instalado.${normal}"
  else
    echo -e "${azul}[+] Instalando $ferramenta...${normal}"
    apt install -y $pacote >> $logfile 2>&1
    echo -e "${verde}[*] $ferramenta instalado com sucesso.${normal}"
  fi
}

# Função para instalar via git clone
instalar_git() {
  repositorio=$1
  pasta=$2

  if [ -d "$pasta" ]; then
    echo -e "${verde}[*] $pasta já está clonado.${normal}"
  else
    echo -e "${azul}[+] Clonando $repositorio...${normal}"
    git clone $repositorio $pasta >> $logfile 2>&1
    echo -e "${verde}[*] Repositório $pasta clonado com sucesso.${normal}"
  fi
}

# Função para atualizar o sistema
atualizar_sistema() {
  echo -e "${azul}[+] Atualizando o sistema...${normal}"
  apt update && apt upgrade -y && apt dist-upgrade -y && apt autoremove -y && apt clean >> $logfile 2>&1
  echo -e "${verde}[*] Sistema atualizado!${normal}"
}

# Loop principal
while true; do
  mostrar_cabecalho
  mostrar_menu
  read -p "Escolha uma opção [0-14]: " opcao

  case $opcao in
    1)
      instalar_apt "nmap" "nmap"
      ;;
    2)
      instalar_apt "msfconsole" "metasploit-framework"
      ;;
    3)
      instalar_apt "sqlmap" "sqlmap"
      ;;
    4)
      instalar_apt "hydra" "hydra"
      ;;
    5)
      instalar_apt "nikto" "nikto"
      ;;
    6)
      instalar_apt "john" "john"
      ;;
    7)
      instalar_apt "aircrack-ng" "aircrack-ng"
      ;;
    8)
      instalar_apt "nc" "netcat"
      ;;
    9)
      instalar_apt "wifite" "wifite"
      ;;
    10)
      instalar_apt "theharvester" "theharvester"
      ;;
    11)
      instalar_apt "apache2" "apache2"
      ;;
    12)
      instalar_apt "btop" "btop"
      ;;
    13)
      echo -e "${azul}[+] Instalando todas as ferramentas...${normal}"
      instalar_apt "nmap" "nmap"
      instalar_apt "msfconsole" "metasploit-framework"
      instalar_apt "sqlmap" "sqlmap"
      instalar_apt "hydra" "hydra"
      instalar_apt "nikto" "nikto"
      instalar_apt "john" "john"
      instalar_apt "aircrack-ng" "aircrack-ng"
      instalar_apt "nc" "netcat"
      instalar_apt "wifite" "wifite"
      instalar_apt "theharvester" "theharvester"
      instalar_apt "apache2" "apache2"
      instalar_apt "btop" "btop"
      ;;
    14)
      atualizar_sistema
      ;;
    0)
      echo -e "${verde}[*] Saindo do instalador. Até logo, ${amarelo}TgDrmmR${verde}!${normal}"
      exit 0
      ;;
    *)
      echo -e "${vermelho}[!] Opção inválida. Tente novamente.${normal}"
      ;;
  esac

  echo ""
  read -p "Pressione ENTER para voltar ao menu..."
  clear
done
