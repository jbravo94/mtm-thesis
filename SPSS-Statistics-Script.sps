* Encoding: UTF-8.
GET FILE="./HealthDesk-Fragebogen.sav".

VARIABLE LEVEL q0001 TO q0014 (ORDINAL).
VARIABLE LEVEL q0016 (ORDINAL).
EXECUTE.

ALTER TYPE  p0001(F1) p0002(F1) p0003(F1) p0004(F1).
EXECUTE.
RECODE  q0014
	(1 THRU 2 = 0) (3 THRU 4 = 1)
	INTO acceptance .

VARIABLE LABELS acceptance "Dichotomized Acceptance".
EXECUTE.

VALUE LABELS
acceptance
0 "Accepts the proposed portal."
1 "Does not accept the proposed portal.".
EXECUTE.

COMPUTE noacceptance = -acceptance + 1.

VARIABLE LABELS noacceptance "Dichotomized No-Acceptance".
EXECUTE.

VALUE LABELS
noacceptance
0 "Does not accept the proposed portal."
1 "Accepts the proposed portal.".
EXECUTE.


VARIABLE LABELS
q0001 "I am feeling confident using my computer.".

VALUE LABELS
q0001
1 "Strongly agree"
2 "Agree"
3 "Disagree"
4 "Strongly disagree"
5 "Does not apply".
EXECUTE.

VARIABLE LABELS
q0002 "I am feeling confident while using communication apps like Skype, iChat, Slack, Messenger, Whatsapp.".

VALUE LABELS
q0002
1 "Strongly agree"
2 "Agree"
3 "Disagree"
4 "Strongly disagree"
5 "Does not apply".
EXECUTE.

VARIABLE LABELS
q0003 "I value the use of health care portals like SV Online, Docfinder or SVA Online.".

VALUE LABELS
q0003
1 "Strongly agree"
2 "Agree"
3 "Disagree"
4 "Strongly disagree"
5 "Does not apply".
EXECUTE.

VARIABLE LABELS
q0004 "I feel the distance to my doctor mostly unacceptable".

VALUE LABELS
q0004
1 "Strongly agree"
2 "Agree"
3 "Disagree"
4 "Strongly disagree"
5 "Does not apply".
EXECUTE.

VARIABLE LABELS
q0005 "I feel the waiting time at my doctor’s place mostly unacceptable.".

VALUE LABELS
q0005
1 "Strongly agree"
2 "Agree"
3 "Disagree"
4 "Strongly disagree"
5 "Does not apply".
EXECUTE.

VARIABLE LABELS
q0006 "I wish to have the possibility to order my receipt online.".

VALUE LABELS
q0006
1 "Strongly agree"
2 "Agree"
3 "Disagree"
4 "Strongly disagree"
5 "Does not apply".
EXECUTE.

VARIABLE LABELS
q0007 "I suffer from a chronic disease such as circulatory problems, chronic inflammations or psychological disorders which need a medical treatment.".

VALUE LABELS
q0007
1 "Strongly agree"
2 "Agree"
3 "Disagree"
4 "Strongly disagree"
5 "Does not apply".
EXECUTE.

VARIABLE LABELS
q0008 "I would rather use one portal for my health services instead of many with different credentials.".

VALUE LABELS
q0008
1 "Strongly agree"
2 "Agree"
3 "Disagree"
4 "Strongly disagree"
5 "Does not apply".
EXECUTE.

VARIABLE LABELS
q0009 "I would rather use an all-in-one healthcare portal if it is simple to use.".

VALUE LABELS
q0009
1 "Strongly agree"
2 "Agree"
3 "Disagree"
4 "Strongly disagree"
5 "Does not apply".
EXECUTE.

VARIABLE LABELS
q0010 "I would like to use a tool, which simplifies the administration of my health.".

VALUE LABELS
q0010
1 "Strongly agree"
2 "Agree"
3 "Disagree"
4 "Strongly disagree"
5 "Does not apply".
EXECUTE.

