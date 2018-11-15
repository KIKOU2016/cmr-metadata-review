DEFAULT_STUB_HEADERS={'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}

DEPENDENT_URL="#{Cmr.get_cmr_base_url}/search/collections.echo10?concept_id=C1000000020-LANCEAMSR2"
DEPENDENT_BODY="<?xml version=\"1.0\" encoding=\"UTF-8\"?><results><hits>1</hits><took>9</took><result concept-id=\"C1000000020-LANCEAMSR2\" revision-id=\"8\" format=\"application/echo10+xml\">\n<Collection>\n<ShortName>Test_ShortName</ShortName>\n<VersionId>0</VersionId>\n<InsertTime>2015-05-01T13:26:43Z</InsertTime>\n<LastUpdate>2015-09-14T13:26:43Z</LastUpdate>\n<LongName>NRT AMSR2 DAILY L3 GLOBAL SNOW WATER EQUIVALENT EASE-GRIDS</LongName>\n<DataSetId>NRT AMSR2 DAILY L3 GLOBAL SNOW WATER EQUIVALENT EASE-GRIDS V0</DataSetId>\n<Description>The Advanced Microwave Scanning Radiometer 2 (AMSR2) instrument on the Global Change Observation Mission - Water 1 (GCOM-W1) provides global passive microwave measurements of terrestrial, oceanic, and atmospheric parameters for the investigation of global water and energy cycles.  Near real-time (NRT) products are generated within 3 hours of the last observations in the file, by the Land Atmosphere Near real-time Capability for EOS (LANCE) at the AMSR Science Investigator-led Processing System (AMSR SIPS), which is collocated with the Global Hydrology Resource Center (GHRC) DAAC.  The GCOM-W1 AMSR2 Level-3 Snow Water Equivalent (SWE) data set contains snow water equivalent (SWE) data and quality assurance flags mapped to Northern and Southern Hemisphere 25 km Equal-Area Scalable Earth Grids (EASE-Grids).  Data are stored in HDF-EOS5 format and are available via HTTP from the EOSDIS LANCE system at https://lance.nsstc.nasa.gov/amsr2-science/data/level3/daysnow/R00/hdfeos5/.  If data latency is not a primary concern, please consider using science quality products.  Science products are created using the best available ancillary, calibration and ephemeris information.  Science quality products are an internally consistent, well-calibrated record of the Earth's geophysical properties to support science.  The AMSR SIPS plans to start producing initial AMSR2 standard science quality data products in late 2015 and they will be available from the NSIDC DAAC.  Notice: All LANCE AMSR2 data should be used with the understanding that these are preliminary products.  Cross calibration with AMSR-E products has not been performed.  As updates are made to the L1R data set, those changes will be reflected in this higher level product.</Description>\n<CollectionDataType>NEAR_REAL_TIME</CollectionDataType>\n<Orderable>false</Orderable>\n<Visible>true</Visible>\n<ProcessingLevelId>3</ProcessingLevelId>\n<ArchiveCenter>GHRC</ArchiveCenter>\n<CitationForExternalPublication>Tedesco, M., J. Jeyaratnam, and R. Kelly. 2015. NRT AMSR2 Daily L3 Global Snow Water Equivalent EASE-Grids [indicate subset used]. Dataset available online, [https://lance.nsstc.nasa.gov/amsr2-science/data/level3/daysnow/R00/hdfeos5/] from NASA LANCE AMSR2 at the GHRC DAAC Huntsville, Alabama, U.S.A. doi: http://dx.doi.org/10.5067/AMSR2/A2_DySno_NRT</CitationForExternalPublication><Price>0.0</Price><SpatialKeywords>\n<Keyword>GLOBAL</Keyword></SpatialKeywords><TemporalKeywords>\n<Keyword>DAILY</Keyword></TemporalKeywords><Temporal><RangeDateTime>\n<BeginningDateTime>2015-05-01T00:00:00Z</BeginningDateTime></RangeDateTime></Temporal><Contacts><Contact>\n<Role>GHRC USER SERVICES</Role><OrganizationEmails>\n<Email>ghrc-dmg@itsc.uah.edu</Email></OrganizationEmails></Contact></Contacts><ScienceKeywords><ScienceKeyword>\n<CategoryKeyword>EARTH SCIENCE</CategoryKeyword>\n<TopicKeyword>CRYOSPHERE</TopicKeyword>\n<TermKeyword>SNOW/ICE</TermKeyword><VariableLevel1Keyword>\n<Value>SNOW WATER EQUIVALENT</Value></VariableLevel1Keyword></ScienceKeyword><ScienceKeyword>\n<CategoryKeyword>EARTH SCIENCE</CategoryKeyword>\n<TopicKeyword>TERRESTRIAL HYDROSPHERE</TopicKeyword>\n<TermKeyword>SNOW/ICE</TermKeyword><VariableLevel1Keyword>\n<Value>SNOW WATER EQUIVALENT</Value></VariableLevel1Keyword></ScienceKeyword></ScienceKeywords><Platforms><Platform>\n<ShortName>GCOM-W1</ShortName>\n<LongName>GCOM-W1</LongName>\n<Type>SATELLITE</Type><Instruments><Instrument>\n<ShortName>AMSR2</ShortName><Sensors><Sensor>\n<ShortName>AMSR2</ShortName></Sensor></Sensors></Instrument></Instruments></Platform></Platforms>\n<AdditionalAttributes>\n<AdditionalAttribute>\n<Name>identifier_product_doi</Name>\n<DataType>STRING</DataType>\n<Description>product DOI</Description>\n<Value>10.5067/AMSR2/A2_DySno_NRT</Value>\n</AdditionalAttribute>\n<AdditionalAttribute>\n<Name>identifier_product_doi_authority</Name>\n<DataType>STRING</DataType>\n<Description>DOI authority</Description>\n<Value>http://dx.doi.org</Value>\n</AdditionalAttribute>\n</AdditionalAttributes>\n<Campaigns><Campaign>\n<ShortName>LANCE</ShortName></Campaign></Campaigns><OnlineAccessURLs><OnlineAccessURL>\n<URL>https://lance.nsstc.nasa.gov/amsr2-science/data/level3/daysnow/R00/hdfeos5/</URL><URLDescription></URLDescription><MimeType></MimeType></OnlineAccessURL></OnlineAccessURLs><OnlineResources><OnlineResource>\n<URL>https://lance.itsc.uah.edu/amsr2-science/data/level3/daysnow/R00/hdfeos5/</URL><Description></Description>\n<Type>Alternate Data Access</Type></OnlineResource><OnlineResource>\n<URL>https://lance.nsstc.nasa.gov/amsr2-science/browse_png/level3/daysnow/R00/</URL><Description></Description>\n<Type>Browse</Type></OnlineResource><OnlineResource>\n<URL>https://worldview.earthdata.nasa.gov/</URL><Description></Description>\n<Type>Worldview Imagery</Type></OnlineResource><OnlineResource>\n<URL>http://lance.nsstc.nasa.gov/</URL><Description></Description>\n<Type>Homepage</Type></OnlineResource><OnlineResource>\n<URL>http://lance.nsstc.nasa.gov/amsr2-science/doc/LANCE_A2_DySno_NRT_dataset.pdf</URL><Description></Description>\n<Type>Guide</Type></OnlineResource><OnlineResource>\n<URL>http://dx.doi.org/10.5067/AMSR2/A2_DySno_NRT</URL><Description></Description>\n<Type>DOI</Type></OnlineResource><OnlineResource>\n<URL>http://ghrc.nsstc.nasa.gov/uso/citation.html</URL><Description></Description>\n<Type>Citing GHRC Data</Type></OnlineResource></OnlineResources><AssociatedDIFs><DIF>\n<EntryId>A2_DySno_NRT</EntryId></DIF></AssociatedDIFs><Spatial><SpatialCoverageType>Horizontal</SpatialCoverageType><HorizontalSpatialDomain><Geometry>\n<CoordinateSystem>CARTESIAN</CoordinateSystem></Geometry></HorizontalSpatialDomain>\n<GranuleSpatialRepresentation>CARTESIAN</GranuleSpatialRepresentation></Spatial>\n<MetadataStandardName>ECHO</MetadataStandardName>\n<MetadataStandardVersion>10</MetadataStandardVersion>\n</Collection></result></results>"
DEPENDENT_HEADER={"date"=>["Mon, 20 Feb 2017 19:38:25 GMT"], "content-type"=>["application/echo10+xml; charset=utf-8"], "access-control-expose-headers"=>["CMR-Hits, CMR-Request-Id"], "access-control-allow-origin"=>["*"], "cmr-hits"=>["1"], "cmr-took"=>["10"], "cmr-request-id"=>["436b50ec-c84a-4180-93fa-9c721087d65b"], "vary"=>["Accept-Encoding, User-Agent"], "connection"=>["close"], "server"=>["Jetty(9.2.z-SNAPSHOT)"]}

OVERWRITE_DEPENDENT_URL="#{Cmr.get_cmr_base_url}/search/collections.echo10?concept_id=C1000000020-LANCEAMSR2"
OVERWRITE_DEPENDENT_BODY="<?xml version=\"1.0\" encoding=\"UTF-8\"?><results><hits>1</hits><took>9</took><result concept-id=\"C1000000020-LANCEAMSR2\" revision-id=\"8\" format=\"application/echo10+xml\">\n<Collection>\n<ShortName>Test_ShortName</ShortName>\n<VersionId>0</VersionId>\n<InsertTime>2015-05-01T13:26:43Z</InsertTime>\n<LastUpdate>2015-09-14T13:26:43Z</LastUpdate>\n<LongName>NRT AMSR2 DAILY L3 GLOBAL SNOW WATER EQUIVALENT EASE-GRIDS</LongName>\n<DataSetId>NRT AMSR2 DAILY L3 GLOBAL SNOW WATER EQUIVALENT EASE-GRIDS V0</DataSetId>\n<Description>The Advanced Microwave Scanning Radiometer 2 (AMSR2) instrument on the Global Change Observation Mission - Water 1 (GCOM-W1) provides global passive microwave measurements of terrestrial, oceanic, and atmospheric parameters for the investigation of global water and energy cycles.  Near real-time (NRT) products are generated within 3 hours of the last observations in the file, by the Land Atmosphere Near real-time Capability for EOS (LANCE) at the AMSR Science Investigator-led Processing System (AMSR SIPS), which is collocated with the Global Hydrology Resource Center (GHRC) DAAC.  The GCOM-W1 AMSR2 Level-3 Snow Water Equivalent (SWE) data set contains snow water equivalent (SWE) data and quality assurance flags mapped to Northern and Southern Hemisphere 25 km Equal-Area Scalable Earth Grids (EASE-Grids).  Data are stored in HDF-EOS5 format and are available via HTTP from the EOSDIS LANCE system at https://lance.nsstc.nasa.gov/amsr2-science/data/level3/daysnow/R00/hdfeos5/.  If data latency is not a primary concern, please consider using science quality products.  Science products are created using the best available ancillary, calibration and ephemeris information.  Science quality products are an internally consistent, well-calibrated record of the Earth's geophysical properties to support science.  The AMSR SIPS plans to start producing initial AMSR2 standard science quality data products in late 2015 and they will be available from the NSIDC DAAC.  Notice: All LANCE AMSR2 data should be used with the understanding that these are preliminary products.  Cross calibration with AMSR-E products has not been performed.  As updates are made to the L1R data set, those changes will be reflected in this higher level product.</Description>\n<CollectionDataType>NEAR_REAL_TIME</CollectionDataType>\n<Orderable>false</Orderable>\n<Visible>true</Visible>\n<ProcessingLevelId>3</ProcessingLevelId>\n<ArchiveCenter>GHRC</ArchiveCenter>\n<CitationForExternalPublication>Tedesco, M., J. Jeyaratnam, and R. Kelly. 2015. NRT AMSR2 Daily L3 Global Snow Water Equivalent EASE-Grids [indicate subset used]. Dataset available online, [https://lance.nsstc.nasa.gov/amsr2-science/data/level3/daysnow/R00/hdfeos5/] from NASA LANCE AMSR2 at the GHRC DAAC Huntsville, Alabama, U.S.A. doi: http://dx.doi.org/10.5067/AMSR2/A2_DySno_NRT</CitationForExternalPublication><Price>0.0</Price><SpatialKeywords>\n<Keyword>GLOBAL</Keyword></SpatialKeywords><TemporalKeywords>\n<Keyword>DAILY</Keyword></TemporalKeywords><Temporal><RangeDateTime>\n<BeginningDateTime>2015-05-01T00:00:00Z</BeginningDateTime></RangeDateTime></Temporal><Contacts><Contact>\n<Role>GHRC USER SERVICES</Role><OrganizationEmails>\n<Email>ghrc-dmg@itsc.uah.edu</Email></OrganizationEmails></Contact></Contacts><ScienceKeywords><ScienceKeyword>\n<CategoryKeyword>EARTH SCIENCE</CategoryKeyword>\n<TopicKeyword>CRYOSPHERE</TopicKeyword>\n<TermKeyword>SNOW/ICE</TermKeyword><VariableLevel1Keyword>\n<Value>SNOW WATER EQUIVALENT</Value></VariableLevel1Keyword></ScienceKeyword><ScienceKeyword>\n<CategoryKeyword>EARTH SCIENCE</CategoryKeyword>\n<TopicKeyword>TERRESTRIAL HYDROSPHERE</TopicKeyword>\n<TermKeyword>SNOW/ICE</TermKeyword><VariableLevel1Keyword>\n<Value>SNOW WATER EQUIVALENT</Value></VariableLevel1Keyword></ScienceKeyword></ScienceKeywords><Platforms><Platform>\n<ShortName>GCOM-W1</ShortName>\n<LongName>GCOM-W1</LongName>\n<Type>SATELLITE</Type><Instruments><Instrument>\n<ShortName>AMSR2</ShortName><Sensors><Sensor>\n<ShortName>AMSR2</ShortName></Sensor></Sensors></Instrument></Instruments></Platform></Platforms>\n<AdditionalAttributes>\n<AdditionalAttribute>\n<Name>identifier_product_doi</Name>\n<DataType>STRING</DataType>\n<Description>product DOI</Description>\n<Value>10.5067/AMSR2/A2_DySno_NRT</Value>\n</AdditionalAttribute>\n<AdditionalAttribute>\n<Name>identifier_product_doi_authority</Name>\n<DataType>STRING</DataType>\n<Description>DOI authority</Description>\n<Value>http://dx.doi.org</Value>\n</AdditionalAttribute>\n</AdditionalAttributes>\n<Campaigns><Campaign>\n<ShortName>LANCE</ShortName></Campaign></Campaigns><OnlineAccessURLs><OnlineAccessURL>\n<URL>https://lance.nsstc.nasa.gov/amsr2-science/data/level3/daysnow/R00/hdfeos5/</URL><URLDescription></URLDescription><MimeType></MimeType></OnlineAccessURL></OnlineAccessURLs><OnlineResources><OnlineResource>\n<URL>https://lance.itsc.uah.edu/amsr2-science/data/level3/daysnow/R00/hdfeos5/</URL><Description></Description>\n<Type>Alternate Data Access</Type></OnlineResource><OnlineResource>\n<URL>https://lance.nsstc.nasa.gov/amsr2-science/browse_png/level3/daysnow/R00/</URL><Description></Description>\n<Type>Browse</Type></OnlineResource><OnlineResource>\n<URL>https://worldview.earthdata.nasa.gov/</URL><Description></Description>\n<Type>Worldview Imagery</Type></OnlineResource><OnlineResource>\n<URL>http://lance.nsstc.nasa.gov/</URL><Description></Description>\n<Type>Homepage</Type></OnlineResource><OnlineResource>\n<URL>http://lance.nsstc.nasa.gov/amsr2-science/doc/LANCE_A2_DySno_NRT_dataset.pdf</URL><Description></Description>\n<Type>Guide</Type></OnlineResource><OnlineResource>\n<URL>http://dx.doi.org/10.5067/AMSR2/A2_DySno_NRT</URL><Description></Description>\n<Type>DOI</Type></OnlineResource><OnlineResource>\n<URL>http://ghrc.nsstc.nasa.gov/uso/citation.html</URL><Description></Description>\n<Type>Citing GHRC Data</Type></OnlineResource></OnlineResources><AssociatedDIFs><DIF>\n<EntryId>A2_DySno_NRT</EntryId></DIF></AssociatedDIFs><Spatial><SpatialCoverageType>Horizontal</SpatialCoverageType><HorizontalSpatialDomain><Geometry>\n<CoordinateSystem>CARTESIAN</CoordinateSystem><Point><PointLongitude>123</PointLongitude><PointLatitude>456</PointLatitude></Point></Geometry></HorizontalSpatialDomain>\n<GranuleSpatialRepresentation>CARTESIAN</GranuleSpatialRepresentation></Spatial>\n<MetadataStandardName>ECHO</MetadataStandardName>\n<MetadataStandardVersion>10</MetadataStandardVersion>\n</Collection></result></results>"
OVERWRITE_DEPENDENT_HEADER={"date"=>["Mon, 20 Feb 2017 19:38:25 GMT"], "content-type"=>["application/echo10+xml; charset=utf-8"], "access-control-expose-headers"=>["CMR-Hits, CMR-Request-Id"], "access-control-allow-origin"=>["*"], "cmr-hits"=>["1"], "cmr-took"=>["10"], "cmr-request-id"=>["436b50ec-c84a-4180-93fa-9c721087d65b"], "vary"=>["Accept-Encoding, User-Agent"], "connection"=>["close"], "server"=>["Jetty(9.2.z-SNAPSHOT)"]}