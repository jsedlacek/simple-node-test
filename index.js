const express = require('express');
const morgan = require('morgan');
const os = require("os");

const app = express();

app.use(morgan((tokens, req, res) => JSON.stringify({
    method: tokens.method(req, res),
    url: tokens.url(req, res),
    status: parseInt(tokens.status(req, res)),
    contentLength: parseInt(tokens.res(req, res, 'content-length'), 10),
    responseTime: parseFloat(tokens['response-time'](req, res))
})));

app.get('*', (req, res) => {
  res.send(os.hostname() + ': ' + req.url);
});

app.listen(8000, () => {
  console.log('listening');
});

process.on('SIGTERM', () => {
  console.log('shutting down');
  process.exit(0);
});
