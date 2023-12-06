db.createCollection("product_details");

db.product_details.insertMany([
    {
        prod_id: 'P001',
        prod_name: 'pen',
        prod_price: 25,
        prod_quantity: 100,
        prod_description: 'smooth flow'
    },
    {
        prod_id: 'P002',
        prod_name: 'bottle',
        prod_price: 200.15,
        prod_quantity: 75,
        prod_description: 'good grip'
    },
    {
        prod_id: 'P003',
        prod_name: 'bag',
        prod_price: 850,
        prod_quantity: 50,
        prod_description: 'nice quality'
    },
    {
        prod_id: 'P004',
        prod_name: 'iphone',
        prod_price: 500000,
        prod_quantity: 23,
        prod_description: ''
    },
    {
        prod_id: 'P005',
        prod_name: 'earphone',
        prod_price: 650.85,å
        prod_quantity: 30,
        prod_description: 'noise cancellation'
    }
]);

db.product_details.insertOne({
    prod_id: 'P006',
    prod_name: 'notebook',
    prod_price: 12.50,
    prod_quantity: 200,
    prod_description: 'ruled pages'
});

db.getCollection("product_details").find({})

db.product_details.updateOne(
    { prod_id: 'P003' },
    { $set: { prod_quantity: 60 } }
);

db.getCollection("product_details").find({"prod_id": "P003"})

db.product_details.aggregate([
    {
        $group: {
            _id: null,
            totalQuantity: { $sum: "$prod_quantity" }
        }
    }
])

db.product_details.find({ prod_price: { $gt: 100 } }).count()

db.product_details.find({ prod_name: /pen/i })