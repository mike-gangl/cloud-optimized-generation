#!/bin/sh
# Environment Variables must be passed into the docker run command

#need to update this 
export edl_username=`aws ssm get-parameter --with-decryption --name generate-edl-username | jq .Parameter.Value --raw-output`
export edl_password=`aws ssm get-parameter --with-decryption --name generate-edl-password | jq .Parameter.Value --raw-output`

cat > ~/.netrc <<EOF
machine urs.earthdata.nasa.gov
  login $edl_username
  password $edl_password
EOF

papermill generate_cloud_optimized_store.ipynb output.ipynb -p collection $COLLECTION -p loadable_coord_vars $LOADABLE_VARS -p start_date = $START_DATE -p end_date $END_DATE
