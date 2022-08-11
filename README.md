# Certificates for Xantara-it VPN Gateway

Create root certificate

See: [Generate and export certificates - Linux (strongSwan)](https://docs.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-certificates-point-to-site-linux)

## Install (on Mac)

```console
$ sudo brew install strongswan
```

## Create root certificate

```console
$ sudo ./create-root-certificate.sh
MIIC/DCCAe********************************************************************************************************5MB6
```

## Create user certificate

```console
$ sudo ./create-user-certificate.sh cees.van.de.griend Welkom01
User certificate: ./var/cert/user/cees.van.de.griend.p12
```
