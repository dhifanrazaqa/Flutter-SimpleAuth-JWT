const bcrypt = require('bcryptjs');

// setup bcrypt to hashpassword
function hashPassword(password) {
    const salt = bcrypt.genSaltSync();
    return bcrypt.hashSync(password, salt);
}

// hashed password cannot be unhashed
// we need to compare hashed login password
// with hashed database password
function comparePassword(raw, hash) {
    return bcrypt.compareSync(raw, hash)
}

module.exports = { 
    hashPassword,
    comparePassword
};