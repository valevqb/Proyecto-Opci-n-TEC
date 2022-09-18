const { Router } = require('express');
const router = Router();

const {getCarreras,getServicios} = require('../controllers/index.controller');


router.get('/Carreras',getCarreras);

router.get('/Servicios',getServicios);



module.exports = router; 