module.exports = (sequelize, DataTypes) => {
    const Foto = sequelize.define('Foto', {
        idComercio: DataTypes.INTEGER,
        nombre_img: DataTypes.STRING
    }, { tableName: 'fotos', timestamps: false });

    return Foto;
};