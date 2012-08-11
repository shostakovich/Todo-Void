# Todo-Void
[![Build
Status](https://secure.travis-ci.org/shostakovich/Todo-Void.png)](http://travis-ci.org/shostakovich/TodoVoid) [![Code
Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/shostakovich/Todo-Void)

A simple application to remember what to do and what you did. In the terminal, clutter free and completly unspectacular.

![Screenshot](https://github.com/shostakovich/Todo-Void/raw/master/screenshot.jpg)

## Installation

Todo-Void is a ruby gem. Its currently under heavy development and you should have a backup strategie for your todo-file ;)

	gem install todo-void
	

## Usage

Try these commands:

* t "Mow the lawn" (Add todo)
* t "Buy new stuff to read" --tags="vacation, reading" (Adds a todo with tags)
* t (Show all todos)
* t -s 41 (Start todo)
* t -f 41 (Finish todos)
* t -d 41 (Delete todos)

You may also look this up in the /features directory within the source code.

## Plans

Plans for the future are:

* Improvements
	* Recuring tasks (in a very simple way)
	* Edit todos
* Maybe some kind of cloud-sync / backup



