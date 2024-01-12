Return-Path: <linux-kbuild+bounces-533-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED01182C5FA
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jan 2024 20:43:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE9321C24967
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jan 2024 19:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F1C215E9C;
	Fri, 12 Jan 2024 19:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A0JOEAA5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF1C15AC9;
	Fri, 12 Jan 2024 19:43:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99EB3C43390;
	Fri, 12 Jan 2024 19:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705088606;
	bh=+/sKBl2UsP9bXPWs3EwoHTK4eUTdqKRg1MEFTGvgPcc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A0JOEAA5rXELyi60uwOC/Zn+Wli0DD/lXa1RMLIw/HfA9CzEepzmuPP6JdXiBEly9
	 2WMC7Zj5tnzbmhO/I5BUcUU5G6UV7tUra32hrwaaDvvJD3EH6rQIoiwzMRTvxTsh7g
	 5DDrjGClwRQHfGPlLc+yX0Mj8atWrfzOv8fjytowOargdOOfmGuoxe3ldfjltcHfcc
	 A3YoJE8FYAsDDm+uEXDroYQ3USc4odNIu0uqbn5D8zRxE7usJAcVGhT4gdyoiP9LLC
	 czHTe+4fADGe9W2pd4dfPryH2Pf01smHhq155lzfDQWIJ2WXXk+WzqANaKHubC05iL
	 KbcKiudwW0t5w==
Date: Fri, 12 Jan 2024 12:43:23 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: kbuild/kconfig: reformat/cleanup
Message-ID: <20240112194323.GA3703896@dev-arch.thelio-3990X>
References: <20240112125830.3753464-1-vegard.nossum@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240112125830.3753464-1-vegard.nossum@oracle.com>

