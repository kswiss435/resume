%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Medium Length Professional CV - RESUME CLASS FILE
%
% This template has been downloaded from:
% http://www.LaTeXTemplates.com
%
% This class file defines the structure and design of the template. 
%
% Original header:
% Copyright (C) 2010 by Trey Hunner
%
% Copying and distribution of this file, with or without modification,
% are permitted in any medium without royalty provided the copyright
% notice and this notice are preserved. This file is offered as-is,
% without any warranty.
%
% Created by Trey Hunner and modified by www.LaTeXTemplates.com
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{resume}[2010/07/10 v0.9 Resume class]

\LoadClass[11pt,letterpaper]{article} % Font size and paper type

\usepackage[parfill]{parskip} % Remove paragraph indentation
\usepackage{array} % Required for boldface (\bf and \bfseries) tabular columns
\usepackage{ifthen} % Required for ifthenelse statements
\usepackage[T1]{fontenc}

\pagestyle{empty} % Suppress page numbers

%----------------------------------------------------------------------------------------
%	HEADINGS COMMANDS: Commands for printing name and address
%----------------------------------------------------------------------------------------

\def \name#1{\def\@name{#1}} % Defines the \name command to set name
\def \@name {} % Sets \@name to empty by default

\def \addressSep {$\diamond$} % Set default address separator to a diamond

% One, two or three address lines can be specified 
\let \@addressone \relax
\let \@addresstwo \relax
\let \@addressthree \relax

