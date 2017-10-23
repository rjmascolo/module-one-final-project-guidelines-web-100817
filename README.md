####          Restaurant Health Inspector!            ####

Basic Design:   RHI is designed to allow the user to find the health grade history
of a restaurant based on the name and location. Users will also be able to look up
restaurants near them with the most and least violations, and can specify a type
of cuisine if they prefer.

The score of the restaurant is pulled from the NYC health inspection information publicly available at https://data.cityofnewyork.us, as are the violation definitions and codes.

Neighborhood information is pulled from https://www.health.ny.gov/statistics/cancer/registry/appendix/neighborhoods.htm, and there is a neighborhood / zip-code table, so the user is able to find restaurants either by zip code or by neighborhood.  Neighborhoods are limited to those officially defined on the table above, and do not include small, loosely defined neighborhoods.

More information about health code assignments can be found here - http://www1.nyc.gov/assets/doh/downloads/pdf/rii/how-we-score-grade.pdf


Contributors: Ryan Mascolo, Dick Ward
