const { loginController } = require("./controller");

exports.handler = async (event) => {
    return await loginController(event);
};
