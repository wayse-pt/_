curl -s "https://wayse.pt$(curl -s https://wayse.pt | grep -o '/assets/index-[^"]*\.js')" \
  | grep -o '{path:"[^"]*",element:' \
  | wc -l