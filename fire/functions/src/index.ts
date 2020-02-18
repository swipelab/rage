import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

admin.initializeApp();

const db = admin.firestore();
const settings = { timestampsInSnapshots: true };
db.settings(settings);

const region = "europe-west2";

export const chats_timeline_archive = functions
  .region(region)
  .firestore.document("chats/{chatId}/timeline/{messageId}")
  .onCreate((snapshot, context) => {
    console.info(
      `message.created -> chats/${context.params.chatId}/timeline/${context.params.messageId}`
    );
    return null;
  });

export const users_welcome = functions
  .region(region)
  .auth.user()
  .onCreate(async user => {
    const group = db.collection("groups").doc();

    await group.create({ leader: user.uid, users: [user.uid], description: 'cross road'});

    await db.doc(`users/${user.uid}`).create({
      id: user.uid,
      alias: user.displayName,
      avatar: user.photoURL,
      group: group.id,
      email: user.email
    });

    return null;
  });

export const users_farewell = functions
  .region(region)
  .auth.user()
  .onDelete(async user => {
    const userRef = db.doc(`users/${user.uid}`);

    console.info(`users/farewell -> ${userRef.path}`);

    const group = await userRef.get().then(x => x.data()?.group);

    if (group) {
      const groupRef = db.doc(`groups/${group}`);
      console.info(`groups/deleting -> ${groupRef}`);

      const groupDoc = await groupRef.get();
      if (1 + groupDoc.data()?.users?.findIndex((x: string) => x === user.uid)) {
        console.info(`groups/delete -> ${groupRef.path}`);
        await groupRef.delete();
      }
    }

    console.info(`users/delete -> ${userRef.path}`);

    await userRef.delete();

    return null;
  });

export const raging = functions
  .region(region)
  .https.onRequest((request, response) => {
    response.send("raging rants on your way!");
  });
