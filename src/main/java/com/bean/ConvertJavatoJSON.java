package com.bean;

import java.util.ArrayList;

import org.json.simple.JSONArray;

public class ConvertJavatoJSON {

	public static void main(String[] args) {
		  String a[]=new String[]
	    			 {"Comics","Superman","Batman","Spider-man","X-men","Captain America","Avengers","Naruto","Dragon Ball",
	    			 "Mystery","Gone Girl","The girl on the train","The Cuckoo's Calling","11/22/33","The Silkworm","Dark Places","Career of Evil","Big Little Lies",
	    			 "Romance","Twilight","Fifty Shades of Grey","The Hunger Games","Anna and the French Kiss","A Walk to Remember","Thirteen Reasons Why","Reasons to Breathe","Beautiful Disaster",
	    			 "Science Fiction","The Time Machine","2001: A Space Odyssey","Starship Troopers","The Host","Contact","Frankenstein","Doomsday Book","The Invisible Man",
	    			 "Short Story","Interpreters of Maldives","Tenth of December","Nine Stories","Dubliners","The Lottery","Dear Life","The Grownup","Get in Trouble",
	    			 "Biography","Steve Jobs","The Rise of Theodore Roosevelt","Benjamin Franklin: An American Life","Einstein:His Life and Universe","Teams of Rivals: The Genius of Abraham Lincoln","The Diary of A young Girl","Into The Wild","John Adams",
	    			 "Suspense","The Da Vinci Code","Shutter Island","Angels & Demons","Red Dragon","Mystic River","The Client","Killing Floor","Vigilante",
	    			 "Textbooks","Data Structure","Database Management System","Computer Networks","Computer Organisation","Operating System","Data Algorithms and Analysis","Theory of Computation","Engineering Mathematics"};
	      
	      JSONArray jsArray = new JSONArray();
	      for (int i = 0; i < a.length; i++) {
	         jsArray.add(a[i]);
	      }
	      System.out.println(jsArray);
	      
	}
}
