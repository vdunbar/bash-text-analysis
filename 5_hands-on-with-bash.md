---
title: "Hands on with Bash"
---

The following is heavily based on the tutorial authored by William J Turkel, Professor of History at The University of Western Ontario, and available at [https://williamjturkel.net/2013/06/15/basic-text-analysis-with-command-line-tools-in-linux/](https://williamjturkel.net/2013/06/15/basic-text-analysis-with-command-line-tools-in-linux/)

## Set up

First things first, we need to launch our terminal app--on a Mac simply navigate to your applications launch Terminal, on a PC start to type `bash` into the start menu text prompt and you should see your Git Bash application pop up.

Second we'll get ourselves set up with a place to work. For this we'll revisit the `cd`--change directory--and `mkdir`--makedirectory--command line tools to create a directory called `Silver-Fleece` on our desktop and place ourselves in that folder.

```bash
cd ~/Desktop

mkdir Silver-Fleece

cd Silver-Fleece
```

## Getting content

We need to get some textual content to work with. For this exercise, we'll download a plain text copy W. E. B. Du Bois' *The Quest of the Silver Fleece*, from Project Gutenberg using `curl`, adn then `ls` to confirm it's in our folder.

The url for the plain text version is `https://www.gutenberg.org/cache/epub/15265/pg15265.txt`

```bash
curl https://www.gutenberg.org/cache/epub/15265/pg15265.txt -o silver-fleece.txt

ls
```

## First look

Having learned a little bit about file encodings, plain text, and some of the nuances in how things like end of lines are handled, the first view of our text we'll want is to know something about its encoding. We can do this with `file`.

```bash
file silver-fleece.txt
```

This tells us that our file is UTF-8 encoded, which is good, and that line endings use a carriage return *and* line feed; this latter piece suggests to us that this file was generated on a Windows PC as Linux and Mac OS expect only a line feed when denoting the end of a line. When moving text files across operating systems, this is an importnat thing to note. We'll look at how we can replace `crlf` line endings with just `lf`.

As we did in the first workshop, we'll start by just looking at the head and tail of the file...

```bash
head silver-fleece.txt

tail silver-fleece.txt
```

## Initial clean up

As is common in text files, there will be content that we don't want to analyze--in this case, the book contains header and footer information about Project Gutenberg, information that we should strip from the file. We'll use the `less` command to paginate through the content to figure out where the header and footer begin and end--the `-N` flag will also give us the line numbers.

```bash
less -N silver-fleece.txt
```

What we see is that the header content runs to line 19 inclusive--line 23 inclusive if we don't want blank lines, and that book ends with line 14523, so we want to strip out lines 14524 through to the end of the book which is at line 14891. To do this, we're going to use `sed`--the stream editor. `sed` is very powerful command line tool for manipulating plain text files.

Before we start making changes to our data set though, we should back it up. Remember, file extensions are simply part of the file name, and when managing plain text files, we can use the extensions to signify the role of particular file.

```bash
cp silver-fleece.txt silver-fleece.bkp

ls
```

First we remove the footer...

```bash
sed '14524,14891d' silver-fleece.txt > silver-fleece-no-footer.txt
```

We're seeing a couple of new things here. First we should note that `sed` is being given an argument in the format of two line numbers seperated by a comma followed by a `d` for delete. It is then being directed to a file to which to apply this argument. Finally, the greater than character `>` directs the output to another file. By default `sed` directs output to your console; it doesn't actually overwrite the file we're working with. It is possible to direct `sed` to overwrite the file, but there are many reasons why we might want to store each of our changes in a new file, for example for error detection and resolution.

To remove the header, we'll similarly apply the following

```bash
sed '1,23d' silver-fleece-no-footer.txt > silver-fleece-trimmed.txt
```

Now, how do we know we've been successful? To view the results, we can use `head` and `tail`.

```bash
head silver-fleece-trimmed.txt

tail silver-fleece-trimmed.txt
```

## Basic stats

We can also compare line, word, and byte counts with `wc`--word count. We'll use truncation to get a report on all of the files we've created so far.

```bash
wc silver*
```

We can also get just the line and word counts with the flags `-l` and `-w`.

```bash
wc -l silver*

wc -w silver*
```

## Looking for words

We'll start with something that resembles collocation or concordance. But this requires an introduction to `grep`--g = global, re = regular expression, p = print. And likely really most importantly, the `re` section of `grep`. `grep` looks through files, finds all instances of a regular expression, and prints the results.

Regular expressions are simply sequences of characters to match. These characters may be metacharacters or literal characters. For example, `grep b somefile.txt` would look for the letter `b` as a stand-alone character in `somefile.txt`, where as `grep b. somefile.txt` would search for the letter `b` followed by any characters, as `.` is a metacharacter that matches any character other than a newline. This kind of general operator is something we're fairly used to. Regular expressions also allow us to mix and match metacharacters and literal characters. For example `[a-z]` matches all lower case letters from a - z.

Let's start with something simple though, and only look for literal characters. We'll start by looking for the word `cotton`, using the flag `-n` so that we also get the line number in the printed output.

```bash
grep -n 'cotton' silver-fleece-trimmed.txt
```

To make this easier to read, we'll run the same command, but with the addition of the `-color` flag.

```bash
grep -n --color 'cotton' silver-fleece-trimmed.txt
```

Much like Markdown requires an application to process the content to translate the structure into a visual representation of that structure that we read, a regular expression--or regex--processor translates the regular expression syntax into a representation that can be executed on a file--`grep` is one such processor. And just like with Markdown, where there are multiple falvours that support extended syntaxes, there are regex processors that support extended implementations. So while the basics are fairly standard, the actual implementation might differ from application to application.

I bring this up because `grep` is case sensitive. We can see this by replacing `cotton` with `Cotton`.

```bash
grep -n --color 'Cotton' silver-fleece-trimmed.txt
```

`egrep` is an alternative regex processor--the `e` standing for `extended`. `egrep` supports some additional arguments, for example allowing us to `OR` literal characters with the use of parentheses--`()--and pipes--`|`. So the following will be case insensitive.

```bash
egrep -n --color '(C|c)otton' silver-fleece-trimmed.txt
```

## More data preparation

From the above, we might imagine that it would be useful to clean our data set a little more before analyzing it. It is not uncommon in text analysis to do things like converting all text to lower case and removing punctuation, excess white space etc... In fact, for things like word frequencies etc, a non-case sensitive data set will be more robust. So, we'll start by removing all punctuation and converting all uppercase characters to lower case characters. Luckily, to aid in this, there a regex patterns that make this relatively easy.

While `grep` is a convenient tool for printing our query to the screen, `grep` does not actually alter the underlying data. There are several command line tools that we could use to achieve this--including `sed` which we've already seen--but for these next couple of tasks, we'll use `tr`--translate characters--as it's slightly simpler to use. `tr` also works a little differently than the other command line tools we've seen so far in terms of how we feed it arguments and direct those arguments to files. We'll be using both the lesser than--`<`--and greater than--`>` symbols to indicate the input file and then the output file to apply our arguments to.

First, we remove the punctuation, using the `-d` flag for delete, and the `[:punct:]` regular expression to represent all punctuation

```bash
tr -d [:punct:] < silver-fleece-trimmed.txt > silver-fleece-nopunct.txt
```

While this approach is simple, it is flawed. For now, we won't concern ourselves with rectifying this flaw, but we should see what's happened

```bash
egrep -n --color '(C|c)otton' silver-fleece-nopunct.txt
```

Next, we'll replace all upper case characters with lower case characters, giving `tr` two regex strings to match and swap using `[:upper:]` and `[:lower:]`.

```bash
tr [:upper:] [:lower:] < silver-fleece-nopunct.txt > silver-fleece-lowercase.txt
```

At this stage, we've seen collocation and concordance in a simple form. With our data a little cleaner now, we can start to address frequencies, extraction and classification.

## Classification

At it's simplest, classification might be seen as lumping synonymous terms together.

## Frequency & Extraction

Frequency and extraction begin with getting our data into something that resembles tabular format, in this case, a single column with one word per row, as we saw with the Emily Dickinson poem. To do this, we need to replace all spaces in our text with a newline character. Now, we'll recall that currently newlines in this file are encoded as `crlf`

```bash
file silver-fleece-lowercase.txt
```

A `cr` is encoded in the file as the non printed `\r`, and the `lf` as the non printed `\n`. Since we're working in Linux or Unix environments, we'll start by standardizing this by deleting all instances of the `\r` character

```bash
tr -d '\r' < silver-fleece-lowercase.txt  > silver-fleece-lowercase-lf.txt
```

We can always verify this

```bash
file silver-fleece-lowercase-lf.txt
```

and then we'll replace all spaces between our words with the non printed `\n` character

```bash
tr ' ' '\n' < silver-fleece-lowercase-lf.txt > silver-fleece-oneword.txt
```

Again, we can see what we've done with `head`

```bash
head silver-fleece-oneword.txt
```

Now that things are organized this way, we can identify unique instances and sort things. First, we sort

```bash
sort silver-fleece-oneword.txt > silver-fleece-sorted.txt
```

And then we do a word frequency analysis

```bash
uniq -c silver-fleece-sorted.txt > silver-fleece-unique.txt
```

And we can use less to view our content

```bash
less silver-fleece-unique.txt 
```

## Pipes

One thing that Bash lets us do is to pass the output from one command to another. We do this with a pipe--`|`--character. So instead of saving our `uniq` output to a file and then reading it back in again with `less` we can save a few steps by piping the results of our call to `uniq` dircetly to `less`--better yet, we can first pipe it back to `sort` with the `-r` flag to reverse the oder to see the most frequent words before piping it to less.

```bash
uniq -c silver-fleece-sorted.txt | sort -r | less
```

