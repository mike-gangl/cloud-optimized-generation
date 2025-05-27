#!/bin/bash
# Environment Variables must be passed into the docker run command

papermill generate_cloud_optimized_store.ipynb output.ipynb -p collection $COLLECTION -p loadable_coord_vars $LOADABLE_VARS -p start_date = $START_DATE -p end_date $END_DATE
