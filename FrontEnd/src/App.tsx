import {Routes, Route} from 'react-router-dom'
import IngresosForm from './pages/ingresos';
import './App.css'

function App() {
  

  return (
   <Routes>
      <Route path='/ingresos' element={<IngresosForm/>}></Route>
   </Routes>
  )
}

export default App
