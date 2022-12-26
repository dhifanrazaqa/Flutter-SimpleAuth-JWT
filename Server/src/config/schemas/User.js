const mongoose = require('mongoose')

const UserSchema = new mongoose.Schema({
  email :{
      type: mongoose.SchemaTypes.String,
      required: true,
      unique: true,
  },
  password :{
      type: mongoose.SchemaTypes.String,
      required: true,
  },
});

module.exports = mongoose.model('users', UserSchema);