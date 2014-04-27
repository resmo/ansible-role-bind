# Ansible Bind Role
An ansible role for installing bind.

[![Build Status](https://travis-ci.org/resmo/ansible-role-bind.png?branch=master)](https://travis-ci.org/resmo/ansible-role-bind)

## Usage:

    ---
    - hosts: all
      remote_user: root
      roles:
      - resmo.bind

## Configuration:

      bind_config_master_zones:
        - name: example.com
      
      bind_config_master_allow_transfer:
        - 127.0.0.1
        - 127.0.0.2
      
      bind_config_slave_zones:
        - name: example.net
          masters: [ '127.1.0.1', '127.1.0.2' ]
          zones:
            - example.net
            - example.org

## Homepage: 

https://github.com/resmo/ansible-role-bind
