#!/bin/bash

echo "Criando estrutura de diretórios"

mkdir -p /{publico,adm,ven,sec}

echo "Criando grupos de usuários"

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Criando usuários"

#Usuário do gruupo adm
useradd carlos -g GRP_ADM carlos -m -s /bin/bash -p $(openssl passwd -crypt 123456) -c "Carlos da Silva"
useradd maria -g GRP_ADM maria -m -s /bin/bash -p $(openssl passwd -crypt 123456) -c "Maria da Silva"
useradd joao -g GRP_ADM joao -m -s /bin/bash -p $(openssl passwd -crypt 123456) -c "João da Silva"

#Usuário do grupo ven
useradd debora -g GRP_VEN joao -m -s /bin/bash -p $(openssl passwd -crypt 123456) -c "Débora da Silva"
useradd sebastiao -g GRP_VEN joao -m -s /bin/bash -p $(openssl passwd -crypt 123456) -c "Sebastião da Silva"
useradd roberto -g GRP_VEN joao -m -s /bin/bash -p $(openssl passwd -crypt 123456) -c "Roberto da Silva"

#Usuário do grupo sec
useradd josefina -g GRP_SEC joao -m -s /bin/bash -p $(openssl passwd -crypt 123456) -c "Josefina da Silva"
useradd amanda -g GRP_SEC joao -m -s /bin/bash -p $(openssl passwd -crypt 123456) -c "Amanda da Silva"
useradd rogerio -g GRP_SEC joao -m -s /bin/bash -p $(openssl passwd -crypt 123456) -c  "Rogério da Silva"

echo "Atribuindo permissões"
chown -R root:GRP_ADM /adm
chown -R root:GRP_VEN /ven
chown -R root:GRP_sec /sec

chmood 770 /adm
chmood 770 /ven
chmood 770 /sec
chmod 777 /publico

echo "Estrutura criada com sucesso"