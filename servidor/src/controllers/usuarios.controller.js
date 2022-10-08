const {pool} = require('../database/postgeSQL');

const postLogeo =  async (req,res) => {
    var usuario = req["query"]["usuario"];
    var contrasena = req["query"]["contrasena"];
    console.debug("SELECT Inicio_Secion("+usuario+","+contrasena+")");
    const response =  await pool.query("SELECT Inicio_Secion("+"'"+usuario+"'"+","+"'"+contrasena+"'"+")");
    res.json({"Estado":response.rows})
}


const postRegistro = async(req,res) => {
    var nombre = req["query"]["nombre"];
    var apellido = req["query"]["apellido"];
    var correo = req["query"]["correo"];
    var contrasena = req["query"]["contrasena"];
    
    Consulta= "Select registrar("+"'"+nombre+"'"+","+"'"+apellido+"'"+","+"'"+correo+"'"+","+"'"+contrasena+"'"+")";
    const response =  await pool.query(Consulta);
    res.json({"Estado":response.rows})
  
    };


module.exports = {postLogeo,postRegistro};