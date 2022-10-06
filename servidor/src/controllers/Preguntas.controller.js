const {pool} = require('../database/postgeSQL');

const getPreguntas =  async (req,res) => {
    var newJson = {"Cantidad":2,"Datos":[{}]}
    const response =  await pool.query('SELECT * FROM Preguntas');
    newJson["Datos"]=response.rows
    res.json(newJson)
}

module.exports = {getPreguntas}