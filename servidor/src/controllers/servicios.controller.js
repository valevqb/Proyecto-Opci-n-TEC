const {pool} = require('../database/postgeSQL');

const getServicios =  async (req,res) => {
    var newJson = {"Cantidad":2,"Datos":[{}]}
    const response =  await pool.query('SELECT * FROM servicios');
    newJson["Datos"]=response.rows
    res.json(newJson)
}

module.exports = {getServicios};