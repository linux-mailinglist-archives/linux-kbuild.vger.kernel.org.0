Return-Path: <linux-kbuild+bounces-10004-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FA0CA5DC8
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Dec 2025 02:54:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F24430517E0
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Dec 2025 01:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A60922D4C8;
	Fri,  5 Dec 2025 01:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rA7DYt3o"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5D03770B;
	Fri,  5 Dec 2025 01:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764899638; cv=none; b=RWAWsetkDRIki/X9aE8l7CPFg6rUkkTzhqub2mwJ7WlbSYdjbDJc06np81nmFlKo6C1XnKI7KHc9ap9O3/Xmww/pGForG5wjhYmdWgsGYXHWODuhhTJ0emxRuTR8eiuHSzsMUgTjKCzUWzyr2jqFndRCDES1xHuLLob4d7m7RRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764899638; c=relaxed/simple;
	bh=fzFtXmRzW8phQjwnDu8d79FYINqCY8a8xAS3c8jhnsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e4veI0IufJxXdiaK1GqlStKOHdJXN6E7iScP/9QioZThrdT4VIWOOfLe805WEi6mHiSSA28fMl8hoiicZe0uy4t3RtHkZ4wyYMeS+whWVYvE6CTiDql1zhJBFEy/z9xkSr3eOT/Ofp3YiXNLhSTEGF5eUltfJ0YGl4GirH+KohY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rA7DYt3o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0C88C4CEFB;
	Fri,  5 Dec 2025 01:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764899637;
	bh=fzFtXmRzW8phQjwnDu8d79FYINqCY8a8xAS3c8jhnsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rA7DYt3okp9Oq/YXjRJQVi7MTBWBULl37f7rlvYQquef71eX7Ng7zrbDkULWh4+AT
	 YGmmTlBfaRLrDOoWU5j1T1IFATza/lBId2ErpCv+hsE9YSN33K7hJf99aBLGZV7V/Y
	 8pFtUfynImp959HN52XRbFULEKtyYdNUNXairTiVMTYya7WuN25QJMzBowyfX2jG6F
	 xPl46dZgr9ksjE6y9O7+9BE64LHa60c7hEgvAjFK8ItoEie9Yv3HeawDi0htyUjc0D
	 xLIK9CAIL68quGVF+ys9aWgfcGOTgclhHxe9VR+CK/hwDeiX2lFHq6HN92pJDCHaja
	 eBW50ZySeMD8Q==
Date: Thu, 4 Dec 2025 18:53:52 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Graham Roff <grahamr@qti.qualcomm.com>
Cc: Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Nicolas Pitre <nico@fluxnic.net>,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2] Support conditional deps using "depends on X if Y"
Message-ID: <20251205015352.GA2060615@ax162>
References: <20251118-kconfig_conditional_deps-v2-1-e360792edaed@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118-kconfig_conditional_deps-v2-1-e360792edaed@qti.qualcomm.com>

Hi Graham,

+ Arnd, who often fixes Kconfig issues and might have some thoughts
around this.

I also forgot to mention this on v1 but please add the "kconfig:"
subject prefix to the commit message to clearly indicate what area this
is touching.

