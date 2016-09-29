# Finding ID:	RHEL-07-010500
# Version:	RHEL-07-010500_rule
# SRG ID:	SRG-OS-000104-GPOS-00051
# Finding Level:	medium
# 
# Rule Summary:
#	The operating system must uniquely identify and must
#	authenticate organizational users (or processes acting on
#	behalf of organizational users) using multi-factor
#	authentication.
#
# CCI-000766 
#    NIST SP 800-53 :: IA-2 (2) 
#    NIST SP 800-53A :: IA-2 (2).1 
#    NIST SP 800-53 Revision 4 :: IA-2 (2) 
#
#################################################################
{%- set stig_id = 'RHEL-07-010500' %}
{%- set helperLoc = 'ash-linux/el7/STIGbyID/cat2/files' %}
{%- set acPkg = 'authconfig' %}
{%- set authconfig = '/usr/sbin/authconfig' %}
{%- set acCACtive = 'use only smartcard for login' %}
{%- set acCACrmov = 'smartcard removal action'%}
{%- set pkcsPkg = 'pam_pkcs11' %}
{%- set pkcsDir = '/etc/pam_pkcs11/' %}
{%- set pkcsEvt = pkcsDir + 'pkcs11_eventmgr.conf' %}
{%- set pkcsCnf = pkcsDir + 'pam_pkcs11.conf' %}

script_{{ stig_id }}-describe:
  cmd.script:
    - source: salt://{{ helperLoc }}/{{ stig_id }}.sh
    - cwd: /root

###################################################################
# Need to leave this, for now. Need to either decide to make this
# an "alert only" module or make it 'skippable' (via pillar value).
# If "alert only" need to decide on best method to use for detect-
# and-notify
###################################################################
{%- if salt['pkg.version'](acPkg) %}
{%- endif %}

{%- if salt['pkg.version'](pkcsPkg) %}
{%- endif %}
