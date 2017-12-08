# Download the Caffe Proto definition from github.com/BVLC/caffe and
# compile it into a JavaScript module and a Typescript definition.

set -e

DIST_DIR=dist
PROTO_DIR=proto
PROTO_URL=http://cdn.rawgit.com/BVLC/caffe/master/src/caffe/proto/caffe.proto

# Create the directorpies
mkdir -p $PROTO_DIR
mkdir -p $DIST_DIR

# Download the proto definition
wget -qO $PROTO_DIR/caffe.proto $PROTO_URL

# Create a JavaScript module
node_modules/.bin/pbjs -t static-module -w commonjs -o $DIST_DIR/caffe.js $PROTO_DIR/caffe.proto
node_modules/.bin/pbts -o $DIST_DIR/caffe.d.ts $DIST_DIR/caffe.js