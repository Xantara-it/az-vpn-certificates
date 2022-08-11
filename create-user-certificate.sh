#!/bin/bash

if [ ${EUID} -ne 0 ] ; then
  echo "You are not ROOT"
  exit 1
fi

export USERNAME="${1}"
export PASSWORD="${2}"

BASE=$(dirname $0)
CA=${BASE}/var/cert/ca
USER=${BASE}/var/cert/user

if [ ! -d "${USER}" ] ; then
  mkdir -p "${USER}"
fi

if [ ! -f "${USER}/${USERNAME}-key.pem" ] ; then
  ipsec pki --gen --outform pem > "${USER}/${USERNAME}-key.pem"
fi

if [ ! -f "${USER}/${USERNAME}-cert.pem" ] ; then
  ipsec pki --pub --in "${USER}/${USERNAME}-key.pem" \
    | ipsec pki --issue --cacert "${CA}/caCert.pem" --cakey "${CA}/caKey.pem" --dn "CN=${USERNAME}" --san "${USERNAME}" --flag clientAuth --outform pem > "${USER}/${USERNAME}-cert.pem"
fi

if [ ! -f "${USER}/${USERNAME}.p12" ] ; then
  openssl pkcs12 -in "${USER}/${USERNAME}-cert.pem" -inkey "${USER}/${USERNAME}-key.pem" -certfile "${CA}/caCert.pem" -export -out "${USER}/${USERNAME}.p12" -password "pass:${PASSWORD}"
fi

if [ -f "${USER}/${USERNAME}.p12" ] ; then
  echo "User certificate: ${USER}/${USERNAME}.p12"
fi
