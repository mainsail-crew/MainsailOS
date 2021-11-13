const path = require('path');

module.exports = function(context, options) {
  return {
    name: 'docusaurus-plugin-image-zoom',

    getClientModules(options) {
      return [path.resolve(__dirname, './zoom')];
    },
  };
};