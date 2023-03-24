const express = require('express');

const app = express();

const appName = 'projetofinal-client';

const outputPath = `${__dirname}/dist/${appName}`;

const PORT = process.env.PORT || 8081;

app.use(express.static(outputPath));

app.get('/*', (req, res)=>{
  res.sendFile(`${outputPath}/index.html`)
})

app.listen(PORT, ()=>{
  console.log('Servidor iniciado na porta', PORT);
})
