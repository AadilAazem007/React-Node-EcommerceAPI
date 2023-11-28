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

    static storeCartData(req, res)
    {
        const { itemId, userId, title, thumbnail, status, price, rating } = req.body;

        if (!itemId || !userId || !title || !thumbnail || !status || !price || !rating) {
            return res.status(400).send('Missing required fields');
        }

        const createdAtMilliseconds = Date.now();
        const updatedAtMilliseconds = Date.now();
        const createdAtSeconds = Math.floor(createdAtMilliseconds / 1000);
        const updatedAtSeconds = Math.floor(updatedAtMilliseconds / 1000);

        const query = `INSERT INTO cart(itemId, userId, title, thumbnail, price, rating, status, created_at, updated_at) VALUE ( ?,?,?,?,?,?,?,FROM_UNIXTIME(?),FROM_UNIXTIME(?) )`
        const values = [itemId, userId, title, thumbnail, price, rating, status, createdAtSeconds, updatedAtSeconds];

        con.query(query, values, (err, data) => {
            if (err) {
                console.error(err);
                return res.status(500).send("Internal Server Error");
            }
            res.send(data);
        });
    }
}

export default CartController