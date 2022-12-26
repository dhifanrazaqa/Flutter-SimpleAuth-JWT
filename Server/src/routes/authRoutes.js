const express = require('express');
const { signup, login, getUser } = require('../controllers');

const router = express.Router();

router.post('/login', login);
router.post('/signup', signup);
router.get('/user', getUser)

module.exports = router;