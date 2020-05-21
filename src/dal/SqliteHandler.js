var sqlite3 = require('sqlite3').verbose();
var SqliteHandler = /** @class */ (function () {
    function SqliteHandler() {
        this.db = null;
    }
    SqliteHandler.prototype.open = function (path) {
        var _this = this;
        return new Promise(function (resolve, reject) {
            _this.db = new sqlite3.Database(path, function (err, row) {
                if (err)
                    reject("Open error: " + err.message);
                else
                    resolve(path + " opened");
            });
        });
    };
    // any query: insert/delete/update
    SqliteHandler.prototype.run = function (query) {
        var _this = this;
        return new Promise(function (resolve, reject) {
            _this.db.run(query, function (err, row) {
                if (err)
                    reject(err.message);
                else
                    resolve(true);
            });
        });
    };
    // any query: insert/delete/update
    SqliteHandler.prototype.prepare = function (query) {
        var _this = this;
        return new Promise(function (resolve, reject) {
            var prepareQuery = _this.db.prepare(query, function (err) {
                if (err)
                    reject(err.message);
                else
                    resolve(prepareQuery);
            });
        });
    };
    // first row read
    SqliteHandler.prototype.get = function (query, params) {
        var _this = this;
        return new Promise(function (resolve, reject) {
            _this.db.get(query, params, function (err, row) {
                if (err)
                    reject("Read error: " + err.message);
                else {
                    resolve(row);
                }
            });
        });
    };
    // set of rows read
    SqliteHandler.prototype.all = function (query, params) {
        var _this = this;
        return new Promise(function (resolve, reject) {
            if (params == undefined)
                params = [];
            _this.db.all(query, params, function (err, rows) {
                if (err)
                    reject("Read error: " + err.message);
                else {
                    resolve(rows);
                }
            });
        });
    };
    // each row returned one by one 
    SqliteHandler.prototype.each = function (query, params, action) {
        var _this = this;
        return new Promise(function (resolve, reject) {
            var db = _this.db;
            _this.db.serialize(function () {
                _this.db.each(query, params, function (err, row) {
                    if (err)
                        reject("Read error: " + err.message);
                    else {
                        if (row) {
                            action(row);
                        }
                    }
                });
                _this.db.get("", function (err, row) {
                    resolve(true);
                });
            });
        });
    };
    SqliteHandler.prototype.close = function () {
        var _this = this;
        return new Promise(function (resolve, reject) {
            _this.db.close();
            resolve(true);
        });
    };
    return SqliteHandler;
}());
module.exports = SqliteHandler;
