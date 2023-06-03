// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
let alertShow = false;

setInterval(() => {
    document.title= 
    alertShow ? "Welcome to Instagram"
            :"Follow for more !";

    alertShow = !alertShow;

}, 1000);
