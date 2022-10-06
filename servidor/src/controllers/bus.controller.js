const {pool} = require('../database/postgeSQL');

const getBus =  async (req,res) => {
    var newJson = {"Cantidad":2,"Datos":[{}]}
    const response =  await pool.query('SELECT * FROM Servicios_Bus');
    newJson["Datos"]=response.rows
    res.json(newJson)
}

module.exports = {getBus};