

if [ -z "$1" ];
then
    echo "pass user account. eg ~/dev_setup <username> <systemname>"
    exit
fi
if [ -z "$2" ];
then
    echo "pass user account. eg ~/dev_setup <username> <systemname>"
    exit
fi

echo 'alias jl="vim ~/webq/journal/`date --iso`"' >> ~/.localaliases.sh

cat << EOF >> ~/.aliases.sh
export PS1="\$PS1 $2
"
EOF

echo "10.129.49.76    server" | sudo tee -a /etc/hosts
echo "10.129.41.67    check" | sudo tee -a /etc/hosts
echo "10.129.26.130   gen" | sudo tee -a /etc/hosts
echo "10.129.2.55 vacha" | sudo tee -a /etc/hosts

cat << EOF >> ~/.ssh/config
Host server
	HostName 10.129.49.76
	User	$1

Host check
	HostName 10.129.41.67
	User	$1

Host gen
	HostName 10.129.26.130
	User	$1

Host vacha
	HostName 10.129.2.55
	User	$1
EOF
