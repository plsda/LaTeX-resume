\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv_article}[2020/12/29]

\LoadClass[a4paper]{article}

\RequirePackage[default]{raleway}
%\RequirePackage[sfdefault]{roboto}
%\RequirePackage{lmodern}

\RequirePackage{etoolbox}
\RequirePackage{titlesec}
\RequirePackage{xcolor}
\RequirePackage{fontawesome}
\RequirePackage{academicons}
\RequirePackage[parfill]{parskip}
\RequirePackage{graphicx, enumitem, tikz}
\RequirePackage[skins]{tcolorbox}
\RequirePackage{relsize}
\RequirePackage[none]{hyphenat}

\definecolor{cvRed}{rgb}{0.89, 0.32, 0.68}
\definecolor{cvGreen}{rgb}{0.32, 0.89, 0.68}
\definecolor{cvBlue}{rgb}{0.32, 0.68, 0.89}
\definecolor{cvBlack}{rgb}{0.19, 0.26, 0.40}
\definecolor{cvGray}{rgb}{0.35, 0.35, 0.35}
\definecolor{cvWhite}{HTML}{F8F8FF}
\definecolor{linkBlue}{HTML}{0645AD}
\RequirePackage{hyperref}
\RequirePackage[margin=1cm, bottom=0cm, top=0cm]{geometry}

\hypersetup
{
	colorlinks=true,
	linkcolor=cvWhite,
	filecolor=cvWhite,      
	urlcolor=cvWhite,
   %linkcolor=linkBlue,
   %filecolor=linkBlue,      
   %urlcolor=linkBlue,
}

\titlespacing*{\subsection}{0pt}{*1.5}{*.5}

\newlength\headerheight
\newlength\headerMainSeparation
\newlength\subsectionSeparation
\setlength\headerheight{4cm}
\setlength\headerMainSeparation{0mm}
\setlength\subsectionSeparation{1mm}

\titleformat{\section}
  {\fontsize{15}{20}\selectfont\raggedright\bfseries\color{cvBlack}}
  {}{0em}
  {}
  [\titlerule] 

\titleformat{\subsection}
  {\vspace{\subsectionSeparation}\fontsize{10}{10}\selectfont\bfseries\color{cvBlack}}
  {}{0em}
  {}

\let\oldSection\section
\let\oldSubsection\subsection

\renewcommand{\section}[2]{\oldSection[#1]{#1}
\begin{minipage}{\columnwidth}
#2
\end{minipage}
}

%[date]{subsection title, additional title description}
\renewcommand*{\subsection}[3][]{\oldSubsection[#2]{#2 \hfill #1\ifblank{#3}{}{{\\ \fontsize{8}{8}\selectfont #3}}}\raggedright} 


%[icon]{title/name, contents}
\newcommand*{\textField}[2][]{\mbox{\makebox[5mm]{#1}{#2}}} 

\newcommand*{\cvHeader}[7]{
\begin{enumerate}[label={},leftmargin=-\marginparwidth]
	\item\colorbox{cvGray}{
		%\hspace{1cm}
		\hspace{2cm}
		\begin{minipage}[t][\headerheight][c]{\paperwidth}
			\begin{minipage}[c][\headerheight][c]{10cm}
				{\color{cvWhite}\sffamily\mdseries\fontsize{30}{40}\selectfont #1 #2} \\ 
				{\color{cvWhite}\hspace*{5mm}\small{#3}}
				\vfill
			\end{minipage}
			\hspace{1cm}
			\begin{minipage}[c][\headerheight][c]{10cm}
				\begin{flushleft}
					\textField[\faEnvelope]{\color{cvWhite} #4} \\
					\textField[\faPhone]{\color{cvWhite} #5} \\
					\textField[\faGithub]{\color{cvWhite}\href{https://github.com/#6}{https://github.com/#6}} \\
					\textField[\faMapMarker]{\color{cvWhite} #7}\\
				\end{flushleft}
			\end{minipage}
		\end{minipage} 
	}
	\vspace{\headerMainSeparation}
\end{enumerate}
}

\newcommand{\cvBody}[2][]{%[sidebar contents]{main contents, main width ratio}
	\begin{minipage}[t][\dimexpr\textheight-\headerMainSeparation-\headerheight-40pt][t]{\textwidth}
		\cvMain{#2}
		%\hfill\vline\hfill
		\hfill
		\cvSidebar{#1}
	\end{minipage}
}

\newcommand{\cvMain}[1]{%
\begin{minipage}[t][\dimexpr\textheight-\headerMainSeparation-\headerheight-40pt][t]{0.65\textwidth}%
#1%
\end{minipage}%
}

\newcommand{\cvSidebar}[1]{%
\begin{minipage}[t][\dimexpr\textheight-\headerMainSeparation-\headerheight-40pt][t]{0.32\textwidth}%
#1%
\end{minipage}%
}
