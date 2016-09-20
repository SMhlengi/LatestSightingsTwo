using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Revamp_LatestSightings
{
    public class Image
    {
	    public string  contributor {get;set;}
	    public string original {get;set;}
	    public string eightyBYeighty {get;set;}
	    public string sixFiftyBYsixFifty {get;set;}
	    public bool display {get;set;}
	    public DateTime dateAdded {get;set;}
	    public DateTime dateModified {get;set;}
	    public string animal {get;set;}
	    public string activity {get;set;}
	    public string area {get;set;}
	    public string tags {get;set;}
        public string generalComment { get; set; }
        public string title { get; set; }
    }
}