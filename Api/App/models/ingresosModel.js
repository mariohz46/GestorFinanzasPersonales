const {DataTypes}=require('sequelize');
const sequelize =require('../config/db').sequelizeInstance;


const Ingresos =sequelize.define('ingresos',{
    idIngreso:{
        type:DataTypes.INTEGER,
        primaryKey:true,
        autoIncrement:true,
        allowNull: false,
    },
    descripcion:{
        type:DataTypes.STRING(100)
    },
    fecha:{
        type:DataTypes.DATE,
        defaultValue:DataTypes.NOW
    },
    monto:{
        type:DataTypes.INTEGER,
        allowNull: false,
    },
    idCategoriaIngreso:{
    type:DataTypes.INTEGER,
    allowNull: false,
    references:{
        model: tipoIngresoModel,
        key: 'idCategoriaIngreso'
    }
},
},{
tableName:'ingresos',
timestamps: false

});


module.exports=Ingresos;