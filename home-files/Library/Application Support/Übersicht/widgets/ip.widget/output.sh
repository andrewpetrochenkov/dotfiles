#!/usr/bin/env bash
{ set +x; } 2>/dev/null

internal_ip="$(ipconfig getifaddr en1)" || exit
public_ip="$(curl -s ipecho.net/plain)" || exit
tmp="$(mktemp)" || exit
curl -fs https://freegeoip.app/xml/$ip > "$tmp"
country_code="$(grep "CountryCode" "$tmp" | sed -n 's:.*<CountryCode>\(.*\)</CountryCode>.*:\1:p')"

cat <<EOF
<table>
    <tr><td>$internal_ip</td><td></td></tr>
    <tr><td>$public_ip</td><td>$country_code</td></tr>
</table>
EOF
