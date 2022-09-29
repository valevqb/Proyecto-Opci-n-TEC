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

const getPreguntas =  async (req,res) => {
    var newJson = {"Cantidad":2,"Datos":[{}]}
    const response =  await pool.query('SELECT * FROM Preguntas');
    newJson["Datos"]=response.rows
    res.json(newJson)
}

const getBecas =  async (req,res) => {
    var newJson = {"Cantidad":2,"Datos":[{}]}
    const response =  await pool.query('SELECT * FROM Becas');
    newJson["Datos"]=response.rows
    res.json(newJson)
}

const getServicios =  async (req,res) => {
    var newJson = {"Cantidad":2,"Datos":[{}]}
    const response =  await pool.query('SELECT * FROM servicios');
    newJson["Datos"]=response.rows
    res.json(newJson)
}

const getCostes =  async (req,res) => {
    var newJson = {"Cantidad":2,"Datos":[{}]}
    const response =  await pool.query('SELECT * FROM costes');
    newJson["Datos"]=response.rows
    res.json(newJson)
}

const getBus =  async (req,res) => {
    var newJson = {"Cantidad":2,"Datos":[{}]}
    const response =  await pool.query('SELECT * FROM Servicios_Bus');
    newJson["Datos"]=response.rows
    res.json(newJson)
}

const getAdmisiones =  async (req,res) => {
    var newJson = {"Cantidad":2,"Datos":[{}]}
    const response =  await pool.query('SELECT * FROM Admisiones');
    newJson["Datos"]=response.rows
    res.json(newJson)
}



module.exports = {
    getPreguntas,
    getCarreras,
    getBecas,
    getServicios,
    getCostes,
    getBus,
    getAdmisiones
}