import express = require('express');

const app: express.Express = express();
app.use(express.urlencoded());
app.use(express.static('public'));
app.listen(3000);