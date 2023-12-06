import con from "../config/config.js";

class CartController
{
    static getCartDataByUserId(req, res)
    {
        const query = `select * from cart where userId = ${req.params.id}`
        const data = con.query(query, (err, data) => {
            if(err)
            {
                console.error(err);
                return res.status(500).send("Internal Server Error");
            }
            return res.send(data)
        })
    }

    static getCartDataId(id) {
        return new Promise((resolve, reject) => {
            const selectQuery = `SELECT * FROM cart WHERE id = ${id}`;
            con.query(selectQuery, (err, data) => {
                if (err) {
                    console.error(err);
                    reject(err);
                } else {
                    resolve(data);
                }
            });
        });
    }

    static storeCartData(req, res)
    {
        const { itemId, userId, title, thumbnail, status, price, rating, quantity } = req.body;

        if (!itemId || !userId || !title || !thumbnail || !status || !price || !rating || !quantity) {
            return res.status(400).send('Missing required fields');
        }

        const createdAtMilliseconds = Date.now();
        const updatedAtMilliseconds = Date.now();
        const createdAtSeconds = Math.floor(createdAtMilliseconds / 1000);
        const updatedAtSeconds = Math.floor(updatedAtMilliseconds / 1000);

        const query = `INSERT INTO cart(itemId, userId, title, thumbnail, price, rating, status, quantity, created_at, updated_at) VALUE ( ?,?,?,?,?,?,?,?,FROM_UNIXTIME(?),FROM_UNIXTIME(?) )`
        const values = [itemId, userId, title, thumbnail, price, rating, status, quantity, createdAtSeconds, updatedAtSeconds];

        con.query(query, values, (err, data) => {
            if (err) {
                console.error(err);
                return res.status(500).send("Internal Server Error");
            }
            res.send(data);
        });
    }

    static updateCartQuantity(req, res) {
        const { id, quantity } = req.body;
        const updateQuery = `UPDATE cart SET quantity = ${quantity} WHERE id = ${id}`;

        con.query(updateQuery, (err, _) => {
            if (err) {
                console.error(err);
                return res.status(500).send("Internal Server Error");
            }

            CartController.getCartDataId(id)
                .then((cartData) => {
                    res.send(cartData);
                })
                .catch((error) => {
                    console.error(error);
                    return res.status(500).send("Internal Server Error");
                });
        });
    }

    static removeCartProduct(req, res)
    {
        const query = `DELETE FROM cart WHERE id = ${req.params.id}`
        const data = con.query(query, (err, data) => {
            if(err)
            {
                console.error(err)
                return res.status(500).send("Internal Server Error");
            }
            res.send(data);
        })
    }
}

export default CartController