Return-Path: <linux-kbuild+bounces-528-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEAD82C03B
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jan 2024 13:59:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18805285AB8
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jan 2024 12:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41BEF5EE9D;
	Fri, 12 Jan 2024 12:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="P6zaFcfn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D236BB22;
	Fri, 12 Jan 2024 12:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40CCGNXU006498;
	Fri, 12 Jan 2024 12:58:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2023-11-20; bh=ZGRVnEkK8aRECIBpGpnRzCqVytd2jHuIiwgd5giJKEI=;
 b=P6zaFcfn0gCnqNH0jFqyAIIWX/P+o9JPeGUBiEJvmfs1cd3HRiDb93hpg6VI4Jn6vBHK
 7rAFr+xTXDFuM0wJuQog7ZiU2TqXawZYIDSU+FF7iFuHf8ieXPTgnKEOGlNARXOWSnHW
 Fv7adLh5CHrLNV46hvGxWYqKEXBc5dc6habzxrgaPUxsPLIh261QdnG6QtSjem+1VJLV
 Fg3sJoReWa6XJWqRgZD3XDI3Ezm4aIDdkiXFla9xHHVfqEDM03N8EBmcC8S0n28jlTav
 p8UDfEE/pqMIrp5TxxE0rigl8U5c62V70hAAgPi3ZSJ2U3vj7JUu+T674fs+mlDlAH9k OA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3vk1ds8jyj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Jan 2024 12:58:41 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 40CAcIZH006986;
	Fri, 12 Jan 2024 12:58:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3vfur8g2rr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Jan 2024 12:58:40 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40CCwdh1002210;
	Fri, 12 Jan 2024 12:58:39 GMT
Received: from localhost.localdomain (dhcp-10-175-37-84.vpn.oracle.com [10.175.37.84])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 3vfur8g2qc-1;
	Fri, 12 Jan 2024 12:58:39 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>, Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        Vegard Nossum <vegard.nossum@oracle.com>
Subject: [PATCH] docs: kbuild/kconfig: reformat/cleanup
Date: Fri, 12 Jan 2024 13:58:30 +0100
Message-Id: <20240112125830.3753464-1-vegard.nossum@oracle.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-12_05,2024-01-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2401120101
X-Proofpoint-ORIG-GUID: 8OYrnNaDsO1kzva0EkelBXkG2BMJauj6
X-Proofpoint-GUID: 8OYrnNaDsO1kzva0EkelBXkG2BMJauj6

This document was using headings in an odd way, causing the sidebar to be
quite messy. I've adding new headings and turned some of the old headings
into description lists.

The indentation was a mix of spaces and tabs; I've turned them all into
4 spaces so it always reads correctly regardless of tab settings.