On Tue, Nov 18, 2025 at 10:46:51AM -0800, Graham Roff wrote:
> From: Nicolas Pitre <nico@fluxnic.net>
> 
> Extend the "depends on" syntax to support conditional dependencies
> using "depends on X if Y". While functionally equivalent to "depends
> on X || (Y == n)", "depends on X if Y" is much more readable and
> makes the kconfig language uniform in supporting the "if <expr>"
> suffix.
> This also improves readability for "optional" dependencies, which
> are the subset of conditional dependencies where X is Y.
> Previously such optional dependencies had to be expressed as
> the counterintuitive "depends on X || !X", now this can be
> represented as "depends on X if X".
> 
> The change is implemented by converting the "X if Y" syntax into the
> "X || (Y == n)" syntax during "depends on" token processing.
> 
> Signed-off-by: Nicolas Pitre <nico@fluxnic.net>
> 
> [Graham Roff: Rewrote commit message and redid patch for latest kernel]
> 
> Signed-off-by: Graham Roff <grahamr@qti.qualcomm.com>
> ---
> This patch updates an earlier one that was not merged to work on 
> the latest kernel release.
> 
> Link: https://lwn.net/ml/linux-kernel/nycvar.YSQ.7.76.2004231102480.2671@knanqh.ubzr/#t
> 
> Support for this change has been expressed by a number of developers
> since the original patch was proposed back in 2020, and has recently
> also been raised as a patch to the Zephyr kconfig system.
> One specific use is when mapping the Bluetooth specification to Kconfig,
> as it explicitly provides dependencies between features as conditional
> on other features. Many other cases exist where the "slightly
> counterintuitive" (quoted from the Kconfig specification) expression 
> "depends on BAR || !BAR" has been used when a proper "if" condition 
> would be more readable. Some examples:
> 
> arch/arm64/Kconfig:
>   depends on ARM64_64K_PAGES || !ARM64_VA_BITS_52 -->
>   depends on ARM64_64K_PAGES if ARM64_VA_BITS_52
> arch/mips/Kconfig:
>   depends on SYS_SUPPORTS_HOTPLUG_CPU || !SMP -->
>   depends on SYS_SUPPORTS_HOTPLUG_CPU if SMP
> arch/riscv/Kconfig:
>   depends on CC_HAS_MIN_FUNCTION_ALIGNMENT || !RISCV_ISA_C -->
>   depends on CC_HAS_MIN_FUNCTION_ALIGNMENT if RISCV_ISA_C
> arch/x86/Kconfig:
>   depends on X86_64 || !SPARSEMEM -->
>   depends on X86_64 if SPARSEMEM
> drivers/acpi/Kconfig:
>   depends on ACPI_WMI || !X86 -->
>   depends on ACPI_WMI if X86
> drivers/bluetooth/Kconfig:
>   depends on USB || !BT_HCIBTUSB_MTK
>   depends on USB if BT_HCIBTUSB_MTK
> mm/Kconfig:
>   depends on !ARM || CPU_CACHE_VIPT -->
>   depends on CPU_CACHE_VIPT if ARM
> kernel/Kconfig.locks:
>   depends on !PREEMPTION || ARCH_INLINE_READ_UNLOCK -->
>   depends on ARCH_INLINE_READ_UNLOCK if PREEMPTION

On the surface, the vast majority these become more readable using the
'if' syntax.

