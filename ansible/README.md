# Home work 12 "Ansible роли, управление настройками нескольких окружений и best practices"

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

## Files project ansible-3

    .
    ├── ansible.cfg
    ├── environments
    │   ├── prod
    │   │   ├── credentials.yml
    │   │   ├── group_vars
    │   │   │   ├── all
    │   │   │   ├── app
    │   │   │   └── db
    │   │   ├── inventory
    │   │   └── requirements.yml
    │   └── stage
    │       ├── credentials.yml
    │       ├── group_vars
    │       │   ├── all
    │       │   ├── app
    │       │   └── db
    │       ├── inventory
    │       └── requirements.yml
    ├── old
    │   ├── files
    │   │   └── puma.service
    │   ├── generate_json.sh
    │   ├── inventory.json
    │   ├── inventory.yml
    │   └── templates
    │       ├── db_config.j2
    │       └── mongod.conf.j2
    ├── playbooks
    │   ├── app.yml
    │   ├── clone.yml
    │   ├── db.yml
    │   ├── deploy.yml
    │   ├── packer_app.yml
    │   ├── packer_db.yml
    │   ├── reddit_app_multiple_plays.yml
    │   ├── reddit_app_one_play.yml
    │   ├── site.yml
    │   └── users.yml
    ├── README.md
    ├── requirements.txt
    └── roles
        ├── app
        │   ├── defaults
        │   │   └── main.yml
        │   ├── files
        │   │   └── puma.service
        │   ├── handlers
        │   │   └── main.yml
        │   ├── meta
        │   │   └── main.yml
        │   ├── README.md
        │   ├── tasks
        │   │   └── main.yml
        │   ├── templates
        │   │   └── db_config.j2
        │   ├── tests
        │   │   ├── inventory
        │   │   └── test.yml
        │   └── vars
        │       └── main.yml
        └── db
            ├── defaults
            │   └── main.yml
            ├── handlers
            │   └── main.yml
            ├── meta
            │   └── main.yml
            ├── README.md
            ├── tasks
            │   └── main.yml
            ├── templates
            │   └── mongod.conf.j2
            ├── tests
            │   ├── inventory
            │   └── test.yml
            └── vars
                └── main.yml

## Integrate with your tools

- [ ] [Set up project integrations](git@github.com:Otus-DevOps-2023-11/irkobl_infra.git)

```bash
git clone git@github.com:Otus-DevOps-2023-11/irkobl_infra.git
git checkout ansible-3
cd irkobl_infra/ansible
ansible-playbook playbooks/site.yml
ansible-vault edit environments/prod/credentials.yml
```

## Ansible-3

    Run in browser

- http://51.250.89.202:9292/


