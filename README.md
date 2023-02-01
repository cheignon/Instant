# Instant
## Test for code review

⚠️⚠️⚠️ on this test I'm using a storyboard becasuse the project  it's small but never do that on the real project. You can use .xib file or better nothing (for UI file) and use the package    [""SnapKit""](https://github.com/SnapKit/SnapKit), it's very easy to use. And if you are okay with the autolayout I'm sure you will do not a mistake on the UI. More inforamtion about SnapKit the compilation time and the performance it's will be very hudge for you project ⚠️⚠️⚠️

## To optimize development time

 - codable :
    I'm using [quicktype.io](https://app.quicktype.io)
 - no use combine:
    I don't use combine because I don't want take time to debug event
- Alamofire:
    why I do that, because I don't want to re-write functionality of URLSession to make secure call... what I mean ... i dont make code to check server response ex: if server it 200 OK if it's 302 or 401 etc ...
- AlamofireImage:
    to optimize the cache for downloading ( sure it's not the best one ) but i need to make this test quickly so i take this one
- Rate limite for research:
    only 50 requests by days so change ApiKey if you need ...
    and 100 request for free acount
    
## Features

- display news of the day
- search news with key word

## improvment

- creat mock class to make UnitTest
- paging to make inifity scroll
- Unit Test ( but i can do if you want )
- Protect data like ApiKey
