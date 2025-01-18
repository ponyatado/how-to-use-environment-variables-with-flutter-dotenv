const fs = require('fs');

const htmlFile = 'build/web/index.html';

fs.readFile(htmlFile, 'utf8', (err, data) => {
  if (err) {
    console.error('Error reading index.html:', err);
    return;
  }

  let result = data;

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

  for (const key of envVars) {
    const placeholder = `__${key}__`;
    const value = process.env[key] || '';
    result = result.replace(new RegExp(placeholder, 'g'), value);
  }

  fs.writeFile(htmlFile, result, 'utf8', (err) => {
    if (err) {
      console.error('Error writing index.html:', err);
      return;
    }
    console.log('Environment variables replaced in index.html');
  });
}); 