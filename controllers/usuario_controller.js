const express = require('express');
const { autentica, autError } = require('./middleware');
const bcrypt = require('bcrypt');
const jsonwebtoken = require('jsonwebtoken');
const Config = require('./config');
const model = require('../models/index');

const Usuario = model.Usuario;
const { secretKey, expiredAfter } = Config;

const router = express.Router();

//FIND ALL USERS
router.get('/', (req, res) => {
    Usuario.findAll()
        .then(user => res.status(200).json({ ok: true, data: user }))
        .catch(err => res.status(400).json({ ok: false, data: err }))
})

//FIND A USER
router.get('/:id', (req, res) => {
    const { id } = req.params;
    Usuario.findOne({ where: { id: id } })
        .then(user => res.status(200).json({ ok: true, data: user }))
        .catch(err => res.status(400).json({ ok: false, data: err }))
})

//EDIT A USER
router.put('/edit/:id',(req,res) => {
    const { id } = req.params;
    Usuario.findOne({ where: { id: id } })
    .then(user => user.update(req.body))
        .then(() => res.status(200).json({ ok: true}))
        .catch(err => res.status(400).json({ ok: false, data: err }))
})

//LOGIN
router.post('/login', (req, res) => {
    const response = {};
    const { email, user, password } = req.body;
    //Checks if is by email or user, and sets the one that is given
    const emailOrUser = email === "" ? {nombre_usuario: user} : {email: email};
    
    if (!emailOrUser || !password) {
        return res.status(400).json({ ok: false, msg: "email or password not received" })
    }
    

    Usuario.findOne({ where: emailOrUser })
        .then((usuari) => {
            // bcrypt.compareSync(password, usuari.password)
            if (usuari && password === usuari.password) {
                return usuari;
            } else {
                throw "usuari/password invalids";
            }
        })
        .then(usuari => {
            response.token = jsonwebtoken.sign(
                {
                    expiredAt: new Date().getTime() + expiredAfter,
                    nombre_usuario: usuari.nombre_usuario,
                    id: usuari.id

                },
                secretKey
            );
            response.ok = true;
            res.json(response)
        })
        .catch(err => res.status(400).json({ ok: false, msg: err }))
});

//REGISTER A USER
router.post('/registro', function (req, res, next) {
    const hash = bcrypt.hashSync(req.body.password, 10);
    req.body.password = hash;
    Usuario.create(req.body)
        .then(item => res.json({ ok: true, data: item }))
        .catch((error) => res.json({ ok: false, error }))
});

module.exports = router;