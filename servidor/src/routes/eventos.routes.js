const { Router } = require('express');
const router = Router();

const {getEventos} = require('../controllers/eventos.controller');

router.get('/Eventos',getEventos);


module.exports = router;