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

---

# Mac OS

See: [Troubleshoot Point-to-Site VPN connections from Mac OS X VPN clients](https://docs.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-troubleshoot-point-to-site-osx-ikev2)

- Import client cert into: **Keychain Access** (double click)
- Open: **System Preferences** -> **Network** -> **+** (add)
  - Interface: VPN
  - VPN Type: IKEv2
  - Service Name: az-infra
  - **Create**
    - Server Address: azuregateway-e9790069-f6f9-4151-b12f-edae1afc398c-03a7f52b1cd5.vpn.azure.com
    - Remote ID: azuregateway-e9790069-f6f9-4151-b12f-edae1afc398c-03a7f52b1cd5.vpn.azure.com
    - Local ID: cees.van.de.griend (username)
    - **Authentication Settings...**
      - Authentication Settings: certificate
      - Certificate **select**: cees.van.de.griend (imported in Keychain Access)
  - **Apply**
  - **Connect**

# Windows

ToDo

# Linux

ToDo (needed?)