VARIABLE LABELS
q0011 "I would do administrative tasks myself (e.g. the request for a receipt) to speed up the process.".

VALUE LABELS
q0011
1 "Strongly agree"
2 "Agree"
3 "Disagree"
4 "Strongly disagree"
5 "Does not apply".
EXECUTE.

VARIABLE LABELS
q0012 "I think the presented all-in-one portal is useful.".

VALUE LABELS
q0012
1 "Strongly agree"
2 "Agree"
3 "Disagree"
4 "Strongly disagree".
EXECUTE.

VARIABLE LABELS
q0013 "I think the presented all-in-one portal is easy to use.".

VALUE LABELS
q0013
1 "Strongly agree"
2 "Agree"
3 "Disagree"
4 "Strongly disagree".
EXECUTE.

VARIABLE LABELS
q0014 "I would accept the presented all-in-one portal for usage.".

VALUE LABELS
q0014
1 "Strongly agree"
2 "Agree"
3 "Disagree"
4 "Strongly disagree".
EXECUTE.

VARIABLE LABELS
q0015 "Gender".

VALUE LABELS
q0015
1 "Male"
2 "Female".
EXECUTE.

VARIABLE LABELS
q0016 "Age".

VALUE LABELS
q0016
1 "<= 25 Years"
2 "26 - 35 Years"
3 "36 - 45 Years"
4 "46 - 55 Years"
5 "56 - 65 Years"
6 "66 <= Years".
EXECUTE.

VARIABLE LABELS
q0017 "Highest education".

VALUE LABELS
q0017
1 "No graduation"
2 "Compulsory school (Pflichtschule)"
3 "College (Fachschule)"
4 "School leaving examination (Matura)"
5 "University/UAS".
EXECUTE.

VARIABLE LABELS
q0018 "Profession".

VALUE LABELS
q0018
1 "Pupil"
2 "Student"
3 "Employee"
4 "Worker"
5 "Entrepreneur"
6 "Retired"
7 "Incapacitated"
8 "Unemployed".
EXECUTE.

VARIABLE LABELS
q0019 "State of residence".

VALUE LABELS
q0019
1 "Vienna"
2 "Lower Austria"
3 "Upper Austria"
4 "Burgenland"
5 "Styria"
6 "Carinthia"
7 "Salzburg"
8 "Tyrol"
9 "Vorarlberg".
EXECUTE.

RECODE  q0007
	(3 THRU 5 = 0) (1 THRU 2 = 1)
	INTO chronicdiseases .

RECODE q0001 q0002 q0003 q0004 q0005 q0006 q0008 q0009 q0010 q0011 (5=SYSMIS). 
EXECUTE. 

VARIABLE LABELS chronicdiseases "Dichotimized Patients with chronic diseases".
EXECUTE.

VALUE LABELS
chronicdiseases
0 "Does not suffer a chronic condition."
1 "Suffers from a chronic condition.".
EXECUTE.


COMPUTE nochronicdiseases = -chronicdiseases + 1.

VALUE LABELS
nochronicdiseases
0 "Suffers from a chronic condition."
1 "Does not suffer a chronic condition.".
EXECUTE.


VARIABLE LABELS nochronicdiseases "Dichotimized Patients with no chronic diseases".
EXECUTE.

VARIABLE LEVEL chronicdiseases (NOMINAL).
VARIABLE LEVEL nochronicdiseases (NOMINAL).

COMPUTE surveyfinished = NVALID(p0001) + NVALID(p0002) + NVALID(p0003) + NVALID(p0004).
VARIABLE LABELS surveyfinished "surveyfinished".
EXECUTE.

RECODE  surveyfinished
	(0 = 1) (ELSE = 0) .
EXECUTE.

SELECT IF (surveyfinished <> 0).


TITLE 'Tests within group'.

