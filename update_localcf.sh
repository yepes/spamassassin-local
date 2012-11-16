 #!/bin/bash

#email al que llegará una alerta si las reglas descargadas son incorrectas
EMAIL="mi@mail.com"

wget --no-check-certificate -O /etc/mail/spamassassin/local.cf https://raw.github.com/yepes/spamassassin-local/master/local.cf
spamassassin --lint
STATUS=$?
[ $STATUS -eq 0 ] && service psa-spamassassin restart
[ $STATUS -ne 0 ] && echo "Error en LOCAL.CF"  |  /bin/mail -s "ERROR LOCAL.CF" "$EMAIL"