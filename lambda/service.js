const { findUserByEmail } = require("./repository");
const { generateToken } = require("./jwt");

exports.loginService = async ({ email, password }) => {
    if (!email || !password) {
        const err = new Error("Email y contraseña son requeridos");
        err.statusCode = 400;
        throw err;
    }

    const user = await findUserByEmail(email);

    // Validación en texto plano (sin bcrypt)
    if (!user || password !== user.password) {
        const err = new Error("Credenciales inválidas");
        err.statusCode = 401;
        throw err;
    }

    const token = generateToken({ id: user.uuid, email: user.email });

    return {
        message: "Login exitoso",
        token,
    };
};
