module.exports = (sequelize, DataTypes) => {
    const Seguidores = sequelize.define('Seguidores', {
        id_usuario_seguido: DataTypes.INTEGER,
        id_seguidor: DataTypes.INTEGER
    }, { tableName: 'seguidores', timestamps: false});
    
    return Seguidores;
};