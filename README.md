# centos7-firewall-setup
Define NerveCenter as a service to CentOS7 firewall-cmd

For CentOS7 systems running firewall-cmd, the nervecenter.xml file and setup.sh
script allows quick provisioning of firewall-cmd so as to include NerveCenter.
Use this script if you are setting up and managing NerveCenter on several CentOS7
hosts.

Once this script has been run, 'nervecenter' will appear in the Services listing
of /usr/bin/firewall-config.  The state of the 'nervecenter' service can seen and
the service can be enabled/disabled through firewall-config's graphical user
interface.

To install NerveCenter as a service for firewall-cmd, run the setup script.
