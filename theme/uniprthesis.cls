\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uniprthesis}[2022/06/27 UniPR thesis class]
%-------------------------- initial code -----------------------

% Defaults to two-side, but passing 'oneside' should set everything up for that
\LoadClass[12pt, a4paper, twoside]{book}

% Some useful packages
\usepackage[utf8]{inputenc} 					        % accented letters
\usepackage{graphicx}       					        % images
\usepackage[a-1b]{pdfx}							          % pdf-a compliance
\usepackage[justification=centering]{caption}	% default caption position
\usepackage{subcaption}							          % multiple images in figure
\usepackage{fancyhdr} 							          % abstract
\usepackage{listings}							            % code
\usepackage{algorithm}							          % pseudo-code
\usepackage[noend]{algpseudocode}				      % pseudo-code
\usepackage{amsthm}								            % math environment
\usepackage{amsmath}							            % math environment
\usepackage{color}		
\usepackage{tabularx}							            % tables management
\usepackage{hhline}								            % tables management
\usepackage[section]{placeins} 					      % to keep floats (images, tables, etc.) within their Sections
\usepackage{afterpage}
\usepackage[a4paper, inner=30mm, outer=30mm, top=40mm, bottom=45mm, bindingoffset=10mm]{geometry}


%%%%%%%%%%% Other commands%%%%%%%%%%%
%to keep floats (images, tables, etc.) within subsections
\makeatletter
\AtBeginDocument{%
	\expandafter\renewcommand\expandafter\subsection\expandafter{%
		\expandafter\@fb@secFB\subsection
	}%
}
\makeatother

%Italian Lables
\makeatletter
\renewcommand{\ALG@name}{Algoritmo}
\makeatother
\renewcommand{\lstlistingname}{Codice}
\renewcommand{\listalgorithmname}{Elenco degli algoritmi}

% Blank page after title
\let\origdoublepage\cleardoublepage
\newcommand{\clearemptydoublepage}{%
	\clearpage
	{\pagestyle{empty}\origdoublepage}%
}
\let\cleardoublepage\clearemptydoublepage

\newcommand{\fncyblank}{\fancyhf{}}
\pagestyle{fancy}
\fancyhead{}
\fancyhead[LE, RO]{\leftmark}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}

