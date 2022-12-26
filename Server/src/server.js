const express = require('express');
const routes = require('./routes');

require('./config')

const app = express();
const port = 5000;

app.use(express.json())
app.use('/api/v1', routes)

app.listen(port, () => {
  console.log(`Server run on port ${port}`)
});