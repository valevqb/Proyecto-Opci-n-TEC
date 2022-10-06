const { Router } = require('express');
const router = Router();

const {getBus} = require('../controllers/bus.controller');

router.get('/Buses',getBus);

module.exports = router;


