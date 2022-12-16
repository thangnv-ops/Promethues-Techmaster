TOKEN="5962145148:AAEs7cIZSaH9g4PPZaoEwGKAajQ3awwVqFE" 
ID="-809040730"
URL="https://api.telegram.org/bot$TOKEN/sendMessage"

curl -s -X POST $URL -d chat_id=$ID -d text="Hello "