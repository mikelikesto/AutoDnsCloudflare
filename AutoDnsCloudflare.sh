EMAIL="INSERT EMAIL HERE"; \
KEY="INSERT KEY HERE"; \
ZONE_ID="INSERT ZONE ID HERE"; \
TYPE="A"; \
NAME="INSERT DOMAIN HERE"; \
CONTENT=$(curl ifconfig.me); \
PROXIED="false"; \
TTL="1"; \
curl -X POST "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records/" \
    -H "X-Auth-Email: $EMAIL" \
    -H "X-Auth-Key: $KEY" \
    -H "Content-Type: application/json" \
    --data '{"type":"'"$TYPE"'","name":"'"$NAME"'","content":"'"$CONTENT"'","proxied":'"$PROXIED"',"ttl":'"$TTL"'}' \
    | python -m json.tool;
