const {pool} = require('../database/postgeSQL');

const getEventos =  async (req,res) => {
    var newJson = {"Cantidad":2,"Datos":[{}]}
    const response =  await pool.query('SELECT * from eventos');
    newJson["Datos"]=response.rows
    res.json(newJson)
}

const postEventos =  async (req,res) => {
    var nombre = req["body"]["nombre"];
    var fechainicio = req["body"]["fechainicio"];
    var fechafin = req["body"]["fechafin"];
    var estododia = req["body"]["estododia"];
    var descripcion = req["body"]["descripcion"];
    const response =  await pool.query("SELECT AgregarEvento("+"'"+nombre+"'"+","+"'"+fechainicio+"'"+","+"'"+fechafin+"'"+","+"'"+descripcion+"'"+","+"'"+estododia+"'"+")");
    
    res.json(response.rows[0]["agregarevento"]["respuesta"])
   
}

const postEliminarEventos =  async (req,res) => {
    var nombre = req["body"]["nombre"];
    const response =  await pool.query("SELECT eliminarevento("+"'"+nombre+"'"+")");
    console.debug(response.rows[0]["eliminarevento"]["respuesta"]);
    res.json(response.rows[0]["eliminarevento"]["respuesta"])
}


module.exports = {getEventos,postEventos,postEliminarEventos};