const { Router } = require('express');
const router = Router();

const {getBecas} = require('../controllers/becas.controller');
router.get('/Becas',getBecas);

module.exports = router;