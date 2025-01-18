const fs = require('fs');
const path = require('path');

// Read the env.js file
const envJsPath = path.join(__dirname, 'build', 'web', 'env.js');
let content = fs.readFileSync(envJsPath, 'utf8');

// Get all environment variables
const envVars = [
  'API_URL',
  'VAR_01',
  'VAR_02',
  'VAR_03',
  'VAR_04',
  'VAR_05',
  'VAR_06',
  'VAR_PRUEBA_LARGA_01',
  'VAR_PRUEBA_LARGA_02',
  'VAR_PRUEBA_LARGA_03',
  'VAR_PRUEBA_LARGA_04',
  'VAR_PRUEBA_LARGA_05'
];

// Replace placeholders with actual environment variables
envVars.forEach(varName => {
  const value = process.env[varName] || '';
  content = content.replace(`{{${varName}}}`, value);
});

// Write the modified content back to env.js
fs.writeFileSync(envJsPath, content, 'utf8'); 