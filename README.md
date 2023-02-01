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
    ⚠️ only 50 requests by days so change ApiKey if you need ...
    and 100 request for free acount
    
## Dont be affraid

- i make very very long class and protocol name , it's for your understanding how I'm coding, so normally the size of name's class or protocol it verry very very smaller thant 
what i do
    
## Features

- display news of the day
- search news with key word

## improvment

- creat mock class to make UnitTest
- paging to make inifity scroll
- Protect data like ApiKey
- Localisé les text fr erg etc..
- I don't found more unite test so maybe to be improve

#@ issue 
 - only half day to make the code ... so i'm sure on COPY/PAST in the CI/CD i'm bad
 - the UI make me lose time but i want make simple but not ugly app sorry
 - for unitTest except the model ... i don't found other unit test. i was started UI test but i thinnk it's too much
 - i think i use to much ``guard`` on this app so sorry
 - i try to make like a big project but i think it's will be incompressible for you... 
 - i try too limite me with SPM else you will see 15 lines of code 

## in real situation what i do normally
- make dev target with dev provisioning profile
- configure the CI file 
- normally when you make iOS App you have Android App ... so I will setup localization file over the  air, then generate a generator file for images, color , etc like that we are in the same level about the guideline
- i use RxSwift normally... but i saw the combine it's faster than Rx

## thank for your watching
- please if i not good for you... Can make me appointment to discuss about that because i want to learn 



