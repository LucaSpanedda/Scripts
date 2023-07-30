#!/bin/bash
set -e

# Contenuto dello script "update_terminal_colors.sh"
if [ "$TERM" = "linux" ]; then
    echo -en "\e]Pffffff" # Imposta il colore del testo su nero
    echo -en "\e]Pfffffff" # Imposta il colore dello sfondo su bianco
fi

# Aggiunge le istruzioni al file .bashrc
echo -e "\n# Impostazioni per il colore del terminale" >> ~/.bashrc
echo -e 'if [ "$TERM" = "linux" ]; then' >> ~/.bashrc
echo -e '    echo -en "\e]Pffffff" # Imposta il colore del testo su nero' >> ~/.bashrc
echo -e '    echo -en "\e]Pfffffff" # Imposta il colore dello sfondo su bianco' >> ~/.bashrc
echo -e 'fi\n' >> ~/.bashrc

# Carica le modifiche nel terminale attuale
source ~/.bashrc
