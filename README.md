# Flix

Flix is an app that allows users to browse movies from the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

## Flix Part 2

### User Stories

#### REQUIRED (10pts)
- [x] (5pts) User can tap a cell to see more details about a particular movie.
- [x] (5pts) User can tap a tab bar button to view a grid layout of Movie Posters using a CollectionView.

#### BONUS
- [x] (2pts) User can tap a poster in the collection view to see a detail screen of that movie.
- [x] (2pts) In the detail view, when the user taps the poster, a new screen is presented modally where they can view the trailer.

### App Walkthrough GIF
![](https://media.giphy.com/media/OXf76aextC7zNgx2sl/giphy.gif)

![](https://i.imgur.com/r02CuP9.gif)


### Notes
Describe any challenges encountered while building the app.

---

## Flix Part 1

### User Stories

#### REQUIRED (10pts)
- [x] (2pts) User sees an app icon on the home screen and a styled launch screen.
- [x] (5pts) User can view and scroll through a list of movies now playing in theaters.
- [x] (3pts) User can view the movie poster image for each movie.

#### BONUS
- [x] (2pt) User can view the app on various device sizes and orientations.
- [x] (1pt) Run your app on a real device.

### App Walkthrough GIF
GIF to show different device sizes and orientations:

![](https://i.imgur.com/D54EDs5.gif)


![](https://i.imgur.com/UH5ZG0R.gif)



### Notes
Describe any challenges encountered while building the app.

I had trouble running the app from Xcode on my iPhone. I went to CodePath's discussion and Apple forums to find the root of this problem. After adding a development team and changing my Bundle Identifier, it kept saying “iPhone is not available. Please reconnect the device.” no matter how many times I tried reconnecting my phone and running the app. I tried updating my preferences in Xcode to Xcode 12.2 in the Command Lines Tools but it still didn't work. Eventually, I looked at Xcode's Window > Devices and Stimulators and saw that the error listed was that I needed to update Xcode to a newer version in order to support my iPhone's iOS 14.4.2.
