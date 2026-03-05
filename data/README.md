# Data for Replication of Pirates and Patents Replication

## by Petra Moser

This folder includes the following datasets

## Data Files for Figures and Tables

1.  `Brit_patents_app_sealed1617-1938.xlsx`: manually collected data on patents sealed and applications between 1617 and 1938. This data is at the year level.

2.  `rpat100513.xls`: Dataset on number of exhibits, countries, and prize data for 1815 and 1876 exhibits. Data is at the country-year level

    -   `id`: country ID

    -   `country`: Name of country

    -   `year`: Year is exhibit. Can be either 1851 or 1876

    -   `council`: Refers to the number of Gold Council medals received by a country in the exhibit of that year

    -   `prize`: Refers to the number of silver prizes received by a country in the exhibit of that year

    -   `honor`: Refers to the number of bronce prizes received by a country in the exhibit of that year

    -   `pleng`: Patent length per country per exhibit year

    -   `plengext`: Patent length extension per country per exhibit year

    -   `pfee`: Patent fee per country per exhibit year

    -   `pop`: population per country

    -   `gdpmad`: GDP data from Madison per country in thousands

    -   `gdpmadpc`: GDP per capita from Madison per country in thoudanss. This variable is missing some values. We recommend you compute your own GDP per capita by dividing gdpmad / pop

    -   `class[xx]`: these columns are the number of exhibits per industry class per country per exhibit year. To see which class is which, please refer to the file readme.doc in the exhibit_data folder

    -   `coun[xx]`, `prix[xx]`, `hon[xx]`: These columns refer to the number of prizes and medals won across exhibits per industry class

    -   `medall`: Total number of medals across council, primal, and honall.

    -   `counall`: Total number of council medals received by the exhibitors of a country

    -   `prizall`: Total number of prizes received by the exhibitors of a country

    -   `honall`: Total number of honors received by the exhibitors of a country

3.  `pat_prize_sciam_cit.dta`: Identifies prize winninf exhibits on the *Scientific American* publication

    -   `year`: grant year of patent

    -   `class1`: Refers to the main class by USPTO of the invention

    -   `subclass1`: Main subclass by USPTO of the invention

    -   `t1X`: equals 1 if invention is a prize-winning exhibit at the Crystal Palace exhibition in 1851

    -   `t2X`: equals 1 if invention is exhibited on the *Schientific American*

    -   `ps`: equals 1 if innovation is patented

4.  `usa1851_JO90724.xls`: Exhibit data for US exhibits. Each row is an exhibit.

    -   `Exhibit`: Exhibit number as coded in catalogue. It's a unique number per row

    -   `City`: Exhibitor's city of origin

    -   `Population`: City population in thousands

    -   `State`: Exhibitor's state of origin

    -   `Description`: Brief description of the exhibit

    -   `Award`: Number of awards (medals for gold, bronze, and silver) for the exhibit

    -   `Patents`: If different from 0, the exhibit was patented

    -   `Industry`: Industry number as coded in read_me_Britain1851.doc

    -   `Patented`: 1 if patented, 0 otherwise

    -   `Patentno`: patent number

    -   `Year of issue`: Year when it was patented

5.  `Britain1851.xls`: Exhibit data for British exhibits. Each row is an exhibit

    -   `number`: Exhibit number as coded in catalogue. It's a unique number per row

    -   `name`: Name of exhibitor. Either inventor or organization that represents the invention

    -   `address`: Street associated with `name`

    -   `city`: Exhibitor's city of origin

    -   `population`: City population in thousands

    -   `country`: Exhibitor's country of origin in Britain: Scotland, N. Ireland, England, etc.

    -   `award`: Number of awards (medals for gold, bronze, and silver) for the exhibit

    -   `reference_to_patent`: If different from 0, the exhibit was patented

    -   `description`: Brief description of the exhibit

    -   `industryclass`: Industry number as coded in read_me_Britain1851.doc

6.  `industry.dta`: Industry labels per class number as coded in read_me_Britain1851.doc

    -   `industry class`: matches `industry class` variable in Britain1851.xls and `Industry` in usa1851_JO90724.xls.

    -   `industry`: more general industry number. Several industry class numbers match a same industry in industry variable

    -   `ind_lbl`: Name of the industry (Label)

7.  `rpat508rep.xlsx`: Number of innovations by country

    -   `country`: Country where the invention originated

    -   `year`: Year of scientific exhibition. Either 1851 for the Crystal Palace exhibit or 1876 for the Centennial Exhibit of San Francisco

    -   `pleng`: Length of intellectual property rights

    -   `pop`: Population in millions of each country

    -   `gdpmad`: Country's GDP as computed by Mad

    -   `gdpmadpc`: GDP per capita

    -   Remaining columns are the industry and number of patents per industry in that country

