module.exports = (sequelize, DataTypes) => {
    const Usuario = sequelize.define('Usuario', {
      nombre: DataTypes.STRING,
      apellidos: DataTypes.STRING,
      email: {
        type: DataTypes.STRING,
        allowNull: false,
      },
      nombre_usuario: DataTypes.STRING,
      password: {
        type: DataTypes.STRING,
        allowNull: false,
      },
      puntuacion: DataTypes.INTEGER,
      feed_check: DataTypes.BOOLEAN,
      ubicacion_check: DataTypes.BOOLEAN,
      
    }, { tableName: 'usuarios', timestamps: false});
    
    return Usuario;
  };