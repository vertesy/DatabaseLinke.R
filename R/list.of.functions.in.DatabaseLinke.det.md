## List of Functions in DatabaseLinke.R (21) 
Updated: 2024/10/24 12:57
- #### 1 `openURLs.1by1()`
Open URLs One by One. This function opens provided links sequentially with an optional delay between each.  This can be useful for slower computers and to avoid triggering anti-robot measures in search engines.

- #### 2 `link_GeneCards()`
GeneCards Link Generator. Generates GeneCards URLs for a given list of gene symbols.

- #### 3 `link_ensembl_zebra()`
Zebrafish Ensembl Link Generator. Generates the latest Ensembl (GRC38) URLs for a given list of zebrafish gene symbols.

- #### 4 `link_ensembl_mice()`
Mouse Ensembl Link Generator. Generates the latest Ensembl (GRC38) URLs for a given list of mouse gene symbols.

- #### 5 `link_ensembl_zebra()`
Generate Zebrafish Ensembl Links. This function generates the latest Zebrafish Ensembl (GRC38) links for a list of gene symbols.

- #### 6 `link_ensembl()`
Generate Ensembl Links. This function generates the latest Ensembl (GRC38) links for a list of gene symbols.

- #### 7 `link_ensembl.grc37()`
Parse Ensembl GRC37 links. This function generates Ensembl GRC37 links for a list of gene symbols.

- #### 8 `link_uniprot_mice()`
Parse UNIPROT Links for Mice Genes. This function generates UNIPROT links for a list of mouse gene symbols.

- #### 9 `link_uniprot_human()`
Parse UNIPROT Links for Human Genes. This function generates UNIPROT links for a list of human gene symbols.

- #### 10 `link_uniprot_zebrafish()`
Parse UNIPROT Links for Zebrafish Genes. This function generates UNIPROT links for a list of zebrafish gene symbols.

- #### 11 `link_String()`
Parse STRING Database Links. This function generates links to the STRING protein interaction database for a list of gene symbols.

- #### 12 `qString()`
qString. Generates links to the STRING protein interaction database based on a given list of gene symbols. The function supports different organisms such as mice, humans, or "NA" for no specific organism.

- #### 13 `link_pubmed()`
link_pubmed. Generates links to the PUBMED database based on a given list of gene symbols and additional search terms.

- #### 14 `link_wikipedia()`
link_wikipedia. Generates Wikipedia search query links based on a given list of gene symbols.

- #### 15 `link_google()`
link_google. Parses Google search query links for a provided list of gene symbols.               The "prefix" and "suffix" will be searched for together with each gene (e.g., "Human ID4 neurons").               Uses google="http://www.google.com/search?as_q=".

- #### 16 `link_bing()`
link_bing. Parses Bing search query links for a provided list of gene symbols.

- #### 17 `# qHGNC()`
HGNC link generator and web lookup. Parses HGNC links for a provided list of gene symbols.

- #### 18 `link_wormbase()`
link_wormbase. Generate Wormbase database links for a list of gene symbols.

- #### 19 `link_MGI.JAX()`
link_MGI.JAX. Generate MGI JAX mouse genomics search query links for a list of gene symbols.

- #### 20 `link_SNPedia_clip2clip()`
link_SNPedia_clip2clip. Generate SNPedia links from a list of rsIDs copied from an Excel column.

- #### 21 `link_Franklin_clip2clip()`
link_Franklin_clip2clip. Generate Franklin (Genoox) links from a list of coordinates.

