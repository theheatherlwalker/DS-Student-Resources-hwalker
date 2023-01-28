## Final Project Information

Welcome to the last project for the NoSQL course! Great job making it this far! This hands-on will be different from the hands-on projects you have previously seen in a couple of different ways. You will be putting together the numerous topics you have learned into one large project. It is designed to mimic real problems which you may face in your career, so it may be a challenge for you and will also take several hours.

Take this project step-by-step and be aware that the project description below is written to be a bit less specific than previous Hands-Ons. The hands-on is supposed to challenge you to do some problem solving to figure out how to accomplish a task. You can always review past lessons or use a Google search if needed. Good luck!

> [!Help] Additional Help!
> Before beginning this hands-on, you may want to watch this [recorded live workshop, "Winnie the Pooh and Databases Too,"](https://vimeo.com/428206689) that goes over a similar example.

> [!Caution] Caution!
> Do not submit your project until you have completed all requirements! You will not be able to resubmit.

> [!info] To Submit
> Be sure to zip and submit your `Lesson5handson` text document when finished! You will not be able to re-submit, so be sure the screenshots to each part are located within this document.

[Notes from Winnie The Pooh Databases Too](Notes%20from%20Winnie%20The%20Pooh%20Databases%20Too.md)
___
```toc
min_depth: 1
max_depth: 6
title: "## Table of Contents"
```
___
## Requirements

For this hands on, you will be working through several real-life scenarios within new collections. This Hands-On is structured into _two_ parts, and each part will ask you to run multiple queries. After each query, please take a screenshot and add it to a text document (or an equivalent) and name this file `Lesson5handson`. This way, you will be able to submit your answers to each part all at once.

___

# Part 1

You have just been hired at a startup company. They currently only have ten employees, but they need to be included in the database. So far, they have only been tracked within an excel sheet. Your boss would like you to create a new collection in Atlas named `employees`. Take a look at the following data and the notes listed below before inserting any data:

| Name | Birthday | Address | City | State | Position Name | Remote | Full Time |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Alison Davidson | 04/05/75 | 874 W. Oak Place | Gary | Indiana | Customer Support | Yes | Yes |
| Henry Chapelton | 09/29/80 | 9324 E. Vista Way | Tempe | Arizona | Customer Support | No | Yes |
| Alex Miller | 11/22/83 | 244 Price Road | Mesa | Arizona | Customer Support | No | No |
| Carly Nielson | 08/04/87 | 678 W. Westward Road | Phoenix | Arizona | Office Manager | No | Yes |
| Tom Talbot | 12/30/89 | 12 Oakland Way | Chandler | Arizona | Inventory Manager | No | Yes |
| Mary Crawley | 07/06/80 | 1010 Granite Way | Charlotte | North Carolina | Human Resources | Yes | Yes |
| Daisy Baxter | 09/09/87 | 990 E. 84th St. | Tempe | Arizona | CEO | No | Yes |
| William Coyle | 10/11/91 | 944 W. 16th St. | Phoenix | Arizona | Intern | No | No |
| Edith Bates | 07/28/90 | 7 E. 20th Pl. | Chandler | Arizona | Customer Support | No | Yes |
| Gwen Harding | 10/11/86 | 234 W. 48th. St. | Phoenix | Arizona | Office Assistent | No | Yes |

**Notes:**

- The `Birthday` field should have a data type of Date.
- The `Position Name`, `Remote`, and `Full Time` fields should be within an embedded document called `position`. 
	- `position.PositionName`
	- `position.Remote`
	- `position.FullTime` 
- `Remote` and `FullTime` fields should have boolean values.



## 1.1   Create `employees` database
```JSON
db.employees.insertMany([

{
name: "Alison Davidson",
birthday: new Date( "04/05/1975" ),
address: "874 W. Oak Place",
city: "Gary",
state: "Indiana",
position: { positionName: "Customer Support", remote: true, fullTime: true }
},

{
name: "Henry Chapelton",
birthday: new Date( "09/29/1980" ),
address: "9324 E. Vista Way",
city: "Tempe",
state: "Arizona",
position: { positionName: "Customer Support", remote: false, fullTime: true }
},

{
name: "Alex Miller",
birthday: new Date( "11/22/1983" ),
address: "244 Price Road",
city: "Mesa",
state: "Arizona",
position: { positionName: "Customer Support", remote: false, fullTime: false }
},

{
name: "Carly Nielson",
birthday: new Date( "08/04/1987" ),
address: "678 W. Westward Road",
city: "Phoenix",
state: "Arizona",
position: { positionName: "Office Manager", remote: false, fullTime: true }
},

{
name: "Tom Talbot",
birthday: new Date( "12/30/1989" ),
address: "12 Oakland Way",
city: "Chandler",
state: "Arizona",
position: { positionName: "Inventory Manager", remote: false, fullTime: true }
},

{
name: "Mary Crawley",
birthday: new Date( "07/06/1980" ),
address: "1010 Granite Way",
city: "Charlotte",
state: "North Carolina",
position: { positionName: "Human Resources", remote: true, fullTime: true }
},

{
name: "Daisy Baxter",
birthday: new Date( "09/09/1987" ),
address: "990 E. 84th St.",
city: "Tempe",
state: "Arizona",
position: { positionName: "CEO", remote: false, fullTime: true }
},

{
name: "William Coyle",
birthday: new Date( "10/11/1991" ),
address: "944 W. 16th St.",
city: "Phoenix",
state: "Arizona",
position: { positionName: "Intern", remote: false, fullTime: false }
},

{
name: "Edith Bates",
birthday: new Date( "07/28/1990" ),
address: "7 E. 20th Pl.",
city: "Chandler",
state: "Arizona",
position: { positionName: "Customer Support", remote: false, fullTime: true }
},

{
name: "Gwen Harding",
birthday: new Date( "10/11/1986" ),
address: "234 W. 48th. St.",
city: "Phoenix",
state: "Arizona",
position: { positionName: "Office Assistant", remote: false, fullTime: true }
}
]);
```
![](DS108-05-05%20-%20NoSQL%20-%20Lesson%205%20Hands-On%20-%201.1a.png)

```JSON
db.employees.find();
```
![](DS108-05-05%20-%20NoSQL%20-%20Lesson%205%20Hands-On%20-%201.1b.png)



## 1.2   Change document for `Alison Davidson`
It's been about a month since you have inserted all employees into the database. There have been a couple of changes to the company. 
The CEO decided that he no longer wants remote employees, so they have transferred the remote employees and they are now living in Arizona. 
- Alison Davidson now lives at `777 E. 1st St. # 120 Tempe, AZ` 

```JSON
db.employees.find({name: "Alison Davidson"});
```
![](DS108-05-05%20-%20NoSQL%20-%20Lesson%205%20Hands-On%20-%201.2a.png)

```JSON
db.employees.replaceOne({name: "Alison Davidson"},
{
name: "Alison Davidson",
birthday: new Date( "04/05/75" ),
address: "777 E. 1st St. # 120",
city: "Tempe",
state: "Arizona",
position: { positionName: "Customer Support", remote: false, fullTime: true }
});
```
![](DS108-05-05%20-%20NoSQL%20-%20Lesson%205%20Hands-On%20-%201.2b.png)

```JSON
db.employees.find({name: "Alison Davidson"});
```
![](DS108-05-05%20-%20NoSQL%20-%20Lesson%205%20Hands-On%20-%201.2c.png)



## 1.3   Change document for `Mary Crawley`
- Mary Crawley now lives at `8322 W. Vista Pl. Scottsdale, AZ`

```JSON
db.employees.find({name: "Mary Crawley"});
```
![](DS108-05-05%20-%20NoSQL%20-%20Lesson%205%20Hands-On%20-%201.3a.png)

```JSON
db.employees.replaceOne({name: "Mary Crawley"},
{
name: "Mary Crawley",
birthday: new Date( "07/06/80" ),
address: "8322 W. Vista Pl.",
city: "Scottsdale",
state: "Arizona",
position: { positionName: "Human Resources", remote: false, fullTime: true }
});
```
![](DS108-05-05%20-%20NoSQL%20-%20Lesson%205%20Hands-On%20-%201.3b.png)

```JSON
db.employees.find({name: "Mary Crawley"});
```
![](DS108-05-05%20-%20NoSQL%20-%20Lesson%205%20Hands-On%20-%201.3c.png)



## 1.4   Remove `state` field
Since all employees now all live in Arizona, there is no need to have a field named "state" within this collection, so please remove it.

```JSON
db.employees.updateMany( { }, { $unset: { state: "" }});
```
![](DS108-05-05%20-%20NoSQL%20-%20Lesson%205%20Hands-On%20-%201.4a.png)

```JSON
db.employees.find();
```
![](DS108-05-05%20-%20NoSQL%20-%20Lesson%205%20Hands-On%20-%201.4b.png)


## 1.5   Create index on `position` field / document
Lastly, they would like very efficient searching using the "position" field (remember that field includes a document with three other fields).

```json
db.employees.createIndex( { position: 1 });
```
![](DS108-05-05%20-%20NoSQL%20-%20Lesson%205%20Hands-On%20-%201.5a.png)

```json
db.employees.getIndexes();
```
![](DS108-05-05%20-%20NoSQL%20-%20Lesson%205%20Hands-On%20-%201.5b.png)



# Part 2

You are currently working for a company who wants to build an app similar to Spotify. Below is a list of data for different songs. Please insert this data into a new collection named `songs`.

| SongId | Title | Artist | Album | ReleaseYear |
| --- | --- | --- | --- | --- |
| 1 | Girls Just Want To Have Fun | Cyndi Lauper | She's So Unusual | 1983 |
| 2 | Hips Don't Lie | Shakira feat. Wyclef Jean | Oral Fixation Vol. 2 | 2006 |
| 3 | Poker Face | Lady Gaga | The Fame | 2008 |
| 4 | Wannabe | Spice Girls | Spice | 1996 |
| 5 | California Gurls | Katy Perry feat. Snoop Dogg | Teenage Dream | 2010 |
| 6 | Bye, Bye, Bye | NSYNC | No Strings Attached | 2000 |
| 7 | I Will Always Love You | Whitney Houston | I Will Always Love You: The Best of Whitney Houston | 2012 |
| 8 | Baby One More Time | Britney Spears | Baby One More Time | 1999 |
| 9 | Vogue | Madonna | I'm Breathless | 1990 |
| 10 | Rolling in the Deep | Adele | 21 | 2011 |
| 11 | 1234 | Feist | The Reminder | 2007 |
| 12 | Elastic Heart | Sia | The Hunger Games: Catching Fire Soundtrack | 2015 |
| 13 | Oops! I Did It Again | Britney Spears | Oops! I Did It Again | 2000 |
| 14 | Bad Romance | Lady Gaga | The Fame Monster | 2009 |
| 15 | Lose Control | Missy Elliot | The Cookbook | 2005 |
| 16 | U Can't Touch This | MC Hammer | Please Hammer, Don't Hurt 'Em | 1990 |
| 17 | Thriller | Michael Jackson | Thriller | 1982 |
| 18 | Single Ladies | Beyonce | I am... Sasha Fierce | 2008 |
| 19 | Rhythm Nation | Janet Jackson | Janet Jackson's Rhythm Nation 1814 | 1989 |

**Notes:**

- The `artist`, `album`, and `releaseYear` fields should be an embedded document named `details`.
- Be sure that the `songId` and `releaseYear` fields have a type of number.


## 2.1   Create `songs` database
```JSON
db.songs.insertMany([

{
"songId": 1,
"title": "Girls Just Want To Have Fun",
"details" : { "artist" : "Cyndi Lauper",
"album": "She's So Unusual",
"releaseYear": 1983
}},

{
"songId": 2,
"title": "Hips Don't Lie",
"details" : { "artist" : "Shakira feat. Wyclef Jean",
"album": "Oral Fixation Vol. 2",
"releaseYear": 2006
}},

{
"songId": 3,
"title": "Poker Face",
"details" : { "artist" : "Lady Gaga",
"album": "The Fame",
"releaseYear": 2008
}},

{
"songId": 4,
"title": "Wannabe",
"details" : { "artist" : "Spice Girls",
"album": "Spice",
"releaseYear": 1996
}},

{
"songId": 5,
"title": "California Gurls",
"details" : { "artist" : "Katy Perry feat. Snoop Dogg",
"album": "Teenage Dream",
"releaseYear": 2010
}},

{
"songId": 6,
"title": "Bye, Bye, Bye",
"details" : { "artist" : "NSYNC",
"album": "No Strings Attached",
"releaseYear": 2000
}},

{
"songId": 7,
"title": "I Will Always Love You",
"details" : { "artist" : "Whitney Houston",
"album": "I Will Always Love You: The Best of Whitney Houston",
"releaseYear": 2012
}},

{
"songId": 8,
"title": "Baby One More Time",
"details" : { "artist" : "Britney Spears",
"album": "Baby One More Time",
"releaseYear": 1999
}},

{
"songId": 9,
"title": "Vogue",
"details" : { "artist" : "Madonna",
"album": "I'm Breathless",
"releaseYear": 1990
}},

{
"songId": 10,
"title": "Rolling in the Deep",
"details" : { "artist" : "Adele",
"album": "21",
"releaseYear": 2011
}},

{
"songId": 11,
"title": "1234",
"details" : { "artist" : "Feist",
"album": "The Reminder",
"releaseYear": 2007
}},

{
"songId": 12,
"title": "Elastic Heart",
"details" : { "artist" : "Sia",
"album": "The Hunger Games: Catching Fire Soundtrack",
"releaseYear": 2015
}},

{
"songId": 13,
"title": "Oops! I Did It Again",
"details" : { "artist" : "Britney Spears",
"album": "Oops! I Did It Again",
"releaseYear": 2000
}},

{
"songId": 14,
"title": "Bad Romance",
"details" : { "artist" : "Lady Gaga",
"album": "The Fame Monster",
"releaseYear": 2009
}},

{
"songId": 15,
"title": "Lose Control",
"details" : { "artist" : "Missy Elliot",
"album": "The Cookbook",
"releaseYear": 2005
}},

{
"songId": 16,
"title": "U Can't Touch This",
"details" : { "artist" : "MC Hammer",
"album": "Please Hammer, Don't Hurt 'Em",
"releaseYear": 1990
}},

{
"songId": 17,
"title": "Thriller",
"details" : { "artist" : "Michael Jackson",
"album": "Thriller",
"releaseYear": 1982
}},

{
"songId": 18,
"title": "Single Ladies",
"details" : { "artist" : "Beyonce",
"album": "I am... Sasha Fierce",
"releaseYear": 2008
}},

{
"songId": 19,
"title": "Rhythm Nation",
"details" : { "artist" : "Janet Jackson",
"album": "Janet Jackson's Rhythm Nation 1814",
"releaseYear": 1989
}}
]);
```
![](DS108-05-05%20-%20NoSQL%20-%20Lesson%205%20Hands-On%20-%202.1a.png)

```JSON
db.songs.find();
```
![](DS108-05-05%20-%20NoSQL%20-%20Lesson%205%20Hands-On%20-%202.1b.png)

## 2.2   Rename `title` field
Next, your company has run into some things they would like to be changed within the database:
- The `title` field needs to be renamed to `songTitle`, so it is clearer to the developers working with the data.

```JSON
db.songs.updateMany( { } , { $rename: { 'title': 'songTitle' } });
```
![](DS108-05-05%20-%20NoSQL%20-%20Lesson%205%20Hands-On%20-%202.2a.png)

```JSON
db.songs.find();
```
![](DS108-05-05%20-%20NoSQL%20-%20Lesson%205%20Hands-On%20-%202.2b.png)

## 2.3   Move `artist` field outside embedded `details` document
- They would like to have the `artist` field to be outside the `details` document but the `album` and `releaseYear` should stay within that document.

```JSON
db.songs.updateMany( { } , { $rename: { 'details.artist': 'artist' } });
```
![](DS108-05-05%20-%20NoSQL%20-%20Lesson%205%20Hands-On%20-%202.3a.png)

```JSON
db.songs.find();
```
![](DS108-05-05%20-%20NoSQL%20-%20Lesson%205%20Hands-On%20-%202.3b.png)