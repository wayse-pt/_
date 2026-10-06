curl -s "https://wayse.pt$(curl -s https://wayse.pt | grep -o '/assets/index-[^"]*\.js')" \
  | grep -o '{path:"[^"]*",element:[^}]*to:"[^"]*"' \
  | awk -F'"' '$4 ~ /^\/#/ {print $2 " → " $4}' \
  | sort