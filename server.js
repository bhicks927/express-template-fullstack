const express = require('express');
const exphbs = require('express-handlebars'); // Template Engine
const path = require('path');
const sequelize = require('./config/connection');
const routes = require('./controllers');
const hbs = exphbs.create({});
const PORT = process.env.PORT || 3001;
const app = express();

// View engine setup
app.engine('handlebars', hbs.engine);
app.set('view engine', 'handlebars');

// Middleware
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname, 'public'))); // Will attempt to serve static files from public directory if no route is matched

// Routes
app.use(routes);

sequelize.sync({ force: false }).then(() => {
  app.listen(PORT, () => console.log(`Server listening on port ${PORT}`));
})