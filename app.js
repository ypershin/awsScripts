#!/usr/bin/env nodejs

var pg = require("pg");

var conString = "pg://ubuntu:aaa@localhost:5432/ubuntu";

var client = new pg.Client(conString);
client.connect();

var query = client.query("SELECT * FROM sc.countries");

query.on("row",function(row,result) {
  result.addRow(row);
});

query.on("end",function(result) {
  console.log(JSON.stringify(result.rows,null,"   "));
  client.end();
});
