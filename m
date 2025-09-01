Return-Path: <linux-kbuild+bounces-8674-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7C3B3DDA5
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Sep 2025 11:09:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D9031883DD5
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Sep 2025 09:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1766C3043C7;
	Mon,  1 Sep 2025 09:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dS/IeTuS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CA030147F;
	Mon,  1 Sep 2025 09:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756717766; cv=none; b=FJCENyqFfct1HN35WzbMEr2NcRGnidQbmvK3NskvlMaNvdOkCa8sgYnQlt3/r+433ljqAHGlKVvR8ktH94JACZJnVcNVg6DCGlgQyI2gU/Y/kTbQeUj8YqcywOo51YzAMNoPFZFluesYdYFEJH/a3SFh8JnQru2g+vjqjU0zkT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756717766; c=relaxed/simple;
	bh=iVM5cHrd70lHqOaznbywwTTMt5WcQ1b11YYlWbwA068=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Sic1/d4YBzS3AIewUxEISpJBj7xExBv9fQ4xmqkUqWcmEMSbIKAnWZBBprb9uyFx75JzUWnEMHV+j+aFaXO6S3Xbey/g9i97pe1K926XVzVMCSyO+RsRTkXajlgnPpX3AZAiBpud/uQi5DN6NSvceL6LgH+cd4IdGs+yvDiYVAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dS/IeTuS; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756717764; x=1788253764;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=iVM5cHrd70lHqOaznbywwTTMt5WcQ1b11YYlWbwA068=;
  b=dS/IeTuSw6nV4GFN8WwP74YNL1NTpKhovamaQ4b4ap6niUUccrGCWqZH
   kHvjpbqMUgC4yOpLW9ZEskM4WRsGX42wTuXglRGMglyEbho8Qi2f/C896
   arfRkovfZns0mbJ818HUXpuinm6Cg0xwlWg/tOgF9eC3emSA9m/EZVA1B
   SidWXRs+IzlhJtalnjQoIEcWSFQ+kU86B1ybA04SxMcE9l1ev4IwxRmnZ
   /a2IJ8CHPI5UVKbrqf2esdGJROaRChBZSfhweIo/b0fg4KM1AVxWPkEfM
   MRlwQrLdzVFhTzCErJJBRNzZkWfTtAcTPV/NyHzcAuiQAG/u3kPOxJBUM
   A==;
X-CSE-ConnectionGUID: DPdPBPIxQ765LJMsOABU4A==
X-CSE-MsgGUID: I82ER2hvTlKZBRo9jfpwaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59035576"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59035576"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 02:09:23 -0700
X-CSE-ConnectionGUID: 65QQJR4JQpqdhZE2SUIQ+g==
X-CSE-MsgGUID: MfYHuNQTTXisaZa5CGK67Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="171140272"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.246.148])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 02:09:18 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>,
 Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <masahiroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, Miguel Ojeda
 <ojeda@kernel.org>, Stephen Brennan <stephen.s.brennan@oracle.com>, Marco
 Bonelli <marco@mebeim.net>, Petr Vorel <pvorel@suse.cz>,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] kconfig: Add transitional symbol attribute for
 migration support
