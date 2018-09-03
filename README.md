[![Build Status](https://travis-ci.org/resmo/ansible-role-bind.png?branch=master)](https://travis-ci.org/resmo/ansible-role-bind)

# Ansible Bind Role

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

Optionally: If you want to notify a server, here is a sample configuration. Note that by default all servers in NS records will be notified.

      bind_config_master_zones:
        # also_notify is a list of IPs
        - name: example.com
          also_notify: [127.0.1.2]
        - name: example.org
          also_notify:
            - 127.0.1.2
            - 127.0.2.3

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


Optionally: If you want to use DNS-SEC validation, here is is how to enable this:

    bind_config_dnssec_enabled: true

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
