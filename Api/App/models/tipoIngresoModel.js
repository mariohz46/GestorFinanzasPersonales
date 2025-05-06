const {DataTypes}=require('sequelize');
const sequelize =require('../config/db');

const TipoIngreso = sequelize-define('tiposdeingresos',{
    idCategoriaIngreso:{
        type:DataTypes.INTEGER,
        primaryKey:true,
        autoIncrement:true
    },
    nombreCategoria:{
        type:DataTypes.STRING(30)
    },
    tableName:'tiposdeingresos',
    timestamps:false
});


module.exports=TipoIngreso;