\setlength{\headheight}{15pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Listings 
\definecolor{mygreen}{rgb}{0,0.4,0}
\definecolor{mygray}{rgb}{0.35,0.35,0.35}
\definecolor{mymauve}{rgb}{0.58,0,0.82}

\lstset{ 
	backgroundcolor=\color{white},    % choose the background color; you must add \usepackage{color} or \usepackage{xcolor}
	basicstyle=\footnotesize,         % the size of the fonts that are used for the code
	breakatwhitespace=false,          % sets if automatic breaks should only happen at whitespace
	breaklines=true,                  % sets automatic line breaking
	captionpos=b,                     % sets the caption-position to bottom
	commentstyle=\color{mygray},      % comment style
	deletekeywords={...},             % if you want to delete keywords from the given language
	escapeinside={(*@}{@*)},          % if you want to add LaTeX within your code
	extendedchars=true,               % lets you use non-ASCII characters; for 8-bits encodings only, does not work with UTF-8
	frame=no,	                        % adds a frame around the code
	keepspaces=true,                  % keeps spaces in text, useful for keeping indentation of code (possibly needs columns=flexible)
	keywordstyle=\color{mygreen},     % keyword style
	language=C++,                     % the language of the code
	otherkeywords={*,...},            % if you want to add more keywords to the set
	numbers=left,                     % where to put the line-numbers; possible values are (none, left, right)
	numbersep=5pt,                    % how far the line-numbers are from the code
	numberstyle=\tiny\color{black},   % the style that is used for the line-numbers
	rulecolor=\color{black},          % if not set, the frame-color may be changed on line-breaks within not-black text (e.g. comments (green here))
	showspaces=false,                 % show spaces everywhere adding particular underscores; it overrides 'showstringspaces'
	showstringspaces=false,           % underline spaces within strings only
	showtabs=false,                   % show tabs within strings adding particular underscores
	stepnumber=1,                     % the step between two line-numbers. If it's 1, each line will be numbered
	stringstyle=\color{black},        % string literal style
	tabsize=2,	                      % sets default tabsize to 2 spaces
	title=\lstname                    % show the filename of files included with \lstinputlisting; also try caption instead of title
}
\newcommand*\Let[2]{\State #1 $\gets$ #2}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Fine Listings

% Questo comando omette i colori dai link
% Da rimuovere se si vogliono i colori
\hypersetup{
  colorlinks,
  linkcolor={black!50!black},
  citecolor={black!50!black},
  urlcolor={black!80!black}
}

%%%%%%%%%%% Some useful Environments (woth italian labels)
\theoremstyle{plain}
\newtheorem{thm}{Teorema}[section]
\newtheorem{cor}[thm]{Corollario}
\newtheorem{lem}[thm]{Lemma}
\newtheorem{prop}[thm]{Proposizione}

\theoremstyle{definition}
\newtheorem{defn}{Definizione}[section]
\newtheorem{example}{Esempio}[section]

\theoremstyle{remark}
\newtheorem{oss}{Osservazione}

\makeatletter
% Title Page
% The years of the Degree
\def\degreeyears#1{\gdef\@degreeyears{#1}}
% The full (unabbreviated) name of the degree
\def\degree#1{\gdef\@degree{#1}}
% The name of your college
\def\college#1{\gdef\@college{#1}}
% The name of the university
\def\university#1{\gdef\@university{#1}}
% The (possibly multiple) advisor
\def\advisor#1{\gdef\@advisor{#1}}
\def\serialNumber#1{\gdef\@serialNumber{#1}}
%\def\advisorSecond#1{\gdef\@\advisorSecond{#1}}
%\def\advisorThird#1{\gdef\@\advisorThird{#1}}
%\def\advisorFourth#1{\gdef\@\advisorFourth{#1}}
% The (possibly multiple) coadvisor
%\def\coadvisor#1{\gdef\@coadvisor{#1}}
%\def\coadvisorSecond#1{\gdef\@\coadvisorSecond{#1}}
%\def\coadvisorThird#1{\gdef\@\coadvisorThird{#1}}
%\def\coadvisorFourth#1{\gdef\@\coadvisorFourth{#1}}
\makeatother

%define title page layout

\makeatletter
\newcommand{\ifempty}[1]{\ifnum\pdf@strcmp{#1}{}=\z@}
\makeatother
\def\crest{{\includegraphics[height=55mm]{theme/logo_unipr.pdf}}}
\newcommand{\nameStyle}[1]{\textbf{#1}}

%\advisorSecond{empty}
\makeatletter
\renewcommand{\maketitle}{%
    \newgeometry{hmarginratio=1:1,left=25mm, top=20mm, bottom=15mm}
    \renewcommand{\footnotesize}{\small}
    \renewcommand{\footnoterule}{\vspace{0.5\baselineskip}\noindent\hspace{0\linewidth}\rule{0.2\linewidth}{0.5pt}\vspace{0.5\baselineskip}}
    \thispagestyle{empty}
    \begin{center}
      %\vspace*{-4em}
      {\large {\crest \par} \vspace*{2mm}}
      {\noindent\rule{\textwidth}{0.4pt}\par}
      {{\large {\scshape \@college}} \par}
      {\vspace*{3mm}{\large \it \@degree} \par}
      \vfill
      { \LARGE {\bfseries \uppercase {\@title}} \par}
      \ifdef{\subTitle}%
      {\vspace*{3mm}\Large {\itshape {\subTitle}} \par}%
      {}%
    \end{center}
      \vfill
    {\large \textsc{Candidato:}} \hfill 
    %\ifempty{\@advisorSecond}
    \ifdef{\advisorSecond}%
      {{\large \raggedleft \textsc{Relatori:} \par}}%
      {{\large \raggedleft \textsc{Relatore:} \par}}%
    {\large {\nameStyle{\@author}} \hfill {\nameStyle{\@advisor}} \par}
    \ifdef{\advisorSecond}%
      {{\large \raggedleft {\nameStyle{\advisorSecond}} \par}
        \ifdef{\advisorThird}%
          {{\large \raggedleft {\nameStyle{\advisorThird}} \par}
          \ifdef{\advisorFourth}%
            {{\large \raggedleft {\nameStyle{\advisorFourth}} \par}}%
            {}
          }%
          {}%
      }%
      {}%
    \vspace*{1.0em}
    {\large \textsc{Matricola:}} \hfill
    \ifdef{\coadvisor}{%
      \ifdef{\coadvisorSecond}%
      {{\large \raggedleft \textsc{Correlatori:} \par}}%
      % {{\large \raggedleft \textsc{Correlatore:} \par}}%
      {{\large \raggedleft \textsc{} \par}} % da commentare se c'e' un correlatore
      {\large \raggedleft {\nameStyle{\@serialNumber}} \hfill {\nameStyle{\coadvisor}} \par}
      \ifdef{\coadvisorSecond}%
      {{\large \raggedleft {\nameStyle{\coadvisorSecond}} \par}
        \ifdef{\coadvisorThird}%
        {{\large \raggedleft {\nameStyle{\coadvisorThird}} \par}
          \ifdef{\coadvisorFourth}%
          {{\large \raggedleft {\nameStyle{\coadvisorFourth}} \par}}%
          {}
        }%
        {}%
      }%
      {}%
      }%
      {%
        {{\large \raggedleft \textsc{} \par}}
        {\large \raggedleft \nameStyle{\@serialNumber} \hfill {} \par}%
      }%
    \vfill
    {\noindent\rule{\textwidth}{0.4pt}\par}
    \begin{center}
    {Anno Accademico \@degreeyears}
    \end{center}
  %  \vfill\null
    \restoregeometry
}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% CSS algoritmi
\lstdefinestyle{custom}{
    aboveskip=1em, % serve per centrare il blocco del codice
    belowskip=-0.5em, % serve per centrare il blocco del codice
    basicstyle=\linespread{0.9}\fontsize{8}{11}\ttfamily,
    keywordstyle=[1]\color{blue}\bfseries,
    keywordstyle=[2]\color{magenta}\bfseries,
    keywordstyle=[3]\color{orange}\bfseries,
    keywordstyle=[4]\color{green!60!black}\bfseries,
    keywordstyle=[5]\color{cyan}\bfseries,
    keywordstyle=[6]\color{red}\bfseries,
    keywordstyle=[7]\color{violet}\bfseries,
    keywordstyle=[8]\color{brown}\bfseries,
    commentstyle=\color{green!50!black},
    stringstyle=\color{red},
    showstringspaces=false,
    tabsize=1,
    frame=single, 
    rulecolor=\color{black!20},
    backgroundcolor=\color{gray!5},
    breaklines=true,
    numbers=left,
    numberstyle=\scriptsize\color{gray},
    numbersep=8pt,
    belowcaptionskip=0pt,  % Spazio sotto la caption
    captionpos=b,  % Posizione della caption
}

