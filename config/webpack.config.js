const path = require("path");
const MiniCssExtractPlugin = require('mini-css-extract-plugin');

module.exports = {
    
    entry: {
        index: "./src/rdg.js",
     
        
    },
    output: {
        path: path.resolve(__dirname, "../Scripts/reactGrid"),
        filename: "[name].js"
    },
    module: {
        rules: [
            {
                test: /\.(js|jsx|ts|tsx)$/,
                exclude: /node_modules/, //excludes node_modules folder from being transpiled by babel. We do this because it's a waste of resources to do so.
                use: [
                    {
                        loader: "babel-loader",
                        options: { presets: ["@babel/preset-flow", "@babel/preset-react", "@babel/preset-typescript"] },
                    },
                    {
                        loader: '@linaria/webpack5-loader',
                        //options: { sourceMap: process.env.NODE_ENV !== 'production' }
                        options: { sourceMap: true }
                    }
                ]
            },
            {
                test: /\.css$/,
                use: [
                    {
                        loader: MiniCssExtractPlugin.loader,
                        //options: {
                        //    //hmr: process.env.NODE_ENV !== 'production',
                        //    hmr: true,
                        //},
                    },
                    {
                        loader: 'css-loader',
                        options: {
                            sourceMap: true,
                        },
                    },
                ],
                //use: [
                //    'style-loader',
                //    'css-loader',
                //    {
                //        loader: 'postcss-loader',
                //        options: {
                //            postcssOptions: {
                //                plugins: ['postcss-nested']
                //            }
                //        }
                //    }
                //]
            }

        ]
    },
    plugins: [
        new MiniCssExtractPlugin({
            filename: 'react-grid.css',
        })
    ],
    resolve: {
        alias: {
            "react/jsx-dev-runtime": "react/jsx-dev-runtime.js",
            "react/jsx-runtime": "react/jsx-runtime.js"
        },
        extensions: ['.ts', '.js', '.jsx', '.tsx']
    }
}