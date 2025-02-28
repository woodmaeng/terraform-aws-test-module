exports.handler = async (event) => {
    const name = event.name;
    const message = name ? `Hello, ${name}` : 'Hello, World!';
    
    const response = {
        statusCode: 200,
        body: JSON.stringify(message),
    };
    return response;
};