> The earlier patch discussion ended without a real conclusion and should
> be revisited now.
> ---
> Changes in v2:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.
> - Link to v1: https://lore.kernel.org/r/20251107-kconfig_conditional_deps-v1-1-aff22199ec0b@qti.qualcomm.com
> ---
>  Documentation/kbuild/kconfig-language.rst          | 22 +++++++++++++++---
>  scripts/kconfig/lkc.h                              |  2 +-
>  scripts/kconfig/menu.c                             | 12 +++++++++-
>  scripts/kconfig/parser.y                           |  6 ++---
>  scripts/kconfig/tests/conditional_dep/Kconfig      | 27 ++++++++++++++++++++++
>  scripts/kconfig/tests/conditional_dep/__init__.py  | 14 +++++++++++
>  .../kconfig/tests/conditional_dep/expected_config1 | 10 ++++++++
>  .../kconfig/tests/conditional_dep/expected_config2 |  8 +++++++
>  .../kconfig/tests/conditional_dep/expected_config3 | 10 ++++++++
>  scripts/kconfig/tests/conditional_dep/test_config1 |  4 ++++
>  scripts/kconfig/tests/conditional_dep/test_config2 |  7 ++++++
>  scripts/kconfig/tests/conditional_dep/test_config3 |  6 +++++
>  12 files changed, 120 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
> index abce88f15d7c..9ff3e530b2b4 100644
> --- a/Documentation/kbuild/kconfig-language.rst
> +++ b/Documentation/kbuild/kconfig-language.rst
> @@ -118,7 +118,7 @@ applicable everywhere (see syntax).
>    This is a shorthand notation for a type definition plus a value.
>    Optionally dependencies for this default value can be added with "if".
>  
> -- dependencies: "depends on" <expr>
> +- dependencies: "depends on" <expr> ["if" <expr>]
>  
>    This defines a dependency for this menu entry. If multiple
>    dependencies are defined, they are connected with '&&'. Dependencies
> @@ -134,6 +134,16 @@ applicable everywhere (see syntax).
>  	bool "foo"
>  	default y
>  
> +  The dependency definition itself may be conditional by appending "if"
> +  followed by an expression. For example::
> +
> +    config FOO
> +	tristate
> +	depends on BAR if BAZ
> +
> +  meaning that FOO is constrained by the value of BAR only if BAZ is
> +  also set.
> +
>  - reverse dependencies: "select" <symbol> ["if" <expr>]
>  
>    While normal dependencies reduce the upper limit of a symbol (see
> @@ -602,8 +612,14 @@ Some drivers are able to optionally use a feature from another module
>  or build cleanly with that module disabled, but cause a link failure
>  when trying to use that loadable module from a built-in driver.
>  
> -The most common way to express this optional dependency in Kconfig logic
> -uses the slightly counterintuitive::
> +The recommended way to express this optional dependency in Kconfig logic
> +uses the conditional form::
> +
> +  config FOO
> +	tristate "Support for foo hardware"
> +	depends on BAR if BAR
> +
> +This slightly counterintuitive style is also widely used::
>  
>    config FOO
>  	tristate "Support for foo hardware"
> diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
> index 56548efc14d7..798985961215 100644
> --- a/scripts/kconfig/lkc.h
> +++ b/scripts/kconfig/lkc.h
> @@ -82,7 +82,7 @@ void menu_warn(const struct menu *menu, const char *fmt, ...);
>  struct menu *menu_add_menu(void);
>  void menu_end_menu(void);
>  void menu_add_entry(struct symbol *sym, enum menu_type type);
> -void menu_add_dep(struct expr *dep);
> +void menu_add_dep(struct expr *dep, struct expr *cond);
>  void menu_add_visibility(struct expr *dep);
>  struct property *menu_add_prompt(enum prop_type type, const char *prompt,
>  				 struct expr *dep);
> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
> index 0f1a6513987c..b2d8d4e11e07 100644
> --- a/scripts/kconfig/menu.c
> +++ b/scripts/kconfig/menu.c
> @@ -127,8 +127,18 @@ static struct expr *rewrite_m(struct expr *e)
>  	return e;
>  }
>  
> -void menu_add_dep(struct expr *dep)
> +void menu_add_dep(struct expr *dep, struct expr *cond)
>  {
> +	if (cond) {
> +		/*
> +		 * We have "depends on X if Y" and we want:
> +		 *	Y != n --> X
> +		 *	Y == n --> y
> +		 * That simplifies to: (X || (Y == n))
> +		 */
> +		dep = expr_alloc_or(dep,
> +				expr_trans_compare(cond, E_EQUAL, &symbol_no));
> +	}
>  	current_entry->dep = expr_alloc_and(current_entry->dep, dep);
>  }
>  
> diff --git a/scripts/kconfig/parser.y b/scripts/kconfig/parser.y
> index 49b79dde1725..6d1bbee38f5d 100644
> --- a/scripts/kconfig/parser.y
> +++ b/scripts/kconfig/parser.y
> @@ -323,7 +323,7 @@ if_entry: T_IF expr T_EOL
>  {
>  	printd(DEBUG_PARSE, "%s:%d:if\n", cur_filename, cur_lineno);
>  	menu_add_entry(NULL, M_IF);
> -	menu_add_dep($2);
> +	menu_add_dep($2, NULL);
>  	$$ = menu_add_menu();
>  };
>  
> @@ -422,9 +422,9 @@ help: help_start T_HELPTEXT
>  
>  /* depends option */
>  
> -depends: T_DEPENDS T_ON expr T_EOL
> +depends: T_DEPENDS T_ON expr if_expr T_EOL
>  {
> -	menu_add_dep($3);
> +	menu_add_dep($3, $4);
>  	printd(DEBUG_PARSE, "%s:%d:depends on\n", cur_filename, cur_lineno);
>  };
>  
> diff --git a/scripts/kconfig/tests/conditional_dep/Kconfig b/scripts/kconfig/tests/conditional_dep/Kconfig
> new file mode 100644
> index 000000000000..ea2bdef9016c
> --- /dev/null
> +++ b/scripts/kconfig/tests/conditional_dep/Kconfig
> @@ -0,0 +1,27 @@
> +# SPDX-License-Identifier: GPL-2.0
> +# Test Kconfig file for conditional dependencies.
> +
> +config FOO
> +    bool "FOO symbol"
> +
> +config BAR
> +    bool "BAR symbol"
> +
> +config TEST_BASIC
> +    bool "Test basic conditional dependency"
> +    depends on FOO if BAR
> +    default y
> +
> +config TEST_COMPLEX
> +    bool "Test complex conditional dependency"
> +    depends on (FOO && BAR) if (FOO || BAR)
> +    default y
> +
> +config BAZ
> +    tristate "BAZ symbol"
> +
> +config TEST_OPTIONAL
> +    tristate "Test simple optional dependency"
> +    depends on BAZ if BAZ
> +    default y

