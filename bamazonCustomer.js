var mysql = require('mysql');
var inquirer = require('inquirer');
var Table = require('easy-table');
var connection = mysql.createConnection({
    host: 'localhost',
    port: '3306',
    user: 'root',
    password: 'root',
    database: 'bamazonDB',

});
connection.connect();

displayTable()

function displayTable() {
    connection.query("SELECT * FROM products", function (error, results) {

            if (error) throw error;
            console.log("\n\n");

            console.log(`BAMAZON`)

            var t = new Table;
         

            results.forEach(function (product) {
                t.cell('Item', product.item_id);
                t.cell('Product', product.product_name);
                t.cell('Department', product.department_name);
                t.cell('Price', product.price, Table.number(2));
                t.cell('Quantity', product.stock_quantity)
                t.newRow();
            });

            console.log(t.toString());

            inquirer.prompt([{
                type: 'input',
                name: 'item_id',
                message: 'What is the Item ID of the item you would like to purchase?'
            }, {
                type: 'input',
                name: 'quantity',
                message: 'How many units would you like to purchase of this item?'

            }]).then(function (answers) {

                    connection.query("SELECT * FROM products WHERE item_id = " + answers.item_id, function (error, results) {
                            try {
                                let currentPrice = results[0].price;
                                var total = (answers.quantity * currentPrice).toFixed(2)

                                if (results[0].stock_quantity < answers.quantity) {
                                    console.log('\n\n\n\n\n')
                                    console.log('Insufficient quantity!');
                                    displayTable();

                                } else {
                                    connection.query('UPDATE products SET stock_quantity = stock_quantity - ' + answers.quantity + 'WHERE item_id = ' + answers.item_id, function (error, results) {

                                        console.log('Inventory Updated!');
                                        console.log("Your total is: $" + total);
                                        console.log('Thank you for shopping!');

                                    });
                                }
                                connection.query("UPDATE departments INNER JOIN products ON products.department_name = departments.department_name SET departments.product_sales = departments.product_sales + ? WHERE products.item_id = ?", [total, answers.item_id], 
                                
                                function (error, results) {
                                    console.log('Department updated');
                                    exitProgram();
                                });
                                

                            
                                }catch(error) {
                                console.log('There was an error with your bamazon request:', error.message);
                                 exitProgram();
                        }

                    })
            });


    })
}
function exitProgram(){
    connection.end();

}
