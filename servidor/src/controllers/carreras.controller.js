const {pool} = require('../database/postgeSQL');
const getCarreras =  async (req,res) => {
    const response =  await pool.query('SELECT  getcarreras()');
    res.json(JSON.parse(response.rows[0]["getcarreras"]))
}

const postCarrera = async(req,res) => {
    var nombre = req["query"]["nombre"];
    var apellido = req["query"]["apellido"];
    var correo = req["query"]["correo"];
    var contrasena = req["query"]["contrasena"];
    
    Consulta= "Select agregarUsuario("+nombre+","+apellido+","+correo+","+contrasena+")";
    res.json({"Estado":Consulta})
  
    };


module.exports = {getCarreras,postCarrera};