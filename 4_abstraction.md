---
title: "Abstraction"
---

Before we dive into some very basic text analysis--mostly word counts, collocation, word replacement etc--using Linux command lines tools with Bash, I want to touch on why we're starting with these tools as opposed to using an application like Voyant that has very similar capabilities.

## Textual abstraction

The results of text analysis techniques abstract us from the underlying text. That is to say that we're no longer working with the text itself in its entirety, but trying to understand it and component parts of it through, for example, a series of patterns. This has implications for how we understand the corpus that we're working with as well as the results that we're generating.

And when implemented through a machine learning process, we don't necessarily know what patterns are being used by the algorithm to connect entities in a text, which makes this abstraction that much more disconnected from the underlying text.

This abstraction is somewhat paradoxical. It provides otherwise unrealizable opportunities for discovery, while simultaneously limiting our understanding of the underlying corpus of text. It also--especially in the context of a learned, computed algorithm--limits our understanding of the tool conducting the analysis. The more these processes are automated, the easier they become, but the less we can say about the derived findings because the layers of abstraction limit our knowledge on how we got from the corpus to the results.

## Computational abstraction

This abstraction is mirrored in the hardware and software used to implement these techniques.

![abstracion visual](images/abstraction.png)

<br /><br />

Our data is all being managed by a series of electrical switches that are either on or off. These processes are abstracted into more complex hardware that hides this from the software engineer. The software that controls this hardware is extremely verbose and specific, for example identifying specific locations in your computer's memory where the next byte should be stored. So we have programming languages that abstract from the need for your average programmer to encode this level of detail--instead, they're provided with an environment in which to write a syntax that more closely resembles instructions we'd provide to another human being. This information is then compiled into its less abstracted form. As the programs that are developed increase in complexity alongside the environments in which they operate, they also are increasingly abstracted, and where once we would type `exit` or `quit` to get out of something, we now simply have an `x` icon that we click. The further we abstract, the further away we are from the underlying processes--and an understanding of what's happening.

## Why Bash

The hope is that by using linux command line tools, which give us more autonomy in part because they are less abstracted then a windowed application like Voyant, will provide greater insights into what is happening when we use other text analysis tools or when we interface with the outputs of text analyses. The tools and language used in these command lines tools also much more closely resembles what researchers are using when they engage in more complex research tasks with the NLP toolkits referenced earlier.
