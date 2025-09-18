// babel.config.js
module.exports = (api) => {
  // Work even if Webpacker/Babel has already configured caching
  const env = (api && api.env) ? api.env() : process.env.BABEL_ENV || process.env.NODE_ENV;

  if (env === 'test') {
    // Jest/rails test: target current Node
    return {
      presets: [['@babel/preset-env', { targets: { node: 'current' } }]],
      plugins: []
    };
  }

  // Dev/Prod: let webpack handle modules; include polyfills via core-js@3 if you use them
  return {
    presets: [['@babel/preset-env', { modules: false, useBuiltIns: 'entry', corejs: 3 }]],
    plugins: []
  };
};
