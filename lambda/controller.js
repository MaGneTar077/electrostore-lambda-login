const { loginService } = require("./service");
const { response } = require("./utils/response");

exports.loginController = async (event) => {
    try {
        const body = JSON.parse(event.body);
        const result = await loginService(body);
        return response(200, result);
    } catch (err) {
        console.error("Login error:", err.message);
        return response(err.statusCode || 500, { message: err.message || "Error interno" });
    }
};
