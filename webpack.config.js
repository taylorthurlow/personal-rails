const ExtractTextPlugin = require("extract-text-webpack-plugin");
const path = require("path");
const glob = require("glob-all");
const PurgecssPlugin = require("purgecss-webpack-plugin");

/**
 * Custom PurgeCSS Extractor
 * https://github.com/FullHuman/purgecss
 * https://github.com/FullHuman/purgecss-webpack-plugin
 */
class TailwindExtractor {
  static extract(content) {
    return content.match(/[A-z0-9-:\/]+/g);
  }
}

module.exports = {
  entry: "./index.js",
  output: {
    path: path.resolve(__dirname, "dist"),
    filename: "styles.css"
  },
  module: {
    rules: [
      {
        test: /\.css$/,
        use: ExtractTextPlugin.extract({
          fallback: "style-loader",
          use: [{ loader: "css-loader", options: { importLoaders: 1 } }, "postcss-loader"]
        })
      }
    ]
  },
  plugins: [
    new ExtractTextPlugin("styles.css"),
    new PurgecssPlugin({
      whitelist: ['body'],
      paths: glob.sync([
        path.join(__dirname, '../../app/views/**/*.erb')
      ]),
      extractors: [
        {
          extractor: TailwindExtractor,
          extensions: ["html", "js", "php"]
        }
      ]
    })
  ]
};