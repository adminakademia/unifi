mkdir -p /docker/unifi
mcedit /docker/unifi/init-mongo.sh


set -e

mongosh <<EOF
db.getSiblingDB('$MONGO_DBNAME').createUser({
  user: '$MONGO_USER',
  pwd: '$MONGO_PASS',
  roles: [{
    role: 'readWrite',
    db: '$MONGO_DBNAME'
  }]
})
db.getSiblingDB('$MONGO_DBNAMESTAT').createUser({
  user: '$MONGO_USER',
  pwd: '$MONGO_PASS',
  roles: [{
    role: 'readWrite',
    db: '$MONGO_DBNAMESTAT'
  }]
})
EOF



chmod 777 /docker/unifi/init-mongo.sh
