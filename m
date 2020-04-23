Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92DBB1B5FF3
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Apr 2020 17:54:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729312AbgDWPyB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 23 Apr 2020 11:54:01 -0400
Received: from mga02.intel.com ([134.134.136.20]:37548 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729230AbgDWPyB (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Apr 2020 11:54:01 -0400
IronPort-SDR: fOP0iJpaEX3hun+GVvdcKCXGNRHj5D5Z+YETTz8NM/q9eGnk2H4ugJz6fOwZtQDtmqpLGCpR8s
 c1r2BlmiVJGg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2020 08:53:54 -0700
IronPort-SDR: eZG7X9iakdPLqS/UaZMvcJzOaH5uigcdpJhP+hd+Xx9MT8K3fpduLXKitGkWciK+m9xeNc/rtN
 s7qQr4ku0g5Q==
X-IronPort-AV: E=Sophos;i="5.73,307,1583222400"; 
   d="scan'208";a="430370525"
Received: from kgonza4-mobl1.amr.corp.intel.com (HELO localhost) ([10.252.33.241])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2020 08:53:51 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Nicolas Pitre <nico@fluxnic.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Saeed Mahameed <saeedm@mellanox.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kconfig: allow for conditional dependencies
In-Reply-To: <nycvar.YSQ.7.76.2004231102480.2671@knanqh.ubzr>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <nycvar.YSQ.7.76.2004231102480.2671@knanqh.ubzr>
Date:   Thu, 23 Apr 2020 18:53:49 +0300
Message-ID: <87imhqb3le.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, 23 Apr 2020, Nicolas Pitre <nico@fluxnic.net> wrote:
> This might appear to be a strange concept, but sometimes we want
> a dependency to be conditionally applied. One such case is currently
> expressed with:
>
>         depends on FOO || !FOO
>
> This pattern is strange enough to give one's pause. Given that it is
> also frequent, let's make the intent more obvious with some syntaxic
> sugar by effectively making dependencies optionally conditional.
>
> This also makes the kconfig language more uniform.

Thanks, I prefer this over all the previous proposals. Versatile yet
self-explanatory.

> Signed-off-by: Nicolas Pitre <nico@fluxnic.net>
>
> diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
> index d0111dd264..0f841e0037 100644
> --- a/Documentation/kbuild/kconfig-language.rst
> +++ b/Documentation/kbuild/kconfig-language.rst
> @@ -114,7 +114,7 @@ applicable everywhere (see syntax).
>    This is a shorthand notation for a type definition plus a value.
>    Optionally dependencies for this default value can be added with "if".
>  
> -- dependencies: "depends on" <expr>
> +- dependencies: "depends on" <expr> ["if" <expr>]
>  
>    This defines a dependency for this menu entry. If multiple
>    dependencies are defined, they are connected with '&&'. Dependencies
> @@ -130,6 +130,16 @@ applicable everywhere (see syntax).
>  	bool "foo"
>  	default y
>  
> +  The dependency definition itself may be conditional by appending "if"
> +  followed by an expression. If such expression is false (n) then this
> +  dependency is ignored. One possible use case is:
> +
> +    config FOO
> +	tristate
> +	depends on BAZ if BAZ != n

I presume this is the same as

	depends on BAZ if BAZ

which makes me wonder if that should be the example. At least current
usage for select is predominantly

	select FOO if BAR

without "!= n".

BR,
Jani.


> +
> +  meaning that FOO is constrained by the value of BAZ only when it is set.
> +
>  - reverse dependencies: "select" <symbol> ["if" <expr>]
>  
>    While normal dependencies reduce the upper limit of a symbol (see
> diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
> index d4ca829736..1a9337d1b9 100644
> --- a/scripts/kconfig/lkc.h
> +++ b/scripts/kconfig/lkc.h
> @@ -72,7 +72,7 @@ void menu_warn(struct menu *menu, const char *fmt, ...);
>  struct menu *menu_add_menu(void);
>  void menu_end_menu(void);
>  void menu_add_entry(struct symbol *sym);
> -void menu_add_dep(struct expr *dep);
> +void menu_add_dep(struct expr *dep, struct expr *cond);
>  void menu_add_visibility(struct expr *dep);
>  struct property *menu_add_prompt(enum prop_type type, char *prompt, struct expr *dep);
>  void menu_add_expr(enum prop_type type, struct expr *expr, struct expr *dep);
> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
> index e436ba44c9..47928cdbc2 100644
> --- a/scripts/kconfig/menu.c
> +++ b/scripts/kconfig/menu.c
> @@ -103,8 +103,18 @@ static struct expr *rewrite_m(struct expr *e)
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
> index 708b6c4b13..4161207da2 100644
> --- a/scripts/kconfig/parser.y
> +++ b/scripts/kconfig/parser.y
> @@ -316,7 +316,7 @@ if_entry: T_IF expr T_EOL
>  {
>  	printd(DEBUG_PARSE, "%s:%d:if\n", zconf_curname(), zconf_lineno());
>  	menu_add_entry(NULL);
> -	menu_add_dep($2);
> +	menu_add_dep($2, NULL);
>  	$$ = menu_add_menu();
>  };
>  
> @@ -412,9 +412,9 @@ help: help_start T_HELPTEXT
>  
>  /* depends option */
>  
> -depends: T_DEPENDS T_ON expr T_EOL
> +depends: T_DEPENDS T_ON expr if_expr T_EOL
>  {
> -	menu_add_dep($3);
> +	menu_add_dep($3, $4);
>  	printd(DEBUG_PARSE, "%s:%d:depends on\n", zconf_curname(), zconf_lineno());
>  };
>  

-- 
Jani Nikula, Intel Open Source Graphics Center
