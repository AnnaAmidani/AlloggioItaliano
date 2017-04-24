<!-- ONE STEP TO INSTALL DATE & TIME STAMP:

   1.  Paste the coding into the BODY of your HTML document  -->

<!-- STEP ONE: Copy this code into the BODY of your HTML document  -->

<BODY>

<CENTER>
<SCRIPT LANGUAGE="JavaScript">

<!-- This script and many more are available free online at -->
<!-- The JavaScript Source!! http://javascript.internet.com -->

<!-- Begin
Stamp = new Date();
year = Stamp.getYear();
if (year < 2000) year = 1900 + year;
document.write('<font size="2" face="Arial"><B>' + (Stamp.getMonth() + 1) +"/"+Stamp.getDate()+ "/"+ year + '</B></font><BR>');
var Hours;
var Mins;
var Time;
Hours = Stamp.getHours();
if (Hours >= 12) {
Time = " P.M.";
}
else {
Time = " A.M.";
}
if (Hours > 12) {
Hours -= 12;
}
if (Hours == 0) {
Hours = 12;
}
Mins = Stamp.getMinutes();
if (Mins < 10) {
Mins = "0" + Mins;
}  
document.write('<font size="2" face="Arial"><B>' + Hours + ":" + Mins + Time + '</B></font>');
// End -->
</SCRIPT>
</CENTER>

<p><center>
<font face="arial, helvetica" size="-2">Free JavaScripts provided<br>
by <a href="http://javascriptsource.com">The JavaScript Source</a></font>
</center><p>

<!-- Script Size:  0.97 KB  -->

