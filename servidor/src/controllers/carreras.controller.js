const {pool} = require('../database/postgeSQL');
const getCarreras =  async (req,res) => {
    var newJson = {"Cantidad":2,"Datos":[{}]}
    const response =  await pool.query('SELECT * FROM Carreras');
    newJson["Datos"]=response.rows
    res.json(newJson)
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