These tristates do not work properly because the "modules" keyword is
not present. Copying the MODULES config from the transitional test fixes
this.

diff --git a/scripts/kconfig/tests/conditional_dep/Kconfig b/scripts/kconfig/tests/conditional_dep/Kconfig
index ab5e3cf7824f..8f762e9c4d38 100644
--- a/scripts/kconfig/tests/conditional_dep/Kconfig
+++ b/scripts/kconfig/tests/conditional_dep/Kconfig
@@ -1,6 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0
 # Test Kconfig file for conditional dependencies.
 
+# Enable module support for tristate testing
+config MODULES
+	bool "Enable loadable module support"
+	modules
+	default y
+
 config FOO
     bool "FOO symbol"
 

> diff --git a/scripts/kconfig/tests/conditional_dep/__init__.py b/scripts/kconfig/tests/conditional_dep/__init__.py
> new file mode 100644
> index 000000000000..ab16df6487ec
> --- /dev/null
> +++ b/scripts/kconfig/tests/conditional_dep/__init__.py
> @@ -0,0 +1,14 @@
> +# SPDX-License-Identifier: GPL-2.0
> +"""
> +Correctly handle conditional dependencies.
> +"""
> +
> +def test(conf):
> +    assert conf.oldconfig('test_config1') == 0
> +    assert conf.config_matches('expected_config1')
> +
> +    assert conf.oldconfig('test_config2') == 0
> +    assert conf.config_matches('expected_config2')
> +
> +    assert conf.oldconfig('test_config3') == 0
> +    assert conf.config_matches('expected_config3')
> diff --git a/scripts/kconfig/tests/conditional_dep/expected_config1 b/scripts/kconfig/tests/conditional_dep/expected_config1
> new file mode 100644
> index 000000000000..2ad02aa66b06
> --- /dev/null
> +++ b/scripts/kconfig/tests/conditional_dep/expected_config1
> @@ -0,0 +1,10 @@
> +#
> +# Automatically generated file; DO NOT EDIT.
> +# Main menu
> +#
> +CONFIG_FOO=y
> +CONFIG_BAR=y
> +CONFIG_TEST_BASIC=y
> +CONFIG_TEST_COMPLEX=y
> +CONFIG_BAZ=y
> +CONFIG_TEST_OPTIONAL=y

Which will result in the following change here, which looks correct to
me.

diff --git a/scripts/kconfig/tests/conditional_dep/expected_config1 b/scripts/kconfig/tests/conditional_dep/expected_config1
index 3198a6d09d9d..826ed7f541b8 100644
--- a/scripts/kconfig/tests/conditional_dep/expected_config1
+++ b/scripts/kconfig/tests/conditional_dep/expected_config1
@@ -2,9 +2,10 @@
 # Automatically generated file; DO NOT EDIT.
 # Main menu
 #
