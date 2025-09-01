Return-Path: <linux-kbuild+bounces-8684-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E00B3ECC4
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Sep 2025 18:57:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A5A31B20E66
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Sep 2025 16:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2261306489;
	Mon,  1 Sep 2025 16:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DcPdTN+W"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837A22DF150;
	Mon,  1 Sep 2025 16:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756745813; cv=none; b=F1X0Y4o8UqLRjWalqliWB1nmv47P/McHnN5oCUJIn51ITEYaEU1K+mabq9TiS0p8xpf6H53wAzxNDfBQf/AXxW88hsVO7mXyBRv8YNqb3sEux0v3mNPBF7bSp5qK0B9blaTCEdqmfQs6OiTTrV1E7FoMDM0wxiLJ3eDuubX5mig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756745813; c=relaxed/simple;
	bh=20LR7yZxZ7jgK8PFAyG1nr1bSN9YMTK88U5EEu7oj88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q9FR3QGjnA8Vb6D0X+Q6qukJ7C+zMfuAKTTqaVrSJkim6NjIg0JJMZofc41CYqxqPV9HgXILaTz1jwcfvIYVSvcbA5bkaYXe4zGwTx2PUfrSxTyNX5zM2Rb7TQTf+BRslH6+iYt8o8/phhw7hOjMo2rwwpWlVULse19mpwegvE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DcPdTN+W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5596FC4CEF0;
	Mon,  1 Sep 2025 16:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756745813;
	bh=20LR7yZxZ7jgK8PFAyG1nr1bSN9YMTK88U5EEu7oj88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DcPdTN+WWGE96roQtfgI5hduqOYqDQqpH5rYt/4CPVQ4g6HiuFjnVxDWy0CMjznbu
	 vYAUwZSnim6X233yoi6pSPwDAYZORQvORdLJm2wdbchjEimGwS7DtP+bNGxkRWM3JL
	 JT2GTySo8NSWG/9i7puLZ2CstVwLtYdLVfBKz/cIrPbLiZ3qNaV8LAFaODdJYu0l5i
	 N52zDGiLV+svuusOfRhV9E9uJoBfhBP2dL1M3SRJL6thygg8BDnIDwj7PBjiuUEek8
	 Y3psAJJUqytLwJr5NYMdGkWd8v32nHb3N2gl4uZFE1GAUBx90ajSCp0qYviGyLO1xJ
	 h8LGAR5uYtMUQ==
Date: Mon, 1 Sep 2025 09:56:52 -0700
From: Kees Cook <kees@kernel.org>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Stephen Brennan <stephen.s.brennan@oracle.com>,
	Marco Bonelli <marco@mebeim.net>, Petr Vorel <pvorel@suse.cz>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] kconfig: Add transitional symbol attribute for
 migration support
Message-ID: <202509010949.9A61A98@keescook>
References: <20250830020109.it.598-kees@kernel.org>
 <59c4f103-7f1b-4829-bd82-0d392047fea4@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <59c4f103-7f1b-4829-bd82-0d392047fea4@oracle.com>

On Mon, Sep 01, 2025 at 10:34:19AM +0200, Vegard Nossum wrote:
> Drive-by review... consider it more as "here's some stuff that could be
> worth looking at" rather than blocking in any way.

Thanks for looking at it!

> 
> On 30/08/2025 04:01, Kees Cook wrote:
> > During kernel option migrations (e.g. CONFIG_CFI_CLANG to CONFIG_CFI),
> > existing .config files need to maintain backward compatibility while
> > preventing deprecated options from appearing in newly generated
> > configurations. This is challenging with existing Kconfig mechanisms
> > because:
> > 
> > 1. Simply removing old options breaks existing .config files.
> > 2. Manually listing an option as "deprecated" leaves it needlessly
> >     visible and still writes them to new .config files.
> > 3. Using any method to remove visibility (.e.g no 'prompt', 'if n',
> >     etc) prevents the option from being processed at all.
> > 
> > Add a "transitional" attribute that creates symbols which are:
> > - Processed during configuration (can influence other symbols' defaults)
> > - Hidden from user menus (no prompts appear)
> > - Omitted from newly written .config files (gets migrated)
> > - Restricted to only having help sections (no defaults, selects, etc)
> >    making it truly just a "prior value pass-through" option.
> > 
> > The transitional syntax requires a type argument and prevents type
> > redefinition:
> > 
> >      config OLD_OPTION
> >          transitional bool
> >          help
> >            Transitional config for OLD_OPTION migration.
> > 
> >      config NEW_OPTION
> >          bool "New option"
> >          default OLD_OPTION
> 
> Can you add this to scripts/kconfig/tests/ + both positive and negative
> tests? Tests are run with 'make testconfig' but (AFAICT) doesn't
> actually recompile config/mconf/etc. before running the tests, so small
> gotcha there.

Yes, I will get that added if people are generally happy with this
feature idea. :)

> > diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
> > index fe2231e0e6a4..be51574d6c77 100644
> > --- a/scripts/kconfig/expr.h
> > +++ b/scripts/kconfig/expr.h
> > @@ -127,6 +127,21 @@ struct symbol {
> >   	/* SYMBOL_* flags */
> >   	int flags;
> > +	/*
> > +	 * Transitional symbol - processed during configuration but hidden from
> > +	 * user in menus and omitted from newly written .config files. Used for
> > +	 * backward compatibility during config option migrations (e.g.,
> > +	 * CFI_CLANG → CFI). Transitional symbols can still influence default
> > +	 * expressions of other symbols.
> > +	 */
> > +	bool transitional:1;
> > +
> > +	/*
> > +	 * Symbol usability - calculated as (visible != no || transitional).
> > +	 * Determines if symbol can be used in expressions.
> > +	 */
> > +	bool usable:1;
> > +
> 
> It's a bit of a "red flag" to see bitfield bools just after an "int
> flags;" member... should these be SYMBOL_ flags?
> 
> Speaking of SYMBOL_ flags, there's apparently one that controls whether
> a given symbol should be written out to .config:

Yeah, I mentioned this in the commit log, and maybe I just have to make
this not as easily readable? But you have a point about "usable" below...

> scripts/kconfig/expr.h:#define SYMBOL_WRITE      0x0200  /* write symbol to
> file (KCONFIG_CONFIG) */
> 
> This seems like something you'd like to use somehow -- maybe simply
> clear it in sym_calc_value() if it's transitional? Similar to how it's
> done for choice values:
> 
>         if (sym_is_choice(sym))
>                 sym->flags &= ~SYMBOL_WRITE;

This is actually handled naturally as part of this logic:

> >   	if (sym->visible != no)
> >   		sym->flags |= SYMBOL_WRITE;

i.e. "usable" doesn't change SYMBOL_WRITE getting set.

> > @@ -205,6 +206,16 @@ config_option: T_PROMPT T_WORD_QUOTE if_expr T_EOL
> >   	printd(DEBUG_PARSE, "%s:%d:prompt\n", cur_filename, cur_lineno);
> >   };
> > +config_option: T_TRANSITIONAL type T_EOL
> > +{
> > +	if (current_entry->sym->type != S_UNKNOWN)
> > +		yyerror("transitional type cannot be set after symbol type is already defined");
> > +	menu_set_type($2);
> > +	current_entry->sym->transitional = true;
> > +	printd(DEBUG_PARSE, "%s:%d:transitional(%u)\n", cur_filename, cur_lineno,
> > +		$2);
> > +};
> 
> You could also consider making this an attribute similar to the
> "modules" flags and simplify:
> 
> config_option: T_TRANSITIONAL T_EOL
> {
>        current_entry->sym->transitional = true;
>        printd(DEBUG_PARSE, "%s:%d:transitional\n", cur_filename,
> cur_lineno);
> };
> 
> ...it would mean the config options look this way:
> 
> config OLD_OPTION
>     bool
>     transitional
> 
> (If not, menu_set_type() does already contain a check for whether the
> type has already been set.)

I went back and forth on how I wanted it to look and ultimately decided
it was awkward to say "use transitional but only with a type that
doesn't have a prompt". Instead it seemed better to have the type
explicitly set.

menu_set_type() does check already, but it's a warning only.

> > @@ -558,6 +606,9 @@ void conf_parse(const char *name)
> >   		if (menu->sym && sym_check_deps(menu->sym))
> >   			yynerrs++;
> > +		if (transitional_check_sanity(menu))
> > +			yynerrs++;
> > +
> >   		if (menu->sym && sym_is_choice(menu->sym)) {
> >   			menu_for_each_sub_entry(child, menu)
> >   				if (child->sym && choice_check_sanity(child))
> > diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
> > index 26ab10c0fd76..b822c0c897e5 100644
> > --- a/scripts/kconfig/symbol.c
> > +++ b/scripts/kconfig/symbol.c
> > @@ -447,6 +447,9 @@ void sym_calc_value(struct symbol *sym)
> >   	if (sym->visible != no)
> >   		sym->flags |= SYMBOL_WRITE;
> > +	/* Calculate usable flag */
> > +	sym->usable = (sym->visible != no || sym->transitional);
> > +
> 
> Is this actually ever used outside of this function? (IOW could this
> just be a local variable instead of a sym-> flag/member?) Or do we need
> to set it here because sym_calc_value() calls itself recursively? To me
> it looks like we only ever access sym->usable for the "sym" that was
> passed as an argument to the function.

Ah! It's not any more, no. I had an earlier version where I was
examining it elsewhere, but yeah, this is only needed here.

> 
> >   	/* set default if recursively called */
> >   	sym->curr = newval;
> > @@ -459,13 +462,15 @@ void sym_calc_value(struct symbol *sym)
> >   			sym_calc_choice(choice_menu);
> >   			newval.tri = sym->curr.tri;
> >   		} else {
> > -			if (sym->visible != no) {
> > +			if (sym->usable) {
> >   				/* if the symbol is visible use the user value
> >   				 * if available, otherwise try the default value
> >   				 */
> >   				if (sym_has_value(sym)) {
> > +					tristate value = sym->transitional ?
> > +						sym->def[S_DEF_USER].tri : sym->visible;
> >   					newval.tri = EXPR_AND(sym->def[S_DEF_USER].tri,
> > -							      sym->visible);
> > +							      value);
> 
> This looks a bit odd to me. Just thinking out loud: your new logic is
> there to be able to use a value even though it's not visible. In the
> case where it's transitional you use the .config value instead of the
> condition that makes it visible.
> 
> Could you simply change sym_calc_visibility() instead to always return
> 'yes' when the symbol is transitional? Wouldn't that simplify everything
> in sym_calc_value()?

It's a tristate, so "m" is also possible besides "y". (sym->visible is
also a tristate. :)

I will send a v3 with better bit fields.

-Kees

-- 
Kees Cook

