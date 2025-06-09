Return-Path: <linux-kbuild+bounces-7409-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53561AD1AC4
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Jun 2025 11:37:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D9B3162EB8
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Jun 2025 09:37:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFBBD246769;
	Mon,  9 Jun 2025 09:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KgOAmjTI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F726C133;
	Mon,  9 Jun 2025 09:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749461864; cv=none; b=IS5OSWhUChuSTwIdzMn14QhLnIDgOWnOX8Bp/6ue804+vSi1VObYp1hqTgcxuj/MywzyUCVCu2KLHbymxOBdqjryUTiWR2XzYmtY8X6yYnSq9HZz/MHBaSC4kNbs0raUhjQuvotJ14z/5u587uWgEUDsXEVuISge9Bu2efJyuZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749461864; c=relaxed/simple;
	bh=XwpFufb+SDXSj2ejHO2odwMZAl/fSCLYz1xkpvW9CS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TxalHECEsmoYGq2phVJYHE907YiINBk25Ogs5Q7hqiHe9lt3uL1JuV7joYU/YP/sFOA9bpEAwLqpCpCTwEx3Kv0Hbb9u+EGWUZGBqCzZ1BLbRS7awtWUf+/4CIf4u97kt/UfGJcMHZKa9KxmKJGtEVhM9r2Qq/13Wxsc1VQLu5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KgOAmjTI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19326C4CEEB;
	Mon,  9 Jun 2025 09:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749461864;
	bh=XwpFufb+SDXSj2ejHO2odwMZAl/fSCLYz1xkpvW9CS4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KgOAmjTIuN6UDbFDyVwRuMVof2MC3ON+k5R3Yqnh40cpJ3nkD2XVrkJntiNv9YmzJ
	 9kDAMpwInUY/N7A37y/mMxx7gjqxmsJ8Gy7v0grPtUhFZfDg22/GE2y+Dwgb33ZcRy
	 711dsrI9/RLdx9T3sOcVfCHcUZzO8v2Y2TcuN9jDAUC2Au5pdXJFHXatqJTUpbIxYV
	 xs13XYTM9GIVsUjZFX2Eou3ZRZX5ILI4HCHLHRoLIHATyLgeP24YGZ8Kc/dqCOnTFy
	 bXwaccwBvbU8I0ynwq51zYs4e9tgJbHTLRpkQzoDqL1tR7C5V6z82X8/GB8ygw/3ni
	 YDsRgb8QoCYag==
Date: Mon, 9 Jun 2025 11:37:38 +0200
From: Alexey Gladkov <legion@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Petr Pavlu <petr.pavlu@suse.com>, Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v3 2/6] modules: Add macros to specify modinfo prefix
Message-ID: <aEarYndP4uo-a0eL@example.org>
References: <cover.1748335606.git.legion@kernel.org>
 <5cd53f6a4bca5186d3c9c47c070883131826c5eb.1748335606.git.legion@kernel.org>
 <CAK7LNATkXFqKLPcHFg-WDynRrVy3BRs6twvcyo2YJQqZBy9xsQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNATkXFqKLPcHFg-WDynRrVy3BRs6twvcyo2YJQqZBy9xsQ@mail.gmail.com>

