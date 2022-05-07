const express = require('express');
const model = require('../models/index');
const multer = require('multer');
const { Sequelize } = require('../models/index');

const Comercio = model.Comercio;
const Foto = model.Foto;
const FiltroComercio = model.FiltroComercio;
const Filtro = model.Filtro;
const Valoracion = model.Valoracion;
const Usuario = model.Usuario;

const router = express.Router();

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'uploads')
    },
    filename: function (req, file, cb) {
        cb(null, Date.now() + '-' + file.originalname)
    }
})

const upload = multer({ storage: storage }).array('files');

//GET ALL COMMERCE
router.get('/', (req, res) => {
    Comercio.findAll({
        order: [
            ['id', 'DESC'],
        ]
    })
        .then(x => res.status(200).json({ ok: true, data: x }))
        .catch(err => res.status(400).json({ ok: false, data: err }))
})

//FIND A COMMERCE
router.get('/:id', (req, res) => {
    const { id } = req.params;
    Comercio.findOne({ where: { id: id } })
        .then(x => res.status(200).json({ ok: true, data: x }))
        .catch(err => res.status(400).json({ ok: false, data: err }))
})

/*GETS ALL THE FILTERS OF A COMMERCE
*Return: returns the filters, the full registerr, not just the id
*/
router.get('/filtrosComercio/:id', (req, res) => {
    const { id } = req.params;
    FiltroComercio.findAll({ where: { id_comercio: id } })
        .then(x => {
            const idFiltros = x.map((fil) => {
                return fil.id_filtro
            })

            Filtro.findAll({ where: { id: idFiltros } })
                .then((y) => res.status(200).json({ ok: true, data: y }))
        })
        .catch(err => res.status(400).json({ ok: false, data: err }))
})

/*GETS ALL THE COMMERCES WITH THE GIVEN FILTERS
*id: array of id's
*Return: returns the commerces, the full register, not just the id
*/
router.post('/filtrar', (req, res) => {
    const { id } = req.body;
    console.log(id)
    FiltroComercio.findAll({ where: { id_filtro: id },
    group:'id_comercio',
    having: Sequelize.literal(`count(*) = ${id.length}`), })
        .then(x => {
            const idComercios = x.map((come) => {
                return come.id_comercio
            })

            Comercio.findAll({ where: { id: idComercios } })
                .then((y) => res.status(200).json({ ok: true, data: y }))
        })
        .catch(err => res.status(400).json({ ok: false, data: err }))
})


//INSERT NEW COMMERCE
router.post('/new', (req, res, next) => {
    console.log(req.body)
    upload(req, res, function (err) {
        if (err instanceof multer.MulterError) {
            return res.status(500).json(err)
        } else if (err) {
            return res.status(500).json(err)
        }

        if (!req.files) {
            res.status(400).json({ ok: false, error: "Missing file(foto)" });
        } else {
            const comercio = {
                nombre: req.body.name,
                descripcion: req.body.description,
                direccion: req.body.address,
                longitud: req.body.longitude,
                latitud: req.body.latitude,
                usuario_creador: req.body.idUser,
                revisado: 0
            }

            let idComercioCreado = 0;

            Comercio.create(comercio)
                .then(comerc => {
                    idComercioCreado = comerc.dataValues.id;

                    let fotosName = req.files;
                    let fotos = []
                    for (let i = 0; i < fotosName.length; i++) {
                        fotos.push(
                            {
                                idComercio: idComercioCreado,
                                nombre_img: fotosName[i].filename
                            }
                        )
                    }
                    Foto.bulkCreate(fotos)
                    //.then(a => res.json({ ok: true, foto: a }))
                    //.catch(e => res.json({ ok: false, error: e, from: "Foto.BulkCreate" }));

                })
                .then(() => {
                    let filtersFromBody = req.body.filter
                    let filters = []

                    for (let i = 0; i < filtersFromBody.length; i++) {
                        filters.push(
                            {
                                id_comercio: idComercioCreado,
                                id_filtro: filtersFromBody[i]
                            }
                        )
                    }

                    console.log(filters)
                    //Crear filtro create
                    FiltroComercio.bulkCreate(filters)
                    //.then(a => res.json({ ok: true, filtro: a }))
                    //.catch(e => res.json({ ok: false, error: e, from: "FiltroComercio.BulkCreate" }));
                })
                .then(a => res.json({ ok: true, data: a }))
                .catch(err => res.status(400).json({ ok: false, data: err }))
        }
    })
})


