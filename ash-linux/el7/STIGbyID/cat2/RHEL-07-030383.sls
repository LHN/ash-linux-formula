# Finding ID:	RHEL-07-030383
# Version:	RHEL-07-030383_rule
# SRG ID:	SRG-OS-000064-GPOS-00033
# Finding Level:	medium
# 
# Rule Summary:
#	All uses of the fchownat command must be audited.
#
# CCI-000172 
# CCI-000126 
#    NIST SP 800-53 :: AU-12 c 
#    NIST SP 800-53A :: AU-12.1 (iv) 
#    NIST SP 800-53 Revision 4 :: AU-12 c 
#    NIST SP 800-53 :: AU-2 d 
#    NIST SP 800-53A :: AU-2.1 (v) 
#    NIST SP 800-53 Revision 4 :: AU-2 d 
#
#################################################################
{%- set stig_id = 'RHEL-07-030383' %}
{%- set helperLoc = 'ash-linux/el7/STIGbyID/cat2/files' %}

script_{{ stig_id }}-describe:
  cmd.script:
    - source: salt://{{ helperLoc }}/{{ stig_id }}.sh
    - cwd: /root
