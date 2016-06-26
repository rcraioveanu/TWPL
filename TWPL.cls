% TWPL.CLS
%
% This class provides the style for submissions to the Toronto Working Papers in Linguistics. 
%
% v0.91, last updated June 26, 2016
%
% Written 2012-2013, 2016 by Radu Craioveanu
% Email: radu.craioveanu@utoronto.ca 
%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% BASICS & CLASS OPTIONS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{TWPL}[2016/05/29 TWPL Document class] % class name

% xelatex mode
\newif\if@loadxelatex 
\DeclareOption{xelatex}{\@loadxelatextrue}

% create an if for loading Doulos, and default to true
\newif\if@loaddoulos 
\@loaddoulostrue
% create a package option to prevent loading Doulos SIL
\DeclareOption{nodoulos}{\@loaddoulosfalse}

% create an if for loading the TeX Gyre fonts, and default to true
\newif\if@loadtexgyre 
\@loadtexgyretrue
% create a package option to prevent loading Doulos SIL
\DeclareOption{notexgyre}{\@loadtexgyrefalse}

% linguex option
\newif\if@loadlinguex 
\DeclareOption{linguex}{\@loadlinguextrue}

% gb4e option
\newif\if@loadgb 
\DeclareOption{gb}{\@loadgbtrue}


% throw an error if the user tries to change the font size here
\newcommand{\@sizeoption@err}{\ClassError{TWPL}
  {Cannot use size option \CurrentOption} 
    {This style requires (and automatically loads) 11pt text}}
\DeclareOption{10pt}{\@sizeoption@err}
\DeclareOption{12pt}{\@sizeoption@err}

% other options
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions

\LoadClass[11pt,twoside]{article} % based on article class

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% REQUIRED PACKAGES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{etoolbox} % provides \AfterEndPreamble 
\RequirePackage{fix-cm} % eliminates pesky font size errors from background loading of Computer Modern Math fonts

\RequirePackage[margin=1in]{geometry} % margins
\RequirePackage{indentfirst} % indents first paragraph of a section
\RequirePackage{enumitem} % needed for customizing gb4e
\RequirePackage{titlesec} % easily redefine section titles
\RequirePackage[hang,flushmargin,multiple]{footmisc} % footnote customization
\RequirePackage[font={it}]{caption} % table/figure caption customization

\RequirePackage{booktabs} % nice-looking tables
\RequirePackage{fancyhdr} % headers and footers
\RequirePackage{array} % some advanced table functionality that should be default
\RequirePackage[natbibapa]{apacite} % references


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% FONTS AND XeLaTeX/PDFTeX SWITCH %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% NOTE ON SMALL CAPS:
% Small caps fonts in the body text (TNR) use TeX Gyre Termes, as all versions of Times New Roman before Windows 8.1 do not have small caps. If you are using Windows 8.1 or 10, this can be changed in the .cls file if you wish.
% Small caps fonts in the paper title and section titles (Arial) use TeX Gyre Heros, for similar reasons.

% Packages for these fonts should be installed with your LaTeX install, but that does not mean that XeLaTeX will automatically find them. You must install these with the rest of your system fonts, either by copying them from your TeX directory (search your filesystem for ``tex-gyre'') or by downloading them from here: http://www.ctan.org/tex-archive/fonts/tex-gyre/fonts/opentype/public/tex-gyre. They must be added to your operating system's font folder.
% To prevent these fonts from being loaded, use ``notexgyre'' as a documentclass option. This will probably only be the case if you don't need small caps or if your TNR and Arial have small caps (Windows 8.1+).

% NOTE ON DOULOS SIL FOR IPA:
% This class file loads SIL's Doulos font to supplement TNR's character set. If you do not have this font installed, and do not need it for your manuscript, load the documentclass with the option ``nodoulos''. If you do need IPA support but do not have Doulos, you can download it from: http://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=doulossil_download


% if xelatex option is selected, load the associated packages
\if@loadxelatex
	\RequirePackage{xltxtra,xunicode,fontspec}
	\defaultfontfeatures{Ligatures=TeX}
	\setmainfont[Scale=1]{Times New Roman}
	\setsansfont[Scale=1]{Arial}

	\if@loadtexgyre
	% replace TNR (lack of) small caps with TGT small caps
	\newfontfamily\tgtermes{TeX Gyre Termes}
		\begingroup
			\tgtermes
			\DeclareFontShape{\f@encoding}{\rmdefault}{m}{sc}{<-> ssub * \f@family/m/sc}{}
			\DeclareFontShape{\f@encoding}{\rmdefault}{bx}{sc}{<-> ssub * \f@family/bx/sc}{}
		\endgroup
	\newfontfamily\tgheros{TeX Gyre Heros}
		\begingroup
			\tgheros
			\DeclareFontShape{\f@encoding}{\sfdefault}{m}{sc}{<-> ssub * \f@family/m/sc}{}
			\DeclareFontShape{\f@encoding}{\sfdefault}{bx}{sc}{<-> ssub * \f@family/bx/sc}{}
		\endgroup
	\fi

	% load Doulos SIL for IPA
	\if@loaddoulos
		\newfontfamily\doulos{Doulos SIL}
	\fi


