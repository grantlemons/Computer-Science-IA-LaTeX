\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{paper}[Grant Lemons's Custom Paper Class]

% Preamble
\LoadClass[letterpaper, 12pt]{article}
\usepackage[includefoot, left=1in, right=1in, top=1in, bottom=0.5in]{geometry}

% Paragraph jump and intents
\setlength{\parskip}{1em}
\setlength{\parindent}{0em}

% Package mass import
\usepackage{microtype}
\usepackage[export]{adjustbox}

% Spacing
\usepackage{setspace}
\singlespacing
\usepackage[nobottomtitles]{titlesec}
\titlespacing{\chapter}{0pt}{0pt}{-0.8em}
\titlespacing{\section}{0pt}{0pt}{-0.8em}
\titlespacing{\subsection}{0pt}{0pt}{-0.8em}
\titlespacing{\subsubsection}{0pt}{0pt}{-0.8em}

% Images
\usepackage{graphicx}
\graphicspath{ {./images/} }

% Subfiles
\usepackage{subfiles}

% Misc Setup
\titleformat{\subsubsection}{\normalfont\normalsize\bfseries}{\thesubsubsection}{1em}{\normalsize}
\titleformat{\subsection}{\normalfont\normalsize\bfseries}{\thesubsection}{1em}{\normalsize}
\titleformat{\section}{\normalfont\large\bfseries}{\thesection}{1em}{\large}
\titleformat{\chapter}[display]{\vspace{-1.8cm}\normalfont\bfseries}{}{0pt}{\Large}
\newcommand{\insertTitlePage}{
	\centering
    \thispagestyle{empty}
	\vspace*{7.5cm}
	\textbf{\huge\thetitle}\\
	\vspace*{0.5cm}
	\textit{\researchquestion}\\
	\vspace{1.0cm}
	\textit{\today}\\
	\vspace{1.0cm}
	\textit{\theauthor}\\
    \flushleft
	\newpage
}

% Link setup
\usepackage{hyperref}    
\hypersetup{
    colorlinks=true, %set true if you want colored links
    linktoc=all,     %set to all if you want both sections and subsections linked
    linkcolor=black,  %choose some color if you want links to stand out
    citecolor=black,
    urlcolor=black,
}

%Document Info
\newcommand{\thetitle}{Methods of Adaptive Quadrature}
\newcommand{\researchquestion}{Comparing a new method of adaptive quadrature to an existing strategy}
\newcommand{\theauthor}{Grant Lemons}

%Random imports
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsfonts}
\usepackage{mathtools}
\usepackage{XCharter}
\usepackage{fancyhdr}
\usepackage{subfiles}
\usepackage[section]{placeins}
\usepackage[width=.95\textwidth, font={footnotesize}]{caption}
\usepackage{subcaption}
\usepackage{float}
\usepackage[all]{nowidow}
\usepackage[nameinlink, noabbrev, capitalize]{cleveref}
\usepackage{ragged2e}
\usepackage{booktabs}

%Needspace
\usepackage{needspace}
\AddToHook{cmd/section/before}{\Needspace*{3\baselineskip}}

% Specific Hyphenation
\hyphenation{Simpson}

% Bibliography
\usepackage[backend=biber, notes, sorting=cms, legalnotes=false]{biblatex-chicago}
\usepackage{fnpct}
\addbibresource{bibliography.bib}
\usepackage[bottom]{footmisc}

%Code Snippets
\usepackage[outputdir=build]{minted}
\usepackage{xcolor}
\usemintedstyle{bw}
\usepackage{fontspec}
\setmonofont[
    Path=/usr/share/fonts/TTF/,
    Contextuals={Alternate},
    UprightFont = FiraCode-Regular,
    BoldFont = FiraCode-Bold,
    Extension=.ttf
]{FiraCode}
\setlength\partopsep{-\topsep}
\addtolength\partopsep{-\parskip}
\addtolength\partopsep{0.5cm}

