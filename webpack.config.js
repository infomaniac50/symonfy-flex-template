/* eslint-env node */

// webpack.config.js
var Encore = require('@symfony/webpack-encore');

Encore
    // directory where all compiled assets will be stored
    .setOutputPath('www/public/build/')

    // what's the public path to this directory (relative to your project's document root dir)
    .setPublicPath('/build')

    // empty the outputPath dir before each build
    .cleanupOutputBeforeBuild()

    // will output as public/build/app.js
    .addEntry('app', './www/assets/js/main.js')

    // will output as public/build/global.css
    .addStyleEntry('global', './www/assets/scss/global.scss')
    .addStyleEntry('login', './www/assets/scss/login.scss')

    // allow sass/scss files to be processed
    .enableSassLoader()

    .autoProvideVariables({
      $: 'jquery',
      jQuery: 'jquery',
      'window.jQuery': 'jquery',
      Popper: ['popper.js', 'default'],
    })

    .enableSourceMaps(!Encore.isProduction())

    // create hashed filenames (e.g. app.abc123.css)
    // .enableVersioning()
;

// export the final configuration
module.exports = Encore.getWebpackConfig();
