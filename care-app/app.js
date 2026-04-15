const http = require('http');

const PORT = process.env.PORT || 3000;
const ENV = process.env.NODE_ENV || 'development';

const server = http.createServer((req, res) => {
    if (req.url === '/health') {
        res.writeHead(200, {'Content-Type': 'application/json'});
        res.end(JSON.stringify({
            status: 'healthy',
            app: 'Talium-tech Care App',
            version: '1.0.0',
            environment: ENV
        }));
    } else {
        res.writeHead(200, {'Content-Type': 'application/json'});
        res.end(JSON.stringify({
            message: 'Welcome to Talium-tech Care App',
            version: '1.0.0'
        }));
    }
});

server.listen(PORT, () => {
    console.log(`Talium-tech running on port ${PORT} in ${ENV} mode`);
});
