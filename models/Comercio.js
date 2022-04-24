module.exports = (sequelize, DataTypes) => {
    const Comercio = sequelize.define('Comercio', {
        nombre: DataTypes.STRING,
        descripcion:  DataTypes.STRING, 
        direccion: DataTypes.STRING,
        longitud: DataTypes.STRING,
        latitud: DataTypes.STRING,
        usuario_creador: DataTypes.INTEGER,
        dueño: DataTypes.INTEGER,
        valoracion: DataTypes.STRING,
        revisado: DataTypes.INTEGER
    }, { tableName: 'comercios', timestamps: false });

    return Comercio;
};