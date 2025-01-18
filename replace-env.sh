#!/bin/bash

# The path to the env.js file
ENV_FILE="build/web/env.js"

# Create the env.js content
cat > "$ENV_FILE" << EOL
window.env = {
  'API_URL': '${API_URL:-}',
  'VAR_01': '${VAR_01:-}',
  'VAR_02': '${VAR_02:-}',
  'VAR_03': '${VAR_03:-}',
  'VAR_04': '${VAR_04:-}',
  'VAR_05': '${VAR_05:-}',
  'VAR_06': '${VAR_06:-}',
  'VAR_PRUEBA_LARGA_01': '${VAR_PRUEBA_LARGA_01:-}',
  'VAR_PRUEBA_LARGA_02': '${VAR_PRUEBA_LARGA_02:-}',
  'VAR_PRUEBA_LARGA_03': '${VAR_PRUEBA_LARGA_03:-}',
  'VAR_PRUEBA_LARGA_04': '${VAR_PRUEBA_LARGA_04:-}',
  'VAR_PRUEBA_LARGA_05': '${VAR_PRUEBA_LARGA_05:-}'
};
EOL

echo "Environment variables have been written to $ENV_FILE" 