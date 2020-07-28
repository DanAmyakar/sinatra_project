1) Need to rewrite migration for ship captains
    -changed migration from create_usrs to captains
    -updated user model to captain model
    -updated migration for ships to captain_id and removed connex_id

2) need to rewrite ships miration w/o connexes
    -removed connex migration
    -renamed connex_slots to cargo_slots

3) Nedd to remove all mention of connexes
    -removed connex model
    -removed connex controller

4) Need to rewrite app controller from sessions[:user_id] to [:captain_id]
    -Updated app controller to reflect users as captains
    -Rewrote user controller to captain controller and updated methods
    
5) need to remove existing 'views'

6) need to write out a welcome page

7) welcome page should have captains name if logged in

8) need to be able to log out

9) after loggin in should return to home page

10) after logging out should return to home page and not display captain name

11) when logged in should have a link for 'view my ships'

12) 'view my ships' should display the ships for that captain only

13) should be able to add a new ship

14) each ship should be a link to that ships page

15) should be able to delete that ship when its viewed

16) should show the manifest of that ship

17) each page should have a home button/link

18) each page should have a logout button/link

