package cz.webarchiv.wah

import cz.webarchiv.linkextractor.LinkExtractor
import cz.webarchiv.wadmin.QaCheck

class QualityAssuranceController {
    def scaffold = QaCheck
    def index = { }

    def extractLinks = {

    }

    def showLinks = {
        def le = new LinkExtractor()

        [links: le.extractLinks(params.url)]
    }
}
