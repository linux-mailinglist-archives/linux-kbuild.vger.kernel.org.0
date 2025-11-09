Return-Path: <linux-kbuild+bounces-9465-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB43C44A32
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 00:29:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93922188C321
	for <lists+linux-kbuild@lfdr.de>; Sun,  9 Nov 2025 23:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1848A221540;
	Sun,  9 Nov 2025 23:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ro/6blGN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA331D6DA9;
	Sun,  9 Nov 2025 23:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762730967; cv=none; b=NndEgkVyKL9wpI1dG40rc5Wz6s8wYnOAqJKv6mEkV/IdjYTXXSLrdCc9h0OlEctQL5gKJKib5W+qf4lESQOJoHJ/eTZAooeydZkVway7SDWU+kYV8Jkoq3hcnn9cZcVHBHINahY3eNyCctJFJE5kprdM9mdLADyyQ1YHQtfuCOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762730967; c=relaxed/simple;
	bh=fziFQOyzAXf7ELLEPYsKq6XLBdxtRH/8u0gcNrBETYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=enJV0ubp9IU4VyG3XpiFgnLFXfo6PRjnXOjS2i/cgWK3/XA/A3x/sqhgwkRWyg3OnoBQKF0aIfNapTZFAEJSL4dv3iPwkgBs1AHtCd8E1g84jBt8mVych1k/kpfCd+m1LQSPJ6VWEjKM54q43CiHXcVvMNsLZMX4a3+gPHFEZiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ro/6blGN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA5BAC4CEF7;
	Sun,  9 Nov 2025 23:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762730966;
	bh=fziFQOyzAXf7ELLEPYsKq6XLBdxtRH/8u0gcNrBETYw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ro/6blGNU9TECL/0nh6lj6iY53Xqk1FslNrna5sVJ44TCrkCtWpNlb5sodwTWJlcz
	 lKJh9pU3dibDiSSgtuHR5DUVPSBzAfot8AKaQupdK8HOmKYtmadoTltvkCihvjMH03
	 jwUyRzvlsaaAm2asC7keHRBY9cAUirQQgJJrj5PmEjAttBeuag4kfAyIOCpWMNS5ID
	 95cuUtGST18nytg0q/9NbST9dCjPzVcJv8tfw2Yq9uCAqmdzwZKMZBJvK8E1CoR3Er
	 Q01fap/HpDC6Bwq0Nl/aNVA0rrvJdfWkGJN2NenvHu25+L+LVPYgPC0UpfsFhK8L4d
	 LWXnJErCMov+w==
Date: Sun, 9 Nov 2025 16:29:22 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Graham Roff <grahamr@qti.qualcomm.com>
Cc: Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Nicolas Pitre <nico@fluxnic.net>
Subject: Re: [PATCH] Support conditional deps using "depends on X if Y"
Message-ID: <20251109232922.GA2977577@ax162>
References: <20251107-kconfig_conditional_deps-v1-1-aff22199ec0b@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107-kconfig_conditional_deps-v1-1-aff22199ec0b@qti.qualcomm.com>

Hi Graham,

On Fri, Nov 07, 2025 at 05:16:34PM -0800, Graham Roff wrote:
> From: Nicolas Pitre <nico@fluxnic.net>
> 
> Extend the "depends on" syntax to support conditional dependencies
> using "depends on X if Y". While functionally equivalent to "depends
> on X || (Y == n)", "depends on X if Y" is much more readable and
> makes the kconfig language uniform in supporting the "if <expr>"
> suffix.
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

Do you have a link to this Zephyr Kconfig change?

> One specific use is when mapping the Bluetooth specification to Kconfig,
> as it explicitly provides dependencies between features as conditional
> on other features. Many other cases exist where the "slightly
> counterintuitive" (quoted from the Kconfig specification) expression 
> "depends on BAR || !BAR" has been used when a proper "if" condition 
> would be more readable.
> 
> The earlier patch discussion ended without a real conclusion and should
> be revisited now.

I think it would be useful to have a slightly more concrete example in
the documentation of where this could be useful because even with the
"if" syntax, it still feels a little confusing to me at least with the
current example. Since this is just internally converting "depends on A
if B" to "depends on A || !B", this seems like a low risk addition to
the Kconfig language but it would be good to have some tests under
scripts/kconfig/tests like the ones recently added by commit
f9afce4f32e9 ("kconfig: Add transitional symbol attribute for migration
support") upstream.

> ---
>  Documentation/kbuild/kconfig-language.rst | 12 +++++++++++-
>  scripts/kconfig/lkc.h                     |  2 +-
>  scripts/kconfig/menu.c                    | 12 +++++++++++-
>  scripts/kconfig/parser.y                  |  6 +++---
>  4 files changed, 26 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
> index abce88f15d7c..61848f999db8 100644
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
> +  followed by an expression. If such expression is false (n) then this
> +  dependency is ignored. One possible use case is:
> +
> +    config FOO
> +	tristate
> +	depends on BAZ if BAZ != n
> +
> +  meaning that FOO is constrained by the value of BAZ only when it is set.
> +
>  - reverse dependencies: "select" <symbol> ["if" <expr>]
>  
>    While normal dependencies reduce the upper limit of a symbol (see
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
> 
> ---
> base-commit: a1388fcb52fcad3e0b06e2cdd0ed757a82a5be30
> change-id: 20251106-kconfig_conditional_deps-51f1c903f863
> 
> Best regards,
> -- 
> Graham Roff <grahamr@qti.qualcomm.com>
> 

