const AWS = require("aws-sdk");
const dynamoDb = new AWS.DynamoDB.DocumentClient();

const USERS_TABLE = "User"; 

exports.findUserByEmail = async (email) => {
    const params = {
        TableName: USERS_TABLE,
        FilterExpression: "#email = :email",
        ExpressionAttributeNames: { "#email": "email" },
        ExpressionAttributeValues: { ":email": email },
    };

    const result = await dynamoDb.scan(params).promise();
    return result.Items[0] || null;
};
