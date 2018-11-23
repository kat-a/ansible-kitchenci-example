# Configuration Management Ansible - Example

## Test Kitchen Setup
- Ansible
- Inspec

## Requirements
- OpenSSH Server in latest version
    - SSH Protocol Version 1 MUST be disabled
    - SSH Protocol Version 2 MUST be enabled
    - no root login should be allowed

- Deploy a message of the day
    - must be done via template
    - your group name, configurable via attribute
    - your group members (Surname delimited by ,). fe. Someone,Anotherone, configurable via attribute array
    - The name of your lecturer (FIRSTNAME/SURNAME), configurable via attribute
    - The Date (DD.MM.YYYY) of the last tool-run (automatic, not configurable)
    - a String “Change me”, which must be configurable via attribute

- User ckappel must be on the system
    - He wants to use a zsh shell
    - He must be a sudo user
    - His public ssh key must be deployed
    - He must be able to login via ssh
    - His home must be /home/kappelc
- User animmervoll must be on the system
    - He wants to use a bash shell
    - He must not be a sudo user
    - He must be able to login via ssh
    - His home must be /home/nimm
    - He must be a group member of lecturer


## Tools

|             |                                                     |
| ----------- | ----------------------------------------------------|
| Vagrant     | [https://www.vagrantup.com/][website]				|
| Virtualbox  | [https://www.virtualbox.org/][website]				|
| Bundler     | [https://bundler.io/][website]	                    |
| Pipenv      | [https://pipenv.readthedocs.io/en/latest/][website] |
| KitchenCI   | [http://kitchen.ci][website]                        |
| Ansible     | [https://docs.ansible.com/][website]                |
| Inspec      | [https://www.inspec.io/][website]                   |

## Setup

### Environment

Install vagrant, virtualbox (there are also drivers for lxc, docker, ec2,...)

```
$ bundle install
$ pipenv shell
```


Create a VM
```
kitchen create
```

Will install all the dependencies (including Ansible) and run your role
```
kitchen converge
```

Will run your unti tests - execute our tests in test/integration/default/
```
kitchen verify
```

Destroy the VM (destroy all instances)
```
kitchen destroy
```

Will execute create, converge, verify and destroy
```
kitchen test
```

Get a listing of your instances
```
kitchen list
```

Log in to one instance
```
kitchen login
```


