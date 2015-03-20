# STIG URL: http://www.stigviewer.com/stig/red_hat_enterprise_linux_6/2014-06-11/finding/V-38677
# Finding ID:	V-38677
# Version:	RHEL-06-000309
# Finding Level:	High
#
#     The NFS server must not have the insecure file locking option 
#     enabled. Allowing insecure file locking could allow for sensitive 
#     data to be viewed or edited by an unauthorized user.
#
############################################################

script_V38677-describe:
  cmd.script:
    - source: salt://ash-linux/STIGbyID/cat1/files/V38677.sh
    - cwd: /root

{%- set exportFile = '/etc/exports' %}
{%- set badOpt = 'insecure_locks' %}

{%- if salt['file.search'](exportFile, badOpt) %}
script_V38677-helper:
  cmd.script:
    - source: salt://ash-linux/STIGbyID/cat1/files/V38677-helper.sh
    - cwd: /root
{#
  {%- if salt['file.search'](exportFile, ',' + insecure_locks) %}
fix_V38677-secondaryOpt:
  file.replace:
    - name: '{{ exportFile }}'
    - pattern: ',{{ badOpt }}'
    - repl: ''
  {%- elif salt['file.search'](exportFile, '[ 	]' + insecure_locks + ',') %}
fix_V38677-primaryOpt:
  file.replace:
    - name: '{{ exportFile }}'
    - pattern: '{{ badOpt }},'
    - repl: ''
  {%- elif salt['file.search'](exportFile, '[ 	]' + insecure_locks + '[ 	]') %}
fix_V38677-onlyOpt:
  file.replace:
    - name: '{{ exportFile }}'
    - pattern: '{{ badOpt }},'
    - repl: ''
  {%- endif %}
#}
{%- else %}
fix_V38677-noChange:
  cmd.run:
    - name: 'echo "No ''{{ badOpt }}'' export options found in ''{{ exportFile }}''"'
{%- endif %}
