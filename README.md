[![Build Status](https://travis-ci.org/resmo/ansible-role-bind.png?branch=master)](https://travis-ci.org/resmo/ansible-role-bind)

# Ansible Bind Role

An ansible role for installing and managing bind, acting as primary and/or secondary nameserver.
It does also copy the master zone files (`bind_masterzones_path`), but however, the zone files must exist in the local machine (`bind_masterzones_local_path`).


## Configuration:

Define where your zones files are stored in the server:

      bind_masterzones_path: path/to/zones_dir

Define where your zones files are stored in the ansible controller machine:

      bind_masterzones_local_path: path/to/zones/local/dir/

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
         - { role: resmo.bind }


## License

MIT


## Author Information

René Moser <mail@renemoser.net>
