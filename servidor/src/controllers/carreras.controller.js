const {pool} = require('../database/postgeSQL');

const getCarreras =  async (req,res) => {
    const response =  await pool.query('SELECT  getcarreras()');
    res.json(JSON.parse(response.rows[0]["getcarreras"]))
}


const postCarrera =  async (req,res) => {
    console.debug("Error");
    try {
        var Resumen = "\"Resumen\":"+"\""+req["body"]["Resumen"]+"\",";
        var Acreditacion = "\"Acreditacion\":"+"\""+req["body"]["Acreditacion"]+"\",";
        var Corte = "\"Corte\":"+"\""+req["body"]["Corte"]+"\",";
        var Grado ="\"Grado\": " +"\""+req["body"]["Grado"]+"\",";
        var Descripcion = "\"Descripcion\":"+"\""+req["body"]["Descripcion"]+"\",";
        var Habilidades = "\"Habilidades\":["+"\""+req["body"]["Habilidades"]+"\"],";
        var Horario = "\"Horario\":"+"\""+req["body"]["Horario"]+"\",";
        var Intereses = "\"Intereses\":["+"\""+req["body"]["Intereses"]+"\"],";
        var Area_Laboral = "\"Area Laboral\":["+"\""+req["body"]["Area Laboral"]+"\"],";
        var Nombre = "\"Nombre\":"+"\""+req["body"]["Nombre"]+"\",";
        var Sede = "\"Sede\":"+"\""+req["body"]["Sede"]+"\",";
        var IMG = "\"IMG\":"+"\""+req["body"]["IMG"]+"\",";
        var Categoria = "\"Categoria\":"+"\""+req["body"]["Categoria"]+"\",";
        var Plan = "\"Plan\":"+"\""+req["body"]["Plan"]+"\"";

        var Consulta = "Select Agregarcarrera('{"+Resumen+Acreditacion+Corte+Grado+Descripcion+Habilidades+Horario+Intereses+Area_Laboral+Nombre+Sede+IMG+Categoria+Plan+"}')";

        console.debug(Consulta);
        const response =  await pool.query(Consulta);
        res.json(response.rows[0]["agregarcarrera"]["respuesta"])
        console.debug(response.rows[0]["agregarcarrera"]["respuesta"]);
    } catch (error) {
        console.debug(error);
        res.json("Error");
    }


};
const eliminarCarrera =  async (req,res) => {
    var id = req["body"]["id"];
   
    const response =  await pool.query("SELECT eliminarCarrera("+"'"+id+"'"+")");
    console.debug(response.rows[0]["eliminarCarrera"]["respuesta"]);
    res.json(response.rows[0]["eliminarCarrera"]["respuesta"]);
}

module.exports = {getCarreras,postCarrera,eliminarCarrera};