% \address command can be used to set the first, second, and third address (last 2 optional)
\def \address #1{
  \@ifundefined{@addresstwo}{
    \def \@addresstwo {#1}
  }{
  \@ifundefined{@addressthree}{
  \def \@addressthree {#1}
  }{
     \def \@addressone {#1}
  }}
}

% \printaddress is used to style an address line (given as input)
\def \printaddress #1{
  \begingroup
    \def \\ {\addressSep\ }
    \centerline{#1}
  \endgroup
  \par
  \addressskip
}

% \printname is used to print the name as a page header
\def \printname {
  \begingroup
    \hfil{\MakeUppercase{\namesize\bf \@name}}\hfil
    \nameskip\break
  \endgroup
}

%----------------------------------------------------------------------------------------
%	PRINT THE HEADING LINES
%----------------------------------------------------------------------------------------

\let\ori@document=\document
\renewcommand{\document}{
  \ori@document  % Begin document
  \printname % Print the name specified with \name
  \@ifundefined{@addressone}{}{ % Print the first address if specified
    \printaddress{\@addressone}}
  \@ifundefined{@addresstwo}{}{ % Print the second address if specified
    \printaddress{\@addresstwo}}
     \@ifundefined{@addressthree}{}{ % Print the third address if specified
    \printaddress{\@addressthree}}
}

%----------------------------------------------------------------------------------------
%	SECTION FORMATTING
%----------------------------------------------------------------------------------------

% Defines the rSection environment for the large sections within the CV
\newenvironment{rSection}[1]{ % 1 input argument - section name
  \sectionskip
  %\MakeUppercase{\textbf{\textsc{#1}}} % Section title
  \textsc{\textbf{\Large #1}} % Section title
  \sectionlineskip
  \hrule % Horizontal line
  \begin{list}{}{ % List for each individual item in the section
    \setlength{\leftmargin}{1.5em} % Margin within the section
  }
  \item[]
}{
  \end{list}
}

%----------------------------------------------------------------------------------------
%	WORK EXPERIENCE FORMATTING
%----------------------------------------------------------------------------------------

\newenvironment{rSubsection}[4]{ % 4 input arguments - company name, year(s) employed, job title and location
 {\bf #1} \hfill {#2} % Bold company name and date on the right
 \ifthenelse{\equal{#3}{}}{}{ % If the third argument is not specified, don't print the job title and location line
  \\
  {\em #3} \hfill {\em #4} % Italic job title and location
  }\smallskip
  \begin{list}{$\cdot$}{\leftmargin=0em} % \cdot used for bullets, no indentation
   \itemsep -0.5em \vspace{-0.5em} % Compress items in list together for aesthetics
  }{
  \end{list}
  \vspace{0.5em} % Some space after the list of bullet points
}

% The below commands define the whitespace after certain things in the document - they can be \smallskip, \medskip or \bigskip
\def\namesize{\huge} % Size of the name at the top of the document
\def\addressskip{\smallskip} % The space between the two address (or phone/email) lines
\def\sectionlineskip{\medskip} % The space above the horizontal line for each section 
\def\nameskip{\bigskip} % The space after your name at the top
\def\sectionskip{\medskip} % The space after the heading section


%%%%%%%%%%%%%%%%
% Bibliography %
%%%%%%%%%%%%%%%%

\RequirePackage[style=verbose, maxnames=99, sorting=ydnt]{biblatex}

\DeclareFieldFormat[article]{title}{#1\par}
\DeclareFieldFormat[book]{title}{#1\par}
\DeclareFieldFormat[inproceedings]{title}{#1\par}
\DeclareFieldFormat[misc]{title}{#1\par}
\DeclareFieldFormat[report]{title}{#1\par}

\DeclareBibliographyDriver{article}{%
	\printfield{title}%
	\newblock%
	\printnames{author}%
	\par%
	\newblock%
	{%
		\footnotesize\addfontfeature{Color=lightgray}\itshape%
		\usebibmacro{journal+issuetitle}%
		\setunit{\space}%
		\printfield{pages}%
		\newunit%
		\printlist{publisher}%
		\setunit*{\addcomma\space}%
		\printfield{year}%
		\newunit%
	}
	\par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{book}{%
	\printfield{title}%
	\newblock%
	\printnames{author}%
	\par%
	\newblock%
	{%
		\footnotesize\addfontfeature{Color=lightgray}\itshape%
		\printlist{publisher}%
		\setunit*{\addcomma\space}%
		\printfield{note}%
		\setunit*{\addcomma\space}%
		\printfield{year}%
		\setunit{\addcomma\space}%
		\printlist{location}%
		\newunit%
	}
	\par\vspace{0.3\baselineskip}
}


\DeclareBibliographyDriver{inproceedings}{%
	\printfield{title}%
	\newblock%
	\printnames{author}%
	\par%
	\newblock%
	{%
		\footnotesize\addfontfeature{Color=lightgray}%
		\printfield{booktitle}%
		\setunit{\addcomma\space}%
		\printfield{year}%
		\setunit{\addcomma\space}%
		\printlist{location}%
		\newunit%
	}
	\par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{misc}{%
	\printfield{title}%
	\newblock%
	\printnames{author}%
	\par%
	\newblock%
	{%
		\footnotesize\addfontfeature{Color=lightgray}\itshape%
		\printfield{booktitle}%
		\setunit*{\addcomma\space}%
		\printfield{note}%
		\setunit*{\addcomma\space}%
		\printfield{year}%
		\setunit{\addcomma\space}%
		\printlist{location}%
		\newunit%
	}
	\par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{report}{%
	\printfield{title}%
	\newblock%
	\printnames{author}%
	\par%
	\newblock%
	{%
		\footnotesize\addfontfeature{Color=lightgray}\itshape%
		\printfield{type}%
		\setunit{\space}%
		\printfield{number}%
		\setunit{\addcomma\space}%
		\printfield{year}%
		\newunit%
	}
	\par\vspace{0.3\baselineskip}
}

\DeclareNameFormat{author}{%
	\small\addfontfeature{Color=lightgray}%
	\ifblank{#3}{}{#3\space}#1%
	\ifthenelse{\value{listcount}<\value{liststop}}
	{\addcomma\space}
	{}%
}

\newcommand{\printbibsection}[2]{
	\begin{refsection}
		\nocite{*}
		\printbibliography[sorting=chronological, type={#1}, title={#2}, heading=subbibliography]
	\end{refsection}
}

\DeclareSortingScheme{chronological}{
	\sort[direction=descending]{\field{year}}
	\sort[direction=descending]{\field{month}}
}