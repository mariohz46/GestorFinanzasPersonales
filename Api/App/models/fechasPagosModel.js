const {DataTypes}=require('sequelize');
const sequelize =require('../config/db');

const FechasDePago = sequelize.define('fechasdepago',{
    idFechaDePago:{
        type:DataTypes.INTEGER,
        primaryKey:true,
        autoIncrement:true
    },
    descripcion:{
        type:DataTypes.STRING(50)
    },
    fecha:{
        type: DataTypes.DATE,
        defaultValue: DataTypes.NOW  
    },
    idGastosF:{
        type:DataTypes.INTEGER,
        references:{
            model:gastosFijosModel,
            key:'idGastosF'
        }
    },
    idGastosV:{
        type:DataTypes.INTEGER,
        references:{
            model:gastosVariablesModel,
            key:'idGastosV'
        }
    },
    tableName:fechasdepago,
    timestamps:false
});

FechasDePago.belongsTo(gastosFijosModel,{foreignKey:'idGastosF'});
FechasDePago.belongsTo(gastosVariablesModel,{foreignKey:'idGastosV'});
