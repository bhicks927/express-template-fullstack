const router = require('express').Router();

router.get('/', async (req, res) => {
  try {
    const data = { statusCode: res.statusCode, message: 'hello' };
    res.render('index', data);
  } catch (err) {
    res.status(500).json(err);
  }
});

module.exports = router;