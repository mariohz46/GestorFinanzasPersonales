const {DataTypes}=require('sequelize');
const sequelize =require('../config/db');

const TipoGasto = sequelize.define('tiposdegastos',{
    idCategoriaGasto:{
        type:DataTypes.INTEGER,
        primaryKey:true,
        autoIncrement:true
    },
    nombreCategoria:{
        type:DataTypes.STRING(30)
    },
    tableName:'tiposdegastos',
    timestamps:false
});