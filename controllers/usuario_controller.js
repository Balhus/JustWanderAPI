const express = require('express');
const { autentica, autError } = require('./middleware');
const bcrypt = require('bcrypt');
const jsonwebtoken = require('jsonwebtoken');
const Config = require('./config');
const model = require('../models/index');

const multer = require('multer');

const Usuario = model.Usuario;
const { secretKey, expiredAfter } = Config;

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
router.put('/edit', (req, res) => {
    upload(req, res, function (err) {
        if (err instanceof multer.MulterError) {
            return res.status(500).json(err)
        } else if (err) {
            return res.status(500).json(err)
        }

        let foto = null;
        if (!req.file) {
            // res.status(400).json({ ok: false, error: "dades incomplertes" });
            foto = req.body.foto;
        } else {
            foto = req.file.filename
        }
        const usuario = {
            nombre: req.body.nombre,
            apellidos: req.body.apellidos,
            email: req.body.email,
            nombre_usuario: req.body.nombre_usuario,
            password: req.body.password,
            puntuacion: req.body.puntuacion,
            feed_check: req.body.feed_check,
            ubicacion_check: req.body.ubicacion_check,
            activo: req.body.activo,
            foto_usuario: foto,
            rol: req.body.rol
        }

        const { id } = req.body;
        console.log(usuario, id)

        Usuario.findOne({ where: { id: id } })
            .then(user => user.update(usuario))
            .then(() => res.status(200).json({ ok: true }))
            .catch(err => res.status(400).json({ ok: false, data: err }))

    })

})

//LOGIN
router.post('/login', (req, res) => {
    const response = {};
    const { email, user, password } = req.body;
    //Checks if is by email or user, and sets the one that is given
    const emailOrUser = email === "" ? { nombre_usuario: user } : { email: email };

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
                    id: usuari.id,
                    rol: usuari.rol
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