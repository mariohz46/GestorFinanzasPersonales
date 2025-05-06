const {DataTypes}=require('sequelize');
const sequelize =require('../config/db');

const Ahorros =sequelize.define('ahorros',{
    idAhorro:{
        type:DataTypes.INTEGER,
        primaryKey:true,
        autoIncrement:true
    },
    descripcion:{
        type:DataTypes.STRING(50)
    },
    monto:{
        type:DataTypes.INTEGER,
        allowNull: false,
    },
    idIngreso:{
        type:DataTypes.INTEGER,
        references:{
            model:ingresosModel,
            key:'idIngreso'
        }
    },
    tableName:'ahorros',
    timestamps:false
});

Ahorros.belongsTo(ingresosModel,{foreignKey:'idIngreso'});

module.exports=Ahorros;