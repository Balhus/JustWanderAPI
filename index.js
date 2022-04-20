const express = require('express');
const cors = require('cors');

const userController = require('./controllers/usuario_controller');
const comerceController = require('./controllers/comercio_controller');

const app = express();

app.use(express.json()); //necesario para poder recibir datos en json
app.use(cors()); //evita problemas al conectar desde otro servidor

//Creating main routes
app.get('/', (req, res) => {
    res.json(`API PROYECTO ENFOCAT
    - /api/usuario
    - /api/comercio`)
})
app.use('/api/usuario', userController);
app.use('/api/comercio', comerceController);

const port = 3030
app.listen(port, () => console.log(`Express en puerto ${port}!`))
