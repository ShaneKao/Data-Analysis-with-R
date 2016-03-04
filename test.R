if(!"RSelenium" %in% installed.packages()){
        install.packages("RSelenium")
}
library("RSelenium")
if(Sys.which("java") == ""){
        print("you must have java installed on your windows box.")
}

checkForServer() 
startServer()
mybrowser <- remoteDriver()
mybrowser$open()
mybrowser$navigate("http://www.airitilibrary.com/Search/ArticleSearch?ArticlesViewModel_SearchField=%E6%94%BF%E5%BA%9C&ArticlesViewModel_TitleKeywordsAbstract=&ArticlesViewModel_Author=&ArticlesViewModel_JournalBookDepartment=&ArticlesViewModel_DOI=&ArticlesViewModel_ArticleArea_Taiwan=false&ArticlesViewModel_ArticleArea_ChinaHongKongMacao=false&ArticlesViewModel_ArticleArea_American=false&ArticlesViewModel_ArticleArea_Other=false&PublicationsViewModel_SearchField=&PublicationsViewModel_PublicationName=&PublicationsViewModel_ISSN=&PublicationsViewModel_PublicationUnitName=&PublicationsViewModel_DOI=&PublicationsViewModel_PublicationArea_Taiwan=false&PublicationsViewModel_PublicationArea_ChinaHongKongMacao=false&PublicationsViewModel_PublicationArea_American=false&PublicationsViewModel_PublicationArea_Other=false")

result = mybrowser$executeScript(script='return jsArticlesViewModel')

for(i in result$SearchResultAL){
        # print(i$Author_HL)
        print(i$AuthorEn)
        print(i$AbstractCh)
        print(i$DocName)
        print(paste0("http://www.airitilibrary.com/Publication/alDetailedMesh?DocID=", i$DocID))
}
