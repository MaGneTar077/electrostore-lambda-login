exports.response = (statusCode, body) => {
    return {
    statusCode,
    body: JSON.stringify(body),
    };
};
