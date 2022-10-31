/* //Requerimos el paquete
 var nodemailer = require('nodemailer');

 //Creamos el objeto de transporte
 var transporter = nodemailer.createTransport({
   service: 'gmail',
   auth: {
     user: 'opciontec@gmail.com',
     pass: 'P@t3rN0$t3r'
   }
 });
 
 var mensaje = "Hola desde nodejs...";
 
 var mailOptions = {
   from: 'opciontec@gmail.com',
   to: 'aguerojavith@gmail.com',
   subject: 'Asunto Del Correo',
   text: mensaje
 };
 
 transporter.sendMail(mailOptions, function(error, info){
   if (error) {
     console.log(error);
   } else {
     console.log('Email enviado: ' + info.response);
   }
 });

 module.exports = transporter;

 */