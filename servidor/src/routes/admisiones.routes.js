const { Router } = require('express');
const router = Router();

const {getAdmisiones} = require('../controllers/admisiones.controller');

router.get('/Admision',getAdmisiones)



module.exports = router; 