+CONFIG_MODULES=y
 CONFIG_FOO=y
 CONFIG_BAR=y
 CONFIG_TEST_BASIC=y
 CONFIG_TEST_COMPLEX=y
-CONFIG_BAZ=y
-CONFIG_TEST_OPTIONAL=y
+CONFIG_BAZ=m
+CONFIG_TEST_OPTIONAL=m

> diff --git a/scripts/kconfig/tests/conditional_dep/expected_config2 b/scripts/kconfig/tests/conditional_dep/expected_config2
> new file mode 100644
> index 000000000000..b4b19cf50730
> --- /dev/null
> +++ b/scripts/kconfig/tests/conditional_dep/expected_config2
> @@ -0,0 +1,8 @@
> +#
> +# Automatically generated file; DO NOT EDIT.
> +# Main menu
> +#
> +# CONFIG_FOO is not set
> +CONFIG_BAR=y
> +CONFIG_BAZ=y
> +CONFIG_TEST_OPTIONAL=y
> diff --git a/scripts/kconfig/tests/conditional_dep/expected_config3 b/scripts/kconfig/tests/conditional_dep/expected_config3
> new file mode 100644
> index 000000000000..c788f6c710e1
> --- /dev/null
> +++ b/scripts/kconfig/tests/conditional_dep/expected_config3
> @@ -0,0 +1,10 @@
> +#
> +# Automatically generated file; DO NOT EDIT.
> +# Main menu
> +#
> +# CONFIG_FOO is not set
> +# CONFIG_BAR is not set
> +CONFIG_TEST_BASIC=y
> +CONFIG_TEST_COMPLEX=y
> +# CONFIG_BAZ is not set
> +CONFIG_TEST_OPTIONAL=y
> diff --git a/scripts/kconfig/tests/conditional_dep/test_config1 b/scripts/kconfig/tests/conditional_dep/test_config1
> new file mode 100644
> index 000000000000..5cc1ecedcba3
> --- /dev/null
> +++ b/scripts/kconfig/tests/conditional_dep/test_config1
> @@ -0,0 +1,4 @@
> +# Basic check that everything can be configured if selected.
> +CONFIG_FOO=y
> +CONFIG_BAR=y
> +CONFIG_BAZ=m

It might be worth adding something like

  # Ensure that TEST_OPTIONAL=y with BAZ=m is converted to TEST_OPTIONAL=m
  CONFIG_TEST_OPTIONAL=y

to the end here to ensure the new logic works the same as the old logic.
It might be worth checking that TEST_OPTIONAL=m works with BAZ=n but not
sure.

> diff --git a/scripts/kconfig/tests/conditional_dep/test_config2 b/scripts/kconfig/tests/conditional_dep/test_config2
> new file mode 100644
> index 000000000000..1175c5307308
> --- /dev/null
> +++ b/scripts/kconfig/tests/conditional_dep/test_config2
> @@ -0,0 +1,7 @@
> +# If FOO is not selected, then TEST_BASIC should fail the conditional
> +# dependency since BAR is set.
> +# TEST_COMPLEX will fail dependency as it depends on both FOO and BAR
> +# if either of those is selected.
> +CONFIG_FOO=n
> +CONFIG_BAR=y
> +CONFIG_BAZ=y
> diff --git a/scripts/kconfig/tests/conditional_dep/test_config3 b/scripts/kconfig/tests/conditional_dep/test_config3
> new file mode 100644
> index 000000000000..3815ad744e89
> --- /dev/null
> +++ b/scripts/kconfig/tests/conditional_dep/test_config3
> @@ -0,0 +1,6 @@
> +# If FOO is not selected, but BAR is also not selected, then TEST_BASIC 
> +# should pass since the dependency on FOO is conditional on BAR.
> +# TEST_COMPLEX should be also set since neither FOO nor BAR are selected
> +# so it has no dependencies.
> +CONFIG_FOO=n
> +CONFIG_BAR=n

Other than that, this seems reasonable to me. The actual code changes
are small and the tests prove this works properly. I won't pick up v3
until after 6.19-rc1 is out at the least.

Cheers,
Nathan

