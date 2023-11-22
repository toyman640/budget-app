// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import { Turbo } from "@hotwired/turbo-rails";

// document.addEventListener('turbo:load', () => {
//   const notificationDiv = document.querySelector('.notification-message');

//   // Display the message for 3 seconds
//   setTimeout(() => {
//     // Add the "keep-note" class after 3 seconds
//     notificationDiv.classList.add('keep-note');
//   }, 3000);
// });

document.addEventListener('turbo:load', () => {
  const notificationDiv = document.querySelector('.notification-message');
  const noticeMessage = notificationDiv.querySelector('.notice');
  const alertMessage = notificationDiv.querySelector('.alert');

  if ((noticeMessage.textContent.trim() || alertMessage.textContent.trim())) {
    setTimeout(() => {
      // Add the "fade-out" class to initiate the fade-out effect
      notificationDiv.classList.add('fade-out');

      // After the fade-out animation duration (e.g., 1 second), hide the element
      setTimeout(() => {
        notificationDiv.classList.add('keep-note');
      }, 1000); // Adjust this value based on your CSS transition duration
    }, 3000);
  } else {
    notificationDiv.classList.add('keep-note');
  }
});

