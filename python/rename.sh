# python3 ~/git/repo/setup.py install

for d in ~/git/*; do
    [ -d "$d"/.readme-generator ] && ( set -x; cd "$d"; mv .readme-generator .readme )
done
