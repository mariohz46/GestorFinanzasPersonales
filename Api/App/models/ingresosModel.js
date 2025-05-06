const {DataTypes}=require('sequelize');
const sequelize =require('../config/db');
const { toDefaultValue } = require('sequelize/lib/utils');

const Ingresos =sequelize.define('ingresos',{
    idIngreso:{
        type:DataTypes.INTEGER,
        primaryKey:true,
        autoIncrement:true
    },
    descripcion:{
        type:DataTypes.STRING(100)
    },
    fecha:{
        type:DataTypes.DATE,
        toDefaultValue:DataTypes.NOW
    },
    monto:{
        type:DataTypes.INTEGER,
        allowNull: false,
    },
    totalIngresos:{
        type:DataTypes.INTEGER
    },
    idTipoIngreso:{
        type:DataTypes.INTEGER,
        references:{
            model:tipoIngresoModel,
            key:'idTipoIngreso'
        }
    },
    tableName:'ingresos',
    timestamps:false
});

Ingresos.belongsTo(tipoIngresoModel, { foreignKey: 'idTipoIngreso' });

module.exports=Ingresos;