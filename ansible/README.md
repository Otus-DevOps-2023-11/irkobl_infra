# Home work 10 "Управление конфигурацией. Знакомство с Ansible"
# Home work 11 "Продолжение знакомства с Ansible: templates, handlers, dynamic inventory, vault, tags"

## Hostst

    reddit-app = 51.250.89.202
    reddit-db = 158.160.32.126

## Files project ansible-1

    ├── ansible.cfg
    ├── clone.yml
    ├── generate_json.sh
    ├── inventory
    ├── inventory.json
    ├── inventory.yaml
    └── README.md

## Files project ansible-2

        .
    ├── ansible.cfg
    ├── app.yml
    ├── clone.yml
    ├── db.yml
    ├── deploy.yml
    ├── files
    │   └── puma.service
    ├── generate_json.sh
    ├── inventory
    ├── inventory.json
    ├── inventory.yml
    ├── README.md
    ├── reddit_app_multiple_plays.yml
    ├── reddit_app_one_play.yml
    ├── requirements.txt
    ├── site.yml
    └── templates
        ├── db_config.j2
        └── mongod.conf.j2

## Integrate with your tools

- [ ] [Set up project integrations](git@github.com:Otus-DevOps-2023-11/irkobl_infra.git)

```bash
git clone git@github.com:Otus-DevOps-2023-11/irkobl_infra.git
cd irkobl_infra/ansible
./generate_json.sh reddit-app reddit-db --list
# add row "inventory = inventory.json" in file ansible.cfg
ansible app -m ping
```

## Ansible-2

- http://51.250.89.202:9292/

```bash
ansible-playbook site.yml
```



