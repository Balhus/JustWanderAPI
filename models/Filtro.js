module.exports = (sequelize, DataTypes) => {
    const Filtro = sequelize.define('Filtro', {
        nombre: DataTypes.STRING
    }, { tableName: 'filtros', timestamps: false });

    return Filtro;
};