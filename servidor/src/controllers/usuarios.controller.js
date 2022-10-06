const {pool} = require('../database/postgeSQL');

const getBus =  async (req,res) => {
    var Cantidad =  await pool.query('SELECT count(id) FROM Servicios_Bus');
    var newJson = {"Cantidad":Cantidad,"Datos":[{}]}
    const response =  await pool.query('SELECT * FROM Servicios_Bus');
    newJson["Datos"]=response.rows
    res.json(newJson)
}

module.exports = {getBus};