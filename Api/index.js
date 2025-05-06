 //Despliegue del app.js
'use strict'

require('dotenv').config();
const DB=require('./App/config/db');
const App= require('./App/app');
const port= process.env.port || process.env.APP_PORT;
const bdPort=process.env.MYSQL_PORT || 3006

DB.sequelizeInstance.sync(bdPort)
 .then(()=>{
    console.info(`Base de datos sincronizada y alojada en el puerto ${bdPort}`);
    App.listen(port,function (error) {
        if (error){
            console.log(error);
        }else{
            console.info(`el servidor de express se esta ejecutando en el puerto ${port}`)
        }
    });
 })
 .catch(error=>{
    console.error('Error en la sincronizacion de la base de datos', error)
 })
