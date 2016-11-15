{%- from "ntp/map.jinja" import server with context %}
{%- if server.enabled %}
#include:
#  - ntp.client
{%- endif %}
