// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import esModuleShim from 'es-module-shim';
import AmountCalculatorController from 'controllers/amount_calculator_controller';

Controller.register('amount-calculator', AmountCalculatorController);
