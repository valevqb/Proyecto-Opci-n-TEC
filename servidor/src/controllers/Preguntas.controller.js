const {pool} = require('../database/postgeSQL');

const getPreguntas =  async (req,res) => {
    var newJson = {"Cantidad":2,"Datos":[{}]}
    const response =  await pool.query('SELECT * FROM Preguntas');
    newJson["Datos"]=response.rows
    res.json(newJson)
}




const postPregunta =  async (req,res) => {
    try {
        var pregunta = "\"Pregunta\":"+"\""+req["body"]["pregunta"]+"\",";
        var respuesta = "\"Respuesta\":"+"\""+req["body"]["respuesta"]+"\",";
        var IMG = "\"IMG\":"+"\""+req["body"]["IMG"]+"\",";

        var enlaces ="\"Enlaces\": [" +"\""+req["body"]["enlaces"]+"\"],";
        
        var tema = "\"Categoria\":"+"\""+req["body"]["tema"]+"\"";
        
        var Consulta = "Select AgregarPregunta('{"+pregunta+respuesta+IMG+enlaces+tema+"}')";
        console.debug(Consulta);
        const response =  await pool.query(Consulta);
        res.json(Consulta)
    } catch (error) {
        console.debug(error);
        res.json("Error");
    }


};

const eliminarPregunta =  async (req,res) => {
    var id = req["body"]["id"];
   
    const response =  await pool.query("SELECT eliminarpregunta("+"'"+id+"'"+")");
    console.debug(response.rows[0]["eliminarpregunta"]["respuesta"]);
    res.json(response.rows[0]["eliminarpregunta"]["respuesta"]);
}

const cambiarPregunta =  async (req,res) => {
    eliminarPregunta(req);
   
}

module.exports = {getPreguntas,postPregunta,eliminarPregunta,cambiarPregunta}