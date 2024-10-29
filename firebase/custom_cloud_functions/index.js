const admin = require("firebase-admin/app");
admin.initializeApp();

const getCityFromLatLng = require("./get_city_from_lat_lng.js");
exports.getCityFromLatLng = getCityFromLatLng.getCityFromLatLng;
