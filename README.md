# utils
Scripts úteis para gerenciamento de servidores linux

## IPTABLES

Restaura regras IPTABLES + redirecionamento de porta 53 > 5300 para uso do DNSTT 

`cd /root && wget https://raw.githubusercontent.com/Andley302/utils/main/iptables_reset && chmod +x iptables_reset && ./iptables_reset`

Restaura regras IPTABLES + redirecionamento de porta 53 > 53 para uso do DNSTT 

`cd /root && wget https://raw.githubusercontent.com/Andley302/utils/main/iptables_reset_53 && chmod +x iptables_reset_53 && ./iptables_reset_53`
