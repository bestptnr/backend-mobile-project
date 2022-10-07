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
router.get("/food/:id", async (req, res) => {
  const _id = req.params.id;
  console.log(_id);
  let recipe = {}
  await dbConn.query(
    `SELECT recipe_id,recipe_name,detail,image,step,type_id FROM recipes WHERE recipe_id = '${_id}'`,
    async (error, results, fields) => {
      if (error) throw error;
      recipe=results
      await dbConn.query(
        `SELECT recipes_ingredient.id,recipes_ingredient.recipe_id,ingredients.Ingredient_id,ingredients.Ingredient,qty,unit.unit_id
          FROM recipes_ingredient
          INNER JOIN recipes ON recipes_ingredient.recipe_id=recipes.recipe_id
          INNER JOIN ingredients ON recipes_ingredient.Ingredient_id=ingredients.Ingredient_id
          INNER JOIN unit ON recipes_ingredient.unit_id=unit.unit_id
          WHERE recipes.recipe_id=${_id}
          ORDER BY ingredients.Ingredient DESC`,
        (error, results, fields) => {
          res.send({data:recipe,ingredient:results})
        }
      );
      ;
    }
  );
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
//         },xf
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
  let arrIngredient = [];
  let qry_1 = req.body.data.slice(11, -1).split(", ");
  let qry_2 = req.body.Ingredients;
  let data = {};
  for (let i of qry_1) {
    let fix = i.split("=");
    data[fix[0]] = fix[1];
  }
  for (let j of qry_2) {
    let ingredient = {};
    for (let i of j.slice(11, -1).split(", ")) {
      let fix = i.split("=");
      ingredient[fix[0]] = fix[1];
    }
    arrIngredient.push(ingredient);
  }
  console.log(arrIngredient);
  await dbConn.query(
    `INSERT INTO recipes SET ?;`,
    data,
    async (error, results, fields) => {
      if (error) throw error;
      const _id = results.insertId;
      for (obj of arrIngredient) {
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

router.put('/update/add/:id',(req,res)=>{
  const _id = req.params.id
  dbConn.query(
     `UPDATE recipes SET ? WHERE recipe_id=${_id}`,req.body,(error,results,fields)=>{
      if (error) throw error;
      res.send(results)
     }
  )
})

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
  if (!newData) {
    return res.status(404).send("Not Found Data");
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
router.get('/ingredient/max',async (req,res)=>{
  dbConn.query(
    `SELECT MAX(Ingredient_id) FROM ingredients`,(error,results)=>{
       console.log(results)
       res.send(results)

    }
  )
})
router.get("/ingredient/size",async (req,res)=>{
  dbConn.query(
    `SELECT MAX(Ingredient_id) as total FROM ingredients`,async(error,results)=>{
        if (error) throw error;
        res.send(results[0])
        
      
    }
  )
})
router.put("/update/ingredient/:id",async (req,res)=>{
  const _id = req.params.id
  const lastrow=0
  console.log(_id)
  dbConn.query(
    `SELECT MAX(Ingredient_id) as total  FROM ingredients`,async(error,results)=>{
       if(_id==1){
        await dbConn.query(
          `INSERT INTO recipes_ingredient SET ? `,req.body, (error, results, fields) => {
            if (error) throw error;
            res.send(results)
          }
          
        )
       }else{
        await dbConn.query(
          `UPDATE recipes_ingredient SET ? WHERE id=${_id}`,req.body, (error, results, fields) => {
            if (error) throw error;
            res.send(results)
          }
        )
       }
    }
  )

})
router.delete("/delete/recipeingredient/:id",async (req,res)=>{
  const _id = req.params.id
  console.log(`DELETE FROM recipes_ingredient WHERE id=${_id}`)
  await dbConn.query(
    `DELETE FROM recipes_ingredient WHERE id=${_id}`,(error,results,fields)=>{
      if (error) throw error;
      console.log("PASS")
      res.send(results)
    }
  )
})



router.delete("/delete/:id", async (req, res) => {
  const _id = req.params.id;
  console.log(_id);
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
  res.send("DELETED");
});
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

router.get("/ingredient", (req, res) => {
  dbConn.query(
    `SELECT * FROM ingredients WHERE soft_delete="N"`,
    (error, results, fields) => {
      if (error) throw error;
      // ORDER BY Ingredient ASC
      res.send(results);
    }
  );
});

// เพิ่มส่วนผสม
// ตัวอย่างข้อมูลที่เพิ่ม
// {
//     "Ingredient":"test"
// }
router.post("/ingredient/add", (req, res) => {
  const data = req.body;
  console.log(data);
  if (!data) {
    return res.status(404).send("Data Not Found");
  }
  dbConn.query(
    `INSERT INTO ingredients SET ?`,
    data,
    (error, results, fields) => {
      if (error) throw error;
      res.send("Created Ingredient!");
    }
  );
});

// อัปเดตส่วนผสม
// ตัวอย่างข้อมูลที่เพิ่ม
// {
//     "Ingredient":"test"
// }
router.put("/ingredient/update/:id", (req, res) => {
  const _id = req.params.id;
  const data = req.body;

  dbConn.query(
    `UPDATE ingredients SET ? WHERE Ingredient_id=${_id}`,
    data,
    (error, results, fields) => {
      if (error) throw error;
      res.send("Updated Ingredient!");
    }
  );
});


router.delete("/ingredient/delete/:id", (req, res) => {
  const _id = req.params.id;
  dbConn.query(
    `UPDATE ingredients SET soft_delete="Y" WHERE Ingredient_id=${_id}`,
    (error, results, fields) => {
      if (error) throw error;
      res.send("Deleted Ingredient!");
    }
  );
});

router.get("/ingredient/search/:text", (req, res) => {
  const textSearch = req.params.text;
  dbConn.query(
    `SELECT * FROM ingredients WHERE Ingredient LIKE '%${textSearch}%'`,
    (error, results, fields) => {
      if (error) throw error;
      return res.send(results);
    }
  );
});

// -----------------------------------------------------------
router.get("/unit", (req, res) => {
  dbConn.query(`SELECT * FROM unit`, (error, results, fields) => {
    if (error) throw error;
    res.send(results);
  });
});
router.get("/type", (req, res) => {
  dbConn.query(
    `SELECT * FROM type WHERE soft_delete="N"`,
    (error, results, fields) => {
      if (error) throw error;
      res.send(results);
    }
  );
});
// เพิ่มปรเภทอาหาร
// ตัวอย่างข้อมูลที่เพิ่ม
// {
//     "type_name":"test"
// }

router.post("/type/add", (req, res) => {
  const data = req.body;
  console.log(req.body);
  dbConn.query(`INSERT INTO type SET ?`, data, (error, results, fields) => {
    if (error) throw error;
    res.send("Created Type!");
  });
});

// อัปเดตประเภทอาหาร
// ตัวอย่างข้อมูลที่เพิ่ม
// {
//     "type_name":"test"
// }
router.put("/type/update/:id", (req, res) => {
  const _id = req.params.id;
  const data = req.body;
  if (!data) {
    return res.status(404).send("Data Not Found");
  }
  dbConn.query(
    `UPDATE type SET ? WHERE type_id=${_id}`,
    data,
    (error, results, fields) => {
      if (error) throw error;
      res.send("Updated Type!");
    }
  );
});
router.delete("/type/delete/:id", (req, res) => {
  const _id = req.params.id;
  console.log(_id);
  dbConn.query(
    `UPDATE type SET soft_delete="Y" WHERE type_id=${_id}`,
    (error, results, fields) => {
      if (error) throw error;
      res.send("Deleted Type!");
    }
  );
});
router.get("/type/search/:text", (req, res) => {
  const textSearch = req.params.text;
  dbConn.query(
    `SELECT * FROM type WHERE type_name LIKE '%${textSearch}%' and soft_delete="N"`,
    (error, results, fields) => {
      if (error) throw error;
      return res.send(results);
    }
  );
});

module.exports = router;
