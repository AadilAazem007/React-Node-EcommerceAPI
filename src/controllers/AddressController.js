import con from "../config/config.js";
 class AddressController{
    static async saveUserAddres(req, res)
    {
        const { userId, firstAddress, secondAddress } = req.body
        const address = [firstAddress,secondAddress]
        try{
            const addressCount = AddressController.getUserAddressCount(userId)
            addressCount.then(rows => {
              if (rows.length > 0) {
                    const countValue = rows[0].count;
                    if(countValue < 1)
                    {
                        for(let i=0; i<address.length; i++)
                        {
                            const query = 'INSERT INTO addresses (userId, address) VALUE (?, ?)'
                            const values = [userId, address[i]]

                            new Promise((resolve, reject) => {
                                con.query(query, values, (err, data) => {
                                    if (err) {
                                        console.error(err);
                                        reject(err)
                                    }
                                    else{
                                        resolve(data)
                                    }
                                });
                            })
                        }
                        res.status(200).send("Addresses added successfully");
                    }
                    else{
                        console.error('User Address is already inserted')
                    }
                }
            }).catch(error => {
                console.error(error);
            });

            
        }catch(err){
            console.error(err);
            res.status(500).send("Internal Server Error")
        }
    }
    
    static getUserAddress (req, res)
    {
        const query = `SELECT address FROM addresses WHERE userId = ${req.params.userId}`
        const data = con.query(query, (err, data) => {
            if(err)
            {
                console.error(err);
                return res.status(500).send("Internal Server Error");
            }
            res.send(data);
        })
    }

    static getUserAddressCount (id)
    {
        return new Promise((resolve, reject) => {
            const query = `SELECT COUNT(*) as count FROM addresses WHERE userId = ${id}`
            const data = con.query(query, (err, data) => {
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


 export default AddressController