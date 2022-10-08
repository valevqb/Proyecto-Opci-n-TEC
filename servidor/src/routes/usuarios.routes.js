const { Router } = require('express');
const router = Router();

const {postLogeo,postRegistro} = require('../controllers/usuarios.controller');

router.post('/inicio_Secion',postLogeo);
router.post('/registrar',postRegistro);

module.exports = router;