const { Router } = require('express');
const router = Router();

const {getCarreras,postCarrera,eliminarCarrera} = require('../controllers/carreras.controller');


router.get('/Carreras',getCarreras);
router.post('/agregarCarrera',postCarrera);
router.post('/eliminarCarrera',eliminarCarrera);



module.exports = router;