FREQUENCIES VARIABLES=q0001 q0002 q0003 q0004
  /STATISTICS=MEDIAN MODE 
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=q0005 q0006 q0008 chronicdiseases
  /STATISTICS=MEDIAN MODE 
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=q0009 q0010 q0011
  /STATISTICS=MEDIAN MODE 
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=q0012 q0013 q0014 
  /STATISTICS=MEDIAN MODE 
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=q0015 q0016 q0017 q0018 q0019  
  /STATISTICS=MEDIAN MODE 
  /ORDER=ANALYSIS.


*Nonparametric Tests: One Sample. 
NPTESTS 
  /ONESAMPLE TEST (q0014) KOLMOGOROV_SMIRNOV(NORMAL=SAMPLE ) 
  /MISSING SCOPE=ANALYSIS USERMISSING=EXCLUDE
  /CRITERIA ALPHA=0.05 CILEVEL=95.

*Nonparametric Tests: One Sample. 
NPTESTS 
  /ONESAMPLE TEST (q0013) KOLMOGOROV_SMIRNOV(NORMAL=SAMPLE ) 
  /MISSING SCOPE=ANALYSIS USERMISSING=EXCLUDE
  /CRITERIA ALPHA=0.05 CILEVEL=95.

*Nonparametric Tests: One Sample. 
NPTESTS 
  /ONESAMPLE TEST (q0012) KOLMOGOROV_SMIRNOV(NORMAL=SAMPLE ) 
  /MISSING SCOPE=ANALYSIS USERMISSING=EXCLUDE
  /CRITERIA ALPHA=0.05 CILEVEL=95.

EXAMINE VARIABLES=q0014 q0013 q0012 
  /PLOT BOXPLOT STEMLEAF NPPLOT 
  /COMPARE GROUPS 
  /STATISTICS DESCRIPTIVES 
  /CINTERVAL 95 
  /MISSING LISTWISE 
  /NOTOTAL.

 NONPAR CORR 
  /VARIABLES=q0014 q0012 q0013 q0001 q0002 q0003 q0004 q0005 q0006 chronicdiseases q0008 q0009 q0010 q0011 q0016
  /PRINT=SPEARMAN TWOTAIL NOSIG 
  /MISSING=PAIRWISE.

RELIABILITY
  /VARIABLES=q0008 q0009 q0010
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.

COMPUTE trendforsimplicity = MEDIAN(q0008, q0009, q0010).

VALUE LABELS
trendforsimplicity
1 "Strongly agree"
2 "Agree"
3 "Disagree"
4 "Strongly disagree".
EXECUTE.

VARIABLE LABELS trendforsimplicity "Trend for simplicity".
VARIABLE LEVEL trendforsimplicity (ORDINAL).
EXECUTE.

FREQUENCIES VARIABLES=trendforsimplicity
  /STATISTICS=MEDIAN MODE 
  /ORDER=ANALYSIS.

NONPAR CORR 
  /VARIABLES=trendforsimplicity
  /PRINT=SPEARMAN TWOTAIL NOSIG 
  /MISSING=PAIRWISE.

* Chart Builder. 
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=q0014 COUNT()[name="COUNT"] MISSING=LISTWISE 
    REPORTMISSING=NO 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: q0014=col(source(s), name("q0014"), unit.category()) 
  DATA: COUNT=col(source(s), name("COUNT")) 
  GUIDE: axis(dim(1), label("I would accept the presented all-in-one portal for usage.")) 
  GUIDE: axis(dim(2), label("Count")) 
  GUIDE: text.title(label("Simple Bar Count of I would accept the presented all-in-one portal ", 
    "for usage.")) 
  GUIDE: text.footnote(label("Error Bars: 95% CI")) 
  SCALE: cat(dim(1), include("1.00", "2.00", "3.00", "4.00")) 
  SCALE: linear(dim(2), include(0)) 
  ELEMENT: interval(position(q0014*COUNT), shape.interior(shape.square)) 
END GPL.

