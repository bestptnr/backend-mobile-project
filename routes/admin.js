const express = require("express");
const router = express.Router();
var mysql = require("mysql");

var dbConn = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "food",
    multipleStatements: true
});
dbConn.connect()

// อาจจะส่งเป็นสองส่วนคือ recipes กับ ตัวของส่วนผสมเข้าไปที่ตาราง recipes_ingredient ตัวอย่างข้อมุลที่ถุกเพิ่มถ้ากดเพิ่ม
// {
//     "data": [
//         {
//             "recipe_name": "แกงเนื้อ",
//             "detail": "สำหรับคนชอบกินเนื้อวัว ขอนำเสนอเมนูแกงเนื้อ สูตรนี้ใส่เนื้อวัวหั่นชิ้นต้มกับน้ำพริกแกงกะทิจนเปื่อยนุ่ม ใส่มะเขือเปราะกับมะเขือพวง และใบโหระพา",
//             "image": "https://s359.thaibuffer.com/pagebuilder/66af9d1f-df67-46cd-a102-fa9df11d9fce.jpg",
//             "step": "เทหางกะทิลงไปในหม้อ ใส่เนื้อวัวลงไปคนให้เข้ากัน เคี่ยวจนเริ่มเปื่อย ยกลงจากเตา เตรียมไว้,ตั้งกระทะใส่หัวกะทิลงไปผัดจนเดือด ตามด้วยพริกแกง ผัดจนกะทิแตกมัน,ใส่ส่วนผสมพริกแกงที่ผัดไว้ลงในหม้อกะทิ คนให้เข้ากัน นำขึ้นตั้งไฟต้มและคนให้เข้ากันจนเดือด จากนั้นเบาไฟลงปรุงรสด้วยน้ำตาลทรายและน้ำปลา,หั่นมะเขือเปราะแบบผ่า 4 ส่วนแล้วใส่ลงไปในหม้อ ตามด้วยมะเขือพวงและพริกชี้ฟ้า คนให้เข้ากันรอจนเดือดอีกครั้ง,ใส่ใบโหระพาลงไปคนต่อสักครู่ ตักใส่ภาชนะ พร้อมเสิร์ฟ",
//             "type_id": 1
//         }
//     ],
//     "ingredients": [
//         {
//             "Ingredient_id": 29,
//             "qty": "400",
//             "unit_id": 5
//         },
//         {
//             "Ingredient_id": 48,
//             "qty": "400",
//             "unit_id": 17
//         },
//         {
//             "Ingredient_id": 12,
//             "qty": "2",
//             "unit_id": 2
//         },
//         {
//             "Ingredient_id": 60,
//             "qty": "200",
//             "unit_id": 17
//         },
//         {
//             "Ingredient_id": 3,
//             "qty": "1+1/2",
//             "unit_id": 2
//         },
//         {
//             "Ingredient_id": 2,
//             "qty": "3",
//             "unit_id": 2
//         },
//         {
//             "Ingredient_id": 61,
//             "qty": "3-5",
//             "unit_id": 7
//         },
//         {
//             "Ingredient_id": 62,
//             "qty": "2-3",
//             "unit_id": 7
//         },
//         {
//             "Ingredient_id": 10,
//             "qty": "1-2",
//             "unit_id": 12
//         }
//     ]
// }
router.post('/add', async (req, res) => {
    let qry_1 = req.body.data
    let qry_2 = req.body.ingredients
    let ingredients = {}
    await dbConn.query(`INSERT INTO recipes SET ?;`,qry_1, async (error,results,fields)=>{
        if(error) throw error;
        const _id = results.insertId
        ingredients.recipe_id = _id
        for(obj of qry_2){
            obj.recipe_id=_id
            await dbConn.query(`INSERT INTO recipes_ingredient SET ?`,obj,(error,results,fields)=>{
                if(error) throw error;
                console.log(obj)
            })
        }
        res.send("Created Data")
       
    })
})

module.exports = router;
