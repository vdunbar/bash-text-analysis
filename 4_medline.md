---
title: Medline
---

## ALM @ NLM

**Automated Language Processing @ the National Library of Medicine (NLM)**

Many examples of human language breaking patterns exist. One timely example that impacts our work as librarians is the MEDLINE 2022 Initiative. 

**MEDLINE 2022 Initiative: Transition to Automated Indexing**

Medical Subject Heading (MeSH) indexing is the task of assigning relevant MeSH terms/controlled vocabulary based on a manual reading of scholarly publications by human indexers. The task is important for improving literature retrieval and for many other scientific investigations in biomedical research including complex evidence syntheses.  

Because of its manual nature, the process of MeSH indexing has been both time-consuming and costly. It is estimated that new articles are not immediately indexed until 2 or 3 months after publication--a time frame that is not absolute--and that said process is quite costly--[approximately ten dollars per article](doi.org/10.1186/s13326-017-0123-3). 

The National Library of Medicine launched the MEDLINE 2022 initiative in 2018 which is a five-year plan to ensure that "MEDLINE continues to evolve to meet the needs of users in an age of data-driven discovery.  A key goal of this initiative involved implementing a range of indexing methods to ensure the timely assignment of MeSH to MEDLINE citations." [1]

Automated MeSH indexing has been under development at NLM for many years and the most significant outcome is the development of the [Medical Text Indexer](https://lhncbc.nlm.nih.gov/ii/tools/MTI.html) (MTI) by researchers in the [Lister Hill National Center for Biomedical Communications](https://lhncbc.nlm.nih.gov/). 

MTI is not new; it has been used to provide indexing suggestions for human indexers since 2002 and was incorporated as the "first line" of indexing with subsequent human curation for a set of journals starting in 2011. Automated indexing with a version of MTI has been used for comments since 2016, OLDMEDLINE citations since 2015, and for processing an experimental batch of backlogged citations in 2016. Since 2018, the method of indexing has been identified in the XML of all completed citations.

## MTI Process Flow Diagram

<br /><br />

![](https://ii.nlm.nih.gov/MTI/images/MTI_Processing_Flow_75pct.png)

<br /><br />

[There is a lot going on with the Medical Text Indexer](https://lhncbc.nlm.nih.gov/ii/tools/MTI/Medical_Text_Indexer_Processing_Flow.pdf) including many of the text analysis techniques previously described. The process is called Clustering and Ranking3. The MeSH headings produced by all of the Indexing Initiative (II) methods are clustered and then formed into a single, final list of recommended indexing terms which is this clustering and ranking process. 

A high level view of the steps involved in the processing is as follows: 
 
1. Load and summarize individual path results calculating the term weights 
2. Clustering of the results determining which of the results are related
3. Ranking the results using the information obtained in 1 and 2 to compute the rank of each item 

The MTI algorithm has been undergoing refinements in recent years as the NLM moves towards automation, including incorporation of deep learning approaches to improve the application of MeSH subheadings, the incorporation of rules and triggers for the indexing of Publication Types, and the application of IM designation.

<div class = "note">
**Note**

The origin of the designation IM and NIM comes from the time when terms describing major points of that article were printed in Index Medicus. IM meant printed in Index Medicus and NIM meant not printed in Index Medicus. IM terms are the main point of the article, while NIM terms are secondary terms supporting the major points of the article. IMN concepts are designated by an asterisk--`*`.
</div>

The version of MTI used for current automated indexing is called MTIA, and it is being applied to citations from a variety of journals. Human curation of MTIA-indexed citations originally involved a scan of all citations indexed by MTIA but has been modified to focus curation on specific sets of citations (e.g., those involving genes and proteins) to scale curation and to ensure that indexed terms are correct and irrelevant terms are not indexed.

By mid-2022 the NLM expects that all citations indexed for MEDLINE will be indexed by MTIA, with human curation applied as indicated.

## Implications of NLP Algorithms

The move towards completely automated indexing has implications for our work as librarians supporting research. First, there is the potential to perpetuate equity issues over time. In fact, our colleague Dean Giustini is currently doing an analysis of automated indexing with faculty at the iSchool. They are comparing human indexed records in MEDLINE to AI indexed records. Dean has commented that the impact of AI creating new subject headings and correcting errors may impact how certain medical information is retrieved (or not) and how bias inherent in these tools will impact marginalized people. 

The other issue is the ability to rely on complex search strategies using a combination of keywords and MeSH for systematic, scoping, rapid, and other reviews. The rigour by which these searches are constructed depend somewhat highly on appropriately applied indexing. 

A few examples of misapplied subject headings:

* Papers in rehabilitation sciences  looking at anatomical calves indexed with “cattle”
* White matter in the brain indexed with “residential characteristics for European ancestry”
* Articles about medical residents indexed with the subject heading “long term care residents”
* The Randomized Controlled Trial publication type being misapplied. This study type in particular is important for systematic reviews of randomized controlled trials. 

<br /><br />

[1] <span class = "citation">NLM Technical Bulletin. [MEDLINE 2022 Initiative: Transition to Automated Indexing](https://www.nlm.nih.gov/pubs/techbull/nd21/nd21_medline_2022.html). 2021 Nov-Dec;(443):e5.</span>