* Chart Builder.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=acceptance COUNTCI(95)[name="COUNTCI_95"
    LOW="COUNTCI_95_LOW" HIGH="COUNTCI_95_HIGH"] MISSING=LISTWISE REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: acceptance=col(source(s), name("acceptance"), unit.category())
  DATA: COUNT=col(source(s), name("COUNTCI_95"))
  DATA: LOW=col(source(s), name("COUNTCI_95_LOW"))
  DATA: HIGH=col(source(s), name("COUNTCI_95_HIGH"))
  GUIDE: axis(dim(1), label("I would accept the presented all-in-one portal for usage."))
  GUIDE: axis(dim(2), label("Count"))
  GUIDE: text.title(label("Simple Bar Count of I would accept the presented all-in-one portal ",
    "for usage."))
  GUIDE: text.footnote(label("Error Bars: 95% CI"))
  SCALE: cat(dim(1), include("0.00", "1.00"))
  SCALE: linear(dim(2), include(0))
  ELEMENT: interval(position(acceptance*COUNT), shape.interior(shape.square))
  ELEMENT: interval(position(region.spread.range(acceptance*(LOW+HIGH))), shape.interior(shape.ibeam))
END GPL.

FREQUENCIES VARIABLES=acceptance
  /ORDER=ANALYSIS.

*Nonparametric Tests: One Sample. 
NPTESTS 
  /ONESAMPLE TEST (acceptance) BINOMIAL(TESTVALUE=0.75 CLOPPERPEARSON SUCCESSCATEGORICAL=LIST(0) SUCCESSCONTINUOUS=CUTPOINT(MIDPOINT)) 
  /MISSING SCOPE=ANALYSIS USERMISSING=EXCLUDE 
  /CRITERIA ALPHA=0.05 CILEVEL=95.

*Nonparametric Tests: One Sample. 
NPTESTS 
  /ONESAMPLE TEST (noacceptance) BINOMIAL(TESTVALUE=0.25 CLOPPERPEARSON SUCCESSCATEGORICAL=LIST(0) SUCCESSCONTINUOUS=CUTPOINT(MIDPOINT)) 
  /MISSING SCOPE=ANALYSIS USERMISSING=EXCLUDE 
  /CRITERIA ALPHA=0.05 CILEVEL=95.

TITLE 'Tests between groups'.

CROSSTABS 
  /TABLES=q0001 q0002 q0003 q0004 q0005 q0006 q0008 q0009 q0010 q0011 q0012 q0013 q0014 q0015 q0016 
    q0017 q0018 q0019 trendforsimplicity BY chronicdiseases 
  /FORMAT=AVALUE TABLES 
  /CELLS=COUNT ROW COLUMN TOTAL 
  /COUNT ROUND CELL.
 
*Nonparametric Tests: Independent Samples. 
NPTESTS 
  /INDEPENDENT TEST (q0001 q0002 q0003 q0004 q0005 q0006 q0008 q0009 q0010 trendforsimplicity q0011 q0012 q0013 q0014 
    q0016) GROUP (chronicdiseases) MANN_WHITNEY 
  /MISSING SCOPE=ANALYSIS USERMISSING=EXCLUDE
  /CRITERIA ALPHA=0.05  CILEVEL=95.

TITLE "Does not suffer from a chronic condition".

FILTER BY nochronicdiseases. 
EXECUTE.

FREQUENCIES VARIABLES=q0001 q0002 q0003 q0004
  /STATISTICS=MEDIAN MODE 
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=q0005 q0006 q0008 
  /STATISTICS=MEDIAN MODE 
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=q0009 q0010 q0011
  /STATISTICS=MEDIAN MODE 
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=q0012 q0013 q0014 
  /STATISTICS=MEDIAN MODE 
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=q0015 q0016 q0017 q0018 q0019  
  /STATISTICS=MEDIAN MODE 
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=trendforsimplicity
  /STATISTICS=MEDIAN MODE 
  /ORDER=ANALYSIS.

