const { JWT_SECRET } = require("./config");

jwt.verify(token, JWT_SECRET);
