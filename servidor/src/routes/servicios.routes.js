const { Router } = require('express');
const router = Router();

const {getServicios} = require('../controllers/servicios.controller');

router.get('/Servicios',getServicios);

module.exports = router;