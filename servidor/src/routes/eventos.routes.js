const { Router } = require('express');
const router = Router();

const {getEventos,postEventos,postEliminarEventos} = require('../controllers/eventos.controller');

router.get('/Eventos',getEventos);
router.post('/PostEventos',postEventos);
router.post('/EliminarEventos',postEliminarEventos);


module.exports = router;