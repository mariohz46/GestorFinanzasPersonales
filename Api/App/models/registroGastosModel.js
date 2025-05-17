const {DataTypes}=require('sequelize');
const sequelize =require('../config/db');

const RegistroGastos = sequelize.define('registrogastos',{
    idRegistroGasto:{
        type:DataTypes.INTEGER,
        primaryKey:true,
        autoIncrement:true
    },
    fecha:{
        type: DataTypes.DATE,
        defaultValue: DataTypes.NOW
    },
    totalGastos:{
        type:DataTypes.INTEGER
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
    idCategoriaGasto:{
        type:DataTypes.INTEGER,
        references:{
            model:tipoGastoModel,
            key:'idCategoriaGasto'
        }
    },
    tableName:'registrogastos',
    timestamps:false
});

RegistroGastos.belongsTo(gastosFijosModel,{foreingKey:'idGastosF'});
RegistroGastos.belongsTo(gastosVariablesModel,{foreingKey:'idGastosV'});
RegistroGastos.belongsTo(tiposGastosModel,{foreingKey:'idCategoriaGasto'});