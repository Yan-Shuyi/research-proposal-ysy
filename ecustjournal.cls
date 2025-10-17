% ecustjournal.cls

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ecustjournal}[2025/10/17 ECUST Journal Template]

% ==================== 基础设置 ====================
\LoadClass[12pt, a4paper, twoside]{article} % 添加 twoside 双面打印
\RequirePackage{fontspec}
\RequirePackage{xeCJK}
\RequirePackage{setspace}
\RequirePackage{geometry}
\RequirePackage{titlesec}
\RequirePackage{enumitem}

\usepackage{tikz}
\usetikzlibrary{positioning, calc} % 添加必要的库

% ==================== 参考文献设置 ====================
\RequirePackage[%
backend=biber,
style=gb7714-2015,
citestyle=gb7714-2015,
sorting=none
]{biblatex}
\addbibresource{references.bib} % 参考文献文件

% ==================== 页眉页脚设置 ====================
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}

% ==================== 页面设置（匹配Word模板） ====================
\geometry{
	a4paper,                  % A4纸张 (29.7cm × 21cm)
	left=18mm,                 % 左边界 1.8cm
	right=20mm,                % 右边界 2.0cm  
	top=20mm,                  % 上边界 2.0cm
	bottom=20mm,               % 下边界 2.0cm
	headheight=15pt,           % 页眉高度 1.5cm换算
	headsep=4mm,               % 页眉与正文间距
	footskip=15mm,             % 页脚基线距离 1.5cm
	bindingoffset=5mm,         % 装订线偏移（靠左）
	includeheadfoot            % 包含页眉页脚在版心内
}

% ==================== 行距和缩进设置 ====================
\setstretch{1.5} % 1.5倍行距
\setlength{\parindent}{2em} % 首行缩进2个字符
\RequirePackage{indentfirst} % 确保每个段落都有首行缩进

% ==================== 字体设置 ====================
\setCJKmainfont{SimSun}[BoldFont=SimHei] % 中文字体：宋体，粗体：黑体
\setmainfont{Times New Roman} % 英文字体：Times New Roman

% ==================== 字体字号 ====================
%使用默认字体字号，与word模板字体字号不同

