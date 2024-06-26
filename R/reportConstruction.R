#' Report construction
#'
#' Report quantities describing the construction of new buildings
#'
#' @param gdx gams transfer container of the BRICK GDX
#' @param brickSets character, BRICK reporting template
#' @param silent boolean, suppress warnings and printing of dimension mapping
#'
#' @author Robin Hasse
#'
#' @importFrom magclass mbind setNames dimSums mselect collapseDim

reportConstruction <- function(gdx, brickSets = NULL, silent = TRUE) {

  # READ -----------------------------------------------------------------------

  # construction variable
  v_construction <- readGdxSymbol(gdx, "v_construction")

  # unit conversion: million m2 / yr-> billion m2 / yr
  v_construction <- (v_construction / 1000) %>%
    mselect(qty = "area") %>%
    collapseDim(dim = "qty")




  # REPORT ---------------------------------------------------------------------

  out <- mbind(

    ## Total ====
    reportAgg(v_construction,
              "Construction|Buildings (bn m2/yr)", brickSets,
              agg = c(bs = "all", hs = "all", loc = "all", typ = "resCom", inc = "all"),
              silent = silent),
    reportAgg(v_construction,
              "Construction|Residential (bn m2/yr)", brickSets,
              agg = c(bs = "all", hs = "all", loc = "all", typ = "res", inc = "all"),
              silent = silent),
    reportAgg(v_construction,
              "Construction|Commercial (bn m2/yr)", brickSets,
              agg = c(bs = "all", hs = "all", loc = "all", typ = "com", inc = "all"),
              silent = silent),


    ## by building type ====
    reportAgg(v_construction,
              "Construction|Residential|{typ} (bn m2/yr)", brickSets,
              agg = c(bs = "all", hs = "all", loc = "all", inc = "all"),
              rprt = c(typ = "res"),
              silent = silent),


    ## by location ====
    reportAgg(v_construction,
              "Construction|Residential|{loc} (bn m2/yr)", brickSets,
              agg = c(bs = "all", hs = "all", typ = "res", inc = "all"),
              rprt = c(loc = "all"),
              silent = silent),


    ## by heating system ====
    reportAgg(v_construction,
              "Construction|Residential|{hs} (bn m2/yr)", brickSets,
              agg = c(bs = "all", loc = "all", typ = "res", inc = "all"),
              rprt = c(hs = "all"),
              silent = silent),


    ## by building type + heating system ====
    reportAgg(v_construction,
              "Construction|Residential|{typ}|{hs} (bn m2/yr)", brickSets,
              agg = c(bs = "all", loc = "all", inc = "all"),
              rprt = c(hs = "all", typ = "res"),
              silent = silent)

  )

  return(out)
}
