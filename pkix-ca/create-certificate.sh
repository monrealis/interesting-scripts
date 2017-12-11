mkdir -p temp

if [ "$DN" == "" ] ; then
    export DN=c00
fi

if [ "$SIGN_KEY" == "" ] ; then
    export SIGN_KEY=$DN
fi

if [ "$KEY" == "" ] ; then
    export KEY=$DN
fi

openssl req -new -key temp/$KEY.key.secured -out temp/$DN.csr -passin pass:changeit -config config.txt

if [ "$ROOT" == "true" ] ; then
    openssl x509 -req -days 3650 -in temp/$DN.csr -signkey temp/$SIGN_KEY.key -out temp/$DN.crt -extensions v3_ca -extfile config.txt
    if [ -f temp/trustore.jks ]; then
        keytool -delete -alias $DN -keystore temp/trustore.jks -storepass changeit
    fi
	keytool -keystore temp/trustore.jks -import -file temp/$DN.crt -storepass changeit -noprompt -alias $DN
else
	openssl x509 -req -days 3650 -in temp/$DN.csr -CA temp/$SIGN_KEY.crt -CAkey temp/$SIGN_KEY.key -out temp/$DN.crt	-CAcreateserial -CAserial temp/ca.seq -extensions v3_ca -extfile config.txt
fi



openssl pkcs12 -export -inkey temp/$KEY.key -in temp/$DN.crt -name $DN -out temp/$DN.p12 -passin pass:changeit -passout  pass:changeit
keytool -importkeystore -deststorepass changeit -destkeypass changeit -destkeystore temp/keystore.jks -srckeystore temp/$DN.p12 -srcstoretype PKCS12 -srcstorepass changeit





