#!/bin/bash

echo "+***************************************************************+"
echo "|Gerando um chave pública                                       |"
echo "+***************************************************************+"

gpg --gen-key


echo "+***************************************************************+"
echo "|Exportando um chave pública em formato ASCII ou texto          |"
echo "+***************************************************************+"

gpg --export --armor "nome_voce_deu_p_chave" > minha_chave_publica.asc
#ou
gpg --export --armor id_da_chave > minha_chave_publica.asc

echo "+***************************************************************+"
echo "|Exportando um chave pública em formato binário                 |"
echo "+***************************************************************+"

gpg --export "nome_voce_deu_p_chave" > minha_chave_publica.gpg
#ou
gpg --export id_da_chave > minha_chave_publica.gpg

echo "+***************************************************************+"
echo "|Exportando todas as chaves públicas em formato binário         |"
echo "+***************************************************************+"

gpg --export  > todas_as_chaves.gpg

echo "+***************************************************************+"
echo "|Exportando todas as chaves públicas em formato ASCII - texto   |"
echo "+***************************************************************+"

gpg --export --armor > todas_as_chaves.asc

echo "+***************************************************************+"
echo "|Exportando uma chave privada em formato binário                |"
echo "+***************************************************************+"

gpg --export-secret-key "nome_voce_deu_p_chave" > minha_chave_privada.gpg
#ou
gpg --export-secret-key id_da_chave > minha_chave_privada.gpg

echo "+***************************************************************+"
echo "|Importando um chave publica, seja em bin seja em texto         |"
echo "+***************************************************************+"

gpg --import minha_chave_publica.key

echo "+***************************************************************+"
echo "|Importando uma chave privada, seja em bin seja em texto        |"
echo "+***************************************************************+"

gpg --allow-secret-key-import --import minha_chave_privada.key

echo "+***************************************************************+"
echo "|Apagando uma chave pública de um Banco de Dados GPG (key-ring) |"
echo "+***************************************************************+"

gpg --delete-key "nome_que_voce_deu_para_chave"
#ou
gpg --delete-key id_da_chave

# se existir uma chave privada associada a esta chave pública,
# então a chave primária deve ser apagada primeiro

echo "+***************************************************************+"
echo "|Apagando uma chave privada de um Banco de Dados GPG (key-ring) |"
echo "+***************************************************************+"

gpg --delete-secret-key "nome_que_voce_deu_para_chave"
#ou
gpg --delete-secret-key id_da_chave

echo "+***************************************************************+"
echo "|Listar as chaves públicas no Banco de Dados GPG (seu key-ring) |"
echo "+***************************************************************+"

gpg --list-keys

echo "+***************************************************************+"
echo "|Listar as chaves privadas no Banco de Dados GPG (seu key-ring) |"
echo "+***************************************************************+"

gpg --list-secret-keys

echo "+***************************************************************+"
echo "|Gerar uma lista de números (fingerprints) que você pode usar   |"
echo "|como método alternativo para checar uma chave pública          |"
echo "+***************************************************************+"

gpg --fingerprint > fingerprint

echo "+***************************************************************+"
echo "|Encriptar informação                                           |"
echo "+***************************************************************+"

gpg -e -u "sua_chave_privada" -r "chave_publica_destinatario" arquivo.rar
# Neste caso você é o remetente, e deve possuir previamente 
# a chave pública do destinatário
# gera o arquivo.rar.gpg

echo "+***************************************************************+"
echo "|Decriptar a informação                                           |"
echo "+***************************************************************+"

gpg -d mydata.tar.gpg
# nesse caso você é o destinatário
# ao decriptar o arquivo, você deverá entrar com 
#a SUA chave privada
#( que gerou a chave pública que você enviou ao remetente)

