const mongoose = require('mongoose')

mongoose.set("strictQuery", false);
mongoose.connect('mongodb://localhost:27017/flutterAuth')
    .then(() => console.log('Connected to DB'))
    .catch(err => console.log)