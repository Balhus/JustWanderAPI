module.exports = (sequelize, DataTypes) => {
    const Comercio = sequelize.define('Comercio', {
        nombre: DataTypes.STRING,
        descripcion: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        direccion: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        longitud: DataTypes.STRING,
        latitud: DataTypes.STRING,

        usuario_creador: DataTypes.INTEGER,
        dueño: DataTypes.INTEGER,
        valoracion: {
            type: DataTypes.STRING,
            allowNull: true,
        },
        revisado: DataTypes.INTEGER
    }, { tableName: 'comercios', timestamps: false });

    return Comercio;
};