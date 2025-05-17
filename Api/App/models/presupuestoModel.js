const {DataTypes}=require('sequelize');
const sequelize =require('../config/db');

const Presupuesto = sequelize.define('presupuestos',{
    idPresupuesto:{
        type:DataTypes.INTEGER,
        primaryKey:true,
        autoIncrement:true
    },
    descripcion:{
        type:DataTypes.STRING(255)
    },
    fechaInicio: {
        type: DataTypes.DATE,
        defaultValue: DataTypes.NOW
    },
    fechaFinal: {
        type: DataTypes.DATE,
        defaultValue: DataTypes.NOW
    },
    totalPresupuesto:{
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
    idIngresos:{
        type:DataTypes.INTEGER,
        references:{
            model:ingresosModel,
            key:'idIngreso'
        }
    },
    tableName:'presupuestos',
    timestamps:false
    
});

Presupuesto.belongsTo(gastosFijosModel,{foreingKey:'idGastosF'});
Presupuesto.belongsTo(gastosVariablesModel,{foreingKey:'idGastosV'});
Presupuesto.belongsTo(ingresosModel,{foreingKey:'idIngreso'});
