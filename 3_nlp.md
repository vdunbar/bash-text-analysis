---
title: "Natural Language Processing"
---

All of the above are techniques that may be used in text analysis irrespective of method--human only, human with computer assistance, computer only. When we look at the latter implementation--computer only--we're moving into the field of Natural Language Processing. A number of Natural Language Toolkits have been developed to aid in the computational implementation of these techniques. Some of the more common toolkits you may see referenced in studies include:

* NLTK
* spaCy
* StanfordCoreNLP
* CogCompNLP
* MALLET (MAchine Learning for LanguagE Toolkit)

## Breaking things down

In a computational environment, working with text as data, one of the first things we might do with these toolkits is to atomize our text--break it down into its component parts, or to a level of granularity that allows us to ask of the data set what we need.

So, we might take the following...

<div class = "doc">
Because I could not stop for Death -,<br />
He kindly stopped for me -,<br />
The Carriage held but just Ourselves -,<br />
and Immortality
</div>

And start to record some metadata about it and deconstruct it, first by sentence...

| Line | Sentence |
| :--- | :--- |
| 1 | Because I could not stop for Death - |
| 2 | He kindly stopped for me - |
| 3 | The Carriage held but just Ourselves - |
| 4 | and Immortality |

And then by word if we wanted to get still more granular...

| Line | Word |
| :--- | :--- |
| 1 | Because |
| 1 | I |
| 1 | could|
| 1 | not |
| 1 | stop |
| 1 | for |
| 1 | Death |
| 2 | He |
| 2 | kindly |
| 2 | stopped |

This kind of approach would work well for things like frequency calculations and extraction or an initial analysis to get familiar with the text as a data set. This kind of approach also allows the text as data to be moved around, sorted etc.

## Finding patterns

We might also look for patterns and be in a position to have multiple texts across which to trace these patterns...

| Year | Candidate | Won (W) or Lost (L) the Popular Vote | Number of 'will', 'shall', 'going to' |
| :--- | :--- | :--- | :--- |
| 1960	| Kennedy	| W	| 163
| 1960	| Nixon	| L	| 122
| 1976	| Carter	| W	| 68
| 1976	| Ford	| L	| 32
| 1980	| Reagan	| W	| 19
| 1980	| Carter	| L	| 18
| ...	| ...	| ...	| ...

## Automated language processing

And lastly, we might try to automate the process through an algorithm designed to work with specific patterns.

The primary issue here, however, is that human language is notorious for breaking patterns. And we run into issues where we need to figure out--perhaps reliant on the techniques above--to have an algorithm know that when one says

```html
I have a tear...
```

They do not mean a saline droplet...

```html
I have a tear...
in my pants.
```

Or in the following...

```html
Text: The thieves stole the paintings. They were subsequently sold.

Human: Who or what was sold?

Machine: The paintings.
```

to be able to disambiguate between the the thieves and the paintings being sold.
