const { Router } = require('express');
const router = Router();

const {getEventos,postEventos,postEliminarEventos,postModificarEventos} = require('../controllers/eventos.controller');

router.get('/Eventos',getEventos);
router.post('/PostEventos',postEventos);
router.post('/EliminarEventos',postEliminarEventos);
router.post('/ModificarEvento',postModificarEventos);


module.exports = router;