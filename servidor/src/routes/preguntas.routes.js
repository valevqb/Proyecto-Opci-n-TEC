const { Router } = require('express');
const router = Router();

const {getPreguntas} = require('../controllers/Preguntas.controller');
router.get('/Preguntas',getPreguntas);

module.exports = router;