RELIABILITY
  /VARIABLES=q0008 q0009 q0010
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.

* Chart Builder. 
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=q0014 COUNT()[name="COUNT"] MISSING=LISTWISE 
    REPORTMISSING=NO 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: q0014=col(source(s), name("q0014"), unit.category()) 
  DATA: COUNT=col(source(s), name("COUNT")) 
  GUIDE: axis(dim(1), label("I would accept the presented all-in-one portal for usage.")) 
  GUIDE: axis(dim(2), label("Count")) 
  GUIDE: text.title(label("Simple Bar Count of I would accept the presented all-in-one portal ", 
    "for usage.")) 
  GUIDE: text.footnote(label("Error Bars: 95% CI")) 
  SCALE: cat(dim(1), include("1.00", "2.00", "3.00", "4.00")) 
  SCALE: linear(dim(2), include(0)) 
  ELEMENT: interval(position(q0014*COUNT), shape.interior(shape.square)) 
END GPL.

* Chart Builder.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=acceptance COUNTCI(95)[name="COUNTCI_95"
    LOW="COUNTCI_95_LOW" HIGH="COUNTCI_95_HIGH"] MISSING=LISTWISE REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: acceptance=col(source(s), name("acceptance"), unit.category())
  DATA: COUNT=col(source(s), name("COUNTCI_95"))
  DATA: LOW=col(source(s), name("COUNTCI_95_LOW"))
  DATA: HIGH=col(source(s), name("COUNTCI_95_HIGH"))
  GUIDE: axis(dim(1), label("I would accept the presented all-in-one portal for usage."))
  GUIDE: axis(dim(2), label("Count"))
  GUIDE: text.title(label("Simple Bar Count of I would accept the presented all-in-one portal ",
    "for usage."))
  GUIDE: text.footnote(label("Error Bars: 95% CI"))
  SCALE: cat(dim(1), include("0.00", "1.00"))
  SCALE: linear(dim(2), include(0))
  ELEMENT: interval(position(acceptance*COUNT), shape.interior(shape.square))
  ELEMENT: interval(position(region.spread.range(acceptance*(LOW+HIGH))), shape.interior(shape.ibeam))
END GPL.

*Nonparametric Tests: One Sample. 
NPTESTS 
  /ONESAMPLE TEST (acceptance) BINOMIAL(TESTVALUE=0.75 CLOPPERPEARSON SUCCESSCATEGORICAL=LIST(0) SUCCESSCONTINUOUS=CUTPOINT(MIDPOINT)) 
  /MISSING SCOPE=ANALYSIS USERMISSING=EXCLUDE 
  /CRITERIA ALPHA=0.05 CILEVEL=95.

*Nonparametric Tests: One Sample. 
NPTESTS 
  /ONESAMPLE TEST (noacceptance) BINOMIAL(TESTVALUE=0.25 CLOPPERPEARSON SUCCESSCATEGORICAL=LIST(0) SUCCESSCONTINUOUS=CUTPOINT(MIDPOINT)) 
  /MISSING SCOPE=ANALYSIS USERMISSING=EXCLUDE 
  /CRITERIA ALPHA=0.05 CILEVEL=95.

EXAMINE VARIABLES=q0003 q0004 q0011 q0016 
  /PLOT BOXPLOT 
  /COMPARE GROUPS 
  /STATISTICS DESCRIPTIVES 
  /CINTERVAL 95 
  /MISSING LISTWISE 
  /NOTOTAL.

FILTER OFF.
USE ALL.
EXECUTE.

FILTER BY chronicdiseases. 
EXECUTE.

TITLE "Suffers from a chronic condition".

