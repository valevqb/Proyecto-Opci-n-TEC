const {pool} = require('../database/postgeSQL');

const getCostes =  async (req,res) => {
    var newJson = {"Cantidad":2,"Datos":[{}]}
    const response =  await pool.query('SELECT * FROM costes');
    newJson["Datos"]=response.rows
    res.json(newJson)
}

module.exports = {getCostes};