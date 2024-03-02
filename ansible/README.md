# Home work 10 "Управление конфигурацией. Знакомство с Ansible"

## Hostst

    reddit-app = 51.250.89.202
    reddit-db = 158.160.32.126

## Files project

    ├── ansible.cfg
    ├── clone.yml
    ├── generate_json.sh
    ├── inventory
    ├── inventory.json
    ├── inventory.yaml
    └── README.md

## Integrate with your tools

- [Set up project integrations](git@github.com:Otus-DevOps-2023-11/irkobl_infra.git)

```bash
git clone git@github.com:Otus-DevOps-2023-11/irkobl_infra.git
cd irkobl_infra/ansible
./generate_json.sh reddit-app reddit-db --list
# add row "inventory = inventory.json" in file ansible.cfg
ansible app -m ping
```