\else % if the user wishes to use pdflatex........
	\RequirePackage[T1]{fontenc}
	\RequirePackage{txfonts}
	\newcommand{\doulos}[1]{#1} % this is a null doulos command so that the example tex file compiles properly under PDFLaTeX
\fi

\let\footnotesize\small
% use postscript points (bp = 1/72 in) instead of TeX points (pt = 1/72.27 in)
%\p@=1bp % or \setlength{\p@}{1bp}

%\renewcommand\LARGE{\@setfontsize\LARGE{18pt}{20pt}}
%\renewcommand{\LARGE}{\fontsize{18pt}{20pt}\selectfont}
%\DeclareMathSizes{10}{10}{10}{10}
%\renewcommand{\Large}{\fontsize{15pt}{17pt}\selectfont}
%\renewcommand{\large}{\fontsize{12pt}{14pt}\selectfont}
%\renewcommand{\normalsize}{\fontsize{11pt}{13pt}\selectfont}
%\renewcommand{\small}{\fontsize{10pt}{12pt}\selectfont}
%\renewcommand{\footnotesize}{\fontsize{10pt}{12pt}\selectfont}
%\renewcommand{\scriptsize}{\fontsize{8pt}{10pt}\selectfont}
%\renewcommand{\tiny}{\fontsize{6pt}{8pt}\selectfont}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% LINGUISTIC EXAMPLES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%\def\LinguisticExamplesPackage#1{\xdef\@lingexpack{#1}}

%\def\@ling{\@lingexpack}
%\def\@lingexpack{linguex}

%\ifdefstring{\@lingexpack}{gb4e}{t}{}

\if@loadlinguex
	\RequirePackage{linguex}
	% formatting 
	\AfterEndPreamble{
	\setlength{\Exlabelwidth}{1cm}
	\setlength{\Exlabelsep}{0cm}
	\setlength{\SubExleftmargin}{1cm}
	\setlength{\SubSubExleftmargin}{1cm}
	\renewcommand{\SubSubExLBr}{}
	\renewcommand{\SubSubExRBr}{.}
	\renewcommand{\firstrefdash}{}
	}
\fi

\if@loadgb
	\AtEndPreamble{
	\RequirePackage{gb4e}
	}
\fi


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% TOP MATTER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% paper title
\newcommand\articletitle{\@ifnextchar[\@twotitles\@onetitle}
\def\@onetitle#1{\gdef\@fulltitle{#1}\gdef\@shorttitle{#1}}
\def\@twotitles[#1]#2{\gdef\@fulltitle{#2}\gdef\@shorttitle{#1}}
% current TWPL volume
\def\volnum#1{\gdef\@volnum{#1}}
\def\@volnum{\@latex@warning@no@line{No \noexpand\volnum given}}
% author affiliation
\def\affiliation#1{\gdef\@affiliation{#1}}
\def\@affiliation{\@latex@warning@no@line{No \noexpand\affiliation given}}
% acknowledgements footnote
\newif\if@ack
\def\acknowledge#1{\@acktrue \gdef\@acknowledgements{#1}}
% abstract
\def\abstract#1{\gdef\@abstract{#1}}
\def\makeabstract{\small\@abstract}

%% create title
\def\maketitle{%
	{\fontsize{18pt}{22pt}\selectfont\raggedright {\noindent\textsf{\@fulltitle}\if@ack\footnotemark\fi}\par}
	\vspace{11pt}

			\ifx \@author\@empty\relax
				\else {\noindent\raggedleft\textsf{\@author}} \\
			\ifx\@affiliation\@empty\relax
				\else {\raggedleft\textsf{\@affiliation}} \\
			\fi
}

%% create top matter
\def\topmatter{
	\thispagestyle{firstpage}
	% change footnote style to get *
	\renewcommand{\thefootnote}{\fnsymbol{footnote}}
	
	{\hspace{2.5in} \begin{minipage}{3.5in}
	\maketitle
	
	\makeabstract
	
	\end{minipage} }

	\if@ack
	\footnotetext{\@acknowledgements}
	\fi
	
	% change footnote style back to numbers; reset counter
	\renewcommand{\thefootnote}{\arabic{footnote}}\setcounter{footnote}{0}

	% establish bibliography style for later
	\bibliographystyle{apacite}

	% change separator for page postfix to a colon
	\renewcommand{\BBN}{: }

}

% insert top matter at start of document
\AtBeginDocument{\topmatter}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% PAGE LAYOUT, HEADERS & FOOTERS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setlength{\parindent}{1cm}
%\setlength{\parskip}{3pt}

% PAGE HEADERS AND NUMBERING
\renewcommand{\footrulewidth}{0pt}
\renewcommand{\headrulewidth}{0pt}
\fancyhf{}
\fancyhead[CO]{\small\textsc{\@shorttitle}}
\fancyhead[CE]{\small\textsc{\@author}}
\fancyfoot[C]{\small\thepage}
% define what appears on the first page
\fancypagestyle{firstpage}{
	\fancyhf{}
	%\fancyhead[L]{\LaTeX\ Template v0.3 [\today]}
	\fancyfoot[L]{\small\textit{Toronto Working Papers in Linguistics (TWPL), Volume \@volnum} \\
	\textit{\textcopyright\ \the\year\ \@author}}
}
\pagestyle{fancy}

% ADJUST SECTION/PARAGRAPH STYLES
\titleformat{\section}{}{\makebox[1cm][l]{\sf\normalsize\thesection}}{0in}{\sf\normalsize}
\titleformat{\subsection}{}{\makebox[1cm][l]{\sf\normalsize\thesubsection}}{0in}{\sf\normalsize}
\titleformat{\subsubsection}{}{\makebox[1cm][l]{\sf\normalsize\thesubsubsection}}{0in}{\sf\normalsize}

% adjust footnote rule length
\renewcommand{\footnoterule}{%
	\kern -3pt \hrule width 5cm \kern 2.6pt
}


\newcommand{\citeposs}[1]{\citeauthor{#1}'s (\citeyear{#1})}

% ADJUST LIST ENVIRONMENT INDENTATION
%\setlength{\leftmargini}{1cm}
%\setlength{\leftmarginii}{2cm}
%\setlength{\leftmarginiii}{3cm}
