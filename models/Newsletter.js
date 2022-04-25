module.exports = (sequelize, DataTypes) => {
    const Newsletter = sequelize.define('Newsletter', {
        id_usuario: DataTypes.INTEGER,
        id_filtro: DataTypes.INTEGER
    }, { tableName: 'newsletter', timestamps: false});
    
    return Newsletter;
};