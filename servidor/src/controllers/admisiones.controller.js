const {pool} = require('../database/postgeSQL');

const getAdmisiones =  async (req,res) => {
    var newJson = {"Cantidad":2,"Datos":[{}]}
    const response =  await pool.query('SELECT * FROM Admisiones');
    newJson["Datos"]=response.rows
    res.json(newJson)
}

module.exports = {getAdmisiones}