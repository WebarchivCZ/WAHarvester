package cz.webarchiv.wah

import cz.webarchiv.linkextractor.LinkExtractor

class QualityAssuranceController {
    def index = { }

    def extractLinks = {

    }

    def showLinks = {
        def le = new LinkExtractor()

        [links: le.extractLinks(params.url)]
    }
}
