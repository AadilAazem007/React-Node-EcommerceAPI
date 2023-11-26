import con from "../config/config.js";

class ProductController {
    
    static getProductList(req, res)
    {
        const query = "SELECT * FROM products"
        const data = con.query(query, (err, data) => {
            if(err)
            {
                console.error(err);
                return res.status(500).send("Internal Server Error");
            }
             res.send(data);
        })
    }

    static getSingleProduct(req, res)
    {
        const query = `SELECT * FROM products WHERE id='${req.params.id}'`
        const data = con.query(query, (err, data) => {
            if(err)
            {
                console.log(err)
                return res.status(500).send("Internal Server Error");
            }
            res.send(data)
        })
    }

    static getCategoryList(req, res)
    {
        const query = "SELECT category FROM products GROUP BY category"
        const data = con.query(query, (err, data) => {
            if(err)
            {
                console.error(err);
                return res.status(500).send("Internal Server Error");
            }
            res.send(data);
        })
    }

    static getSingleCategoryData(req, res)
    {
        const query = `SELECT * FROM products WHERE category = '${req.params.category}'`
        const data = con.query(query, (err, data) => {
            if(err)
            {
                console.error(err);
                return res.status(500).send("Internal Server Error");
            }
            res.send(data);
        })
    }

    static getBrandList(req, res)
    {
        const query = "SELECT brand FROM products GROUP BY brand"
        const data = con.query(query, (err, data) => {
            if(err)
            {
                console.error(err);
                return res.status(500).send("Internal Server Error");
            }
            res.send(data);
        })
    }
    
    static getSingleBrandData(req, res)
    {
        const query = `SELECT * FROM products WHERE brand = '${req.params.brand}'`
        const data = con.query(query, (err, data) => {
            if(err)
            {
                console.error(err);
                return res.status(500).send("Internal Server Error");
            }
            res.send(data);
        })
    }
}

export default ProductController