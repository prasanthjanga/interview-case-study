<p align="center">
    <img align="center" src="https://supplycart.my/wp-content/uploads/2019/09/sc_logo_tm.png">
</p>

# Supplycart Interview Case Study

This case study is designed for candidates to showcase their skills and coding style focusing on Laravel, Vue and TailwindCSS. You may use more technologies apart from the 3 mentioned. 

### Instructions

- Fork this repo to your github account
- Complete the tasks given
- Once completed, create a PR to this repository
- Lastly, add some guidance or instruction on how to run your code

### Requirements

You must work on this assignment using:
 - Vue (optional for BE dev)
 - TailwindCSS
 - Laravel (optional for FE dev)

### Tasks

1. As guest, I want to be able to register an account
2. As guest, I want to be able to login using registered account
3. As user, I want to see list of products after login
4. As user, I want to be able to add product to cart
5. As user, I want to be able to place order for added products in cart
6. As user, I want to user my order history
7. As user, I want to be able to logout

### Bonus Tasks

1. Verify email after registration
2. Product attributes and filtering e.g brand, category
3. Add unit tests
5. Deploy app to a server

### Installation steps
	- composer install
	- cp .env.example .env
	Update DB details & app URL in .env file

	- php artisan key:generate
	- php artisan storage:link
	- php artisan vendor:publish
	- Please enter 25 ([25] Tag: livewire)
	- config/livewire.php
	Update the asset URL according to your root folder
	- 'asset_url'  => '/interview-case-study/public',
	- npm install
	- please use DB dupm /interview-case-study/database/tailwind_css_db_back_up_20201013.sql