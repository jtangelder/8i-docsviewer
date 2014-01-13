var DirectoryDescriptionFilePlugin = require("enhanced-resolve/lib/DirectoryDescriptionFilePlugin");

module.exports = {
  module: {
    loaders: [
      { test: /\.coffee/, loader: "jsx-loader!coffee-loader" },
      { test: /\.jsx?$/, loader: "jsx-loader" },

      { test: /\.css/, loader: "url-loader?limit=10000!style-loader!css-loader" },

      { test: /\.gif/, loader: "url-loader?limit=10000&minetype=image/gif" },
      { test: /\.jpg/, loader: "url-loader?limit=10000&minetype=image/jpg" },
      { test: /\.png/, loader: "url-loader?limit=10000&minetype=image/png" },
      ,
      { test: /\.(woff|eot|ttf|svg)/, loader: "url-loader" }
    ]
  },

  resolve: {
    modulesDirectories: ["./node_modules", "./bower_components"]
  },

  amd: { Zepto: true },

  plugins: [
    function() {
      this.resolvers.normal.apply(new DirectoryDescriptionFilePlugin("component.json", ["main"]));
      this.resolvers.normal.apply(new DirectoryDescriptionFilePlugin("bower.json", ["main"]));
    }
  ]
};