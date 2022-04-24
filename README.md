# Sqflite

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

In this project , I am working with Sqflite Database.

## Usage

    Insert
    
    void insertDb(String username, String password) async {
    SQLHelper.insert(username, password);
    print('user saved $username + $password');}
  
  
    get Items 
  
    void getItems() async {
    final rows = await SQLHelper.getItems();
    print('query all rows');
    rows.forEach(print);)
    
      
      
  
  
