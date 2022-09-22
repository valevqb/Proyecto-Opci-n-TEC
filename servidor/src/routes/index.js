const { Router } = require('express');
const router = Router();

const {getCarreras,getPreguntas,getBecas,getServicios,getCostes,getBus} = require('../controllers/index.controller');


router.get('/Carreras',getCarreras);

router.get('/Preguntas',getPreguntas);

router.get('/Becas',getBecas);

router.get('/Servicios',getServicios);

router.get('/Costes',getCostes);

router.get('/Buses',getBus);



module.exports = router; 









