% (c) 2002 Matthew Boedicker <mboedick@mboedick.org> (original author) http://mboedick.org
% (c) 2003-2007 David J. Grant <davidgrant-at-gmail.com> http://www.davidgrant.ca
% (c) 2008 Nathaniel Johnston <nathaniel@nathanieljohnston.com> http://www.nathanieljohnston.com
% (c) 2019 Jumar Martin <jumar@jumart.in> https://jumart.in

%This work is licensed under the Creative Commons Attribution-Noncommercial-Share Alike 2.5 License. To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/2.5/ or send a letter to Creative Commons, 543 Howard Street, 5th Floor, San Francisco, California, 94105, USA.


\ProvidesClass{listofpersonalprofessionalachievements}[List of Personal and Professional Achievements]
\LoadClass[letterpaper,10pt,draft]{article}
\newlength{\outerbordwidth}
\pagestyle{empty}
\raggedbottom
\usepackage{fontspec}
\setmainfont{Avenir}
\raggedright
\usepackage[svgnames]{xcolor}
\usepackage{framed}
\usepackage{tocloft}
\usepackage{etoolbox}
\usepackage{enumitem}

\robustify\cftdotfill

%-----------------------------------------------------------
%Margin setup

\setlength{\evensidemargin}{-0.25in}
\setlength{\headheight}{0in}
\setlength{\headsep}{0in}
\setlength{\oddsidemargin}{-0.25in}
\setlength{\paperheight}{11in}
\setlength{\paperwidth}{8.5in}
\setlength{\tabcolsep}{0in}
\setlength{\textheight}{9.5in}
\setlength{\textwidth}{7in}
\setlength{\topmargin}{-0.3in}
\setlength{\topskip}{0in}
\setlength{\voffset}{0.1in}
\setlist[itemize]{leftmargin=*}

%-----------------------------------------------------------
%Custom commands

% \openitem builds a free floating item that isn't tied to a particular
% subheading, only a header.
% ex. \openitem{Patents}{U.S. 3597875, 133737}
% will produce:
% *Patents* U.S. 3597875, 133737s
\newcommand{\openitem}[2]{\item[] \textbf{#1} #2\vspace{2pt}}

% \secheading creates a heading in the document
% ex. \secheading{Cool Things I've Done}
% will produce:
% *Cool Things I've Done*
\newcommand{\secheading}[1]{\vspace{2pt}
{
\setlength{\FrameSep}{\outerbordwidth}
\textbf{\large #1}
}
}

% \secsubheading creates an entry under a heading. This is usually used by \secitem as the biographical data portion of the item.
% ex. \secsubheading{Sr. Builder}{Frontier, Inc.}{Jan. 20xx}{Dec. 20xx}
% will produce:
% Sr. Builder              Jan. 20xx -- Dec. 20xx
% /Frontiner, Inc./
\newcommand{\secsubheading}[4]{
\vspace{2pt}
\begin{tabular*}{6.86in}{l@{\cftdotfill{\cftsecdotsep}\extracolsep{\fill}}r}
\textbf{#1} & #3 -- #4\\
\textit{#2} \\
\end{tabular*}
}


% \secitem provides a item under a section. This uses \secsubheading under the hood and includes a space to elaborate.
% variables 1-4 is passed to \secsubheading and variable 5 is provided below \secsubheading.
% ex. \secitem{Sr. Builder}{Frontier, Inc.}{Jan. 20xx}{Dec. 20xx}{Managed and built great products for millions to use.}
% will produce:
% Sr. Builder              Jan. 20xx -- Dec. 20xx
% /Frontiner, Inc./
%    Managed and buil great products for millions
%    to use.
\newcommand{\secitem}[5]{
\item[]
\secsubheading{#1}{#2}{#3}{#4}
\vspace{-10pt}
\begin{itemize}
\item[]{#5}
\end{itemize}
}

% \biodata presents quintessential data like your name, contact info, and a quip about you
% ex. \biodata{Xiva Martínez}{xiva@example.org}{Internet Frontiersman}
% will produce:
% Xiva Martínez            November 14th, 20xx
% xiva@example.org       Internet Frontiersman
\newcommand{\biodata}[3]{
\begin{tabular*}{7in}{l@{\extracolsep{\fill}}r}
\textbf{\Large #1} & \textbf{\today} \\
#2 & #3
\vspace{8pt}
\end{tabular*}
}

