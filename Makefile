t:
	strace -f -ostrace.txt -e open PYTHONPATH=/home/mdupont/experiments/ccore/ansible/lib python  /home/mdupont/experiments/ccore/ansible/bin/ansible-playbook  -i ansible_hosts test_playbook.yml --verbose

t2:
	PYTHONPATH=/home/mdupont/experiments/ccore/ansible/lib python /home/mdupont/experiments/ccore/ansible/bin/ansible-playbook -i ansible_hosts test_playbook.yml --verbose
