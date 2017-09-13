DSPACEURL="https://localhost:8443/rest"
EMAIL="admin@dspace.com"
PASSWORD="admin"
VERSION="6"

TOKEN=$(./login.sh $DSPACEURL ${EMAIL} ${PASSWORD} $VERSION)

for R in $(ls requests/POST_*); do
  for T in json xml; do
    echo "EXECUTING REQUEST: $R ($T):"
    echo "--------------------------------------------"
    ./send_request.sh $DSPACEURL $TOKEN $R $T $VERSION
    echo ""
    echo "--------------------------------------------"
    echo ""
  done
done

for R in $(ls requests/PUT_*); do
  for T in json xml; do
    echo "EXECUTING REQUEST: $R ($T):"
    echo "--------------------------------------------"
    ./send_request.sh $DSPACEURL $TOKEN $R $T $VERSION
    echo ""
    echo "--------------------------------------------"
    echo ""
  done
done

for R in $(ls requests/UPLOAD_*); do
  for T in json xml; do
    echo "EXECUTING REQUEST: $R ($T):"
    echo "--------------------------------------------"
    ./send_file.sh $DSPACEURL $TOKEN $R $T $VERSION
    echo ""
    echo "--------------------------------------------"
    echo ""
  done
done

./logout.sh ${TOKEN}
