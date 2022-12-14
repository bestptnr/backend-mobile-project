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

// get อาหารทั้งหมดออกมา
router.get("/all", async (req, res) => {
  await dbConn.query("SELECT * FROM recipes", (error, results, fields) => {
    if (error) throw error;
    return res.send(results);
  });
});

// get อาหารที่ใหม่ล่าสุดออกมาแนะนำตรงหน้าหลัก 6 เมนูที่จะออกมา Ex http://localhost:3000/food/main
router.get("/main", (req, res) => {
  const _id = req.params.id;
  dbConn.query(
    `SELECT * FROM recipes ORDER BY created_at DESC LIMIT 6`,
    (error, results, fields) => {
      if (error) throw error;
      return res.send(results);
    }
  );
});

// get อาหารทั้งหมดออกมาทั้งหมด วิธี วัตถุดิบ น่าจะเวลากดเข้าไปในเมนูนั้นๆ Ex http://localhost:3000/food/find/2
router.get("/find/:id", async (req, res) => {
  const _id = req.params.id;
  console.log(_id);
  let recipe = {};
  await dbConn.query(
    `SELECT recipes.recipe_id,recipes.recipe_name,recipes.detail,recipes.image,step,recipes.type_id,type.type_name FROM recipes 
    INNER JOIN type ON recipes.type_id=type.type_id WHERE recipe_id = '${_id}'`,
    async (error, results, fields) => {
      if (error) throw error;
      recipe = results;
      console.log(results)
      await dbConn.query(
        `SELECT recipes_ingredient.id,recipes_ingredient.recipe_id,ingredients.Ingredient_id,ingredients.Ingredient,qty,unit.unit
          FROM recipes_ingredient
          INNER JOIN recipes ON recipes_ingredient.recipe_id=recipes.recipe_id
          INNER JOIN ingredients ON recipes_ingredient.Ingredient_id=ingredients.Ingredient_id
          INNER JOIN unit ON recipes_ingredient.unit_id=unit.unit_id
          WHERE recipes.recipe_id=${_id}
          ORDER BY ingredients.Ingredient DESC`,
        (error, results, fields) => {
          res.send({ data: recipe, ingredients: results });
        }
      );
    }
  );
});

// ค้นหาจากชื่ออาหาร Ex http://localhost:3000/food/search/ผัด
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

// get ข้อมูลเป็น type เวลากดเข้าไปในประเภทเมนู http://localhost:3000/food/type
router.get("/type", (req, res) => {
  dbConn.query(`SELECT * FROM type `, (error, results, fields) => {
    if (error) throw error;
    return res.send(results);
  });
});

// get ข้อมูลเป็นเมนูที่มี type ตามเลข id Ex http://localhost:3000/food/type/2
router.get("/type/:id", (req, res) => {
  const _id = req.params.id;
  dbConn.query(
    `SELECT * FROM recipes WHERE type_id = ${_id}`,
    (error, results, fields) => {
      if (error) throw error;
      return res.send(results);
    }
  );
});

// ไม่รู้หมดหรือยังถ้ามีอีกค่อยเติมเอาเนอะ

module.exports = router;
