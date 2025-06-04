#!/bin/bash

read -p "Digite o nome do usuário (ex: user): " USUARIO
DOMINIO="connectifytech.com"
EMAIL="${USUARIO}@${DOMINIO}"

read -s -p "Digite a senha para ${EMAIL}: " SENHA
echo

SENHA_CRIPT=$(openssl passwd -6 "$SENHA")

sudo useradd -M -s /bin/false -p "$SENHA_CRIPT" "$USUARIO"

MAILDIR="/home/${USUARIO}/Maildir"
sudo mkdir -p "$MAILDIR"
sudo chown "$USUARIO:$USUARIO" "$MAILDIR"
sudo chmod -R 700 "$MAILDIR"

MAILBOX="/var/mail/$USUARIO"
if [ -f "$MAILBOX" ]; then
  sudo chmod ug+rw "$MAILBOX"
fi

echo
echo "✅ Usuário de e-mail ${EMAIL} criado com sucesso."
echo "📬 Acesse com:"
echo "    mutt -f imaps://${EMAIL}@localhost"