//DELETE A COMMERCE
router.get('/delete/:id', (req, res) => {
    const { id } = req.params;
    Comercio.destroy({ where: { id: id } })
        .then(user => res.status(200).json({ ok: true }))
        .catch(err => res.status(400).json({ ok: false, data: err }))
})

//FIND a COMMERCE BY userId
router.get('/user/:id', (req, res) => {
    const { id } = req.params;
    console.log("user: ", id);
    Comercio.findAll({ where: { usuario_creador: id } })
        .then(user => { res.status(200).json({ ok: true, data: user }) })
        .catch(err => res.status(400).json({ ok: false, data: err }))
})

//RATE a commerce
router.post('/valorar', (req, res) => {
    let numVals = 0;
    let total = 0;
    let idUsuario = 0;
    let newValoracion = 0;

    Valoracion.create(req.body)
        .then(response => {
            //Update puntuacion user
            Valoracion.findAll({ where: { idComercio: req.body.idComercio } })
                .then(resp => {
                    numVals = resp.length;
                    Array.from(resp).forEach((el) => {
                        total += el.valoracion;
                    })
                    console.log(total)
                    Comercio.findOne({ where: { id: req.body.idComercio } })
                        .then(com => {
                            //Getting the id of the creator of the user
                            idUsuario = com.usuario_creador;
                            //Valoracion logic

                            if (com.puntuacion === null) {
                                newValoracion = req.body.valoracion;
                            } else {
                                newValoracion = (total) / numVals;
                            }
                            com.update({ valoracion: newValoracion })

                        })
                        .then(() => {
                            Usuario.findOne({ where: { id: idUsuario } })
                                .then(user => {
                                    let newPuntuacion = 0;
                                    console.log(req.body.valoracion)
                                    if (user.puntuacion === null) {
                                        newPuntuacion += parseInt(req.body.valoracion);
                                    } else {
                                        newPuntuacion = user.puntuacion + parseInt(req.body.valoracion);
                                    }
                                    user.update({ puntuacion: newPuntuacion })
                                })
                        })
                        .then(x => res.status(200).json({ ok: true, data: newValoracion }))
                        .catch(err => res.status(400).json({ ok: false, data: err }))
                })

            // .then(() => res.status(200).json({ ok: true }))
            //.catch(err => res.status(400).json({ ok: false, data: err }))
            //Get user, and update
        })
    // .then(item => res.json({ ok: true, data: item }))
    // .catch((error) => res.json({ ok: false, error }))
})

//get the valoration of an user of a commerce
router.post('/valoracionUsuario', (req, res) => {
    Valoracion.findOne({ where: Sequelize.and({ idComercio: req.body.idComercio }, { idUsuario: req.body.idUsuario }) })
        .then(x => res.status(200).json({ ok: true, data: x }))
        .catch(err => res.status(400).json({ ok: false, data: err }))
})

//Get the number of valorations of a commerce
router.post('/valoracion/all', (req, res) => {
    let numRegisters = 0;

    Valoracion.findAll({ where: { idComercio: req.body.idComercio } })
        .then(resp => {
            console.log(resp.length);
            numRegisters = resp.length
            res.status(200).json({ ok: true, numVotos: numRegisters })
        })
        .catch(err => res.status(400).json({ ok: false, data: err }))
})



module.exports = router;