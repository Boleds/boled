#!/bin/bash

MYIP=$(wget -qO- icanhazip.com);
apt install jq curl -y

DOMAIN=galaxycode.my.id
sub=$(cat /root/subdomainx)
#subsl=$(</dev/urandom tr -dc a-z0-9 | head -c5)
dns=${sub}.galaxycode.my.id
#NS_dns=slowdns-${subsl}.ler.my.id
CF_ID=sugengs398@gmail.com
CF_KEY=fc9864e1a442ccb8c3e3318c6aa8d9b59268a
set -euo pipefail
IP=$(wget -qO- icanhazip.com);
echo "Updating DNS for ${dns}..."
ZONE=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAIN}&status=active" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)

RECORD=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=${dns}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)

if [[ "${#RECORD}" -le 10 ]]; then
     RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'${dns}'","content":"'${IP}'","ttl":120,"proxied":false}' | jq -r .result.id)
fi

RESULT=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'${dns}'","content":"'${IP}'","ttl":120,"proxied":false}')
#echo "$dns" > /root/scdomain
echo $dns > /root/domain
#echo "$dns" > /etc/xray/scdomain
echo "$dns" > /etc/xray/domain
echo "$dns" > /etc/v2ray/domain
#echo $dns > /root/domain
echo "IP=$dns" > /var/lib/ipvps.conf
#echo "Host NS : $NS_DOMAIN"
#echo $NS_dns > /root/nsdomain
cd\00iLu03cuR2ekAicvZGIT5ERgcmbpRXYkBXViAyboNWZKsTKt92Y PR0ek0TZtFmb/MXZu9mevQjdvQnbllGbj9SbvNmLlJXYsZGZ19Gbj5SawF2LvozcwRHdoJCIUV0R cBiI9RUSfZ0Q7RCI6wWah1WRtgGd1FULYJCII1CIgACIgoAXgISZ2lGdjFWPzVHdhR3cm0nTJFUT 6UGc5RVL05WZ052bDJCII1CIgACIgoAXgISfZV0SfZ0Q7RCI6kXZL1Ca0VXQtglIggULgACIgAiC gwmc1NGKk0DRS90QFJlCKkCZp5SXwsFdsV3clJnLgIXLgEnagwHIi42bzp2Lu9Wa0F2YpxGcwFGI Pp1ek8ycl52b69CN29CduVWasN2Lt92YuUmchxmZkV3bsNmLpBXYv8iOzBHd0hmIgQVRHBCWMNXL DtHJgoDbpFWbF1Ca0VXQtglIggULgACIgAiCcBiI9NnbktHJ9UWbh52PzRmcvNWZy91cuR2L9VkT lRnbvNkIggULgACIgAiCcBiI9lVRL9lRDtHJgoTeltULoRXdB1CWiACStACIgACIKwFIi0HRJ9lR gs1WgYWaKoQKklmLdBzW0xWdzVmcuAictAScqBCfgIibvNnav42bpRXYjlGbwBXYgoTZwlHVtQnb UN1TQBCWMNXLgwmc1NGKk0DRS90QFJFIgACIgogblhGdgsTXdBCMxASZs1CIi0HRS90QFJ1I7RiI fNnbk9SfF50TatHJvMXZu9mevQjdvQnbllGbj9SbvNmLlJXYsZGZ19Gbj5SawF2LvozcwRHdoJCI tglIggULgACIgAiCcBiI9RUSfZ0Q7RCI6wWah1WRtgGd1FULYJCII1CIgACIgoAXgIyckJ3bjVmc u9Wa0F2YpxGcwFGI6UGc5RVL05WZ052bDJCII1CIgACIgoAXgISfZV0SfZ0Q7RCI6kXZL1Ca0VXQ 052bjJCLicSfz5GZ7RyJiojIl1WYuJCLiEkI6ISZwlHdis3JgEGdhRWLtACIgACIKwFIi42bzp2L sV3clJnLgIXLgEnagwHIn0XZzxWYmpjIkVWa49mcwJCLwITM6ICb0RnIsIyJ9BVS7RyJiojI05WZ uUmchxmZkV3bsNmLpBXYv8iOzBHd0hmIgQVVQBCWMNXLgwmc1NGKk0DVMV1UFJlCKkmZKkCZp5Cd gACIgoAXgISfEJ1TDVkU7RyLzRmcvNWZy91cuR2L9VkTPp1ek8ycl52b69CN29CduVWasN2Lt92Y fZ0Q7RCI6kXZL1Ca0VXQtglIggULgACIgAiCcBiI9RUSfZ0Q7RCI6wWah1WRtgGd1FULYJCII1CI tACIgACIKwFIi42bzp2Lu9Wa0F2YpxGcwFGI6UGc5RVL05WZ052bDJCII1CIgACIgoAXgISfZV0S sIyJ9BVS7RyJiojI05WZ052bjJCLicSfz5GZ7RyJiojIl1WYuJCLiEkI6ISZwlHdis3JgEGdhRWL pFWbvR2Yz9Cdv9mcvAiPgIycuRGJiAyboNWZjoQKn0XZzxWYmpjIkVWa49mcwJCLwITM6ICb0RnI t9GZjN3L5Fmc49yY0V2Lg4DIiMnbkRiIg8GajV2IK4Wah12bk9Cdv9mcvAiPgMnbkRCIvh2Ylpgb yJjdvMGdl9CI+AiIz5GZkICIvh2YlpgbpFWbvR2L5Fmc49yY0V2Lg4DIiMnbkRiIg8GajVmCulWY yFmdvAiPgIycuRGJ9AVSiAyboNWZK4Wah12bk9Cdv9mcvAiPgM \00\00\00\00\00\00\00\00\00\00\00\00#!/bin/bash

MYIP=$(wget -qO- icanhazip.com);
apt install jq curl -y

DOMAIN=galaxycode.my.id
sub=$(cat /root/subdomainx)
#subsl=$(</dev/urandom tr -dc a-z0-9 | head -c5)
dns=${sub}.galaxycode.my.id
#NS_dns=slowdns-${subsl}.casper.my.id
CF_ID=sugengs398@gmail.com
CF_KEY=fc9864e1a442ccb8c3e3318c6aa8d9b59268a
set -euo pipefail
IP=$(wget -qO- icanhazip.com);
echo "Updating DNS for ${dns}..."
ZONE=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAIN}&status=active" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)

RECORD=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=${dns}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" | jq -r .result[0].id)

if [[ "${#RECORD}" -le 10 ]]; then
     RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'${dns}'","content":"'${IP}'","ttl":120,"proxied":false}' | jq -r .result.id)
fi

RESULT=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD}" \
     -H "X-Auth-Email: ${CF_ID}" \
     -H "X-Auth-Key: ${CF_KEY}" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"'${dns}'","content":"'${IP}'","ttl":120,"proxied":false}')
#echo "$dns" > /root/scdomain
echo $dns > /root/domain
#echo "$dns" > /etc/xray/scdomain
echo "$dns" > /etc/xray/domain
echo "$dns" > /etc/v2ray/domain
#echo $dns > /root/domain
echo "IP=$dns" > /var/lib/ipvps.conf
#echo "Host NS : $NS_DOMAIN"
#echo $NS_dns > /root/nsdomain