On Mon, Jun 02, 2025 at 04:49:24PM +0900, Masahiro Yamada wrote:
> On Tue, May 27, 2025 at 6:08 PM Alexey Gladkov <legion@kernel.org> wrote:
> >
> > The __MODULE_INFO macros always use __MODULE_INFO_PREFIX. The only way
> > to use a different prefix is to override __MODULE_INFO_PREFIX, which is
> > not very useful.
> 
> Not necessarily.
> This would be a very special case only used in modpost,
> and modpost can use MODULE_INFO() instead.
> 
> 
>         list_for_each_entry_safe(alias, next, &mod->aliases, node) {
> -               buf_printf(&buf, "MODULE_ALIAS_MODNAME(\"%s\", \"%s\");\n",
> +               buf_printf(&buf, "MODULE_INFO(\"%s\".alias, \"%s\");\n",
>                            alias->builtin_modname, alias->str);
>                 list_del(&alias->node);
>                 free(alias->builtin_modname);

You can't do that because a character can't contain quotation marks
and periods.

.vmlinux.export.c:16163:17: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before ‘.’ token
16163 | MODULE_INFO(ahci.alias, "pci:v*d*sv*sd*bc01sc06i01*");
      |                 ^
././include/linux/compiler_types.h:83:23: note: in definition of macro ‘___PASTE’
   83 | #define ___PASTE(a,b) a##b
      |                       ^

The same thing for variant with quotes:

.vmlinux.export.c:16163:13: error: expected ‘=’, ‘,’, ‘;’, ‘asm’ or ‘__attribute__’ before string constant
16163 | MODULE_INFO("ahci".alias, "pci:v*d*sv*sd*bc01sc06i01*");
      |             ^~~~~~

But I can do something like this to make it work:

	buf_printf(&buf,
		   "#undef __MODULE_INFO_PREFIX\n"
		   "#define __MODULE_INFO_PREFIX\n");

	list_for_each_entry_safe(alias, next, &mod->aliases, node) {
		buf_printf(&buf, "__MODULE_INFO(%s.alias, unused, \"%s\");\n",
			   alias->builtin_modname, alias->str);

> 
> > The new macro will be used in file2alias.c to generate modalias for
> > builtin modules.
> >
> > Signed-off-by: Alexey Gladkov <legion@kernel.org>
> > Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
> > ---
> >  include/linux/module.h      | 3 +++
> >  include/linux/moduleparam.h | 7 +++++--
> >  2 files changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/linux/module.h b/include/linux/module.h
> > index 8050f77c3b64..88048561360f 100644
> > --- a/include/linux/module.h
> > +++ b/include/linux/module.h
> > @@ -170,6 +170,9 @@ struct module_kobject *lookup_or_create_module_kobject(const char *name);
> >  /* For userspace: you can also call me... */
> >  #define MODULE_ALIAS(_alias) MODULE_INFO(alias, _alias)
> >
> > +#define MODULE_ALIAS_MODNAME(_modname, _alias) \
> > +       __MODULE_INFO_WITH_PREFIX(_modname ".", alias, alias, _alias)
> > +
> >  /* Soft module dependencies. See man modprobe.d for details.
> >   * Example: MODULE_SOFTDEP("pre: module-foo module-bar post: module-baz")
> >   */
> > diff --git a/include/linux/moduleparam.h b/include/linux/moduleparam.h
> > index bfb85fd13e1f..3f819fc67c43 100644
> > --- a/include/linux/moduleparam.h
> > +++ b/include/linux/moduleparam.h
> > @@ -20,10 +20,13 @@
> >  /* Chosen so that structs with an unsigned long line up. */
> >  #define MAX_PARAM_PREFIX_LEN (64 - sizeof(unsigned long))
> >
> > -#define __MODULE_INFO(tag, name, info)                                   \
> > +#define __MODULE_INFO_WITH_PREFIX(prefix, tag, name, info)               \
> >         static const char __UNIQUE_ID(name)[]                             \
> >                 __used __section(".modinfo") __aligned(1)                 \
> > -               = __MODULE_INFO_PREFIX __stringify(tag) "=" info
> > +               = prefix __stringify(tag) "=" info
> > +
> > +#define __MODULE_INFO(tag, name, info)                                   \
> > +       __MODULE_INFO_WITH_PREFIX(__MODULE_INFO_PREFIX, tag, name, info)
> >
> >  #define __MODULE_PARM_TYPE(name, _type)                                          \
> >         __MODULE_INFO(parmtype, name##type, #name ":" _type)
> > --
> > 2.49.0
> >
> 
> 
> -- 
> Best Regards
> Masahiro Yamada
> 

-- 
Rgrds, legion


