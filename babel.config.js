module.exports = function (api) {
  api.cache(true);
  const env = api.env(); // 'development' | 'test' | 'production'

  const presets = [
    // Let webpack handle modules
    ['@babel/preset-env', { modules: false, useBuiltIns: 'entry', corejs: 3 }]
  ];

  // No custom plugins — keeps the build simple and avoids missing packages
  const plugins = [];

  // For tests, target current Node so jest/rails test is happy (optional)
  if (env === 'test') {
    return {
      presets: [['@babel/preset-env', { targets: { node: 'current' } }]],
      plugins
    };
  }

  return { presets, plugins };
};
