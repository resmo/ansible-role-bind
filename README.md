[![Build Status](https://travis-ci.org/teadur/ansible-role-bind.png?branch=master)](https://travis-ci.org/teadur/ansible-role-bind)

# Ansible Bind9 Role

An ansible role for installing and managing bind, acting as primary and/or secondary nameserver. 
It does also copy the master zone files (`bind_masterzones_path`), but however, the zone files must exist.


## Configuration:

Define where your zones files are stored:

      bind_masterzones_path: path/to/zones_dir

Configure the domains of the zones for a bind act as primary nameserver:

      bind_config_master_zones:
        - name: example.com
        - name: example2.com
        - name: example3.com

Optionally: If your zone should be synced with secondary nameservers, define the IPs of those:

      bind_config_master_allow_transfer:
        - 127.0.0.1
        - 127.0.0.2

Optionally: If your nameservers acts as a secondary nameserver, here is a sample setup:

      bind_config_slave_zones:
        - name: example.net
          masters: [ '127.1.0.1', '127.1.0.2' ]
          zones:
            - example.net
            - example.org

Optionally: If your nameservers acts as a secondary nameserver, here is a sample setup with TSIG Keys:

      bind_config_slave_zones:
        - name: example.net
          tsig_keys:
            - name: sample-key
              algorithm: hmac-md5
              secret: 'phaiGouX7Soh8gee4Vee'
          masters_templates:
            - name: example-tmpl
              servers:
              - '127.0.0.1 key sample-key'
              - '2001::15 key sample-key'
          masters: [ 'example-templ' ]
          zones:
            - example.net
            - example.org

Optionally: If you need to forward some zones directly to another nameserver, here is a sample:

    bind_config_forward_zones:
      - name: domains forwarded to 127.1.0.x nameservers
        forwarders: [ '127.1.0.1', '127.1.0.2' ]
        forward: only
        zones:
          - forwarded.example.net
          - forwarded.example.org

*forward* should be either _first_ or _only_


Optionally: If you want to adjust the allow-query option globally, here is a sample:

    bind_config_allow_query: [ '127.1.0.1', '127.1.0.2' ]


## Dependencies

None.


## Example Playbook

    ---
    - hosts: nameservers
      remote_user: root
      roles:
         - { role: bind9 }


## License

MIT


## Author Information

René Moser <mail@renemoser.net>

Additions by Daniel Paufler <dpaufler@leo34.net>
Additions by Georg Kahest <georg@gj.ee>
