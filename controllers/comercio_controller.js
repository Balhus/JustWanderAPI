const express = require('express');
const jsonwebtoken = require('jsonwebtoken');
const Config = require('./config');
const model = require('../models/index');

const Comercio = model.Comercio;
const router = express.Router();

//GET ALL COMERCE
router.get('/', (req, res) => {
    Comercio.findAll()
        .then(user => res.status(200).json({ ok: true, data: user }))
        .catch(err => res.status(400).json({ ok: false, data: err }))
})

//FIND A COMERCE
router.get('/:id', (req, res) => {
    const { id } = req.params;
    Comercio.findOne({ where: { id: id } })
        .then(user => res.status(200).json({ ok: true, data: user }))
        .catch(err => res.status(400).json({ ok: false, data: err }))
})

//INSERT NEW COMERCE

//DELETE AN COMERCE
router.get('/delete/:id', (req, res) => {
    const { id } = req.params;
    Comercio.destroy({ where: { id: id } })
        .then(user => res.status(200).json({ ok: true }))
        .catch(err => res.status(400).json({ ok: false, data: err }))
})

//FIND a COMERCE BY userId
router.get('/user/:id', (req, res) => {
    const { id } = req.params;
    Comercio.findOne({ where: { usuario_creador: id } })
        .then(user => res.status(200).json({ ok: true, data: user }))
        .catch(err => res.status(400).json({ ok: false, data: err }))
})


module.exports = router;