const {DataTypes}=require('sequelize');
const sequelize =require('../config/db');

const GastosV = sequelize.define('gastosvariables',{
    idGastosV:{
        type:DataTypes.INTEGER,
        primaryKey:true,
        autoIncrement:true
    },
    nombre:{
        type:DataTypes.STRING(60)
    },
    monto:{
        type:DataTypes.INTEGER,
        allowNull: false,
    },
    TotalGastosV:{
        type:DataTypes.INTEGER
    },
    idTipoGasto:{
        type:DataTypes.INTEGER,
        references:{
            model:tipoGastoModel,
            key:'idCategoriaGasto'
        }
    },
    tableName:'gastosvariables',
    timestamps:false
});

GastosV.belongsTo(tipoGastoModel,{foreignKey:'idCategoriaGasto'})

module.exports=GastosV;