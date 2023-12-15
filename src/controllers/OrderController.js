import con from "../config/config.js";

class OrderController {
    static async saveOrder(req, res)
    {
        const { userId, orderId, price, status } = req.body

        const createdAtMilliseconds = Date.now();
        const updatedAtMilliseconds = Date.now();
        const createdAtSeconds = Math.floor(createdAtMilliseconds / 1000);
        const updatedAtSeconds = Math.floor(updatedAtMilliseconds / 1000);

        try{
            const orderCount = await OrderController.checkOrderId(orderId)
            if(orderCount[0].count === 0)
            {
                const query = "INSERT INTO orders (userId, orderId, price, status, created_at, updated_at) VALUE(?,?,?,?,FROM_UNIXTIME(?),FROM_UNIXTIME(?))"
                const value = [userId, orderId, price, status, createdAtSeconds, updatedAtSeconds]

                con.query(query, value, (err, data) => {
                    if (err) {
                        console.error(err);
                        return res.status(500).send("Internal Server Error");
                    }
                    res.send(data);
                }) 
            }
            else
            {
                console.error('User Address is already inserted')
                res.send("User Address is already inserted");
            }
        }
        catch(err)
        {
            console.error(err);
            res.status(500).send("Internal Server Error")
        }
    }

    static checkOrderId(orderId){
        return new Promise((resolve, reject) => {
            const query = `SELECT COUNT(orderId) as count FROM orders WHERE orderId='${orderId}'`
            con.query(query, (err, data) => {
                if(err)
                {
                    console.error(err);
                    reject(err)
                }
                resolve(data)
            })
        })
    }
}

export default OrderController