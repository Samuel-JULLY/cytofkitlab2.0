% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cytofkit.R
\name{cytofkit}
\alias{cytofkit}
\title{cytofkit: an integrated mass cytometry data analysis pipeline}
\usage{
cytofkit(
  fcsFiles = getwd(),
  markers = "parameter.txt",
  projectName = "cytofkit",
  ifCompensation = FALSE,
  transformMethod = c("autoLgcl", "cytofAsinh", "logicle", "arcsinh", "none"),
  mergeMethod = c("ceil", "all", "min", "fixed"),
  fixedNum = 10000,
  normalizeMethod = c("default", "tsne", "umap", "quantile_100_evts"),
  dimReductionMethod = c("tsne", "pca", "isomap", "umap"),
  clusterMethods = c("Rphenograph", "ClusterX", "DensVM", "FlowSOM", "NULL", "FlowSOMDR"),
  visualizationMethods = c("tsne", "pca", "isomap", "umap", "NULL"),
  progressionMethod = c("NULL", "diffusionmap", "isomap"),
  Rphenograph_k = 30,
  FlowSOM_k = 40,
  seed = NULL,
  clusterSampleSize = 500,
  resultDir = getwd(),
  saveResults = TRUE,
  saveObject = TRUE,
  openShinyAPP = FALSE,
  ...
)
}
\arguments{
\item{fcsFiles}{It can be either the path where your FCS files are stored or a vector of FCS file names.}

\item{markers}{It can be either a text file that containing markers to be used for analysis or a vector of the marker names.}

\item{projectName}{A prefix that will be added to the names of all result files.}

\item{ifCompensation}{Boolean value, to apply compensation contained in FCS, or a compensation matrix.}

\item{transformMethod}{Data Transformation method, including \code{autoLgcl}, \code{cytofAsinh}, \code{logicle} and \code{arcsinh}, or \code{none} to avoid transformation.}

\item{mergeMethod}{When multiple fcs files are selected, cells can be combined using 
one of the four different methods including \code{ceil}, \code{all}, \code{min}, \code{fixed}. 
The default option is \code{ceil}, up to a fixed number (specified by \code{fixedNum}) of cells are sampled 
without replacement from each fcs file and combined for analysis.
\code{all}: all cells from each fcs file are combined for analysis. 
\code{min}: The minimum number of cells among all the selected fcs files are sampled from each fcs file and combined for analysis. 
\code{fixed}: a fixed num (specified by fixedNum) of cells are sampled (with replacement when the total number of cell is less than 
fixedNum) from each fcs file and combined for analysis.}

\item{fixedNum}{The fixed number of cells to be extracted from each FCS file.}

\item{normalizeMethod}{The normalization nmethod prior to clustering and dimension reduction. Any choice "default", "tsne", "umap", "quantile_100_evts". Default = as defined in original cytofkit package.}

\item{dimReductionMethod}{The method used for dimensionality reduction, including \code{tsne}, \code{pca} and \code{isomap}.}

\item{clusterMethods}{The clustering method(s) used for subpopulation detection, including \code{DensVM}, \code{ClusterX}, \code{Rphenograph} and \code{FlowSOM}. Multiple selections are accepted.}

\item{visualizationMethods}{The method(s) used for visualize the cluster data, including \code{tsne}, \code{pca} and \code{isomap}. Multiple selections are accepted.}

\item{progressionMethod}{Use the first ordination score of \code{isomap} to estimated the progression order of cells, choose \code{NULL} to ignore.}

\item{Rphenograph_k}{Integer number of nearest neighbours to pass to Rphenograph.}

\item{FlowSOM_k}{Number of clusters for meta clustering in FlowSOM.}

\item{seed}{Integer to set a seed for reproducible results.}

\item{clusterSampleSize}{The uniform size of each cluster.}

\item{resultDir}{The directory where result files will be generated.}

\item{saveResults}{Save the results, and the post-processing results including scatter plot, heatmap, and statistical results.}

\item{saveObject}{Save the results into RData objects for loading back to R for further analysis}

\item{openShinyAPP}{Opens the shinyAPP automatically when the analysis was done, default FALSE.}

\item{...}{Other arguments passed to \code{cytof_exprsExtract}}
}
\value{
a list containing \code{expressionData}, \code{dimReductionMethod}, \code{visualizationMethods}, \code{dimReducedRes}, \code{clusterRes}, \code{progressionRes}, \code{projectName}, \code{rawFCSdir} and \code{resultDir}. If choose 'saveResults = TRUE', results will be saved into files under \code{resultDir}.
}
\description{
The main function to drive the cytofkit workflow.
}
\details{
\code{cytofkit} works as the main funciton to perform the analysis of one or multiple FCS files. 
The workflow contains data merging from multiple FCS file, expression data transformation, 
dimensionality reduction with \code{PCA}, \code{isomap} or \code{tsne} (default), clustering 
analysis with methods includes \code{DensVM}, \code{ClusterX}, \code{Rphenograph)} and \code{FlowSOM} for 
subpopulation detection, and estimation of cellular progression using \code{isomap}. The analysis 
results can be visualized using scatter plot, heatmap plot or progression plot. Dimension reduced 
data and cluster labels will be saved back to new copies of FCS files. By default the analysis 
results will be automatically saved under \code{resultDir} for further annotation. Moreover An 
interactive web application is provided for interactive exploration of the analysis results, 
see \code{cytofkitShinyAPP}.
}
\examples{
dir <- system.file('extdata',package='cytofkitlab')
file <- list.files(dir, pattern='.fcs$', full=TRUE)
parameters <- list.files(dir, pattern='.txt$', full=TRUE)
## remove the hash symbol to run the following command
#cytofkit(fcsFile = file, markers = parameters) 
}
\references{
\url{https://github.com/JinmiaoChenLab/cytofkit}
}
\seealso{
\code{\link{cytofkit}}, \code{\link{cytofkit_GUI}}, \code{\link{cytofkitShinyAPP}}
}
\author{
Hao Chen, Jinmiao Chen
}
