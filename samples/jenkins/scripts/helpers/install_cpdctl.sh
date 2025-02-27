PATH=$PATH:/usr/local/bin

curl -s https://api.github.com/repos/IBM/cpdctl/releases | \
  jq -r '.[0].assets[] | select (.name == "cpdctl_darwin_amd64.tar.gz") | .url'  | \
  xargs -I {} curl -sSL -H 'Accept: application/octet-stream' "{}" -o cpdctl_darwin_amd64.tar.gz

tar -xvf cpdctl_darwin_amd64.tar.gz

chmod a+rw $CPDCONFIG

echo "Installed cpdctl in version:"
./cpdctl version