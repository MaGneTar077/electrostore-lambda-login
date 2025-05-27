const { JWT_SECRET } = require("./config");

exports.generateToken = (payload) => {
    return jwt.sign(payload, JWT_SECRET, { expiresIn: "2h" });
};
