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

%Interview Dialog
\newenvironment{interviewer}{\emph{Interviewer}:~}{}
\newenvironment{client}{\emph{Client}:~}{}
\endinput
