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

//DELETE A Filter
router.get('/delete/:id', (req, res) => {
    const { id } = req.params;
    Filtro.destroy({ where: { id: id } })
        .then(user => res.status(200).json({ ok: true }))
        .catch(err => res.status(400).json({ ok: false, data: err }))
})

//CREATE A Filter
router.post('/new', function (req, res, next) {

    Filtro.create(req.body)
        .then(item => res.json({ ok: true, data: item }))
        .catch((error) => res.json({ ok: false, error }))
});

//EDIT A Filter
router.put('/edit/:id', (req, res) => {
    const { id } = req.params;
    Filtro.findOne({ where: { id: id } })
        .then(user => user.update(req.body))
        .then(() => res.status(200).json({ ok: true }))
        .catch(err => res.status(400).json({ ok: false, data: err }))
})


module.exports = router;