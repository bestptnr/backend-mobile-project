const express = require("express");
const router = express.Router();
var mysql = require("mysql");

var dbConn = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "food",
  multipleStatements: true,
});
dbConn.connect();

router.get("/all", async (req, res) => {
    await dbConn.query("SELECT * FROM recipes", (error, results, fields) => {
        if (error) throw error;
        return res.send(results);
    });
});

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
router.post("/add", async (req, res) => {
  let qry_1 = req.body.data;
  let qry_2 = req.body.ingredients;
  await dbConn.query(
    `INSERT INTO recipes SET ?;`,
    qry_1,
    async (error, results, fields) => {
      if (error) throw error;
      const _id = results.insertId;
      for (obj of qry_2) {
        obj.recipe_id = _id;
        await dbConn.query(
          `INSERT INTO recipes_ingredient SET ?`,
          obj,
          (error, results, fields) => {
            if (error) throw error;
            console.log(obj);
          }
        );
      }
      res.send("Created Recipes Success");
    }
  );
});

// ตย ข้อมูลที่นำเข้าของ update
// {
//     "data": [
//         {
//             "recipe_id": 22,
//             "recipe_name": "แกงเนื้อthhhh",
//             "detail": "hhhสำหรับคนชอบกินเนื้อวัว ขอนำเสนอเมนูแกงเนื้อ สูตรนี้ใส่เนื้อวัวหั่นชิ้นต้มกับน้ำพริกแกงกะทิจนเปื่อยนุ่ม ใส่มะเขือเปราะกับมะเขือพวง และใบโหระพา",
//             "image": "https://s359.thaibuffer.com/pagebuilder/66af9d1f-df67-46cd-a102-fa9df11d9fce.jpg",
//             "step": "เทหางกะทิลงไปในหม้อ ใส่เนื้อวัวลงไปคนให้เข้ากัน เคี่ยวจนเริ่มเปื่อย ยกลงจากเตา เตรียมไว้,ตั้งกระทะใส่หัวกะทิลงไปผัดจนเดือด ตามด้วยพริกแกง ผัดจนกะทิแตกมัน,ใส่ส่วนผสมพริกแกงที่ผัดไว้ลงในหม้อกะทิ คนให้เข้ากัน นำขึ้นตั้งไฟต้มและคนให้เข้ากันจนเดือด จากนั้นเบาไฟลงปรุงรสด้วยน้ำตาลทรายและน้ำปลา,หั่นมะเขือเปราะแบบผ่า 4 ส่วนแล้วใส่ลงไปในหม้อ ตามด้วยมะเขือพวงและพริกชี้ฟ้า คนให้เข้ากันรอจนเดือดอีกครั้ง,ใส่ใบโหระพาลงไปคนต่อสักครู่ ตักใส่ภาชนะ พร้อมเสิร์ฟ",
//             "type_id": 2
//         }
//     ],
//     "ingredients": [
//         {
//             "id": 12,
//             "Ingredient_id": 29,
//             "qty": "40330",
//             "unit_id": 5
//         },
//         {
//             "id": 13,
//             "Ingredient_id": 48,
//             "qty": "4200",
//             "unit_id": 17
//         },
//         {
//             "id": 14,
//             "Ingredient_id": 12,
//             "qty": "23",
//             "unit_id": 2
//         },
//         {
//             "id": 160,
//             "Ingredient_id": 29,
//             "qty": "400",
//             "unit_id": 5
//         },
//         {
//             "id": 161,
//             "Ingredient_id": 48,
//             "qty": "400",
//             "unit_id": 17
//         },
//         {
//             "id": 162,
//             "Ingredient_id": 12,
//             "qty": "2",
//             "unit_id": 2
//         },
//         {
//             "id": 163,
//             "Ingredient_id": 60,
//             "qty": "200",
//             "unit_id": 17
//         },
//         {
//             "id": 164,
//             "Ingredient_id": 3,
//             "qty": "3331+1/2",
//             "unit_id": 2
//         },
//         {
//             "id": 165,
//             "Ingredient_id": 2,
//             "qty": "3",
//             "unit_id": 2
//         },
//         {
//             "id": 166,
//             "Ingredient_id": 61,
//             "qty": "3-5",
//             "unit_id": 7
//         },
//         {
//             "id": 167,
//             "Ingredient_id": 62,
//             "qty": "2-3",
//             "unit_id": 7
//         },
//         {
//             "id": 168,
//             "Ingredient_id": 29,
//             "qty": "1-233333",
//             "unit_id": 11
//         }
//     ]
// }
router.put("/update/:id", async (req, res) => {
  const _id = req.params.id;
  const newData = req.body;
  if(!newData){
    return res.status(404).send("Not Found Data")
  }
  await dbConn.query(
    `UPDATE recipes SET ? WHERE recipe_id=${_id};`,
    newData.data,
    async (error, results, fields) => {
      if (error) throw error;
      for (obj of newData.ingredients) {
        obj.recipe_id = _id;
        await dbConn.query(
          `UPDATE recipes_ingredient SET ? WHERE id=${obj.id}`,
          obj,
          (error, results, fields) => {
            if (error) throw error;
          }
        );
      }
    }
  );
  res.send("UPDATE SUCSSESS");
});

