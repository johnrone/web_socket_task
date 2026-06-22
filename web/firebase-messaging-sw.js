importScripts("https://www.gstatic.com/firebasejs/10.7.0/firebase-app-compat.js");
importScripts("https://www.gstatic.com/firebasejs/10.7.0/firebase-messaging-compat.js");

firebase.initializeApp({
  apiKey: "AIzaSyDT-3jdwjeb1JHNQlAQodVFd-DSccZMFkY",
  authDomain: "websocket-ad5f6.firebaseapp.com",
  projectId: "websocket-ad5f6",
  storageBucket: "websocket-ad5f6.firebasestorage.app",
  messagingSenderId: "444113697306",
  appId: "1:444113697306:web:b58ad212cd332b4a576fa3",
  measurementId: "G-0R6W0V064F"
});

const messaging = firebase.messaging();

messaging.onBackgroundMessage((payload) => {
  console.log('Received background message ', payload);
  const notificationTitle = payload.notification.title;
  const notificationOptions = {
    body: payload.notification.body,
    icon: '/favicon.png'
  };

  return self.registration.showNotification(notificationTitle, notificationOptions);
});
