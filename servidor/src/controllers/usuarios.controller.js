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
   
    var nombre = req["body"]["nombre"];
    var correo = req["body"]["correo"];
    var contrasena = req["body"]["contrasena"];
    
    Consulta= "Select registrar("+"'"+nombre+"'"+","+"'"+correo+"'"+","+"'"+contrasena+"'"+")";
    console.debug(req["body"])
    const response =  await pool.query(Consulta);
    res.json(response.rows[0]["registrar"]["respuesta"])
    };

    
const postCambiarContrasena = async(req,res) => {
    var nueva = req["query"]["nueva"];
    var correo = req["query"]["correo"];
    var contrasena = req["query"]["contrasena"];
    Consulta = "Select cambiaContrasena("+"'"+correo+"'"+","+"'"+contrasena+"'"+","+"'"+nueva+"'"+")";
   
    const response =  await pool.query(Consulta);
    res.json(response.rows[0]["cambiacontrasena"]["respuesta"])
    console.debug(response.rows[0]["cambiacontrasena"]["respuesta"])
    
    };

    


module.exports = {postLogeo,postRegistro,postCambiarContrasena};