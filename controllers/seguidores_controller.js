const express = require('express');
const model = require('../models/index');
const multer = require('multer');
const { Sequelize } = require('../models/index');

const Seguidores = model.Seguidores;
const Usuario = model.Usuario;

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
    Seguidores.findAll({ where: { id_usuario_seguido: id } })
        .then(x => {
            const idFollowers = x.map((come) => {
                return come.id_seguidor
            })
            Usuario.findAll({ where: { id: idFollowers } })
                .then((y) => res.status(200).json({ ok: true, data: y }))

        })
        .catch(err => res.status(400).json({ ok: false, data: err }))
})


//DELETE A FOLLOW
router.post('/delete', (req, res) => {
    const { id_usuario_seguido, id_seguidor } = req.body;
    console.log(id_seguidor, id_usuario_seguido)
    Seguidores.destroy({ where: Sequelize.and({ id_usuario_seguido: id_usuario_seguido }, { id_seguidor: id_seguidor }) })
        .then(user => res.status(200).json({ ok: true }))
        .catch(err => res.status(400).json({ ok: false, data: err }))
})

//CREATE A FOLLOW
router.post('/new', function (req, res, next) {

    Seguidores.create(req.body)
        .then(item => res.json({ ok: true, data: item }))
        .catch((error) => res.json({ ok: false, error }))
});

module.exports = router;