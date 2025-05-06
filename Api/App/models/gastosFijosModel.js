const {DataTypes}=require('sequelize');
const sequelize =require('../config/db');

const GastosF = sequelize.define('gastosfijos',{
    idGastosF:{
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
    totalGastosF:{
        type:DataTypes.INTEGER
    },
    idTipoGasto:{
        type:DataTypes.INTEGER,
        references:{
            model:TipoGastoModel,
            key:'idCategoriaGasto'
        }
    },
    tableName:'gastosfijos',
    timestamps:false
});

GastosF.belongsTo(TipoGastoModel, {foreignKey: 'idCategoriaGasto'});

module.exports= GastosF;