%List of Snippets
\usepackage{tocloft}
\newcommand{\listsnippets}{List of Code Snippets}
\newlistof{snippet}{snip}{\listsnippets}
\newcommand{\snippet}[1]{%
    \refstepcounter{snippet}
    \addcontentsline{snip}{snippet}{\protect\numberline{\thesnippet}#1}\par}
\usepackage{tocbibind}
\newcommand{\listofsnippets}{
    \begingroup
        \tocfile{\listsnippets}{snip}
    \endgroup
}
\renewcommand\cftsnippetindent{\cftfigindent}

%Tikz
\usepackage{tikz}
\usetikzlibrary{calc}
\usetikzlibrary{patterns}
\usetikzlibrary{fpu}
\usetikzlibrary{spy}

%Tikz Graphs
\newcommand{\exampleLowSubintervals}{6}
\newcommand{\exampleHighSubintervals}{60}
\newcommand{\ruleEq}[1]{cos((#1 + 2) r)+1}
\newcommand{\simpleEq}[1]{((#1+(2/3))^3 + 2*(#1)^2)/6}
\newcommand{\complexEq}[1]{2*(sin((3)/(abs(#1)+.3) r)^2)}
\newcommand{\normalEq}[1]{(10/sqrt(2*pi))*e^((-1/2)*((#1)^2))}
\newcommand{\DerDerNormalEq}[1]{(\normalEq{#1})*((#1)^2 - 1)}
\newcommand{\graphRule}{\draw[darkgray, smooth, thick, samples=100, domain={\leftbound-.05}:{\rightbound+.05}] plot(\x, {\ruleEq{\x}}) node[darkgray, align=left, right, yshift=0.5cm, xshift=-3.9cm] {\scriptsize \(f(x)\)};}
\newcommand{\graphSimple}{\draw[darkgray, smooth, thick, samples=100, domain={\leftbound-.05}:{\rightbound+.05}] plot(\x, {\simpleEq{\x}}) node[darkgray, align=left, right, yshift=-0.2cm, xshift=-3.0cm] {\tiny\(f(x)\)};}
\newcommand{\graphComplex}{\draw[darkgray, smooth, thick, samples=1500, domain={\leftbound-.05}:{\rightbound+.05}] plot(\x, {\complexEq{\x}}) node[darkgray, align=left, right, yshift=.15cm, xshift=-3.6cm] {\tiny\(f(x)\)};}
\newcommand{\graphNormal}{\draw[darkgray, smooth, thick, samples=100, domain={\leftbound-.05}:{\rightbound+.05}] plot(\x, {\normalEq{\x}}) node[darkgray, align=left, right, yshift=2.5cm, xshift=-3cm] {\small\(f(x)\)};}
\newcommand{\graphDerDerNormal}{\draw[dashed, darkgray, smooth, thick, samples=100, domain={\leftbound-.05}:{\rightbound+.05}] plot(\x, {\DerDerNormalEq{\x}}) node[darkgray, align=left, right, yshift=-1.5cm, xshift=-3.3cm] {\small\(\sder{x}\)};}
\newcommand{\numline}[1]{
    \draw[black, thick] ({\rightbound+.1}, -0.02) -- ({\leftbound-.1}, -0.02) node[black, align=center, left, yshift=-0.13cm, xshift=.5cm] {\scriptsize \(x\)};
    \foreach \x in  {#1} {
        \draw[color=black] (\x, 3pt) -- (\x, -3pt) node[below]{\tiny \(\x\)};
    }
}

% Top and bottom rules for tables
\newcommand{\dtoprule}{\toprule[1pt]\midrule[0.3pt]}
\newcommand{\dbottomrule}{\midrule[0.3pt]\bottomrule[1pt]}

% Quotes
\usepackage[english]{babel}
\usepackage[autostyle, english=american]{csquotes}
\MakeOuterQuote{"}

%Page Numbering
\pagestyle{fancy}
\fancypagestyle{frontorback}{%
    \fancyhf{}
    \fancyhead[R]{\thepage}
    \setlength{\headheight}{15pt}
}
\fancyhf{}
\fancyhead[R]{\thepage \hspace{1pt} of \pageref{mylastpage}}
\setlength{\headheight}{15pt}

%Equation Numbering
\newcommand*\tageq{\refstepcounter{equation}\tag{\theequation}}

%Derivative commands
\newcommand{\der}[1]{\frac{d(#1)}{dx}}
\newcommand{\derf}[2]{\frac{d(#1)}{dx}(#2)}
\newcommand{\sder}[1]{f''(#1)}
\newcommand{\sderf}[2]{#1''(#2)}

\endinput
