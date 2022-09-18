const {Pool} = require('pg');

const pool = new Pool({
    host: '192.168.18.13',
    user: 'opcionTec',
    password: '2003',
    database: 'OpcionTEC',
    port: '5432'
})

const getCarreras =  async (req,res) => {
    var newJson = {"Cantidad":2,"Datos":[{}]}
    const response =  await pool.query('SELECT * FROM Carreras');
    newJson["Datos"]=response.rows
    res.json(newJson)
}

const getServicios =  async (req,res) => {
    var newjson = {"Casa":"HJolas"}
   res.json(newjson)
}


module.exports = {
    getServicios,
    getCarreras
    
}