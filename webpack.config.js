const path = require('path');

module.exports = {
    entry: './app/assets/javascript/controllers/application.js', // Adjust this path to your entry file
    output: {
        filename: 'bundle.js', // Output file name
        path: path.resolve(__dirname, 'app/assets/builds'), // Adjust this path as needed
    },
    mode: 'development', // Use 'production' for production builds
};
