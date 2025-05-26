const jwt = require("jsonwebtoken");

exports.generateToken = (payload) => {
    const secret = process.env.JWT_SECRET || "i3876538~i$5";
    return jwt.sign(payload, secret, { expiresIn: "2h" });
};