8.  `sewing_machines906022.xls`, sheet: `Tab sm pat total pat`: Number of British and US patents per year along with the share of sewing-machine patents per country per year. British patents don't include tables and stands and US patents exclude attachments and tables Between 1850 and 1885, a total of 4,563 patents were granted in the USPTO main class 112 (“sewing”). From these data, we exclude patents for ancillary inventions, including “attachments” (subclasses 101 and 122 to 153) and “table and stands” (subclass 217). Final sample contains 3,508 patents issued between 1850 and 1885. We also compare our data with sewing machine patents in Knight’s (1877) Mechanical Dictionary. Knight includes 337 additional patents, but few of them are for improvements in sewing machines; 42 percent of Knight’s additional patents are for tables and stands, 26 percent are miscellaneous parts such as bobbin winders and tension devices. To measure changes in invention in the absence of a pool, we construct a complementary data set of 1,493 British patents between 1850 and 1885 by searching A Cradle of Invention…for sewing machine patents.

    -   `Year`: Years between 1850 to 1885

    -   `British patents`: British patents per year on sewing machines

    -   `British Patents (less tables and stands): Total British patents on sewing machines less tables and stands

    -   `All British Patents`: Total British patents across inventions per year

    -   `Proportion`: British share of sewing machine patents (British Patents) over all British patents

    -   `British Proportion (less attachments and tables)...6`: British proportion of sewing machines (less attachments and tables) over all British patents

    -   `All US Patents`: All patents across inventions in the US per year

    -   `US Sewing Machine Parts (less attachments and tables)`: Number of sewing-machine patents in the US less attachments and tables per year

9.  `RJE_data140123.dta`: Data on number of patents per stitch type (chain or lock)

    -   `year`: Year of patent

    -   `subclass`: Subclass of patent by USPTO. Between 197 and 202 it's chain stitch. Between 181 and 196 is lock stitch.

    -   `total_count`: Total number of patents per subclass per year

10. `usa1851_census.xls`: US Exhibits for 1851 Great Exhibit in London

    -   `Exhibit`: Exhibit number

    -   `Name`: Exhibitor name

    -   `City`: City where exhibit was created

    -   `Population`: Population of exhibition city

    -   `State`: State of exhibit origin

    -   `Description`: Description of exhibit

    -   `Award`: Number of awards per exhibit

    -   `Award industry`: Industry in the catalogue

    -   `Patents`: Is different from 0, exhibit was patented

    -   `Industry`: Industry where innovation falls under the catalogue

    -   `Patented`: Equals to 1 if patented, 0 otherwise

11. `twea_data.dta`: Data on chemical subclasses by the USPTO between 1875 and 1939. Indicates subclasses with confiscated inventions under the Trading with the Enemy Act

    -   `uspto_class`: Class and subclass from USPTO

    -   `grntyr`: Year where patents were granted

    -   `count_usa`: Number of patents by American inventors in the USPTO class

    -   `count_france/germany`: Number of patents by French and German inventors

    -   `count`: Total number of patents granted in the class

    -   `count_for/noger/for_noger`: Number of patents by non-US inventors, non-German inventors, and foreigners non-US or German inventors, respectively.

    -   `year_conf`: Remaining lifetime of licensed patents at the time of licensig

    -   `count_cl`: Number of licenses in the subclass in all years

    -   `licensed/confiscated_class`: Equals 1 if there was a patent licensed or confiscated in that class

12. `class_year.dta`: Patent list of inventions patented in Germany by German and US inventors

    -   `class`: Patent class

    -   `year`: Year of patenting

    -   `nc`: Patent count

    -   `nc_foreign`: Count of patents by foreigners

    -   `nclic`: Equsl 1 if class was licensed

13. `PlantPat_DateMerge.dta`: Each row represents a plant innovation between 1930 and 1970.

    -   `patent number`: patent number

    -   `originator1`: Inventor name

    -   `gender1`: gender of inventor

    -   `originatorstate(x)`: State where the invention was created

    -   `rose`: Equals 1 if plant innovation is a rose

14. `20years.dta`: Opera-level data from 1781 to 1821. Includes only premiers

    -   `title`: Title of opera

    -   `year`: Year of performance

    -   `state`: Italian state where the opera was premiered

    -   `birth_place`: Birth place of composer

    -   `birth_state`: Birth state of composer

    -   `last_name`: Last name of composer

    -   `first_name`: First name of composer

    -   `birth/death_year`: Birth and death year of composer, respectively

    -   `annals`: Equals to 1 if the opera appeared in Loewenber's Annals of outstanding operas. This is one of the quality indicators.

    -   `amazon`: Equals to 1 if the opera is sold through Amazon.com. Captures longevity of popularity

    -   `city`: City of premier

    -   `theater`: Theater of premier

    -   `opera_sy`: number of operas per state and year

    -   `opera_sy_annals/amazon`: number of operas per state and year in Loewenberg's Annals and Amazon.com

15. `Fig 5.xlsx`: Shows when Italian composers living abroad migrated back to Italy

    -   `Composer`: Last name of composer

    -   `Date`: Year of return to Italy

16. `repeated_performances140405.dta`: Performance-level data for each opera per year. Shows the longevity in performances for each opera

    -   `state/city`: State and city of performance, respectively

    -   `prem_year`: Year of premier

    -   `year`: Year of performance

    -   `last_name`: Last name of composer

    -   `title`: Opera title

    -   `language`: Language of performance

    -   `theater`: Theater of performance

    -   `day/month`: Day and month of performance, respectively

    -   `type`: Type of opera (e.g. premier, repeat, revival)

    -   `longevity`: Number of years performing up to that year of performance. (e.g. year = 1800, prem_year = 1750, then longevity = 50)

17. `dat_rom_ecb_final.dta`: Data on poetry book publications and author information, including death year

    -   `year`: Calendar year

    -   `rawprice`: Price of book in that year

    -   `year_pub_old`: Year of first publication

    -   `author/title_old`: Age of author and book, respectively

    -   `title_text_old`: Name of book

    -   `author_text_old`: Name of author

    -   `genre_author`: Genre for which author is known

    -   `genre`: Genre of book

    -   `author_death_yr`: Year of death of the author

18. `books_data.dta`: Price data on book reproductions and number of citations per book

    -   `id`: Book ID

    -   `year_c`: Year of citation

    -   `name`: Book author

    -   `title`: Book title

    -   `city`: City where book is published

    -   `publisher`: Original publisher of book

    -   `field`: Scientific field of the book

    -   `cit_year`: Citations in a given year

    -   `year_from_early`: Year of publication

    -   `english/french/spanish/italian`: Equal 1 if book is in either of these languages, respectively each column

    -   `chemistry/mathematics`: Equal 1 if book is about chemistry/ math, respectively

19. `brp_dataset.dta`: Book Republication Program dataset

    -   `id`: Book ID
    
    -   `title`: Book title
    
    -   `name`: Book author name
    
    -   `year_c`: Citation year
    
    -   `field`: Scientific field of book
    
    -   `cit_year`: Total citations per year
    
    -   `brp`: Equals to 1 if book was republished under BRP
    
    -   `post`: Equals 1 if citation year is post-BRP
    
    -   `count_eng/ count_noneng`: English and Non-english citations, respectively
    
    -   `mathematics`: Equals 1 if the book was on mathematics
    
    -   `chem`: Equals 1 if the book was on chemistry
    
    -   `p_original`: Original price
    
    -   `p_reproduction`: Reproduction price
    
    -   `decl_perc`: Decline in price after reproduction
    
    -   `emigre_us`: Equals 1 if the book was written by a US emigre

20. `mos_citations`: Book citations from people featured in the Men of Science books

    -   `id`: Book ID
    
    -   `year_c`: Citation year
    
    -   `brp`: Equals to 1 if book was republished under BRP
    
    -   `count_eng`: Number of English citations
    
    -   `publ_year`: Year of publication
    
    -   `mathematics`: Equals 1 if the book was on mathematics
    
    -   `chem`: Equals 1 if the book was on chemistry
    
    -   `p_reproduction`: Reproduction price
    
    -   `emigre_us`: Equals 1 if the book was written by a US emigre

21. `libraries_books.dta`: Number of BRP and Swiss books per university

    -   `university`: Name of university
    
    -   `tot_brp`: Average number of BRP books
    
    -   `tot_swiss`: Average number of Swiss books
    
    -   `total_books`: Total average books (tot_brp + tot_swiss)

22. `libraries_cit_coord.dta`: Number of BRP citations with coordinates

    -   `latitude'/ `longitude`: Coordinates of place of citations to BRP book
    
    -   `count`: Citations per year
    
    -   `location`: Location name
    
    -   `type`: Equals 1 for citations and 0 for library
