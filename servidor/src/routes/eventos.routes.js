const { Router } = require('express');
const router = Router();

const {getEventos,postEventos} = require('../controllers/eventos.controller');

router.get('/Eventos',getEventos);
router.post('/PostEventos',postEventos);


module.exports = router;