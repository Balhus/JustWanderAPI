module.exports = (sequelize, DataTypes) => {
    const Valoracion = sequelize.define('Valoracion', {
        valoracion: DataTypes.INTEGER,
        idUsuario: DataTypes.INTEGER,
        idComercio: DataTypes.INTEGER,
        votado: DataTypes.BOOLEAN
    }, { tableName: 'valoraciones', timestamps: false });

    return Valoracion;
};