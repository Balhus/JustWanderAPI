module.exports = (sequelize, DataTypes) => {
    const FiltroComercio = sequelize.define('FiltroComercio', {
        id_comercio: DataTypes.INTEGER,
        id_filtro: DataTypes.INTEGER
    }, { tableName: 'filtros_comercios', timestamps: false });

    return FiltroComercio;
};