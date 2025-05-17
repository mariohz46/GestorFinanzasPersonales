const Ingreso = require('./ingresosModel');
const TipoIngreso = require('./tipoIngresoModel');

// Definir asociaciones aquí
TipoIngreso.hasMany(Ingreso, {
  foreignKey: 'idCategoriaIngreso',
  sourceKey: 'idCategoriaIngreso'
});

Ingreso.belongsTo(TipoIngreso, {
  foreignKey: 'idCategoriaIngreso',
  targetKey: 'idCategoriaIngreso'
});

module.exports = {
  Ingreso,
  TipoIngreso
};