router.delete("/delete/:id", async (req, res) => {
    const _id = req.params.id;
    await dbConn.query(
      `DELETE FROM recipes_ingredient WHERE recipe_id=${_id}`,
      async (error, results, fields) => {
        if (error) throw error;
        await dbConn.query(
          `DELETE FROM recipes WHERE recipe_id=${_id}`,
          (error, results, fields) => {
            if (error) throw error;
          }
        );
      }
    );
    res.send("DELETED")
})
router.get("/search/:text", (req, res) => {
    const textSearch = req.params.text;
    dbConn.query(
        `SELECT * FROM recipes WHERE recipe_name LIKE '%${textSearch}%'`,
        (error, results, fields) => {
            if (error) throw error;
            return res.send(results);
        }
    );
});
// ---------------------------------------------------------------------



router.get("/ingredient",(req,res)=>{
    dbConn.query(`SELECT * FROM ingredients ORDER BY Ingredient ASC `,(error,results,fields)=>{
        if (error) throw error;
        res.send(results)
    })
})


// เพิ่มส่วนผสม
// ตัวอย่างข้อมูลที่เพิ่ม
// {
//     "Ingredient":"test"
// }
router.post("/ingredient/add",(req,res)=>{
    const data = req.body
    if(!data){
      return res.status(404).send("Data Not Found")
    }
    dbConn.query(`INSERT INTO ingredients SET ?`,data,(error,results,fields)=>{
        if (error) throw error;
        res.send("Created Ingredient!")
    })
})

// อัปเดตส่วนผสม
// ตัวอย่างข้อมูลที่เพิ่ม
// {
//     "Ingredient":"test"
// }
router.put("/ingredient/update/:id",(req,res)=>{
    const _id = req.params.id
    const data = req.body
    dbConn.query(`UPDATE ingredients SET ? WHERE Ingredient_id=${_id}`,data,(error,results,fields)=>{
        if (error) throw error;
        res.send("Updated Ingredient!")
    })
})
router.delete("/ingredient/delete/:id",(req,res)=>{
    const _id = req.params.id
    dbConn.query(`DELETE FROM ingredients WHERE Ingredient_id=${_id}`,(error,results,fields)=>{
        if (error) throw error;
        res.send("Deleted Ingredient!")
    })
})



// -----------------------------------------------------------
router.get("/type",(req,res)=>{
    dbConn.query(`SELECT * FROM type`,(error,results,fields)=>{
        if (error) throw error;
        res.send(results)
    })
})
// เพิ่มปรเภทอาหาร
// ตัวอย่างข้อมูลที่เพิ่ม
// {
//     "type_name":"test"
// }

router.post("/type/add",(req,res)=>{
    const data = req.body
    dbConn.query(`INSERT INTO type SET ?`,data,(error,results,fields)=>{
        if (error) throw error;
        res.send("Created Type!")
    })
})

// อัปเดตประเภทอาหาร
// ตัวอย่างข้อมูลที่เพิ่ม
// {
//     "type_name":"test"
// }
router.put("/type/update/:id",(req,res)=>{
    const _id = req.params.id
    const data = req.body
    if(!data){
      return res.status(404).send("Data Not Found")
    }
    dbConn.query(`UPDATE type SET ? WHERE type_id=${_id}`,data,(error,results,fields)=>{
        if (error) throw error;
        res.send("Updated Type!")
    })
})
router.delete("/type/delete/:id",(req,res)=>{
    const _id = req.params.id
    dbConn.query(`DELETE FROM type WHERE type_id=${_id}`,(error,results,fields)=>{
        if (error) throw error;
        res.send("Deleted Type!")
    })
})




module.exports = router;
