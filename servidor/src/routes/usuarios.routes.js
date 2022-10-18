const { Router } = require('express');
const router = Router();

const {postLogeo,postRegistro,postCambiarContrasena} = require('../controllers/usuarios.controller');

router.post('/inicio_Secion',postLogeo);
router.post('/registrar',postRegistro);
router.post('/CambiarContrasena',postCambiarContrasena);
router.post('/CambiarDatos',postCambiarContrasena);

module.exports = router;