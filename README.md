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


Optionally: You can enable logging (this creates one file per channel):

    bind_logging_enabled: on

Optionally: You can configure log files size, versions, logging severity and path:
    bind_logging_path: /var/log/named
    bind_logging_file_versions: 3
    bind_logging_file_size: 5m
    bind_logging_severity: dynamic

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
Logging configuration borrowed from <a href="">Steven Carr</a> from a <a href="https://stackoverflow.com/a/12114139/907592">StackOverflow's answer</a>.
