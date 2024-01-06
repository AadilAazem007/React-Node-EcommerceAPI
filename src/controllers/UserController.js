import con from "../config/config.js";

class UserController {

    static async saveUserData(req, res)
    {
        const { name, email, password, encrypt_password, city, mobile } = req.body;
        const createdAtMilliseconds = Date.now();
        const updatedAtMilliseconds = Date.now();
        const createdAtSeconds = Math.floor(createdAtMilliseconds / 1000);
        const updatedAtSeconds = Math.floor(updatedAtMilliseconds / 1000);

        const checkUser = await UserController.checkUser(email, mobile)
        const checkUserCount = checkUser[0].count
        
        if(checkUserCount > 0)
        {
            console.log("User Already exists")
            res.send("User Already exists");
        }
        else
        {
            const query = "INSERT INTO users (name, email, password, encrypt_password, city, mobile, updated_at, created_at) VALUES (?,?,?,?,?,?,FROM_UNIXTIME(?),FROM_UNIXTIME(?))"
            const values = [name, email, password, encrypt_password, city, mobile, createdAtSeconds, updatedAtSeconds];

            con.query(query, values, (err, data) => {
                if (err) {
                    console.error(err);
                    return res.status(500).send("Internal Server Error");
                }
                res.send(data); 
            });
        }
    }

    static checkUser(email, mobile)
    {
        return new Promise((resolve, reject) => {
            const query = `SELECT COUNT(*) as count FROM users WHERE email = '${email}' AND mobile = '${mobile}'`
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

export default UserController