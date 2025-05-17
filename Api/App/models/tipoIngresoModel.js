const {DataTypes}=require('sequelize');
const sequelize =require('../config/db').sequelizeInstance;
const { toDefaultValue } = require('sequelize/lib/utils');

const TipoIngreso =sequelize.define('tiposdeingresos',{
    idCategoriaIngreso:{
        type:DataTypes.INTEGER,
        primaryKey:true,
        autoIncrement:true,
        allowNull: false,
    },

    nombreCategoria:{
        type:DataTypes.STRING(30)
    },
},
{
    tableName:'tiposdeingresos',
    timestamps: false
}
);

module.exports=TipoIngreso;