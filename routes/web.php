<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\ProfilesController;
use App\Http\Controllers\CommentController;
use App\Http\Controllers\PostsController;
use App\Http\Controllers\LikeController;
use App\Http\Controllers\StoryController;
use App\Http\Controllers\FollowsController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/




Auth::routes(['verify' => true]);

Route::resource('comments', CommentController::class);


Route::get('/', [PostsController::class, 'index'])->name('post.index');

Route::get('/p/create', [PostsController::class, 'create'])->name('post.create');


Route::post('/p', [PostsController::class, 'store'])->name('post.store');

Route::delete('/p/{post}', [PostsController::class, 'destroy'])->name('post.destroy');

Route::get('/p/{post}', [PostsController::class, 'show'])->name('post.show');

Route::post('/p/{post}', [PostsController::class, 'updatelikes'])->name('post.update'); //  This need more time

Route::get('/explore', [PostsController::class, 'explore'])->name('post.explore'); // Explore Page

Route::get('/posts', [PostsController::class, 'vue_index']); // Infinite scrolling

Route::post('like/{like}',[LikeController::class, 'update2'])->name('like.create');
Route::post('like/{like}/2',[LikeController::class, 'update3'])->name('like.create2');

Route::get('/home', [HomeController::class, 'index'])->name('home');



// Profile Route
Route::get('/profile/{user}/edit',  [ProfilesController::class, 'edit'])->name('profile.edit');
Route::get('/profile/{user}', [ProfilesController::class, 'index'])->name('profile.index');
Route::patch('/profile/{user}', [ProfilesController::class, 'update'])->name('profile.update');

Route::any('/search', [ProfilesController::class, 'search'])->name('profile.search'); // Search Page


// Follow Route
Route::post('/follow/{user}', [FollowsController::class,'store']);

// Stories Route
Route::get('/stories/create', [StoryController::class, 'create'])->name('stories.create');

Route::get('/stories/{user}', [StoryController::class, 'show'])->name('stories.show');

Route::post('/stories', [StoryController::class, 'store'])->name('stories.store');

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