Also use ``...`` instead of `...`; the difference is that `` is meant
for "inline literals" (and renders in a monospace font) while ` is for
"interpreted text" (and renders with italics).

Also changed the title of the document to be more descriptive.

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 Documentation/kbuild/kconfig.rst | 363 ++++++++++++++-----------------
 1 file changed, 166 insertions(+), 197 deletions(-)

diff --git a/Documentation/kbuild/kconfig.rst b/Documentation/kbuild/kconfig.rst
index c946eb44bd13..fc4e845bc249 100644
--- a/Documentation/kbuild/kconfig.rst
+++ b/Documentation/kbuild/kconfig.rst
@@ -1,10 +1,10 @@
-===================
-Kconfig make config
-===================
+=================================
+Configuration targets and editors
+=================================
 
-This file contains some assistance for using `make *config`.
+This file contains some assistance for using ``make *config``.
 
-Use "make help" to list all of the possible configuration targets.
+Use ``make help`` to list all of the possible configuration targets.
 
 The xconfig ('qconf'), menuconfig ('mconf'), and nconfig ('nconf')
 programs also have embedded help text.  Be sure to check that for
@@ -12,8 +12,9 @@ navigation, search, and other general help text.
 
 The gconfig ('gconf') program has limited help text.
 
+
 General
--------
+=======
 
 New kernel releases often introduce new config symbols.  Often more
 important, new kernel releases may rename config symbols.  When
@@ -24,118 +25,102 @@ symbols have been introduced.
 
 To see a list of new config symbols, use::
 
-	cp user/some/old.config .config
-	make listnewconfig
+    cp user/some/old.config .config
+    make listnewconfig
 
 and the config program will list any new symbols, one per line.
 
 Alternatively, you can use the brute force method::
 
-	make oldconfig
-	scripts/diffconfig .config.old .config | less
-
-----------------------------------------------------------------------
-
-Environment variables for `*config`
+    make oldconfig
+    scripts/diffconfig .config.old .config | less
 
-KCONFIG_CONFIG
---------------
-This environment variable can be used to specify a default kernel config
-file name to override the default name of ".config".
 
-KCONFIG_DEFCONFIG_LIST
-----------------------
+Environment variables
+=====================
 
-This environment variable specifies a list of config files which can be used
-as a base configuration in case the .config does not exist yet. Entries in
-the list are separated with whitespaces to each other, and the first one
-that exists is used.
+Environment variables for ``*config``:
 
-KCONFIG_OVERWRITECONFIG
------------------------
-If you set KCONFIG_OVERWRITECONFIG in the environment, Kconfig will not
-break symlinks when .config is a symlink to somewhere else.
+``KCONFIG_CONFIG``
+    This environment variable can be used to specify a default kernel config
+    file name to override the default name of ".config".
 
-KCONFIG_WARN_UNKNOWN_SYMBOLS
-----------------------------
-This environment variable makes Kconfig warn about all unrecognized
-symbols in the config input.
+``KCONFIG_DEFCONFIG_LIST``
+    This environment variable specifies a list of config files which can be
+    used as a base configuration in case the .config does not exist yet.
+    Entries in the list are separated with whitespaces to each other, and
+    the first one that exists is used.
 
-KCONFIG_WERROR
---------------
-If set, Kconfig treats warnings as errors.
+``KCONFIG_OVERWRITECONFIG``
+    If you set KCONFIG_OVERWRITECONFIG in the environment, Kconfig will not
+    break symlinks when .config is a symlink to somewhere else.
 
-`CONFIG_`
----------
-If you set `CONFIG_` in the environment, Kconfig will prefix all symbols
-with its value when saving the configuration, instead of using the default,
-`CONFIG_`.
+``KCONFIG_WARN_UNKNOWN_SYMBOLS``
+    This environment variable makes Kconfig warn about all unrecognized
+    symbols in the config input.
 
-----------------------------------------------------------------------
+``KCONFIG_WERROR``
+    If set, Kconfig treats warnings as errors.
 
-Environment variables for '{allyes/allmod/allno/rand}config'
+``CONFIG_``
+    If you set ``CONFIG_`` in the environment, Kconfig will prefix all symbols
+    with its value when saving the configuration, instead of using the
+    default, ``CONFIG_``.
 
-KCONFIG_ALLCONFIG
------------------
-(partially based on lkml email from/by Rob Landley, re: miniconfig)
+Environment variables for ``{allyes/allmod/allno/rand}config``:
 
---------------------------------------------------
+``KCONFIG_ALLCONFIG``
+    The allyesconfig/allmodconfig/allnoconfig/randconfig variants can also
+    use the environment variable KCONFIG_ALLCONFIG as a flag or a filename
+    that contains config symbols that the user requires to be set to a
+    specific value.  If KCONFIG_ALLCONFIG is used without a filename where
+    KCONFIG_ALLCONFIG == "" or KCONFIG_ALLCONFIG == "1", ``make *config``
+    checks for a file named "all{yes/mod/no/def/random}.config"
+    (corresponding to the ``*config`` command that was used) for symbol values
+    that are to be forced.  If this file is not found, it checks for a
+    file named "all.config" to contain forced values.
 
-The allyesconfig/allmodconfig/allnoconfig/randconfig variants can also
-use the environment variable KCONFIG_ALLCONFIG as a flag or a filename
-that contains config symbols that the user requires to be set to a
-specific value.  If KCONFIG_ALLCONFIG is used without a filename where
-KCONFIG_ALLCONFIG == "" or KCONFIG_ALLCONFIG == "1", `make *config`
-checks for a file named "all{yes/mod/no/def/random}.config"
-(corresponding to the `*config` command that was used) for symbol values
-that are to be forced.  If this file is not found, it checks for a
-file named "all.config" to contain forced values.
+    This enables you to create "miniature" config (miniconfig) or custom
+    config files containing just the config symbols that you are interested
+    in.  Then the kernel config system generates the full .config file,
+    including symbols of your miniconfig file.
 
-This enables you to create "miniature" config (miniconfig) or custom
-config files containing just the config symbols that you are interested
-in.  Then the kernel config system generates the full .config file,
-including symbols of your miniconfig file.
-
-This 'KCONFIG_ALLCONFIG' file is a config file which contains
-(usually a subset of all) preset config symbols.  These variable
-settings are still subject to normal dependency checks.
-
-Examples::
+    This ``KCONFIG_ALLCONFIG`` file is a config file which contains
+    (usually a subset of all) preset config symbols.  These variable
+    settings are still subject to normal dependency checks.
 
-	KCONFIG_ALLCONFIG=custom-notebook.config make allnoconfig
+    Examples::
 
-or::
+        KCONFIG_ALLCONFIG=custom-notebook.config make allnoconfig
 
-	KCONFIG_ALLCONFIG=mini.config make allnoconfig
+    or::
 
-or::
+        KCONFIG_ALLCONFIG=mini.config make allnoconfig
 
-	make KCONFIG_ALLCONFIG=mini.config allnoconfig
+    or::
 
-These examples will disable most options (allnoconfig) but enable or
-disable the options that are explicitly listed in the specified
-mini-config files.
+        make KCONFIG_ALLCONFIG=mini.config allnoconfig
 
-----------------------------------------------------------------------
+    These examples will disable most options (allnoconfig) but enable or
+    disable the options that are explicitly listed in the specified
+    mini-config files.
 
-Environment variables for 'randconfig'
+Environment variables for ``randconfig``:
 
-KCONFIG_SEED
-------------
-You can set this to the integer value used to seed the RNG, if you want
-to somehow debug the behaviour of the kconfig parser/frontends.
-If not set, the current time will be used.
+``KCONFIG_SEED``
+    You can set this to the integer value used to seed the RNG, if you want
+    to somehow debug the behaviour of the kconfig parser/frontends.
+    If not set, the current time will be used.
 
-KCONFIG_PROBABILITY
--------------------
-This variable can be used to skew the probabilities. This variable can
-be unset or empty, or set to three different formats:
+``KCONFIG_PROBABILITY``
+    This variable can be used to skew the probabilities. This variable can
+    be unset or empty, or set to three different formats:
 
     =======================     ==================  =====================
-	KCONFIG_PROBABILITY     y:n split           y:m:n split
+    KCONFIG_PROBABILITY         y:n split           y:m:n split
     =======================     ==================  =====================
-	unset or empty          50  : 50            33  : 33  : 34
-	N                        N  : 100-N         N/2 : N/2 : 100-N
+    unset or empty              50  : 50            33  : 33  : 34
+    N                            N  : 100-N         N/2 : N/2 : 100-N
     [1] N:M                     N+M : 100-(N+M)      N  :  M  : 100-(N+M)
     [2] N:M:L                    N  : 100-N          M  :  L  : 100-(M+L)
     =======================     ==================  =====================
@@ -149,112 +134,98 @@ that:
 
 Examples::
 
-	KCONFIG_PROBABILITY=10
-		10% of booleans will be set to 'y', 90% to 'n'
-		5% of tristates will be set to 'y', 5% to 'm', 90% to 'n'
-	KCONFIG_PROBABILITY=15:25
-		40% of booleans will be set to 'y', 60% to 'n'
-		15% of tristates will be set to 'y', 25% to 'm', 60% to 'n'
-	KCONFIG_PROBABILITY=10:15:15
-		10% of booleans will be set to 'y', 90% to 'n'
-		15% of tristates will be set to 'y', 15% to 'm', 70% to 'n'
+    KCONFIG_PROBABILITY=10
+        10% of booleans will be set to 'y', 90% to 'n'
+        5% of tristates will be set to 'y', 5% to 'm', 90% to 'n'
+    KCONFIG_PROBABILITY=15:25
+        40% of booleans will be set to 'y', 60% to 'n'
+        15% of tristates will be set to 'y', 25% to 'm', 60% to 'n'
+    KCONFIG_PROBABILITY=10:15:15
+        10% of booleans will be set to 'y', 90% to 'n'
+        15% of tristates will be set to 'y', 15% to 'm', 70% to 'n'
 
-----------------------------------------------------------------------
+Environment variables for ``syncconfig``:
 
-Environment variables for 'syncconfig'
+``KCONFIG_NOSILENTUPDATE``
+    If this variable has a non-blank value, it prevents silent kernel
+    config updates (requires explicit updates).
 
-KCONFIG_NOSILENTUPDATE
-----------------------
-If this variable has a non-blank value, it prevents silent kernel
-config updates (requires explicit updates).
+``KCONFIG_AUTOCONFIG``
+    This environment variable can be set to specify the path & name of the
+    "auto.conf" file.  Its default value is "include/config/auto.conf".
 
-KCONFIG_AUTOCONFIG
-------------------
-This environment variable can be set to specify the path & name of the
-"auto.conf" file.  Its default value is "include/config/auto.conf".
+``KCONFIG_AUTOHEADER``
+    This environment variable can be set to specify the path & name of the
+    "autoconf.h" (header) file.
+    Its default value is "include/generated/autoconf.h".
 
-KCONFIG_AUTOHEADER
-------------------
-This environment variable can be set to specify the path & name of the
-"autoconf.h" (header) file.
-Its default value is "include/generated/autoconf.h".
-
-
-----------------------------------------------------------------------
 
 menuconfig
-----------
-
-SEARCHING for CONFIG symbols
+==========
 
 Searching in menuconfig:
 
-	The Search function searches for kernel configuration symbol
-	names, so you have to know something close to what you are
-	looking for.
+    The Search function searches for kernel configuration symbol
+    names, so you have to know something close to what you are
+    looking for.
 
-	Example::
+    Example::
 
-		/hotplug
-		This lists all config symbols that contain "hotplug",
-		e.g., HOTPLUG_CPU, MEMORY_HOTPLUG.
+        /hotplug
+        This lists all config symbols that contain "hotplug",
+        e.g., HOTPLUG_CPU, MEMORY_HOTPLUG.
 
-	For search help, enter / followed by TAB-TAB (to highlight
-	<Help>) and Enter.  This will tell you that you can also use
-	regular expressions (regexes) in the search string, so if you
-	are not interested in MEMORY_HOTPLUG, you could try::
+    For search help, enter / followed by TAB-TAB (to highlight
+    <Help>) and Enter.  This will tell you that you can also use
+    regular expressions (regexes) in the search string, so if you
+    are not interested in MEMORY_HOTPLUG, you could try::
 
-		/^hotplug
+        /^hotplug
 
-	When searching, symbols are sorted thus:
+    When searching, symbols are sorted thus:
 
-	  - first, exact matches, sorted alphabetically (an exact match
-	    is when the search matches the complete symbol name);
-	  - then, other matches, sorted alphabetically.
+    - first, exact matches, sorted alphabetically (an exact match
+      is when the search matches the complete symbol name);
+    - then, other matches, sorted alphabetically.
 
-	For example: ^ATH.K matches:
+    For example, ^ATH.K matches:
 
-	    ATH5K ATH9K ATH5K_AHB ATH5K_DEBUG [...] ATH6KL ATH6KL_DEBUG
-	    [...] ATH9K_AHB ATH9K_BTCOEX_SUPPORT ATH9K_COMMON [...]
+        ATH5K ATH9K ATH5K_AHB ATH5K_DEBUG [...] ATH6KL ATH6KL_DEBUG
+        [...] ATH9K_AHB ATH9K_BTCOEX_SUPPORT ATH9K_COMMON [...]
 
-	of which only ATH5K and ATH9K match exactly and so are sorted
-	first (and in alphabetical order), then come all other symbols,
-	sorted in alphabetical order.
+    of which only ATH5K and ATH9K match exactly and so are sorted
+    first (and in alphabetical order), then come all other symbols,
+    sorted in alphabetical order.
 
-	In this menu, pressing the key in the (#) prefix will jump
-	directly to that location. You will be returned to the current
-	search results after exiting this new menu.
+    In this menu, pressing the key in the (#) prefix will jump
+    directly to that location. You will be returned to the current
+    search results after exiting this new menu.
 
-----------------------------------------------------------------------
+User interface options for 'menuconfig':
 
-User interface options for 'menuconfig'
+``MENUCONFIG_COLOR``
+    It is possible to select different color themes using the variable
+    MENUCONFIG_COLOR.  To select a theme use::
 
-MENUCONFIG_COLOR
-----------------
-It is possible to select different color themes using the variable
-MENUCONFIG_COLOR.  To select a theme use::
+        make MENUCONFIG_COLOR=<theme> menuconfig
 
-	make MENUCONFIG_COLOR=<theme> menuconfig
+    Available themes are::
 
-Available themes are::
+      - mono       => selects colors suitable for monochrome displays
+      - blackbg    => selects a color scheme with black background
+      - classic    => theme with blue background. The classic look
+      - bluetitle  => a LCD friendly version of classic. (default)
 
-  - mono       => selects colors suitable for monochrome displays
-  - blackbg    => selects a color scheme with black background
-  - classic    => theme with blue background. The classic look
-  - bluetitle  => a LCD friendly version of classic. (default)
+``MENUCONFIG_MODE``
+    This mode shows all sub-menus in one large tree.
 
-MENUCONFIG_MODE
----------------
-This mode shows all sub-menus in one large tree.
+    Example::
 
-Example::
+        make MENUCONFIG_MODE=single_menu menuconfig
 
-	make MENUCONFIG_MODE=single_menu menuconfig
-
-----------------------------------------------------------------------
 
 nconfig
--------
+=======
 
 nconfig is an alternate text-based configurator.  It lists function
 keys across the bottom of the terminal (window) that execute commands.
@@ -266,61 +237,59 @@ Use F1 for Global help or F3 for the Short help menu.
 
 Searching in nconfig:
 
-	You can search either in the menu entry "prompt" strings
-	or in the configuration symbols.
+    You can search either in the menu entry "prompt" strings
+    or in the configuration symbols.
+
+    Use / to begin a search through the menu entries.  This does
+    not support regular expressions.  Use <Down> or <Up> for
+    Next hit and Previous hit, respectively.  Use <Esc> to
+    terminate the search mode.
 
-	Use / to begin a search through the menu entries.  This does
-	not support regular expressions.  Use <Down> or <Up> for
-	Next hit and Previous hit, respectively.  Use <Esc> to
-	terminate the search mode.
+    F8 (SymSearch) searches the configuration symbols for the
+    given string or regular expression (regex).
 
-	F8 (SymSearch) searches the configuration symbols for the
-	given string or regular expression (regex).
+    In the SymSearch, pressing the key in the (#) prefix will
+    jump directly to that location. You will be returned to the
+    current search results after exiting this new menu.
 
-	In the SymSearch, pressing the key in the (#) prefix will
-	jump directly to that location. You will be returned to the
-	current search results after exiting this new menu.
+Environment variables:
 
-NCONFIG_MODE
-------------
-This mode shows all sub-menus in one large tree.
+``NCONFIG_MODE``
+    This mode shows all sub-menus in one large tree.
 
-Example::
+    Example::
 
-	make NCONFIG_MODE=single_menu nconfig
+        make NCONFIG_MODE=single_menu nconfig
 
-----------------------------------------------------------------------
 
 xconfig
--------
+=======
 
 Searching in xconfig:
 
-	The Search function searches for kernel configuration symbol
-	names, so you have to know something close to what you are
-	looking for.
-
-	Example::
+    The Search function searches for kernel configuration symbol
+    names, so you have to know something close to what you are
+    looking for.
 
-		Ctrl-F hotplug
+    Example::
 
-	or::
+        Ctrl-F hotplug
 
-		Menu: File, Search, hotplug
+    or::
 
-	lists all config symbol entries that contain "hotplug" in
-	the symbol name.  In this Search dialog, you may change the
-	config setting for any of the entries that are not grayed out.
-	You can also enter a different search string without having
-	to return to the main menu.
+        Menu: File, Search, hotplug
 
+    lists all config symbol entries that contain "hotplug" in
+    the symbol name.  In this Search dialog, you may change the
+    config setting for any of the entries that are not grayed out.
+    You can also enter a different search string without having
+    to return to the main menu.
 
-----------------------------------------------------------------------
 
 gconfig
--------
+=======
 
 Searching in gconfig:
 
-	There is no search command in gconfig.  However, gconfig does
-	have several different viewing choices, modes, and options.
+    There is no search command in gconfig.  However, gconfig does
+    have several different viewing choices, modes, and options.
-- 
2.34.1


