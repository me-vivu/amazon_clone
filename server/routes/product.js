const express = require('express');
const productRouter = express.Router();
const auth = require('../middlewares/signInAuth');
const Product = require('../models/product');


//api/products?category=Essentials we use query for this
//api/products:category=Essentials we use params in request tag
productRouter.get('/api/products', auth , async(req, res) => {
    try {
        //console.log(req.query.category);
        const products = await Product.find({
            category:req.query.category
        });
        res.json(products);

    } catch (e) {
        res.status(500).json({error: e.message});
    }

});

productRouter.get('/api/products/search/:name', auth , async(req, res) => {
    try {
        //console.log(req.query.category);
        const products = await Product.find({
            name: {$regex: req.params.name, $options: "i"},
    
        });
        res.json(products);

    } catch (e) {
        res.status(500).json({error: e.message});
    }

});

module.exports = productRouter;