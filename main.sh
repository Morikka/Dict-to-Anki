input=($@)
echo $input
word=$(echo $input | awk '{print $1}')
echo $word
def=$(echo $input | awk '{$1= ""; print $0}')
echo $def
curl -X "POST" "http://127.0.0.1:8765/" \
     -H 'Content-Type: text/plain; charset=utf-8' \
     -d $'{
  "action": "addNotes",
  "version": 6,
  "params": {
    "notes": [
      {
        "deckName": "Default",
        "modelName": "Basic",
        "fields": {
          "Front": "'"$word"'",
          "Back": "'"$def"'"
        }
      }
    ]
  }
}'