FREQUENCIES VARIABLES=q0001 q0002 q0003 q0004
  /STATISTICS=MEDIAN MODE 
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=q0005 q0006 q0008 
  /STATISTICS=MEDIAN MODE 
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=q0009 q0010 q0011
  /STATISTICS=MEDIAN MODE 
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=q0012 q0013 q0014 
  /STATISTICS=MEDIAN MODE 
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=q0015 q0016 q0017 q0018 q0019  
  /STATISTICS=MEDIAN MODE 
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=trendforsimplicity
  /STATISTICS=MEDIAN MODE 
  /ORDER=ANALYSIS.

RELIABILITY
  /VARIABLES=q0008 q0009 q0010
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.

* Chart Builder. 
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=q0014 COUNT()[name="COUNT"] MISSING=LISTWISE 
    REPORTMISSING=NO 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: q0014=col(source(s), name("q0014"), unit.category()) 
  DATA: COUNT=col(source(s), name("COUNT")) 
  GUIDE: axis(dim(1), label("I would accept the presented all-in-one portal for usage.")) 
  GUIDE: axis(dim(2), label("Count")) 
  GUIDE: text.title(label("Simple Bar Count of I would accept the presented all-in-one portal ", 
    "for usage.")) 
  GUIDE: text.footnote(label("Error Bars: 95% CI")) 
  SCALE: cat(dim(1), include("1.00", "2.00", "3.00", "4.00")) 
  SCALE: linear(dim(2), include(0)) 
  ELEMENT: interval(position(q0014*COUNT), shape.interior(shape.square)) 
END GPL.

* Chart Builder.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=acceptance COUNTCI(95)[name="COUNTCI_95"
    LOW="COUNTCI_95_LOW" HIGH="COUNTCI_95_HIGH"] MISSING=LISTWISE REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: acceptance=col(source(s), name("acceptance"), unit.category())
  DATA: COUNT=col(source(s), name("COUNTCI_95"))
  DATA: LOW=col(source(s), name("COUNTCI_95_LOW"))
  DATA: HIGH=col(source(s), name("COUNTCI_95_HIGH"))
  GUIDE: axis(dim(1), label("I would accept the presented all-in-one portal for usage."))
  GUIDE: axis(dim(2), label("Count"))
  GUIDE: text.title(label("Simple Bar Count of I would accept the presented all-in-one portal ",
    "for usage."))
  GUIDE: text.footnote(label("Error Bars: 95% CI"))
  SCALE: cat(dim(1), include("0.00", "1.00"))
  SCALE: linear(dim(2), include(0))
  ELEMENT: interval(position(acceptance*COUNT), shape.interior(shape.square))
  ELEMENT: interval(position(region.spread.range(acceptance*(LOW+HIGH))), shape.interior(shape.ibeam))
END GPL.

*Nonparametric Tests: One Sample. 
NPTESTS 
  /ONESAMPLE TEST (acceptance) BINOMIAL(TESTVALUE=0.75 CLOPPERPEARSON SUCCESSCATEGORICAL=LIST(0) SUCCESSCONTINUOUS=CUTPOINT(MIDPOINT)) 
  /MISSING SCOPE=ANALYSIS USERMISSING=EXCLUDE 
  /CRITERIA ALPHA=0.05 CILEVEL=95.

*Nonparametric Tests: One Sample. 
NPTESTS 
  /ONESAMPLE TEST (noacceptance) BINOMIAL(TESTVALUE=0.25 CLOPPERPEARSON SUCCESSCATEGORICAL=LIST(0) SUCCESSCONTINUOUS=CUTPOINT(MIDPOINT)) 
  /MISSING SCOPE=ANALYSIS USERMISSING=EXCLUDE 
  /CRITERIA ALPHA=0.05 CILEVEL=95.

EXAMINE VARIABLES=q0003 q0004 q0011 q0016 
  /PLOT BOXPLOT 
  /COMPARE GROUPS 
  /STATISTICS DESCRIPTIVES 
  /CINTERVAL 95 
  /MISSING LISTWISE 
  /NOTOTAL.

FILTER OFF.
USE ALL.
EXECUTE.


