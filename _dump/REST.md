# REST -- Representational State Transfer

---

[Roy Fielding -- Dissertation](http://www.ics.uci.edu/~fielding/pubs/dissertation/fielding_dissertation.pdf)

## p. 106, Table 5-1

<table border=0>
    <tr>
        <th>Data Element</th>
        <th>Modern Web Examples</th>
    </tr>
    <tr>
        <td>resource</td>
        <td>the intended conceptual target of a hypertext reference</td>
    </tr>
    <tr>
        <td>resource identifier</td>
        <td>URL, URN</td>
    </tr>
    <tr>
        <td>representation</td>
        <td>HTML document, JPEG image</td>
    </tr>
    <tr>
        <td>representation metadata</td>
        <td>media type, last-modified time</td>
    </tr>
    <tr>
        <td>resource metadata</td>
        <td>source link, alternates, vary</td>
    </tr>
    <tr>
        <td>control-data</td>
        <td>if-modified-since, cache-control</td>
    </tr>
</table>

- the key abstraction of information in REST is a resource
- any information that can be named can be a resource (document, image, temporal service)
- a resource is a conceptual mapping to a set of entities, not the entity that corresponds to the mapping at any particular point in time
- the values in the set may be *resource representations* or *resource identifiers*
- the mapping semantics of a resource are required to be static, since the semantics distinguish one resource from another
- a *representation* is a sequence of bytes, plus *representation metadata* to describe those bytes
- REST uses a *resource* identifier to identify the particular resource involved in an interaction between componenets.
- REST connectors provide a generic interface for accessing and manipulating the value set of a resource
- connectors present an abstract interface for component communication
    - enhancing simplicity by providing clean separation of concerns 
    - hiding the underlying implementation of resources and communication mechanisms
- all REST interactions are stateless    

    1. removes any need for the connectors to retain application state between requests, thus reducing consumption of physical resources, improving scalability
    1. it allows interactions to be processes in parallel without requiring that the processing mechanism understand the interactions semantics
    1. allows an intermediary to view and understand a request in isolation, maybe necessary when services are dynamically rearranged
    1. forces all of the information that might factor into the reusability of a cached response to be present in each request  
    
## p. 111, Table 5-2 -- REST connectors



