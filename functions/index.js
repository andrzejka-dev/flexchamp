/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

const {onRequest} = require("firebase-functions/v2/https");
const logger = require("firebase-functions/logger");

https://firebase.google.com/docs/functions/get-started

exports.helloWorld = onRequest((request, response) => {
  logger.info("Hello logs!", {structuredData: true});
  response.send("Hello from Firebase!");
});


admin.initializeApp();

exports.createUserRecord = admin.auth.user().onCreate((user) => {
    console.log('user created', user.email, user.uid);
    return admin.firestore().collection('users').doc(user.uid).set({email: user.email, create_at: admin.firestore.FieldValue.serverTimestamp()});
});

exports.deleteUserRecord = admin.auth.user().onDelete((user) => {
    console.log('user deleted', user.email, user.uid);
    return admin.firestore().collection('users').doc(user.uid).delete();
});
