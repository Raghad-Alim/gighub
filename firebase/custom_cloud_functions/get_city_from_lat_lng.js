const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code
const fetch = require("node-fetch");

exports.getCityFromLatLng = functions.https.onCall(async (data, context) => {
  const lat = data.lat;
  const lng = data.lng;
  const apiKey = "AIzaSyCqwaBqp0NS37DyZ4zRctftpDVB4uEokFw";

  const url = `https://maps.googleapis.com/maps/api/geocode/json?latlng=${lat},${lng}&key=${apiKey}`;

  try {
    const response = await fetch(url);
    const result = await response.json();

    if (result.results.length > 0) {
      for (const component of result.results[0].address_components) {
        if (component.types.includes("locality")) {
          return { city: component.long_name };
        }
      }
    }
    return { city: "City not found" };
  } catch (error) {
    throw new functions.https.HttpsError(
      "failed-precondition",
      "Error fetching city name",
      error,
    );
  }
});
