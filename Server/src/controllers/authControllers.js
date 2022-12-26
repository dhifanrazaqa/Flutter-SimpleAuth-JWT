const User = require('../config/schemas/User');
const { hashPassword, comparePassword } = require('../utils/helper')
const jwt = require('jsonwebtoken');

const login = async (req, res) => {
  const { email, password } = req.body;
  if (!email || !password) return res.send(400);
  // get user file based on email
  const userDB = await User.findOne({email});
  if (!userDB) return res.status(401).json({msg: "User not found"});
  const isValid = comparePassword(password, userDB.password);
  if (isValid){
    console.log(userDB);
    const token = jwt.sign({id: userDB.id}, "password");
    return res.status(200).json({token: token}); 
  }
  else{
    return res.status(401).json({msg: "Password is not correct"});
  }
};

const signup = async (req, res) => {
  const { email } = req.body;

  // check existing email in database
  const userDB = await User.findOne({email});
  // check condition if username or email exist
  if (userDB) {
      res.status(400).send({msg: 'User already exist'})
  }
  else {
      // hashing password to store in database
      const password = hashPassword(req.body.password)
      let user = new User({
        email,
        password,
      });
      console.log(user);
      await user.save();
      const token = jwt.sign({id: user.id}, "password");
      return res.status(201).json({token: token});
  }
};

const getUser = async (req, res) => {
  const token = req.header("token");
  if (!token) return res.status(401).json({msg: "You are not logged in"});

  const decodedToken = jwt.verify(token, "password");
  console.log(decodedToken);
  const userDB = await User.findById(decodedToken.id);
  
  return res.status(200).json({user: userDB});
}

module.exports = {
  login,
  signup,
  getUser,
};