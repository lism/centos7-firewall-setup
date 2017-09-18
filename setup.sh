#!/bin/sh
#--------------------------------------------------------------------------------
#  For CentOS7 systems running firewall-cmd, declare NerveCenter to the firewall
#  as a service.  System administrators can then directly select/enable/disable
#  the firewall's permissions for NerveCenter.
#
#  Applicable on CentOS7.x hosts for NerveCenter versions 6, 7 and 8 
#
#  This script can be used as the base for building NerveCenter into a
#  CentOS7 system's firewall disposition. However it is naive to the
#  configuration of your firewall and certaintly of your security practices.
#  Thus: **This can only be an example**. It is usable on a simple "out of
#  the box" CentOS7 system but needs to be reviewed and adapted if your
#  system is other than firewall-cmd's starting configuration.
#
#  You are welcome to copy and adapt this script.
#
PATH=/usr/bin:/bin:/sbin:/usr/sbin
export PATH

# 1. Copy the NerveCenter service descrption into the non-standard services 
#    repo used by firewall-cmd.
/bin/cp nervecenter.xml /etc/firewalld/services/

# 2. Have firewall-cmd reload its list of known services. This will cause it 
#    'see' the added NerveCenter service description.
/usr/bin/firewall-cmd --reload

# Should now include 'nervecenter' in its list of defined services.
## /usr/bin/firewall-cmd --get-services

# 3. Add NerveCenter into the set of ephemeral services.
/usr/bin/firewall-cmd --zone=public --add-service=nervecenter

# Add NerveCenter to the permanent set of services.
/usr/bin/firewall-cmd --permanent --zone=public --add-service=nervecenter

# 4. List the services enabled by the firewall.  'nervecenter' should be included.
/usr/bin/firewall-cmd --list-services

# 5. Restart the firewall.
#    (If you omit this, firewalld will throw "ERROR: INVALID_SERVICE: nervecenter"
#     messages.)
/usr/bin/systemctl restart firewalld

exit 0
#--------------------------------------------------------------------------------
# ###
