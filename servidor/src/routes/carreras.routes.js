const { Router } = require('express');
const router = Router();

const {getCarreras,postCarrera} = require('../controllers/carreras.controller');


router.get('/Carreras',getCarreras);
router.post('/agregarCarrera',postCarrera);

module.exports = router;