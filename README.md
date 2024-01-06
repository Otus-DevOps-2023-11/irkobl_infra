Getting acquainted with Yandex.Cloud infrastructure
==================================================

# Connection data

    bastion_IP = 158.160.129.53
    someinternalhost_IP = 10.131.0.30

# Сonnect through VPN

```sh
cat << EOF > secret
test
6214157507237678334670591556762
EOF
sudo openvpn --config cloud-bastion.ovpn --auth-user-pass secret
ssh -i ~/.ssh/appuser -J appuser@158.160.129.53 appuser@10.131.0.30
```

## Create aliases

    1. Config file to ssh
        
```sh 
    nano ~/.ssh/config
```
            
        Host someinternalhost
            Hostname 10.131.0.30
            User appuser    
            ProxyJump bastion
        Host bastion
            User appuser
            Hostname 158.160.129.53

```sh
    ssh someinternalhost
```

    2. Alias "~/.bashrc"

```sh
    echo "alias someinternalhost='ssh -i ~/.ssh/appuser -J appuser@158.160.129.53 appuser@10.131.0.30'" >> ~/.bashrc
    source ~/.bashrc
    
    someinternalhost
```

## Add certificate returned and "nip.io":

    Domain: bast.158.160.129.53.nip.io

    Response: {
        "type": "urn:ietf:params:acme:error:rateLimited",
        "detail": "Error creating new order :: too many certificates already issued for \"nip.io\". Retry after 2024-01-05T08:00:00Z: see https://letsencrypt.org/docs/rate-limits/",
        "status": 429
    }
