const { Router } = require('express');
const router = Router();

const {getPreguntas,postPregunta,eliminarPregunta,cambiarPregunta} = require('../controllers/Preguntas.controller');
router.get('/Preguntas',getPreguntas);
router.post('/agregarPregunta',postPregunta);
router.post('/cambiarPregunta',cambiarPregunta);
router.post('/eliminarPregunta',eliminarPregunta);



module.exports = router;