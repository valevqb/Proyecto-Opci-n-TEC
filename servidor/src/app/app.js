const express = require('express');
const app = express();
var cors = require('cors')
const PORT = process.env.PORT || 3000;

//middlewares
app.use(express.json());
app.use(express.urlencoded({extended: false}));
app.use(cors());
// routes
app.use("/api",require('../routes/admisiones.routes'))
app.use("/api",require('../routes/becas.routes'))
app.use("/api",require('../routes/buses.routes'))
app.use("/api",require('../routes/carreras.routes'))
app.use("/api",require('../routes/costes.routes'))
app.use("/api",require('../routes/preguntas.routes'))
app.use("/api",require('../routes/servicios.routes'))
app.use("/api",require('../routes/usuarios.routes'))
app.use("/api",require('../routes/eventos.routes'))




app.use('/', function (req, res, next) {
    res.sendStatus(404);
});
app.listen(PORT, () =>
    console.log('Server running on port: ' + PORT
    ));