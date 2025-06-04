#!/bin/bash

read -p "Digite o nome do usuário (ex: joao): " USUARIO
DOMINIO="connectifytech.com"
EMAIL="${USUARIO}@${DOMINIO}"

if id "$USUARIO" &>/dev/null; then
  echo "⚠️  O usuário '$USUARIO' já existe no sistema."
  exit 1
fi

read -s -p "Digite a senha para ${EMAIL}: " SENHA
echo

SENHA_CRIPT=$(openssl passwd -6 "$SENHA")

sudo useradd -M -s /bin/false -p "$SENHA_CRIPT" "$USUARIO"

MAILDIR="/home/${USUARIO}/Maildir"
sudo mkdir -p "$MAILDIR"
sudo chown -R "$USUARIO:$USUARIO" "$MAILDIR"
sudo chmod -R 700 "$MAILDIR"

if [ -f "/var/mail/$USUARIO" ]; then
  sudo chmod ug+rw "/var/mail/$USUARIO"
fi

echo
echo "✅ Usuário de e-mail ${EMAIL} criado com sucesso!"
echo "📂 Diretório de e-mail: $MAILDIR"
echo "📬 Para testar com mutt:"
echo "    mutt -f imaps://${EMAIL}@localhost"
