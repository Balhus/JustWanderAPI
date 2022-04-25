const express = require('express');
const model = require('../models/index');
const multer = require('multer');

const Seguidores = model.Seguidores;

const router = express.Router();



//GET ALL FOLLOWERS
router.get('/', (req, res) => {
        Seguidores.findAll()
        .then(x => res.status(200).json({ ok: true, data: x }))
        .catch(err => res.status(400).json({ ok: false, data: err }))
})


//USER´S FOLLOWERS
router.get('/:id', (req, res) => {
    const { id } = req.params;
    seguidores.findOne({ where: { id_usuario_seguido: id } })
        .then(x => res.status(200).json({ ok: true, data: x }))
        .catch(err => res.status(400).json({ ok: false, data: err }))
})


//DELETE A FOLLOW
router.get('/delete/:id', (req, res) => {
    const { id } = req.params;
    Seguidores.destroy({ where: { id: id } })
        .then(user => res.status(200).json({ ok: true }))
        .catch(err => res.status(400).json({ ok: false, data: err }))
})

//CREATE A FOLLOW
router.post('/seguidor', function (req, res, next) {
   
    Seguidores.create(req.body)
        .then(item => res.json({ ok: true, data: item }))
        .catch((error) => res.json({ ok: false, error }))
});

module.exports = router;