On Fri, Jan 12, 2024 at 01:58:30PM +0100, Vegard Nossum wrote:
> This document was using headings in an odd way, causing the sidebar to be
> quite messy. I've adding new headings and turned some of the old headings
> into description lists.
> 
> The indentation was a mix of spaces and tabs; I've turned them all into
> 4 spaces so it always reads correctly regardless of tab settings.
> 
> Also use ``...`` instead of `...`; the difference is that `` is meant
> for "inline literals" (and renders in a monospace font) while ` is for
> "interpreted text" (and renders with italics).
> 
> Also changed the title of the document to be more descriptive.
> 
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>

The output seems reasonable to me.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  Documentation/kbuild/kconfig.rst | 363 ++++++++++++++-----------------
>  1 file changed, 166 insertions(+), 197 deletions(-)
> 
> diff --git a/Documentation/kbuild/kconfig.rst b/Documentation/kbuild/kconfig.rst
> index c946eb44bd13..fc4e845bc249 100644
> --- a/Documentation/kbuild/kconfig.rst
> +++ b/Documentation/kbuild/kconfig.rst
> @@ -1,10 +1,10 @@
> -===================
> -Kconfig make config
> -===================
> +=================================
> +Configuration targets and editors
> +=================================
>  
> -This file contains some assistance for using `make *config`.
> +This file contains some assistance for using ``make *config``.
>  
> -Use "make help" to list all of the possible configuration targets.
> +Use ``make help`` to list all of the possible configuration targets.
>  
>  The xconfig ('qconf'), menuconfig ('mconf'), and nconfig ('nconf')
>  programs also have embedded help text.  Be sure to check that for
> @@ -12,8 +12,9 @@ navigation, search, and other general help text.
>  
>  The gconfig ('gconf') program has limited help text.
>  
> +
>  General
> --------
> +=======
>  
>  New kernel releases often introduce new config symbols.  Often more
>  important, new kernel releases may rename config symbols.  When
> @@ -24,118 +25,102 @@ symbols have been introduced.
>  
>  To see a list of new config symbols, use::
>  
> -	cp user/some/old.config .config
> -	make listnewconfig
> +    cp user/some/old.config .config
> +    make listnewconfig
>  
>  and the config program will list any new symbols, one per line.
>  
>  Alternatively, you can use the brute force method::
>  
> -	make oldconfig
> -	scripts/diffconfig .config.old .config | less
> -
> -----------------------------------------------------------------------
> -
> -Environment variables for `*config`
> +    make oldconfig
> +    scripts/diffconfig .config.old .config | less
>  
> -KCONFIG_CONFIG
> ---------------
> -This environment variable can be used to specify a default kernel config
> -file name to override the default name of ".config".
>  
> -KCONFIG_DEFCONFIG_LIST
> -----------------------
> +Environment variables
> +=====================
>  
> -This environment variable specifies a list of config files which can be used
> -as a base configuration in case the .config does not exist yet. Entries in
> -the list are separated with whitespaces to each other, and the first one
> -that exists is used.
> +Environment variables for ``*config``:
>  
> -KCONFIG_OVERWRITECONFIG
> ------------------------
> -If you set KCONFIG_OVERWRITECONFIG in the environment, Kconfig will not
> -break symlinks when .config is a symlink to somewhere else.
> +``KCONFIG_CONFIG``
> +    This environment variable can be used to specify a default kernel config
> +    file name to override the default name of ".config".
>  
> -KCONFIG_WARN_UNKNOWN_SYMBOLS
> -----------------------------
> -This environment variable makes Kconfig warn about all unrecognized
> -symbols in the config input.
> +``KCONFIG_DEFCONFIG_LIST``
> +    This environment variable specifies a list of config files which can be
> +    used as a base configuration in case the .config does not exist yet.
> +    Entries in the list are separated with whitespaces to each other, and
> +    the first one that exists is used.
>  
> -KCONFIG_WERROR
> ---------------
> -If set, Kconfig treats warnings as errors.
> +``KCONFIG_OVERWRITECONFIG``
> +    If you set KCONFIG_OVERWRITECONFIG in the environment, Kconfig will not
> +    break symlinks when .config is a symlink to somewhere else.
>  
> -`CONFIG_`
> ----------
> -If you set `CONFIG_` in the environment, Kconfig will prefix all symbols
> -with its value when saving the configuration, instead of using the default,
> -`CONFIG_`.
> +``KCONFIG_WARN_UNKNOWN_SYMBOLS``
> +    This environment variable makes Kconfig warn about all unrecognized
> +    symbols in the config input.
>  
> -----------------------------------------------------------------------
> +``KCONFIG_WERROR``
> +    If set, Kconfig treats warnings as errors.
>  
> -Environment variables for '{allyes/allmod/allno/rand}config'
> +``CONFIG_``
> +    If you set ``CONFIG_`` in the environment, Kconfig will prefix all symbols
> +    with its value when saving the configuration, instead of using the
> +    default, ``CONFIG_``.
>  
> -KCONFIG_ALLCONFIG
> ------------------
> -(partially based on lkml email from/by Rob Landley, re: miniconfig)
> +Environment variables for ``{allyes/allmod/allno/rand}config``:
>  
> ---------------------------------------------------
> +``KCONFIG_ALLCONFIG``
> +    The allyesconfig/allmodconfig/allnoconfig/randconfig variants can also
> +    use the environment variable KCONFIG_ALLCONFIG as a flag or a filename
> +    that contains config symbols that the user requires to be set to a
> +    specific value.  If KCONFIG_ALLCONFIG is used without a filename where
> +    KCONFIG_ALLCONFIG == "" or KCONFIG_ALLCONFIG == "1", ``make *config``
> +    checks for a file named "all{yes/mod/no/def/random}.config"
> +    (corresponding to the ``*config`` command that was used) for symbol values
> +    that are to be forced.  If this file is not found, it checks for a
> +    file named "all.config" to contain forced values.
>  
> -The allyesconfig/allmodconfig/allnoconfig/randconfig variants can also
> -use the environment variable KCONFIG_ALLCONFIG as a flag or a filename
> -that contains config symbols that the user requires to be set to a
> -specific value.  If KCONFIG_ALLCONFIG is used without a filename where
> -KCONFIG_ALLCONFIG == "" or KCONFIG_ALLCONFIG == "1", `make *config`
> -checks for a file named "all{yes/mod/no/def/random}.config"
> -(corresponding to the `*config` command that was used) for symbol values
> -that are to be forced.  If this file is not found, it checks for a
> -file named "all.config" to contain forced values.
> +    This enables you to create "miniature" config (miniconfig) or custom
> +    config files containing just the config symbols that you are interested
> +    in.  Then the kernel config system generates the full .config file,
> +    including symbols of your miniconfig file.
>  
> -This enables you to create "miniature" config (miniconfig) or custom
> -config files containing just the config symbols that you are interested
> -in.  Then the kernel config system generates the full .config file,
> -including symbols of your miniconfig file.
> -
> -This 'KCONFIG_ALLCONFIG' file is a config file which contains
> -(usually a subset of all) preset config symbols.  These variable
> -settings are still subject to normal dependency checks.
> -
> -Examples::
> +    This ``KCONFIG_ALLCONFIG`` file is a config file which contains
> +    (usually a subset of all) preset config symbols.  These variable
> +    settings are still subject to normal dependency checks.
>  
> -	KCONFIG_ALLCONFIG=custom-notebook.config make allnoconfig
> +    Examples::
>  
> -or::
> +        KCONFIG_ALLCONFIG=custom-notebook.config make allnoconfig
>  
> -	KCONFIG_ALLCONFIG=mini.config make allnoconfig
> +    or::
>  
> -or::
> +        KCONFIG_ALLCONFIG=mini.config make allnoconfig
>  
> -	make KCONFIG_ALLCONFIG=mini.config allnoconfig
> +    or::
>  
> -These examples will disable most options (allnoconfig) but enable or
> -disable the options that are explicitly listed in the specified
> -mini-config files.
> +        make KCONFIG_ALLCONFIG=mini.config allnoconfig
>  
> -----------------------------------------------------------------------
> +    These examples will disable most options (allnoconfig) but enable or
> +    disable the options that are explicitly listed in the specified
> +    mini-config files.
>  
> -Environment variables for 'randconfig'
> +Environment variables for ``randconfig``:
>  
> -KCONFIG_SEED
> -------------
> -You can set this to the integer value used to seed the RNG, if you want
> -to somehow debug the behaviour of the kconfig parser/frontends.
> -If not set, the current time will be used.
> +``KCONFIG_SEED``
> +    You can set this to the integer value used to seed the RNG, if you want
> +    to somehow debug the behaviour of the kconfig parser/frontends.
> +    If not set, the current time will be used.
>  
> -KCONFIG_PROBABILITY
> --------------------
> -This variable can be used to skew the probabilities. This variable can
> -be unset or empty, or set to three different formats:
> +``KCONFIG_PROBABILITY``
> +    This variable can be used to skew the probabilities. This variable can
> +    be unset or empty, or set to three different formats:
>  
>      =======================     ==================  =====================
> -	KCONFIG_PROBABILITY     y:n split           y:m:n split
> +    KCONFIG_PROBABILITY         y:n split           y:m:n split
>      =======================     ==================  =====================
> -	unset or empty          50  : 50            33  : 33  : 34
> -	N                        N  : 100-N         N/2 : N/2 : 100-N
> +    unset or empty              50  : 50            33  : 33  : 34
> +    N                            N  : 100-N         N/2 : N/2 : 100-N
>      [1] N:M                     N+M : 100-(N+M)      N  :  M  : 100-(N+M)
>      [2] N:M:L                    N  : 100-N          M  :  L  : 100-(M+L)
>      =======================     ==================  =====================
> @@ -149,112 +134,98 @@ that:
>  
>  Examples::
>  
> -	KCONFIG_PROBABILITY=10
> -		10% of booleans will be set to 'y', 90% to 'n'
> -		5% of tristates will be set to 'y', 5% to 'm', 90% to 'n'
> -	KCONFIG_PROBABILITY=15:25
> -		40% of booleans will be set to 'y', 60% to 'n'
> -		15% of tristates will be set to 'y', 25% to 'm', 60% to 'n'
> -	KCONFIG_PROBABILITY=10:15:15
> -		10% of booleans will be set to 'y', 90% to 'n'
> -		15% of tristates will be set to 'y', 15% to 'm', 70% to 'n'
> +    KCONFIG_PROBABILITY=10
> +        10% of booleans will be set to 'y', 90% to 'n'
> +        5% of tristates will be set to 'y', 5% to 'm', 90% to 'n'
> +    KCONFIG_PROBABILITY=15:25
> +        40% of booleans will be set to 'y', 60% to 'n'
> +        15% of tristates will be set to 'y', 25% to 'm', 60% to 'n'
> +    KCONFIG_PROBABILITY=10:15:15
> +        10% of booleans will be set to 'y', 90% to 'n'
> +        15% of tristates will be set to 'y', 15% to 'm', 70% to 'n'
>  
> -----------------------------------------------------------------------
> +Environment variables for ``syncconfig``:
>  
> -Environment variables for 'syncconfig'
> +``KCONFIG_NOSILENTUPDATE``
> +    If this variable has a non-blank value, it prevents silent kernel
> +    config updates (requires explicit updates).
>  
> -KCONFIG_NOSILENTUPDATE
> -----------------------
> -If this variable has a non-blank value, it prevents silent kernel
> -config updates (requires explicit updates).
> +``KCONFIG_AUTOCONFIG``
> +    This environment variable can be set to specify the path & name of the
> +    "auto.conf" file.  Its default value is "include/config/auto.conf".
>  
> -KCONFIG_AUTOCONFIG
> -------------------
> -This environment variable can be set to specify the path & name of the
> -"auto.conf" file.  Its default value is "include/config/auto.conf".
> +``KCONFIG_AUTOHEADER``
> +    This environment variable can be set to specify the path & name of the
> +    "autoconf.h" (header) file.
> +    Its default value is "include/generated/autoconf.h".
>  
> -KCONFIG_AUTOHEADER
> -------------------
> -This environment variable can be set to specify the path & name of the
> -"autoconf.h" (header) file.
> -Its default value is "include/generated/autoconf.h".
> -
> -
> -----------------------------------------------------------------------
>  
>  menuconfig
> -----------
> -
> -SEARCHING for CONFIG symbols
> +==========
>  
>  Searching in menuconfig:
>  
> -	The Search function searches for kernel configuration symbol
> -	names, so you have to know something close to what you are
> -	looking for.
> +    The Search function searches for kernel configuration symbol
> +    names, so you have to know something close to what you are
> +    looking for.
>  
> -	Example::
> +    Example::
>  
> -		/hotplug
> -		This lists all config symbols that contain "hotplug",
> -		e.g., HOTPLUG_CPU, MEMORY_HOTPLUG.
> +        /hotplug
> +        This lists all config symbols that contain "hotplug",
> +        e.g., HOTPLUG_CPU, MEMORY_HOTPLUG.
>  
> -	For search help, enter / followed by TAB-TAB (to highlight
> -	<Help>) and Enter.  This will tell you that you can also use
> -	regular expressions (regexes) in the search string, so if you
> -	are not interested in MEMORY_HOTPLUG, you could try::
> +    For search help, enter / followed by TAB-TAB (to highlight
> +    <Help>) and Enter.  This will tell you that you can also use
> +    regular expressions (regexes) in the search string, so if you
> +    are not interested in MEMORY_HOTPLUG, you could try::
>  
> -		/^hotplug
> +        /^hotplug
>  
> -	When searching, symbols are sorted thus:
> +    When searching, symbols are sorted thus:
>  
> -	  - first, exact matches, sorted alphabetically (an exact match
> -	    is when the search matches the complete symbol name);
> -	  - then, other matches, sorted alphabetically.
> +    - first, exact matches, sorted alphabetically (an exact match
> +      is when the search matches the complete symbol name);
> +    - then, other matches, sorted alphabetically.
>  
> -	For example: ^ATH.K matches:
> +    For example, ^ATH.K matches:
>  
> -	    ATH5K ATH9K ATH5K_AHB ATH5K_DEBUG [...] ATH6KL ATH6KL_DEBUG
> -	    [...] ATH9K_AHB ATH9K_BTCOEX_SUPPORT ATH9K_COMMON [...]
> +        ATH5K ATH9K ATH5K_AHB ATH5K_DEBUG [...] ATH6KL ATH6KL_DEBUG
> +        [...] ATH9K_AHB ATH9K_BTCOEX_SUPPORT ATH9K_COMMON [...]
>  
> -	of which only ATH5K and ATH9K match exactly and so are sorted
> -	first (and in alphabetical order), then come all other symbols,
> -	sorted in alphabetical order.
> +    of which only ATH5K and ATH9K match exactly and so are sorted
> +    first (and in alphabetical order), then come all other symbols,
> +    sorted in alphabetical order.
>  
> -	In this menu, pressing the key in the (#) prefix will jump
> -	directly to that location. You will be returned to the current
> -	search results after exiting this new menu.
> +    In this menu, pressing the key in the (#) prefix will jump
> +    directly to that location. You will be returned to the current
> +    search results after exiting this new menu.
>  
> -----------------------------------------------------------------------
> +User interface options for 'menuconfig':
>  
> -User interface options for 'menuconfig'
> +``MENUCONFIG_COLOR``
> +    It is possible to select different color themes using the variable
> +    MENUCONFIG_COLOR.  To select a theme use::
>  
> -MENUCONFIG_COLOR
> -----------------
> -It is possible to select different color themes using the variable
> -MENUCONFIG_COLOR.  To select a theme use::
> +        make MENUCONFIG_COLOR=<theme> menuconfig
>  
> -	make MENUCONFIG_COLOR=<theme> menuconfig
> +    Available themes are::
>  
> -Available themes are::
> +      - mono       => selects colors suitable for monochrome displays
> +      - blackbg    => selects a color scheme with black background
> +      - classic    => theme with blue background. The classic look
> +      - bluetitle  => a LCD friendly version of classic. (default)
>  
> -  - mono       => selects colors suitable for monochrome displays
> -  - blackbg    => selects a color scheme with black background
> -  - classic    => theme with blue background. The classic look
> -  - bluetitle  => a LCD friendly version of classic. (default)
> +``MENUCONFIG_MODE``
> +    This mode shows all sub-menus in one large tree.
>  
> -MENUCONFIG_MODE
> ----------------
> -This mode shows all sub-menus in one large tree.
> +    Example::
>  
> -Example::
> +        make MENUCONFIG_MODE=single_menu menuconfig
>  
> -	make MENUCONFIG_MODE=single_menu menuconfig
> -
> -----------------------------------------------------------------------
>  
>  nconfig
> --------
> +=======
>  
>  nconfig is an alternate text-based configurator.  It lists function
>  keys across the bottom of the terminal (window) that execute commands.
> @@ -266,61 +237,59 @@ Use F1 for Global help or F3 for the Short help menu.
>  
>  Searching in nconfig:
>  
> -	You can search either in the menu entry "prompt" strings
> -	or in the configuration symbols.
> +    You can search either in the menu entry "prompt" strings
> +    or in the configuration symbols.
> +
> +    Use / to begin a search through the menu entries.  This does
> +    not support regular expressions.  Use <Down> or <Up> for
> +    Next hit and Previous hit, respectively.  Use <Esc> to
> +    terminate the search mode.
>  
> -	Use / to begin a search through the menu entries.  This does
> -	not support regular expressions.  Use <Down> or <Up> for
> -	Next hit and Previous hit, respectively.  Use <Esc> to
> -	terminate the search mode.
> +    F8 (SymSearch) searches the configuration symbols for the
> +    given string or regular expression (regex).
>  
> -	F8 (SymSearch) searches the configuration symbols for the
> -	given string or regular expression (regex).
> +    In the SymSearch, pressing the key in the (#) prefix will
> +    jump directly to that location. You will be returned to the
> +    current search results after exiting this new menu.
>  
> -	In the SymSearch, pressing the key in the (#) prefix will
> -	jump directly to that location. You will be returned to the
> -	current search results after exiting this new menu.
> +Environment variables:
>  
> -NCONFIG_MODE
> -------------
> -This mode shows all sub-menus in one large tree.
> +``NCONFIG_MODE``
> +    This mode shows all sub-menus in one large tree.
>  
> -Example::
> +    Example::
>  
> -	make NCONFIG_MODE=single_menu nconfig
> +        make NCONFIG_MODE=single_menu nconfig
>  
> -----------------------------------------------------------------------
>  
>  xconfig
> --------
> +=======
>  
>  Searching in xconfig:
>  
> -	The Search function searches for kernel configuration symbol
> -	names, so you have to know something close to what you are
> -	looking for.
> -
> -	Example::
> +    The Search function searches for kernel configuration symbol
> +    names, so you have to know something close to what you are
> +    looking for.
>  
> -		Ctrl-F hotplug
> +    Example::
>  
> -	or::
> +        Ctrl-F hotplug
>  
> -		Menu: File, Search, hotplug
> +    or::
>  
> -	lists all config symbol entries that contain "hotplug" in
> -	the symbol name.  In this Search dialog, you may change the
> -	config setting for any of the entries that are not grayed out.
> -	You can also enter a different search string without having
> -	to return to the main menu.
> +        Menu: File, Search, hotplug
>  
> +    lists all config symbol entries that contain "hotplug" in
> +    the symbol name.  In this Search dialog, you may change the
> +    config setting for any of the entries that are not grayed out.
> +    You can also enter a different search string without having
> +    to return to the main menu.
>  
> -----------------------------------------------------------------------
>  
>  gconfig
> --------
> +=======
>  
>  Searching in gconfig:
>  
> -	There is no search command in gconfig.  However, gconfig does
> -	have several different viewing choices, modes, and options.
> +    There is no search command in gconfig.  However, gconfig does
> +    have several different viewing choices, modes, and options.
> -- 
> 2.34.1
> 

