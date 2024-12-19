/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

const {onRequest, onCall} = require("firebase-functions/v2/https");
const logger = require("firebase-functions/logger");

const admin = require('firebase-admin');

admin.initializeApp();

https://firebase.google.com/docs/functions/get-started

exports.helloWorld = onRequest( async(request, response) => {
  logger.info("Hello logs!", {structuredData: true});
  // admin.firestore().collection('users').doc().set({email: 'hvvh'}), 
  admin.firestore().collection('users').doc("CzlOTwYoGPJiVKe5Tbop").delete();
  response.send("Hello bjdbscdisbsfugwe"+JSON.stringify(request.body));

  let aa;
  try {
    aa = await admin
      .firestore()
      .collection("users")
      .where("email", "==", "test")
      .get();
  } catch {
    response.send("not working");
  }
  logger.info("Hello logs!", { structuredData: true });
  response.send("Hello bjdbscdisbsfugwe" + JSON.stringify(aa));

});
// CzlOTwYoGPJiVKe5Tbop
// admin.firestore().collection('users').doc().set({email: 'hvvh'}),
// exports.createUser = onCall(async (data, context) => {
//   // Check if the request is authenticated
//   console.log(context.auth);
//   // if (!context.auth) {
//   //   throw new functions.https.HttpsError(
//   //     "unauthenticated",
//   //     "The function must be called while authenticated."
//   //   );
//   // }

//   const { email, password, displayName } = data;

//   try {
//     // Create a new user
//     const userRecord = await admin.auth().createUser({
//       email,
//       password,
//       displayName,
//     });
//     console.log({ userRecord });
//     return {
//       message: "User created successfully",
//       uid: userRecord.uid,
//     };
//   } catch (error) {
//     throw new functions.https.HttpsError(
//       "internal",
//       error.message || "Failed to create user"
//     );
//   }
// });


