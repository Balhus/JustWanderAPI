const express = require('express');
const model = require('../models/index');
const multer = require('multer');

const Newsletter = model.Newsletter;
const Usuarios = model.Usuario;
const router = express.Router();


router.get('/', (req, res) => {
    Newsletter.findAll()
    .then(x => res.status(200).json({ ok: true, data: x }))
    .catch(err => res.status(400).json({ ok: false, data: err }))
})


//filter NEW USER (EMAIL AND ID USER)

router.post('/filter', (req, res) => {
    const { email } = req.body;

    Usuarios.findOne({ where: { email: email } })
        .then(x => {
            Newsletter.findAll({where : {id: x.id}}) 
            .then(y => 
             res.status(200).json({ ok: true, data: y }) )
        })
        .catch(err => res.status(400).json({ ok: false, data: err }))
})






module.exports = router;