% ==================== 页眉页脚详细设置 ====================
% 定义页眉信息命令
\newcommand{\@headertitle}{} % 页眉标题
\newcommand{\headertitle}[1]{\renewcommand{\@headertitle}{#1}}

\pagestyle{fancy}
\fancyhf{} % 清除所有页眉页脚

% 常规页面设置 - 双面对称布局
% 页眉标题填这里
\fancyhead[C]{\small \@headertitle} % 文章标题
\fancyhead[LE]{\small \thepage} % 偶数页左上角：页码
\fancyhead[RO]{\small \thepage} % 奇数页右上角：页码

% ==================== 目录设置 ====================
\renewcommand{\contentsname}{目录}
\renewcommand\tableofcontents{%
	\section*{\contentsname}%
	\@starttoc{toc}%
}

% ==================== 标题格式设置 ====================
\titleformat{name=\section,numberless}{\bfseries\large\centering}{}{0em}{}
% 所有标题靠左对齐
\titleformat{\section}{\bfseries\large}{\thesection}{1em}{}
\titleformat{\subsection}{\bfseries}{\thesubsection}{1em}{}
\titleformat{\subsubsection}{\bfseries}{\thesubsubsection}{1em}{}

% ==================== 自定义命令 ====================
% 中文标题、作者、单位
\newcommand{\chinesetitle}[1]{\begin{center}\bfseries\large #1\end{center}}
\newcommand{\chineseauthor}[1]{\begin{center}#1\end{center}}
\newcommand{\chineseaffiliation}[1]{\begin{center}(#1)\end{center}}

% 英文标题、作者、单位
\newcommand{\englishtitle}[1]{\begin{center}\bfseries\large #1\end{center}}
\newcommand{\englishauthor}[1]{\begin{center}#1\end{center}}
\newcommand{\englishaffiliation}[1]{\begin{center}(#1)\end{center}}

% ==================== 摘要格式调整 ====================
% 摘要内容与"摘要"字样在同一行
\renewenvironment{abstract}{%
	\vspace{0.5em}
	\noindent\textbf{摘要: } % "摘要"与内容在同一行
	\ignorespaces % 忽略接下来的空格
}{%
	\par
	\vspace{0.5em}
}

\newenvironment{abstracten}{%
	\vspace{0.5em}
	\noindent\textbf{Abstract: } % "摘要"与内容在同一行
	\ignorespaces % 忽略接下来的空格
}{%
	\par
	\vspace{0.5em}
}

% 关键词和分类号
\newcommand{\keywords}[1]{\noindent\textbf{关键词:} #1}
\newcommand{\enkeywords}[1]{\noindent\textbf{Key words:} #1}

% ==================== 数学相关宏包 ====================
\RequirePackage{amsmath}      % 基础数学公式
\RequirePackage{amssymb}      % 数学符号
\RequirePackage{amsthm}       % 定理环境
\RequirePackage{bm}           % 粗体数学符号
\RequirePackage{mathtools}    % 数学工具扩展
\RequirePackage{mathrsfs}     % 花体字母

% ==================== 定理及图表环境设置 ====================
\theoremstyle{definition}     % 定义类环境样式
\newtheorem{definition}{定义}[section]   % 自动编号：定义2.1
\newtheorem{property}{性质}[section]    % 自动编号：性质2.1  
\newtheorem{theorem}{定理}[section]      % 自动编号：定理2.1
\newtheorem{lemma}{引理}[section]        % 引理环境
\newtheorem{corollary}{推论}[section]    % 推论环境
\newtheorem{proposition}{命题}[section]  % 命题环境

\theoremstyle{remark}         % 注记类环境样式
\newtheorem*{remark}{注}       % 注环境（不编号）
\newtheorem*{example}{例}      % 例环境（不编号）

% 设置证明环境为中文
\renewenvironment{proof}[1][\textbf{证明}]{\par
	\noindent#1:\quad
	\ignorespaces
}{%
	\hfill$\square$\par
}

% ==================== 算法环境设置 ====================
\RequirePackage{algorithm}     % 算法环境
\RequirePackage{algpseudocode} % 算法伪代码
\RequirePackage{algorithmicx}  % 算法扩展

% 算法样式设置
\floatname{algorithm}{算法}    % 将"Algorithm"改为"算法"
\renewcommand{\algorithmicrequire}{\textbf{输入:}}    % 输入格式
\renewcommand{\algorithmicensure}{\textbf{输出:}}     % 输出格式
\renewcommand{\algorithmiccomment}[1]{\hfill\text{// #1}} % 注释格式

% ==================== 表格和图表设置 ====================
\RequirePackage{booktabs}      % 三线表
\RequirePackage{array}         % 表格扩展
\RequirePackage{multirow}      % 多行表格
\RequirePackage{graphicx}      % 图形支持
\RequirePackage{caption}       % 标题格式
\RequirePackage{threeparttable}% 表格注释支持
\RequirePackage{subcaption}    % 子图表

% ==================== 图表标题中英文双语设置 ====================
% 使用bicaption宏包支持中英文双语标题
\RequirePackage{bicaption}     % 中英文双语标题

% 设置中英文标题格式
\captionsetup[figure][bi-first]{name=图} % 中文图标题
\captionsetup[figure][bi-second]{name=Fig.} % 英文图标题
\captionsetup[table][bi-first]{name=表} % 中文表标题
\captionsetup[table][bi-second]{name=Table} % 英文表标题

% 定义中英文双语标题命令
\newcommand{\figbicaption}[2]{%
	\bicaption{#1}{#2} % 中文标题、英文标题
}

\newcommand{\tabbicaption}[2]{%
	\bicaption{#1}{#2} % 中文标题、英文标题
}

% ==================== 封面设置 ====================
\newcommand{\@ecustlogo}{} % 校徽图片路径
\newcommand{\ecustlogo}[1]{\renewcommand{\@ecustlogo}{#1}}

\newcommand{\@reporttitle}{} % 报告标题
\newcommand{\reporttitle}[1]{\renewcommand{\@reporttitle}{#1}}

% 修改所有字段命令以支持文本输入
\newcommand{\@studentname}{\underline{\hspace{8cm}}} % 姓名
\newcommand{\studentname}[1]{\renewcommand{\@studentname}{\underline{\makebox[8cm][l]{#1}}}}

\newcommand{\@studentid}{\underline{\hspace{8cm}}} % 学号
\newcommand{\studentid}[1]{\renewcommand{\@studentid}{\underline{\makebox[8cm][l]{#1}}}}

\newcommand{\@college}{\underline{\hspace{8cm}}} % 学院
\newcommand{\college}[1]{\renewcommand{\@college}{\underline{\makebox[8cm][l]{#1}}}}

\newcommand{\@advisor}{\underline{\hspace{8cm}}} % 导师
\newcommand{\advisor}[1]{\renewcommand{\@advisor}{\underline{\makebox[8cm][l]{#1}}}}

% 定义主标题和副标题变量
\newcommand{\@thesistitle}{\underline{\hspace{8cm}}}
\newcommand{\@thesissubtitle}{} % 初始为空

% 主标题命令
\newcommand{\thesistitle}[1]{
	\renewcommand{\@thesistitle}{\underline{\makebox[8cm][l]{#1}}}
}

% 副标题命令
\newcommand{\thesissubtitle}[1]{
	\renewcommand{\@thesissubtitle}{\underline{\makebox[8cm][l]{#1}}}
}

\newcommand{\@proposaltime}{\underline{\hspace{8cm}}} % 开题时间
\newcommand{\proposaltime}[1]{\renewcommand{\@proposaltime}{\underline{\makebox[8cm][l]{#1}}}}

% 封面生成命令
\newcommand{\makecover}{
	\begin{titlepage}
		\centering
		
		\vspace*{1.5cm}
		
		% 校徽和校名
		\begin{tabular}{@{}c@{}}
			\includegraphics[width=0.5\textwidth]{\@ecustlogo} \\
			\vspace{1.5cm}
			{\fontsize{36}{43}\selectfont\bfseries \@reporttitle}
		\end{tabular}
		
		\vspace{1cm}
		
		% 学生信息表格 - 支持多行题目
		{\fontsize{14}{17}\selectfont\bfseries
			\begin{tabular}{@{}l@{\hspace{1.5em}}l@{}}
				\makebox[4em][s]{姓\hfill 名}： & \@studentname \\[1.2em]
				\makebox[4em][s]{学\hfill 号}： & \@studentid \\[1.2em]
				\makebox[4em][s]{学\hfill 院}： & \@college \\[1.2em]
				\makebox[4em][s]{导\hfill 师}： & \@advisor \\[1.2em]
				\makebox[4em][s]{论文题目}： & \@thesistitle \\
				\ifx\@thesissubtitle\empty
				% 无副标题，不添加行
				\else
				\makebox[4em][s]{} & \@thesissubtitle \\[1.2em]
				\fi
				\makebox[4em][s]{开题时间}： & \@proposaltime \\
			\end{tabular}
		}
		
		\vfill
		
		% 底部信息
		{\fontsize{16}{19}\selectfont\bfseries
			\renewcommand{\arraystretch}{1.5}
			\begin{tabular}{c}
				研究生院制表 \\[0.5em]
				\vspace{0.8cm}
			\end{tabular}
		}
	\end{titlepage}
}

% ==================== 表格数字对齐设置 ====================
\RequirePackage{siunitx}
\sisetup{
	detect-mode,
	group-digits = false,
	input-signs = + -,
	input-symbols = ( ) [ ] * + - ×,
	round-mode = places,
	round-precision = 2
}

% ==================== 其他实用宏包 ====================
\RequirePackage{verbatim}      % 代码环境
\RequirePackage{hyperref}      % 超链接（建议最后加载）
\RequirePackage{cleveref}      % 智能引用

% ==================== 超链接设置（最后加载） ====================
\AtEndOfClass{
	\RequirePackage{hyperref}
	\hypersetup{
		colorlinks=true,
		linkcolor=blue,
		citecolor=red,
		urlcolor=magenta,
		pdftitle={ECUST Journal Template},
		pdfauthor={Author Name}
	}
}

% ==================== 多行注释 ====================
% 定义注释环境
\RequirePackage{comment} % 加载comment宏包

% ==================== 编译优化设置 ====================
% 减少过满和欠满的警告
\clubpenalty=10000
\widowpenalty=10000
\brokenpenalty=10000

% 允许稍微灵活的页面布局
\emergencystretch=1em
\tolerance=500

% ==================== 自定义环境 ====================
% 定义示例环境
\newenvironment{exampleenv}[1][]{
	\begin{trivlist}
		\item[\hskip\labelsep \bfseries 例#1:]
	}{\end{trivlist}}

% 定义注意环境
\newenvironment{noteenv}[1][]{
	\begin{trivlist}
		\item[\hskip\labelsep \bfseries 注#1:]
	}{\end{trivlist}}

% ==================== 文档结束 ====================
\endinput