const express = require('express');
const model = require('../models/index');
const multer = require('multer');

const Comercio = model.Comercio;
const Filtro = model.Filtro;

const router = express.Router();

//GET ALL FILTERS
router.get('/', (req, res) => {
    Filtro.findAll()
        .then(x => res.status(200).json({ ok: true, data: x }))
        .catch(err => res.status(400).json({ ok: false, data: err }))
})

module.exports = router;