const express =require('express');
const router = express.Router();
const controllerIngreso =require('../controllers/ingresosController');



router.post('/ingresos',controllerIngreso.insertar);
router.get('/ingresos',controllerIngreso.mostrarProductos);
module.exports = router;