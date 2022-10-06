const {pool} = require('../database/postgeSQL');


const getBecas =  async (req,res) => {
    var newJson = {"Cantidad":2,"Datos":[{}]}
    const response =  await pool.query('SELECT * FROM Becas');
    newJson["Datos"]=response.rows
    res.json(newJson)
}


module.exports = {getBecas}