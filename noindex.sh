(
    u="https://wayse.pt$(curl --silent 'https://wayse.pt' | grep --only-matching '/assets/index-[^.]*\.js')"
    e='let b = "";
    process.stdin.on("data", d => b += d);
    process.stdin.on("end", () => {
        const err = b.match(/\{path:"\*",element:o\.jsx\(([A-Za-z0-9_]+),/)[1];
        const rRegex = /\{path:"([^"]+)",element:o\.jsx\(([A-Za-z0-9_]+),/g;
        const r = [];
        let m;
        while (null !== (m = rRegex.exec(b))) {
            const [_, path, comp] = m;
            if (err !== comp && "ue" !== comp && "*" !== path) {
                const def = b.slice(b.indexOf(comp + "="), b.indexOf(comp + "=") + 3000);
                if (def.includes("noIndex:!0") || def.includes("noindex, nofollow")) {
                    r.push(path);
                }
            }
        }
        console.log(r.sort().join("\n"));
    });'
    curl --silent "$u" | node --eval "$e"
)