In-Reply-To: <20250830020109.it.598-kees@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250830020109.it.598-kees@kernel.org>
Date: Mon, 01 Sep 2025 12:09:14 +0300
Message-ID: <7bca36d46dab04667aa595623fd0966385ee4658@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, 29 Aug 2025, Kees Cook <kees@kernel.org> wrote:
> During kernel option migrations (e.g. CONFIG_CFI_CLANG to CONFIG_CFI),
> existing .config files need to maintain backward compatibility while
> preventing deprecated options from appearing in newly generated
> configurations. This is challenging with existing Kconfig mechanisms
> because:
>
> 1. Simply removing old options breaks existing .config files.
> 2. Manually listing an option as "deprecated" leaves it needlessly
>    visible and still writes them to new .config files.
> 3. Using any method to remove visibility (.e.g no 'prompt', 'if n',
>    etc) prevents the option from being processed at all.
>
> Add a "transitional" attribute that creates symbols which are:
> - Processed during configuration (can influence other symbols' defaults)
> - Hidden from user menus (no prompts appear)
> - Omitted from newly written .config files (gets migrated)
> - Restricted to only having help sections (no defaults, selects, etc)
>   making it truly just a "prior value pass-through" option.
>
> The transitional syntax requires a type argument and prevents type
> redefinition:
>
>     config OLD_OPTION
>         transitional bool
>         help
>           Transitional config for OLD_OPTION migration.

How long do you think we'll need to keep the transitional config options
around? Forever?

BR,
Jani.

>     config NEW_OPTION
>         bool "New option"
>         default OLD_OPTION
>
> This allows seamless migration: olddefconfig processes existing
> CONFIG_OLD_OPTION=3Dy settings to enable CONFIG_NEW_OPTION=3Dy, while
> CONFIG_OLD_OPTION is omitted from newly generated .config files.
>
> Implementation details:
> - Parser validates transitional symbols can only have help sections
> - Symbol visibility logic updated: usable =3D (visible !=3D no || transit=
ional)
> - Transitional symbols preserve user values during configuration
> - Type safety enforced to prevent redefinition after transitional declara=
tion
> - Used distinct struct members instead of new flags for readability
> - Documentation added to show the usage
>
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> With help from Claude Code to show me how to navigate the kconfig parser.
>
>  v2: fixed human-introduced errors
>  v1: https://lore.kernel.org/all/20250830014438.work.682-kees@kernel.org/
>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nicolas Schier <nicolas.schier@linux.dev>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: <linux-kbuild@vger.kernel.org>
> Cc: <linux-doc@vger.kernel.org>
> ---
>  scripts/kconfig/expr.h                    | 15 +++++++
>  scripts/kconfig/lexer.l                   |  1 +
>  scripts/kconfig/parser.y                  | 51 +++++++++++++++++++++++
>  scripts/kconfig/symbol.c                  | 11 +++--
>  Documentation/kbuild/kconfig-language.rst | 31 ++++++++++++++
>  5 files changed, 106 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
> index fe2231e0e6a4..be51574d6c77 100644
> --- a/scripts/kconfig/expr.h
> +++ b/scripts/kconfig/expr.h
> @@ -127,6 +127,21 @@ struct symbol {
>  	/* SYMBOL_* flags */
>  	int flags;
>=20=20
> +	/*
> +	 * Transitional symbol - processed during configuration but hidden from
> +	 * user in menus and omitted from newly written .config files. Used for
> +	 * backward compatibility during config option migrations (e.g.,
> +	 * CFI_CLANG =E2=86=92 CFI). Transitional symbols can still influence d=
efault
> +	 * expressions of other symbols.
> +	 */
> +	bool transitional:1;
> +
> +	/*
> +	 * Symbol usability - calculated as (visible !=3D no || transitional).
> +	 * Determines if symbol can be used in expressions.
> +	 */
> +	bool usable:1;
> +
>  	/* List of properties. See prop_type. */
>  	struct property *prop;
>=20=20
> diff --git a/scripts/kconfig/lexer.l b/scripts/kconfig/lexer.l
> index 9c2cdfc33c6f..6d2c92c6095d 100644
> --- a/scripts/kconfig/lexer.l
> +++ b/scripts/kconfig/lexer.l
> @@ -126,6 +126,7 @@ n	[A-Za-z0-9_-]
>  "select"		return T_SELECT;
>  "source"		return T_SOURCE;
>  "string"		return T_STRING;
> +"transitional"		return T_TRANSITIONAL;
>  "tristate"		return T_TRISTATE;
>  "visible"		return T_VISIBLE;
>  "||"			return T_OR;
> diff --git a/scripts/kconfig/parser.y b/scripts/kconfig/parser.y
> index e9c3c664e925..01d2d0f720ce 100644
> --- a/scripts/kconfig/parser.y
> +++ b/scripts/kconfig/parser.y
> @@ -75,6 +75,7 @@ struct menu *current_menu, *current_entry, *current_cho=
ice;
>  %token T_SELECT
>  %token T_SOURCE
>  %token T_STRING
> +%token T_TRANSITIONAL
>  %token T_TRISTATE
>  %token T_VISIBLE
>  %token T_EOL
> @@ -205,6 +206,16 @@ config_option: T_PROMPT T_WORD_QUOTE if_expr T_EOL
>  	printd(DEBUG_PARSE, "%s:%d:prompt\n", cur_filename, cur_lineno);
>  };
>=20=20
> +config_option: T_TRANSITIONAL type T_EOL
> +{
> +	if (current_entry->sym->type !=3D S_UNKNOWN)
> +		yyerror("transitional type cannot be set after symbol type is already =
defined");
> +	menu_set_type($2);
> +	current_entry->sym->transitional =3D true;
> +	printd(DEBUG_PARSE, "%s:%d:transitional(%u)\n", cur_filename, cur_linen=
o,
> +		$2);
> +};
> +
>  config_option: default expr if_expr T_EOL
>  {
>  	menu_add_expr(P_DEFAULT, $2, $3);
> @@ -482,6 +493,43 @@ assign_val:
>=20=20
>  %%
>=20=20
> +/**
> + * transitional_check_sanity - check transitional symbols have no other
> + *			       properties
> + *
> + * @menu: menu of the potentially transitional symbol
> + *
> + * Return: -1 if an error is found, 0 otherwise.
> + */
> +static int transitional_check_sanity(const struct menu *menu)
> +{
> +	struct property *prop;
> +
> +	if (!menu->sym || !menu->sym->transitional)
> +		return 0;
> +
> +	/* Check for depends and visible conditions. */
> +	if ((menu->dep && !expr_is_yes(menu->dep)) ||
> +	    (menu->visibility && !expr_is_yes(menu->visibility))) {
> +		fprintf(stderr, "%s:%d: error: %s",
> +			menu->filename, menu->lineno,
> +			"transitional symbols can only have help sections\n");
> +		return -1;
> +	}
> +
> +	/* Check for any property other than "help". */
> +	for (prop =3D menu->sym->prop; prop; prop =3D prop->next) {
> +		if (prop->type !=3D P_COMMENT) {
> +			fprintf(stderr, "%s:%d: error: %s",
> +				prop->filename, prop->lineno,
> +				"transitional symbols can only have help sections\n");
> +			return -1;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * choice_check_sanity - check sanity of a choice member
>   *
> @@ -558,6 +606,9 @@ void conf_parse(const char *name)
>  		if (menu->sym && sym_check_deps(menu->sym))
>  			yynerrs++;
>=20=20
> +		if (transitional_check_sanity(menu))
> +			yynerrs++;
> +
>  		if (menu->sym && sym_is_choice(menu->sym)) {
>  			menu_for_each_sub_entry(child, menu)
>  				if (child->sym && choice_check_sanity(child))
> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
> index 26ab10c0fd76..b822c0c897e5 100644
> --- a/scripts/kconfig/symbol.c
> +++ b/scripts/kconfig/symbol.c
> @@ -447,6 +447,9 @@ void sym_calc_value(struct symbol *sym)
>  	if (sym->visible !=3D no)
>  		sym->flags |=3D SYMBOL_WRITE;
>=20=20
> +	/* Calculate usable flag */
> +	sym->usable =3D (sym->visible !=3D no || sym->transitional);
> +
>  	/* set default if recursively called */
>  	sym->curr =3D newval;
>=20=20
> @@ -459,13 +462,15 @@ void sym_calc_value(struct symbol *sym)
>  			sym_calc_choice(choice_menu);
>  			newval.tri =3D sym->curr.tri;
>  		} else {
> -			if (sym->visible !=3D no) {
> +			if (sym->usable) {
>  				/* if the symbol is visible use the user value
>  				 * if available, otherwise try the default value
>  				 */
>  				if (sym_has_value(sym)) {
> +					tristate value =3D sym->transitional ?
> +						sym->def[S_DEF_USER].tri : sym->visible;
>  					newval.tri =3D EXPR_AND(sym->def[S_DEF_USER].tri,
> -							      sym->visible);
> +							      value);
>  					goto calc_newval;
>  				}
>  			}
> @@ -497,7 +502,7 @@ void sym_calc_value(struct symbol *sym)
>  	case S_STRING:
>  	case S_HEX:
>  	case S_INT:
> -		if (sym->visible !=3D no && sym_has_value(sym)) {
> +		if (sym->usable && sym_has_value(sym)) {
>  			newval.val =3D sym->def[S_DEF_USER].val;
>  			break;
>  		}
> diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kb=
uild/kconfig-language.rst
> index a91abb8f6840..345c334ce680 100644
> --- a/Documentation/kbuild/kconfig-language.rst
> +++ b/Documentation/kbuild/kconfig-language.rst
> @@ -232,6 +232,37 @@ applicable everywhere (see syntax).
>    enables the third modular state for all config symbols.
>    At most one symbol may have the "modules" option set.
>=20=20
> +- transitional attribute: "transitional"
> +  This declares the symbol as transitional, meaning it should be process=
ed
> +  during configuration but omitted from newly written .config files.
> +  Transitional symbols are useful for backward compatibility during conf=
ig
> +  option migrations - they allow olddefconfig to process existing .config
> +  files while ensuring the old option doesn't appear in new configuratio=
ns.
> +
> +  A transitional symbol:
> +  - Has no prompt (is not visible to users in menus)
> +  - Is processed normally during configuration (values are read and used)
> +  - Can be referenced in default expressions of other symbols
> +  - Is not written to new .config files
> +  - Cannot have any other properties (it is a pass-through option)
> +
> +  Example migration from OLD_NAME to NEW_NAME::
> +
> +    config NEW_NAME
> +	bool "New option name"
> +	default OLD_NAME
> +	help
> +	  This replaces the old CONFIG_OLD_NAME option.
> +
> +    config OLD_NAME
> +	transitional bool
> +	help
> +	  Transitional config for OLD_NAME to NEW_NAME migration.
> +
> +  With this setup, existing .config files with "CONFIG_OLD_NAME=3Dy" will
> +  result in "CONFIG_NEW_NAME=3Dy" being set, while CONFIG_OLD_NAME will =
be
> +  omitted from newly written .config files.
> +
>  Menu dependencies
>  -----------------

--=20
Jani Nikula, Intel

