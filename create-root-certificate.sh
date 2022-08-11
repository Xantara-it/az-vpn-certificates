#!/bin/bash

if [ ${EUID} -ne 0 ] ; then
  echo "You are not ROOT"
  exit 1
fi

BASE=$(dirname $0)
CA=${BASE}/var/cert/ca

if [ ! -d "${CA}" ] ; then
  mkdir -p "${CA}" 
fi

if [ ! -f "${CA}/caKey.pem" ] ; then 
  ipsec pki --gen --outform pem > "${CA}/caKey.pem"
fi

if [ ! -f "${CA}/caCert.pem" ] ; then
  ipsec pki --self --in "${CA}/caKey.pem" --dn "CN=Xantara IT VPN CA" --ca --outform pem > "${CA}/caCert.pem"
fi

if [ ! -f "${CA}/caCert.txt" ] ; then
  openssl x509 -in "${CA}/caCert.pem" -outform der | base64 | tee "${CA}/caCert.txt"
fi
