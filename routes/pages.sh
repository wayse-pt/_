curl -s "https://wayse.pt$(curl -s https://wayse.pt | grep -o '/assets/index-[^"]*\.js')" \
  | grep -o '{path:"[^"]*",element:[^}]*}' \
  | awk '
      { l[NR] = $0; if ($0 ~ /\{path:"\*"/) { split($0, a, "("); split(a[2], b, ","); err = b[1] } }
      END { for (i = 1; i <= NR; i++) if (index(l[i], "(" err ",") == 0 && l[i] !~ /replace:!0/) { split(l[i], p, "\""); print p[2] } }
    ' \
  | sort