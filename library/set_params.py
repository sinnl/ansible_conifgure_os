#!/usr/bin/env python

# Copyright: (c) 2019, Lukasz Durlak <lukasz@itluk.eu>
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)

# DOCUMENTATION = '''
# ---
# module: set_timezone
#
# short_description: Purpose of this module is to define a GEO region based on the IP of the system and set required timezone.
#
# version_added: "1.0"
#
# description:
#     - "Using IP's second and third octet fins the geo location and set timezone "
#
# author:
#     - Lukasz Durlak (lukasz@itluk.eu)
# '''

from ansible.module_utils.basic import AnsibleModule

def run_module():
    module_args = dict(
        ip = {"type": "str", "require": True},
    )

    module = AnsibleModule(
        argument_spec=module_args,
        supports_check_mode=False
    )

    oktets = module.params['ip'].split('.')
    oktet1 = int(oktets[1])
    oktet2 = int(oktets[2])


    if oktet1 == 33 :
        timezone = 'Europe/London'
        dns1 = '10.33.0.60'
        dns2 = '10.33.0.61'
        dns3 = '10.34.32.21'
    elif oktet1 in range(34,36) :
        timezone = 'Europe/Dublin'
        dns1 = '10.34.32.21'
        dns2 = '10.34.32.61'
        dns3 = '10.33.0.60'
    elif oktet1 == 40 :
        timezone = 'Asia/Tel_Aviv'
        dns1 = '10.34.32.21'
        dns2 = '10.34.32.61'
        dns3 = '10.33.0.60'
    elif oktet1 == 43 :
        timezone = 'Europe/Berlin'
        dns1 = '10.34.32.21'
        dns2 = '10.34.32.61'
        dns3 = '10.33.0.60'
    elif oktet1 == 168 or oktet1 == 10 :
        timezone = 'Europe\Warsaw'
        dns1 = '192.168.1.1'
        dns2 = '192.168.1.211'
        dns3 = '8.8.8.8'
    elif oktet1 in range(1,21) :
        timezone = 'America/Los_Angeles'
        dns1 = '10.1.32.114'
        dns2 = '10.25.32.61'
        dns3 = '10.25.20.21'
    elif oktet1 == 23 :
        timezone = 'America/New_York'
    elif oktet1 == 25 :
        timezone = 'America/Chicago'
        dns1 = '10.25.32.61'
        dns2 = '10.25.20.21'
        dns3 = '10.1.32.114'
    elif oktet1 in range(65,81) :
        timezone = 'Asia/Kolkata'
        dns1 = '10.65.32.21'
        dns2 = '10.65.32.40'
        dns3 = '10.65.32.113'
    else:
        timezone = 'UTC'
        dns1 = '10.25.32.61'
        dns2 = '10.25.20.21'
        dns3 = '10.1.32.114'


    module.exit_json(
        changed=False,
        ansible_facts={
            'timezone': timezone,
            'dns1' : dns1,
            'dns2' : dns2,
            'dns3' : dns3,
        }
    )

def main():
    run_module()

if __name__ == '__main__':
    main()
