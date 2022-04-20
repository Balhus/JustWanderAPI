const express = require('express');
const jsonwebtoken = require('jsonwebtoken');
const Config = require('./config');
const model = require('../models/index');
const multer = require('multer');

const Comercio = model.Comercio;
const Foto = model.Foto;
const FiltroComercio = model.FiltroComercio;

const router = express.Router();

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'uploads')
    },
    filename: function (req, file, cb) {
        cb(null, Date.now() + '-' + file.originalname)
    }
})

const upload = multer({ storage: storage }).single('file');

//GET ALL COMMERCE
router.get('/', (req, res) => {
    Comercio.findAll()
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

//GETS ALL THE FILTERS OF A COMMERCE
router.get('/filtrosComercio/:id', (req, res) => {
    const { id } = req.params;
    FiltroComercio.findAll({ where: { id_comercio: id } })
        .then(x => res.status(200).json({ ok: true, data: x }))
        .catch(err => res.status(400).json({ ok: false, data: err }))
})

//GETS ALL THE COMMERCES WITH THE GIVEN FILTER
router.get('/filtrar/:id', (req, res) => {
    const { id } = req.params;
    FiltroComercio.findAll({ where: { id_filtro: id } })
        .then(x => res.status(200).json({ ok: true, data: x }))
        .catch(err => res.status(400).json({ ok: false, data: err }))
})


//INSERT NEW COMMERCE
router.get('/new', (req, res) => {

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
    Comercio.create({ comercio })
        .then(comerc => {
            idComercioCreado = comerc.id;
            upload(req, res, function (err) {
                if (err instanceof multer.MulterError) {
                    return res.status(500).json(err)
                } else if (err) {
                    return res.status(500).json(err)
                }

                if (!req.file) {
                    res.status(400).json({ ok: false, error: "Missing file(foto)" });
                } else {
                    const fotos = {
                        idComercio: idComercioCreado,
                        nombre_img: req.file.filename
                    }

                    Foto.create(fotos)
                        .then(a => res.json({ ok: true, foto: a }))
                        .catch(e => res.json({ ok: false, error: e }));
                }
            })
        })
        .then(() => {
            let filters=[]
            filters = (req.body.filter).map(el => {
                return (
                    {
                        id_comercio: idComercioCreado,
                        id_filtro: el.id 
                    }
                );
            });
            
            //Crear filtro create
            FiltroComercio.bulkCreate(filters)
                        .then(a => res.json({ ok: true, filtro: a }))
                        .catch(e => res.json({ ok: false, error: e }));
        })
        .catch(err => res.status(400).json({ ok: false, data: err }))
})


//DELETE AN COMMERCE
router.get('/delete/:id', (req, res) => {
    const { id } = req.params;
    Comercio.destroy({ where: { id: id } })
        .then(user => res.status(200).json({ ok: true }))
        .catch(err => res.status(400).json({ ok: false, data: err }))
})

//FIND a COMMERCE BY userId
router.get('/user/:id', (req, res) => {
    const { id } = req.params;
    Comercio.findOne({ where: { usuario_creador: id } })
        .then(user => res.status(200).json({ ok: true, data: user }))
        .catch(err => res.status(400).json({ ok: false, data: err }))
})


module.exports = router;