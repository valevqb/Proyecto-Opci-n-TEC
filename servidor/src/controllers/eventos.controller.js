const {pool} = require('../database/postgeSQL');

const getEventos =  async (req,res) => {
    var newJson = {"Cantidad":2,"Datos":[{}]}
    const response =  await pool.query('SELECT * from eventos');
    newJson["Datos"]=response.rows
    console.debug(response.rows);
    res.json(newJson)
}

module.exports = {getEventos};