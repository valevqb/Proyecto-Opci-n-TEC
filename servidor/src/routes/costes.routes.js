const { Router } = require('express');
const router = Router();

const {getCostes} = require('../controllers/costes.controller');
router.get('/Costes',getCostes);
module.exports = router;