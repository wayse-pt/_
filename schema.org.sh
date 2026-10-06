curl -s "https://wayse.pt$(curl -s https://wayse.pt | grep -o '/assets/index-[^"]*\.js')" \
  | grep -o '"@context":"https://schema\.org","@type":"[^"]*"' \
  | awk -F'"' '{print $8}' \
  | sort