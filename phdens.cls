\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{phdens}[07/01/2023 researchbook template]

\PassOptionsToClass{\CurrentOption}{book}
\LoadClass[12pt, a4paper,openright]{book}

%%% Template geometry
\RequirePackage[textwidth=427pt,textheight=630pt,voffset=30pt]{geometry}

%using xcolor with svg mode for the section color
\RequirePackage[svgnames]{xcolor}


%% font related package
\RequirePackage[english]{babel}
\RequirePackage{lmodern} % Scalable font for lettrine's loversize option


%%%% Maths %%%%
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{witharrows} % arrow between equations to explain steps

% to customize header & footer
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhead[RE]{\slshape\leftmark}% right even head with chapter mark
\fancyhead[LO]{\slshape\rightmark}% left odd head with section mark
\fancyhead[LE,RO]{}% remove left even and right odd head
\fancyfoot[LE,RO]{}% set left even and right odd foot
\fancyfoot[C]{\thepage}% remove centre foot


%for table of content per chapter
\RequirePackage{minitoc}



% tikz for graphs
\RequirePackage{tikz}

%used for the chapter style
\usetikzlibrary{calc} 









%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% chapter & section customization
\RequirePackage[sf,bf]{titlesec}

\titleformat{\section}
  {\normalfont\bfseries\Large\color{DarkRed}}
  {\thesection.}
  {1em}
  {}

\titleformat{\subsection}
  {\normalfont\bfseries\large\color{black}}
  {\thesubsection.}
  {1em}
  {}

\titleformat{\subsubsection}
  {\normalfont\bfseries\color{black}}
  {\thesubsubsection.}
  {1em}
  {}



\titleformat{\chapter}[display]
{}
{\hfill \tikz[remember picture] \node[] (nr) {\fontsize{20}{70}\selectfont\color{black}\textsc{\chaptertitlename ~~} \fontsize{60}{70}\selectfont\color{black}\thechapter};
\begin{tikzpicture}[overlay,remember picture]
\coordinate (rightborder) at ($(nr)+(100,0)$);
\coordinate (right) at ($(nr.east) + (0.5,0)$);
\draw[line width=4.5em] (right) -- (rightborder);
\end{tikzpicture}}
{-1ex}
{\filleft\fontsize{30}{50}\selectfont}
[\vspace{-1ex}\minitoc]

\titleformat{name=\chapter,numberless}[display]
{\normalfont\huge}
{}
{0pt}
{
    %\titlerule
    \vspace{0.2cm}
}
[
    \vspace{0.2cm}
    %\titlerule
]

\titlespacing{\chapter}{0pt}{-30pt}{-20pt}
\titlespacing{name=\chapter,numberless}{0pt}{-30pt}{10pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%







%customize link colors for the table of content
\definecolor{linkcolor}{rgb}{0,0,0.6} % définition de la couleur des liens pdf
\RequirePackage[ 
    pdftex,colorlinks=true,
    pdfstartview=ajustementV,
    linkcolor= linkcolor,
    citecolor= linkcolor,
    urlcolor= linkcolor,
    hyperindex=true,
    hyperfigures=false]{hyperref}

%%%% Bibliography %%%%
\RequirePackage[sectionbib]{natbib}
\RequirePackage{chapterbib}
\setlength{\bibsep}{0.5pt}
\RequirePackage{csquotes}
\renewcommand{\bibsection}{}
\input{aastexv6.sty} % For ADS abbreviations in the bibtex entries.


\RequirePackage{appendix}




\RequirePackage[listings]{tcolorbox}
\tcbuselibrary{listings,theorems,skins,hooks}

%\newtcbtheorem[⟨init options⟩]{⟨name⟩}{⟨display name⟩}{⟨options⟩}{⟨prefix⟩}

\newtcolorbox{marker}[1][]{enhanced,
  before skip balanced=2mm,after skip balanced=3mm,
  boxrule=0.4pt,left=5mm,right=2mm,top=2mm,bottom=2mm,
  colback=yellow!50,
  colframe=yellow!20!black,
  sharp corners,rounded corners=southeast,arc is angular,arc=3mm,
  underlay={%
    \path[fill=tcbcolback!80!black] ([yshift=3mm]interior.south east)--++(-0.4,-0.1)--++(0.1,-0.2);
    \path[draw=tcbcolframe,shorten <=-0.05mm,shorten >=-0.05mm] ([yshift=3mm]interior.south east)--++(-0.4,-0.1)--++(0.1,-0.2);
    \path[fill=yellow!50!black,draw=none] (interior.south west) rectangle node[white]{\Huge\bfseries !} ([xshift=4mm]interior.north west);
    },
  drop fuzzy shadow,#1}

\newtcolorbox{result}{colback=black!10!white,
  colframe=black!75!black}

\newtcbtheorem[number within=section]{tcresult}{$\,\!$}%
{colback=black!5,colframe=black!35!black,fonttitle=\bfseries,
separator sign={}}{res}

\newtcbtheorem[number within=section]{tcdefinition}{Definition}%
{colback=green!5,colframe=green!35!black,fonttitle=\bfseries,
separator sign={\ $\blacktriangleright$}}{def}

\newtcbtheorem[number within=section]{tctheorem}{Theorem}%
{colback=red!5,colframe=red!35!black,fonttitle=\bfseries,
separator sign={\ $\blacktriangleright$}}{thm}

\newtcbtheorem[number within=section]{tcproposition}{Proposition}%
{colback=black!5,colframe=black!35!black,fonttitle=\bfseries,
separator sign={\ $\blacktriangleright$}}{prop}





