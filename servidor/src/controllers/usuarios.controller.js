const {pool} = require('../database/postgeSQL');

const postLogeo =  async (req,res) => {
   
    var usuario = req["body"]["correo"];
    var contrasena = req["body"]["contrasena"];
    console.debug("SELECT Inicio_Secion("+usuario+","+contrasena+")");
    const response =  await pool.query("SELECT Inicio_Secion("+"'"+usuario+"'"+","+"'"+contrasena+"'"+")");
    res.json(response.rows[0]["inicio_secion"]["respuesta"])
    console.debug(response.rows[0]["inicio_secion"]["respuesta"]);
}


const postRegistro = async(req,res) => {
    console.debug(req["body"])
    var nombre = req["body"]["nombre"];
    var apellido = req["body"]["apellido"];
    var correo = req["body"]["correo"];
    var contrasena = req["body"]["contrasena"];
    
    Consulta= "Select registrar("+"'"+nombre+"'"+","+"'"+apellido+"'"+","+"'"+correo+"'"+","+"'"+contrasena+"'"+")";
    const response =  await pool.query(Consulta);
    res.json(response.rows[0]["registrar"]["respuesta"])
    console.debug(response.rows[0]["registrar"]["respuesta"])
    console.debug(response.rows[0]["registrar"])
    };


module.exports = {postLogeo,postRegistro};