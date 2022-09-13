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
//     "recipes":{
//         "recipe_name": "แกงมัสมั่นไก่ทอด",
//         "detail": "“แกงมัสมั่นไก่” ถือว่าเป็นเมนูเด็ดอีกเมนูหนึ่งที่ได้รับการจัดอันดับว่าฝรั่งชอบมากที่สุด แซงหน้าต้มยำกุ้งไปแล้ว จำไว้ค่ะเสน่ห์ปลายจวักผัวรักจนตาย ดังกาพย์แห่เครื่องคาวหวานได้กล่าวไว้ 'มัสมั่นแกงแก้วตา หอมยี่หร่ารสร้อนแรง ชายใดได้กลืนแกง แรงอยากให้ใฝ่ฝันหา…",
//         "image": "https://s359.thaibuffer.com/pagebuilder/ae403169-b697-43de-8667-e7d7ba225333.jpg",
//         "step": "เคี่ยวพริกแกงตั้งหม้อให้ร้อนใส่กะทิลงไปเคี่ยวสักพักจนเดือดใส่พริกแกงลงไปเคี่ยวจนกะทิแตกมัน,เติมเครื่องลงไปผัดใส่หอมใหญ่หั่นลงไปผัดใส่น่องไก่ลงไปผัดคลุกให้เข้ากับน้ำแกงใส่เม็ดมะม่วงหิมพานต์ลงไปใส่มันฝรั่งลงไปผัด,เคี่ยวจนไก่นุ่มเติมหางกะทิเคี่ยวจนไก่นุ่มประมาณ45-60นาทีหมั่นคน,ปรุงรสชาติเติมน้ำตาลมะพร้าวเติมน้ำมะขามเปียกเติมน้ำปลา และเกลือเคี่ยวต่อให้เข้ากันดีเป็นอันเสร็จพิธี",
//         "type_id": 2
//     },
//     "ingredients": [
//         {
//             "recipe_id": 1,
//             "recipe_name": "แกงมัสมั่นไก่",
//             "Ingredient": "เนื้อไก่",
//             "qty": "5",
//             "unit": "น่อง\r\n"
//         },
//         {
//             "recipe_id": 1,
//             "recipe_name": "แกงมัสมั่นไก่",
//             "Ingredient": "พริกแกงมัสมั่น ",
//             "qty": "200",
//             "unit": "กรัม"
//         },
//         {
//             "recipe_id": 1,
//             "recipe_name": "แกงมัสมั่นไก่",
//             "Ingredient": "กะทิ",
//             "qty": "2",
//             "unit": "ถ้วย"
//         },
//         {
//             "recipe_id": 1,
//             "recipe_name": "แกงมัสมั่นไก่",
//             "Ingredient": "หางกะทิ",
//             "qty": "3",
//             "unit": "ถ้วย"
//         },
//         {
//             "recipe_id": 1,
//             "recipe_name": "แกงมัสมั่นไก่",
//             "Ingredient": "หอมหัวใหญ่",
//             "qty": "3",
//             "unit": "ถ้วย"
//         },
//         {
//             "recipe_id": 1,
//             "recipe_name": "แกงมัสมั่นไก่",
//             "Ingredient": "มันฝรั่ง ",
//             "qty": "500",
//             "unit": "กรัม"
//         },
//         {
//             "recipe_id": 1,
//             "recipe_name": "แกงมัสมั่นไก่",
//             "Ingredient": "เม็ดมะม่วงหิมพานต์",
//             "qty": "200",
//             "unit": "กรัม"
//         },
//         {
//             "recipe_id": 1,
//             "recipe_name": "แกงมัสมั่นไก่",
//             "Ingredient": "น้ำตาลมะพร้าว",
//             "qty": "2",
//             "unit": "ช้อนโต๊ะ"
//         },
//         {
//             "recipe_id": 1,
//             "recipe_name": "แกงมัสมั่นไก่",
//             "Ingredient": "เกลือป่น",
//             "qty": "1",
//             "unit": "หยิบมือ"
//         },
//         {
//             "recipe_id": 1,
//             "recipe_name": "แกงมัสมั่นไก่",
//             "Ingredient": "น้ำปลา",
//             "qty": "1/2",
//             "unit": "ช้อนโต๊ะ"
//         },
//         {
//             "recipe_id": 1,
//             "recipe_name": "แกงมัสมั่นไก่",
//             "Ingredient": "น้ำมะขามเปียก ",
//             "qty": "4",
//             "unit": "ช้อนโต๊ะ"
//         }
//     ]

// }
router.post('/add',(req,res)=>{
    let qry_1 = req.body.recipes
    let qry_2 = req.body.ingredients
    for(const obj of qry_2){
        console.log(obj)
    }

    res.send("PASS")
    // dbConn.query(`INSERT INTO recipes SET ?`,qry_1,(error,results,fields)=>{
    //     if(error) throw error;
    
    // })
  
})

module.exports = router;
