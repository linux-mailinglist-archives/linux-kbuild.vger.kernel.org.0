Return-Path: <linux-kbuild+bounces-3299-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D939672D0
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 Aug 2024 19:31:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12FD31F21FEA
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 Aug 2024 17:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CB312557A;
	Sat, 31 Aug 2024 17:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="YhnBacCb";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="W8lzOZo+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fout4-smtp.messagingengine.com (fout4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FCC4C8C;
	Sat, 31 Aug 2024 17:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725125461; cv=none; b=GZjm6/9cdE1+XLFRy17gBSN20z2wCbgRHRXF2fjXJXdpRw4hOxfxY3www8s/BjdhaEU81egCLGbUw3aqXzP/3E8ckr9dtyUBK6t27ClUbNRt3wAlHxQrBArsOKvDRE1UMQTGWp6NYptGBmD/PSxr58RFzI11WVQaaSpQNVtvlNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725125461; c=relaxed/simple;
	bh=jdfxVdQ05Xx8+jrCpe00f5GeceDiDNpSvYctUIll+vE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IqABRAXlc64uCMfIVl6bajNHhZR0sYuxrFKCjkzoFlF9dILt40PaWTUW5nsbg/yonk+rEByRNyViMT6S02BWIEuh3NeqB9LY4r38rHSecC1ezAWHWejdcK75n3usbdiR4i+la0Eid6JLH19MqCYpiji7C/8QN8YyQ7C2v1J3zfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=YhnBacCb; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=W8lzOZo+; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id 8DA3D13801C7;
	Sat, 31 Aug 2024 13:30:55 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sat, 31 Aug 2024 13:30:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1725125455;
	 x=1725211855; bh=6hcBQV+lMn3nVLZRbacEyKgHgYoLImcFvXoJIsy56rM=; b=
	YhnBacCbSrGcGAILCvbGCaw6DawV2A5xJxX6pjP6HyQEpmtPHk2sY0lr4JF8WpuO
	0pvwL8kuEg3HtCj0RFClJr3C9GO6Hrkse+L5NRhwQxJHL62vjvbbZfZ/1nLgM95h
	/+2ROW82yyaLH0/Bovm+XuIjXm4T6AHhBEXuWb2yS+12I5ZX4LW+7XvnAJc/DXJb
	Au6kvzQ5Cb4TkFQX72/0tgLxNnEl12gjXwbsKxLXvUPXpmbAcmdfLSPGqOPwbc89
	4PzaUbVn/7pwxjCSvGB/dGG2S/aGkH5n3gTqN+1qdFoUCPUOanNdoQKT+CLTyEjb
	OwYT8zB/E3VB8F4j1KybHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725125455; x=
	1725211855; bh=6hcBQV+lMn3nVLZRbacEyKgHgYoLImcFvXoJIsy56rM=; b=W
	8lzOZo+sKqYQiI08ms8FVDpwvdAYYj1b/a2lYKW+WLrKvFKi2fAyUFx68DSSh3kB
	Vs+VUCkJyIBKhia63htccXUduzeLQTW+pCcSjlENmI7Hy7BKL5lsK4RZAm+QTOIX
	niY+qfS9cd79z53SqNenFJmL880aa52+86sob00F/ZAfSaT6lsyPKVeKnyH4WTRA
	ItV9feyxgtLMY1mGRYY5OY9V+ZZfQZsAApbWpIXc0L+uyWZDhTfIPeURBbDh/Owl
	L/NZiHAQ4bjUyly+o4y4c0dynBQCmu3IxBkIRS2kVAciAifxoPDfnjxQcMEpK98q
	frMQErhpstk81LrYwvS3Q==
X-ME-Sender: <xms:T1PTZsvqdF1cIqCrdN93zrAxIZ7XM8jSNMKPukefc6drUw0wQtqLSQ>
    <xme:T1PTZpd21JoltMCQi2czRngIT1tDZ3jj5P8tJ0z0XSjrLfaC3IWMVekvb2wfx89CR
    pnG01GH0EsBd6HvVHU>
X-ME-Received: <xmr:T1PTZnyAlguDyTDQ-VA_k3W7O5u2JQaoz0MNe3bwKd_svKI761eAC4zfev2YtuExy4eDznYVwKcnsrmOHHxQzSP-WA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudefkedguddugecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepveet
    gedtvddvhfdtkeeghfeffeehteehkeekgeefjeduieduueelgedtheekkeetnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhs
    ohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepgedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgrshgrhhhirhhohieskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgsuhhilhgusehvghgvrhdrkhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepmhgrrhgvgiesuggvnhigrdguvg
X-ME-Proxy: <xmx:T1PTZvOIt2UCFgjeMz51MakhNnt8w9JBva15grLDP7furyZxJDUAJA>
    <xmx:T1PTZs9ld2pAqufHVj6gZ1azBMmQ6fNyTiFFynAmFnxgvGOIxdxKIg>
    <xmx:T1PTZnXvCHjvqSn102HNOrh2yOP6G_k3g65X7p5WuMor4WiVdFJ5kw>
    <xmx:T1PTZlekassfyiuOeOuj7yxQT2IZjcdR7V026mWw5AAbeks033JNCA>
    <xmx:T1PTZgbHVZNvpXkzEPSRmVJdNgwJG74DXvYHNPlahc_k4bh78HfZ598h>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 31 Aug 2024 13:30:54 -0400 (EDT)
Date: Sat, 31 Aug 2024 19:30:53 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v2 02/12] kconfig: refactor choice value calculation
Message-ID: <20240831173053.GA27734@ragnatech.se>
References: <20240618103541.3508486-1-masahiroy@kernel.org>
 <20240618103541.3508486-3-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240618103541.3508486-3-masahiroy@kernel.org>

Hello Yamada-san,

Thanks for your work.

I bisected a kconfig issue to this change, but I'm not sure how to 
resolve it and would appreciate your help.

Before this changes if I run menuconfig,

    $ ARCH=arm64 make menuconfig

The menu option for by SOC_RENESAS is visible at

    Device Drivers ->
        SOC (System On Chip) specific Drivers ->
            Renesas SoC driver support

However after this patch it is not.

Furthermore searching (/) for any config option protected by SOC_RENESAS 
in drivers/soc/renesas/Kconfig (e.g. ARCH_R8A77965) results in a search 
hit, but if I try to jump to it by pressing 1 all I get is a blank 
screen.

I'm not sure if a fix to the for mention Kconfig file is needed or if 
something else is wrong. This is still true for today's linux-next [1].

1. 985bf40edf43 ("Add linux-next specific files for 20240830")

On 2024-06-18 19:35:21 +0900, Masahiro Yamada wrote:
> Handling choices has always been in a PITA in Kconfig.
> 
> For example, fixes and reverts were repeated for randconfig with
> KCONFIG_ALLCONFIG:
> 
>  - 422c809f03f0 ("kconfig: fix randomising choice entries in presence of KCONFIG_ALLCONFIG")
>  - 23a5dfdad22a ("Revert "kconfig: fix randomising choice entries in presence of KCONFIG_ALLCONFIG"")
>  - 8357b48549e1 ("kconfig: fix randomising choice entries in presence of KCONFIG_ALLCONFIG")
>  - 490f16171119 ("Revert "kconfig: fix randomising choice entries in presence of KCONFIG_ALLCONFIG"")
> 
> As these commits pointed out, randconfig does not randomize choices when
> KCONFIG_ALLCONFIG is used. This issue still remains.
> 
> [Test Case]
> 
>     choice
>             prompt "choose"
> 
>     config A
>             bool "A"
> 
>     config B
>             bool "B"
> 
>     endchoice
> 
>     $ echo > all.config
>     $ make KCONFIG_ALLCONFIG=1 randconfig
> 
> The output is always as follows:
> 
>     CONFIG_A=y
>     # CONFIG_B is not set
> 
> Not only randconfig, but other all*config variants are also broken with
> KCONFIG_ALLCONFIG.
> 
> With the same Kconfig,
> 
>     $ echo '# CONFIG_A is not set' > all.config
>     $ make KCONFIG_ALLCONFIG=1 allyesconfig
> 
> You will get this:
> 
>     CONFIG_A=y
>     # CONFIG_B is not set
> 
> This is incorrect because it does not respect all.config.
> 
> The correct output should be:
> 
>     # CONFIG_A is not set
>     CONFIG_B=y
> 
> To handle user inputs more accurately, this commit refactors the code
> based on the following principles:
> 
>  - When a user value is given, Kconfig must set it immediately.
>    Do not defer it by setting SYMBOL_NEED_SET_CHOICE_VALUES.
> 
>  - The SYMBOL_DEF_USER flag must not be cleared, unless a new config
>    file is loaded. Kconfig must not forget user inputs.
> 
> In addition, user values for choices must be managed with priority.
> If user inputs conflict within a choice block, the newest value wins.
> The values given by randconfig have lower priority than explicit user
> inputs.
> 
> This commit implements it by using a linked list. Every time a choice
> block gets a new input, it is moved to the top of the list.
> 
> Let me explain how it works.
> 
> Let's say, we have a choice block that consists of five symbols:
> A, B, C, D, and E.
> 
> Initially, the linked list looks like this:
> 
>     A(=?) --> B(=?) --> C(=?) --> D(=?) --> E(=?)
> 
> Suppose randconfig is executed with the following KCONFIG_ALLCONFIG:
> 
>     CONFIG_C=y
>     # CONFIG_A is not set
>     CONFIG_D=y
> 
> First, CONFIG_C=y is read. C is set to 'y' and moved to the top.
> 
>     C(=y) --> A(=?) --> B(=?) --> D(=?) --> E(=?)
> 
> Next, '# CONFIG_A is not set' is read. A is set to 'n' and moved to
> the top.
> 
>     A(=n) --> C(=y) --> B(=?) --> D(=?) --> E(=?)
> 
> Then, 'CONFIG_D=y' is read. D is set to 'y' and moved to the top.
> 
>     D(=y) --> A(=n) --> C(=y) --> B(=?) --> E(=?)
> 
> Lastly, randconfig shuffles the order of the remaining symbols,
> resulting in:
> 
>     D(=y) --> A(=n) --> C(=y) --> B(=y) --> E(=y)
> or
>     D(=y) --> A(=n) --> C(=y) --> E(=y) --> B(=y)
> 
> When calculating the output, the linked list is traversed and the first
> visible symbol with 'y' is taken. In this case, it is D if visible.
> 
> If D is hidden by 'depends on', the next node, A, is examined. Since
> it is already specified as 'n', it is skipped. Next, C is checked, and
> selected if it is visible.
> 
> If C is also invisible, either B or E is chosen as a result of the
> randomization.
> 
> If B and E are also invisible, the linked list is traversed in the
> reverse order, and the least prioritized 'n' symbol is chosen. It is
> A in this case.
> 
> Now, Kconfig remembers all user values. This is a big difference from
> the previous implementation, where Kconfig would forget CONFIG_C=y when
> CONFIG_D=y appeared in the same input file.
> 
> The new appaorch respects user-specified values as much as possible.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
> Changes in v2:
>   - If all 'y' and '?' symbols are invisible, traverse the linked list
>     in the reverse order to pick up the least prioritized 'n'.
> 
>  scripts/kconfig/conf.c     | 131 +++++++++++++++---------------
>  scripts/kconfig/confdata.c |  54 +++----------
>  scripts/kconfig/expr.h     |  12 ++-
>  scripts/kconfig/lkc.h      |   7 +-
>  scripts/kconfig/menu.c     |  17 +---
>  scripts/kconfig/parser.y   |   4 +
>  scripts/kconfig/symbol.c   | 159 +++++++++++++++++++++++--------------
>  7 files changed, 187 insertions(+), 197 deletions(-)
> 
> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> index 5dbdd9459f21..1c59998a62f7 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -114,41 +114,54 @@ static void set_randconfig_seed(void)
>  	srand(seed);
>  }
>  
> -static void randomize_choice_values(struct symbol *csym)
> +/**
> + * randomize_choice_values - randomize choice block
> + *
> + * @choice: menu entry for the choice
> + */
> +static void randomize_choice_values(struct menu *choice)
>  {
> -	struct property *prop;
> -	struct symbol *sym;
> -	struct expr *e;
> -	int cnt, def;
> -
> -	prop = sym_get_choice_prop(csym);
> -
> -	/* count entries in choice block */
> -	cnt = 0;
> -	expr_list_for_each_sym(prop->expr, e, sym)
> -		cnt++;
> +	struct menu *menu;
> +	int x;
> +	int cnt = 0;
>  
>  	/*
> -	 * find a random value and set it to yes,
> -	 * set the rest to no so we have only one set
> +	 * First, count the number of symbols to randomize. If sym_has_value()
> +	 * is true, it was specified by KCONFIG_ALLCONFIG. It needs to be
> +	 * respected.
>  	 */
> -	def = rand() % cnt;
> +	menu_for_each_sub_entry(menu, choice) {
> +		struct symbol *sym = menu->sym;
>  
> -	cnt = 0;
> -	expr_list_for_each_sym(prop->expr, e, sym) {
> -		if (def == cnt++) {
> -			sym->def[S_DEF_USER].tri = yes;
> -			csym->def[S_DEF_USER].val = sym;
> -		} else {
> -			sym->def[S_DEF_USER].tri = no;
> -		}
> -		sym->flags |= SYMBOL_DEF_USER;
> -		/* clear VALID to get value calculated */
> -		sym->flags &= ~SYMBOL_VALID;
> +		if (sym && !sym_has_value(sym))
> +			cnt++;
> +	}
> +
> +	while (cnt > 0) {
> +		x = rand() % cnt;
> +
> +		menu_for_each_sub_entry(menu, choice) {
> +			struct symbol *sym = menu->sym;
> +
> +			if (sym && !sym_has_value(sym))
> +				x--;
> +
> +			if (x < 0) {
> +				sym->def[S_DEF_USER].tri = yes;
> +				sym->flags |= SYMBOL_DEF_USER;
> +				/*
> +				 * Move the selected item to the _tail_ because
> +				 * this needs to have a lower priority than the
> +				 * user input from KCONFIG_ALLCONFIG.
> +				 */
> +				list_move_tail(&sym->choice_link,
> +					       &choice->choice_members);
> +
> +				break;
> +			}
> +		}
> +		cnt--;
>  	}
> -	csym->flags |= SYMBOL_DEF_USER;
> -	/* clear VALID to get value calculated */
> -	csym->flags &= ~SYMBOL_VALID;
>  }
>  
>  enum conf_def_mode {
> @@ -159,9 +172,9 @@ enum conf_def_mode {
>  	def_random
>  };
>  
> -static bool conf_set_all_new_symbols(enum conf_def_mode mode)
> +static void conf_set_all_new_symbols(enum conf_def_mode mode)
>  {
> -	struct symbol *sym, *csym;
> +	struct menu *menu;
>  	int cnt;
>  	/*
>  	 * can't go as the default in switch-case below, otherwise gcc whines
> @@ -170,7 +183,6 @@ static bool conf_set_all_new_symbols(enum conf_def_mode mode)
>  	int pby = 50; /* probability of bool     = y */
>  	int pty = 33; /* probability of tristate = y */
>  	int ptm = 33; /* probability of tristate = m */
> -	bool has_changed = false;
>  
>  	if (mode == def_random) {
>  		int n, p[3];
> @@ -217,14 +229,21 @@ static bool conf_set_all_new_symbols(enum conf_def_mode mode)
>  		}
>  	}
>  
> -	for_all_symbols(sym) {
> +	menu_for_each_entry(menu) {
> +		struct symbol *sym = menu->sym;
>  		tristate val;
>  
> -		if (sym_has_value(sym) || sym->flags & SYMBOL_VALID ||
> -		    (sym->type != S_BOOLEAN && sym->type != S_TRISTATE))
> +		if (!sym || !menu->prompt || sym_has_value(sym) ||
> +		    (sym->type != S_BOOLEAN && sym->type != S_TRISTATE) ||
> +		    sym_is_choice_value(sym))
>  			continue;
>  
> -		has_changed = true;
> +		if (sym_is_choice(sym)) {
> +			if (mode == def_random)
> +				randomize_choice_values(menu);
> +			continue;
> +		}
> +
>  		switch (mode) {
>  		case def_yes:
>  			val = yes;
> @@ -251,34 +270,10 @@ static bool conf_set_all_new_symbols(enum conf_def_mode mode)
>  			continue;
>  		}
>  		sym->def[S_DEF_USER].tri = val;
> -
> -		if (!(sym_is_choice(sym) && mode == def_random))
> -			sym->flags |= SYMBOL_DEF_USER;
> +		sym->flags |= SYMBOL_DEF_USER;
>  	}
>  
>  	sym_clear_all_valid();
> -
> -	if (mode != def_random) {
> -		for_all_symbols(csym) {
> -			if ((sym_is_choice(csym) && !sym_has_value(csym)) ||
> -			    sym_is_choice_value(csym))
> -				csym->flags |= SYMBOL_NEED_SET_CHOICE_VALUES;
> -		}
> -	}
> -
> -	for_all_symbols(csym) {
> -		if (sym_has_value(csym) || !sym_is_choice(csym))
> -			continue;
> -
> -		sym_calc_value(csym);
> -		if (mode == def_random)
> -			randomize_choice_values(csym);
> -		else
> -			set_all_choice_values(csym);
> -		has_changed = true;
> -	}
> -
> -	return has_changed;
>  }
>  
>  static void conf_rewrite_tristates(tristate old_val, tristate new_val)
> @@ -429,10 +424,9 @@ static void conf_choice(struct menu *menu)
>  {
>  	struct symbol *sym, *def_sym;
>  	struct menu *child;
> -	bool is_new;
> +	bool is_new = false;
>  
>  	sym = menu->sym;
> -	is_new = !sym_has_value(sym);
>  
>  	while (1) {
>  		int cnt, def;
> @@ -456,8 +450,10 @@ static void conf_choice(struct menu *menu)
>  				printf("%*c", indent, ' ');
>  			printf(" %d. %s (%s)", cnt, menu_get_prompt(child),
>  			       child->sym->name);
> -			if (!sym_has_value(child->sym))
> +			if (!sym_has_value(child->sym)) {
> +				is_new = true;
>  				printf(" (NEW)");
> +			}
>  			printf("\n");
>  		}
>  		printf("%*schoice", indent - 1, "");
> @@ -586,9 +582,7 @@ static void check_conf(struct menu *menu)
>  		return;
>  
>  	sym = menu->sym;
> -	if (sym && !sym_has_value(sym) &&
> -	    (sym_is_changeable(sym) || sym_is_choice(sym))) {
> -
> +	if (sym && !sym_has_value(sym) && sym_is_changeable(sym)) {
>  		switch (input_mode) {
>  		case listnewconfig:
>  			if (sym->name)
> @@ -804,8 +798,7 @@ int main(int ac, char **av)
>  		conf_set_all_new_symbols(def_default);
>  		break;
>  	case randconfig:
> -		/* Really nothing to do in this loop */
> -		while (conf_set_all_new_symbols(def_random)) ;
> +		conf_set_all_new_symbols(def_random);
>  		break;
>  	case defconfig:
>  		conf_set_all_new_symbols(def_default);
> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index 1ac7fc9ad756..05823f85402a 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -382,10 +382,7 @@ int conf_read_simple(const char *name, int def)
>  
>  	def_flags = SYMBOL_DEF << def;
>  	for_all_symbols(sym) {
> -		sym->flags |= SYMBOL_CHANGED;
>  		sym->flags &= ~(def_flags|SYMBOL_VALID);
> -		if (sym_is_choice(sym))
> -			sym->flags |= def_flags;
>  		switch (sym->type) {
>  		case S_INT:
>  		case S_HEX:
> @@ -399,6 +396,8 @@ int conf_read_simple(const char *name, int def)
>  	}
>  
>  	while (getline_stripped(&line, &line_asize, in) != -1) {
> +		struct menu *choice;
> +
>  		conf_lineno++;
>  
>  		if (!line[0]) /* blank line */
> @@ -460,15 +459,14 @@ int conf_read_simple(const char *name, int def)
>  		if (conf_set_sym_val(sym, def, def_flags, val))
>  			continue;
>  
> -		if (sym && sym_is_choice_value(sym)) {
> -			struct symbol *cs = prop_get_symbol(sym_get_choice_prop(sym));
> -			if (sym->def[def].tri == yes) {
> -				if (cs->def[def].tri != no)
> -					conf_warning("override: %s changes choice state", sym->name);
> -				cs->def[def].val = sym;
> -				cs->def[def].tri = yes;
> -			}
> -		}
> +		/*
> +		 * If this is a choice member, give it the highest priority.
> +		 * If conflicting CONFIG options are given from an input file,
> +		 * the last one wins.
> +		 */
> +		choice = sym_get_choice_menu(sym);
> +		if (choice)
> +			list_move(&sym->choice_link, &choice->choice_members);
>  	}
>  	free(line);
>  	fclose(in);
> @@ -514,18 +512,6 @@ int conf_read(const char *name)
>  		/* maybe print value in verbose mode... */
>  	}
>  
> -	for_all_symbols(sym) {
> -		if (sym_has_value(sym) && !sym_is_choice_value(sym)) {
> -			/* Reset values of generates values, so they'll appear
> -			 * as new, if they should become visible, but that
> -			 * doesn't quite work if the Kconfig and the saved
> -			 * configuration disagree.
> -			 */
> -			if (sym->visible == no && !conf_unsaved)
> -				sym->flags &= ~SYMBOL_DEF_USER;
> -		}
> -	}
> -
>  	if (conf_warnings || conf_unsaved)
>  		conf_set_changed(true);
>  
> @@ -1146,23 +1132,3 @@ void conf_set_changed_callback(void (*fn)(bool))
>  {
>  	conf_changed_callback = fn;
>  }
> -
> -void set_all_choice_values(struct symbol *csym)
> -{
> -	struct property *prop;
> -	struct symbol *sym;
> -	struct expr *e;
> -
> -	prop = sym_get_choice_prop(csym);
> -
> -	/*
> -	 * Set all non-assinged choice values to no
> -	 */
> -	expr_list_for_each_sym(prop->expr, e, sym) {
> -		if (!sym_has_value(sym))
> -			sym->def[S_DEF_USER].tri = no;
> -	}
> -	csym->flags |= SYMBOL_DEF_USER;
> -	/* clear VALID to get value calculated */
> -	csym->flags &= ~(SYMBOL_VALID | SYMBOL_NEED_SET_CHOICE_VALUES);
> -}
> diff --git a/scripts/kconfig/expr.h b/scripts/kconfig/expr.h
> index 7c0c242318bc..7acf27a4f454 100644
> --- a/scripts/kconfig/expr.h
> +++ b/scripts/kconfig/expr.h
> @@ -73,6 +73,8 @@ enum {
>   * Represents a configuration symbol.
>   *
>   * Choices are represented as a special kind of symbol with null name.
> + *
> + * @choice_link: linked to menu::choice_members
>   */
>  struct symbol {
>  	/* link node for the hash table */
> @@ -110,6 +112,8 @@ struct symbol {
>  	/* config entries associated with this symbol */
>  	struct list_head menus;
>  
> +	struct list_head choice_link;
> +
>  	/* SYMBOL_* flags */
>  	int flags;
>  
> @@ -133,7 +137,6 @@ struct symbol {
>  #define SYMBOL_CHOICEVAL  0x0020  /* used as a value in a choice block */
>  #define SYMBOL_VALID      0x0080  /* set when symbol.curr is calculated */
>  #define SYMBOL_WRITE      0x0200  /* write symbol to file (KCONFIG_CONFIG) */
> -#define SYMBOL_CHANGED    0x0400  /* ? */
>  #define SYMBOL_WRITTEN    0x0800  /* track info to avoid double-write to .config */
>  #define SYMBOL_CHECKED    0x2000  /* used during dependency checking */
>  #define SYMBOL_WARNED     0x8000  /* warning has been issued */
> @@ -145,9 +148,6 @@ struct symbol {
>  #define SYMBOL_DEF3       0x40000  /* symbol.def[S_DEF_3] is valid */
>  #define SYMBOL_DEF4       0x80000  /* symbol.def[S_DEF_4] is valid */
>  
> -/* choice values need to be set before calculating this symbol value */
> -#define SYMBOL_NEED_SET_CHOICE_VALUES  0x100000
> -
>  #define SYMBOL_MAXLENGTH	256
>  
>  /* A property represent the config options that can be associated
> @@ -204,6 +204,8 @@ struct property {
>   * for all front ends). Each symbol, menu, etc. defined in the Kconfig files
>   * gets a node. A symbol defined in multiple locations gets one node at each
>   * location.
> + *
> + * @choice_members: list of choice members with priority.
>   */
>  struct menu {
>  	/* The next menu node at the same level */
> @@ -223,6 +225,8 @@ struct menu {
>  
>  	struct list_head link;	/* link to symbol::menus */
>  
> +	struct list_head choice_members;
> +
>  	/*
>  	 * The prompt associated with the node. This holds the prompt for a
>  	 * symbol as well as the text for a menu or comment, along with the
> diff --git a/scripts/kconfig/lkc.h b/scripts/kconfig/lkc.h
> index 64dfc354dd5c..bdd37a16b040 100644
> --- a/scripts/kconfig/lkc.h
> +++ b/scripts/kconfig/lkc.h
> @@ -40,7 +40,6 @@ void zconf_nextfile(const char *name);
>  /* confdata.c */
>  extern struct gstr autoconf_cmd;
>  const char *conf_get_configname(void);
> -void set_all_choice_values(struct symbol *csym);
>  
>  /* confdata.c and expr.c */
>  static inline void xfwrite(const void *str, size_t len, size_t count, FILE *out)
> @@ -121,11 +120,7 @@ static inline tristate sym_get_tristate_value(struct symbol *sym)
>  	return sym->curr.tri;
>  }
>  
> -
> -static inline struct symbol *sym_get_choice_value(struct symbol *sym)
> -{
> -	return (struct symbol *)sym->curr.val;
> -}
> +struct symbol *sym_get_choice_value(struct symbol *sym);
>  
>  static inline bool sym_is_choice(struct symbol *sym)
>  {
> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
> index bf5dcc05350b..170a269a8d7c 100644
> --- a/scripts/kconfig/menu.c
> +++ b/scripts/kconfig/menu.c
> @@ -591,7 +591,6 @@ bool menu_is_empty(struct menu *menu)
>  
>  bool menu_is_visible(struct menu *menu)
>  {
> -	struct menu *child;
>  	struct symbol *sym;
>  	tristate visible;
>  
> @@ -610,21 +609,7 @@ bool menu_is_visible(struct menu *menu)
>  	} else
>  		visible = menu->prompt->visible.tri = expr_calc_value(menu->prompt->visible.expr);
>  
> -	if (visible != no)
> -		return true;
> -
> -	if (!sym || sym_get_tristate_value(menu->sym) == no)
> -		return false;
> -
> -	for (child = menu->list; child; child = child->next) {
> -		if (menu_is_visible(child)) {
> -			if (sym)
> -				sym->flags |= SYMBOL_DEF_USER;
> -			return true;
> -		}
> -	}
> -
> -	return false;
> +	return visible != no;
>  }
>  
>  const char *menu_get_prompt(struct menu *menu)
> diff --git a/scripts/kconfig/parser.y b/scripts/kconfig/parser.y
> index 20538e1d3788..9d58544b0255 100644
> --- a/scripts/kconfig/parser.y
> +++ b/scripts/kconfig/parser.y
> @@ -157,6 +157,9 @@ config_stmt: config_entry_start config_option_list
>  				current_entry->filename, current_entry->lineno);
>  			yynerrs++;
>  		}
> +
> +		list_add_tail(&current_entry->sym->choice_link,
> +			      &current_choice->choice_members);
>  	}
>  
>  	printd(DEBUG_PARSE, "%s:%d:endconfig\n", cur_filename, cur_lineno);
> @@ -240,6 +243,7 @@ choice: T_CHOICE T_EOL
>  	menu_add_entry(sym);
>  	menu_add_expr(P_CHOICE, NULL, NULL);
>  	menu_set_type(S_BOOLEAN);
> +	INIT_LIST_HEAD(&current_entry->choice_members);
>  
>  	printd(DEBUG_PARSE, "%s:%d:choice\n", cur_filename, cur_lineno);
>  };
> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
> index 8df0a75f40b9..329c7bd314cf 100644
> --- a/scripts/kconfig/symbol.c
> +++ b/scripts/kconfig/symbol.c
> @@ -188,7 +188,6 @@ static void sym_set_changed(struct symbol *sym)
>  {
>  	struct menu *menu;
>  
> -	sym->flags |= SYMBOL_CHANGED;
>  	list_for_each_entry(menu, &sym->menus, link)
>  		menu->flags |= MENU_CHANGED;
>  }
> @@ -282,36 +281,95 @@ struct symbol *sym_choice_default(struct symbol *sym)
>  	return NULL;
>  }
>  
> -static struct symbol *sym_calc_choice(struct symbol *sym)
> +/*
> + * sym_calc_choice - calculate symbol values in a choice
> + *
> + * @choice: a menu of the choice
> + *
> + * Return: a chosen symbol
> + */
> +static struct symbol *sym_calc_choice(struct menu *choice)
>  {
> -	struct symbol *def_sym;
> -	struct property *prop;
> -	struct expr *e;
> -	int flags;
> +	struct symbol *res = NULL;
> +	struct symbol *sym;
> +	struct menu *menu;
>  
> -	/* first calculate all choice values' visibilities */
> -	flags = sym->flags;
> -	prop = sym_get_choice_prop(sym);
> -	expr_list_for_each_sym(prop->expr, e, def_sym) {
> -		sym_calc_visibility(def_sym);
> -		if (def_sym->visible != no)
> -			flags &= def_sym->flags;
> +	/* Traverse the list of choice members in the priority order. */
> +	list_for_each_entry(sym, &choice->choice_members, choice_link) {
> +		sym_calc_visibility(sym);
> +		if (sym->visible == no)
> +			continue;
> +
> +		/* The first visible symble with the user value 'y'. */
> +		if (sym_has_value(sym) && sym->def[S_DEF_USER].tri == yes) {
> +			res = sym;
> +			break;
> +		}
>  	}
>  
> -	sym->flags &= flags | ~SYMBOL_DEF_USER;
> +	/*
> +	 * If 'y' is not found in the user input, use the default, unless it is
> +	 * explicitly set to 'n'.
> +	 */
> +	if (!res) {
> +		res = sym_choice_default(choice->sym);
> +		if (res && sym_has_value(res) && res->def[S_DEF_USER].tri == no)
> +			res = NULL;
> +	}
>  
> -	/* is the user choice visible? */
> -	def_sym = sym->def[S_DEF_USER].val;
> -	if (def_sym && def_sym->visible != no)
> -		return def_sym;
> +	/* Still not found. Pick up the first visible, user-unspecified symbol. */
> +	if (!res) {
> +		menu_for_each_sub_entry(menu, choice) {
> +			sym = menu->sym;
>  
> -	def_sym = sym_choice_default(sym);
> +			if (!sym || sym->visible == no || sym_has_value(sym))
> +				continue;
>  
> -	if (def_sym == NULL)
> -		/* no choice? reset tristate value */
> -		sym->curr.tri = no;
> +			res = sym;
> +			break;
> +		}
> +	}
>  
> -	return def_sym;
> +	/*
> +	 * Still not found. Traverse the linked list in the _reverse_ order to
> +	 * pick up the least prioritized 'n'.
> +	 */
> +	if (!res) {
> +		list_for_each_entry_reverse(sym, &choice->choice_members,
> +					    choice_link) {
> +			if (sym->visible == no)
> +				continue;
> +
> +			res = sym;
> +			break;
> +		}
> +	}
> +
> +	menu_for_each_sub_entry(menu, choice) {
> +		tristate val;
> +
> +		sym = menu->sym;
> +
> +		if (!sym || sym->visible == no)
> +			continue;
> +
> +		val = sym == res ? yes : no;
> +
> +		if (sym->curr.tri != val)
> +			sym_set_changed(sym);
> +
> +		sym->curr.tri = val;
> +		sym->flags |= SYMBOL_VALID | SYMBOL_WRITE;
> +	}
> +
> +	return res;
> +}
> +
> +struct symbol *sym_get_choice_value(struct symbol *sym)
> +{
> +	struct menu *menu = list_first_entry(&sym->menus, struct menu, link);
> +
> +	return sym_calc_choice(menu);
>  }
>  
>  static void sym_warn_unmet_dep(struct symbol *sym)
> @@ -347,7 +405,7 @@ void sym_calc_value(struct symbol *sym)
>  {
>  	struct symbol_value newval, oldval;
>  	struct property *prop;
> -	struct expr *e;
> +	struct menu *choice_menu;
>  
>  	if (!sym)
>  		return;
> @@ -355,13 +413,6 @@ void sym_calc_value(struct symbol *sym)
>  	if (sym->flags & SYMBOL_VALID)
>  		return;
>  
> -	if (sym_is_choice_value(sym) &&
> -	    sym->flags & SYMBOL_NEED_SET_CHOICE_VALUES) {
> -		sym->flags &= ~SYMBOL_NEED_SET_CHOICE_VALUES;
> -		prop = sym_get_choice_prop(sym);
> -		sym_calc_value(prop_get_symbol(prop));
> -	}
> -
>  	sym->flags |= SYMBOL_VALID;
>  
>  	oldval = sym->curr;
> @@ -400,9 +451,11 @@ void sym_calc_value(struct symbol *sym)
>  	switch (sym_get_type(sym)) {
>  	case S_BOOLEAN:
>  	case S_TRISTATE:
> -		if (sym_is_choice_value(sym) && sym->visible == yes) {
> -			prop = sym_get_choice_prop(sym);
> -			newval.tri = (prop_get_symbol(prop)->curr.val == sym) ? yes : no;
> +		choice_menu = sym_get_choice_menu(sym);
> +
> +		if (choice_menu) {
> +			sym_calc_choice(choice_menu);
> +			newval.tri = sym->curr.tri;
>  		} else {
>  			if (sym->visible != no) {
>  				/* if the symbol is visible use the user value
> @@ -461,8 +514,6 @@ void sym_calc_value(struct symbol *sym)
>  	}
>  
>  	sym->curr = newval;
> -	if (sym_is_choice(sym) && newval.tri == yes)
> -		sym->curr.val = sym_calc_choice(sym);
>  	sym_validate_range(sym);
>  
>  	if (memcmp(&oldval, &sym->curr, sizeof(oldval))) {
> @@ -473,23 +524,8 @@ void sym_calc_value(struct symbol *sym)
>  		}
>  	}
>  
> -	if (sym_is_choice(sym)) {
> -		struct symbol *choice_sym;
> -
> -		prop = sym_get_choice_prop(sym);
> -		expr_list_for_each_sym(prop->expr, e, choice_sym) {
> -			if ((sym->flags & SYMBOL_WRITE) &&
> -			    choice_sym->visible != no)
> -				choice_sym->flags |= SYMBOL_WRITE;
> -			if (sym->flags & SYMBOL_CHANGED)
> -				sym_set_changed(choice_sym);
> -		}
> -
> +	if (sym_is_choice(sym))
>  		sym->flags &= ~SYMBOL_WRITE;
> -	}
> -
> -	if (sym->flags & SYMBOL_NEED_SET_CHOICE_VALUES)
> -		set_all_choice_values(sym);
>  }
>  
>  void sym_clear_all_valid(void)
> @@ -523,15 +559,15 @@ bool sym_set_tristate_value(struct symbol *sym, tristate val)
>  {
>  	tristate oldval = sym_get_tristate_value(sym);
>  
> -	if (oldval != val && !sym_tristate_within_range(sym, val))
> +	if (!sym_tristate_within_range(sym, val))
>  		return false;
>  
> -	if (!(sym->flags & SYMBOL_DEF_USER)) {
> +	if (!(sym->flags & SYMBOL_DEF_USER) || sym->def[S_DEF_USER].tri != val) {
> +		sym->def[S_DEF_USER].tri = val;
>  		sym->flags |= SYMBOL_DEF_USER;
>  		sym_set_changed(sym);
>  	}
>  
> -	sym->def[S_DEF_USER].tri = val;
>  	if (oldval != val)
>  		sym_clear_all_valid();
>  
> @@ -565,10 +601,17 @@ void choice_set_value(struct menu *choice, struct symbol *sym)
>  
>  		menu->sym->def[S_DEF_USER].tri = val;
>  		menu->sym->flags |= SYMBOL_DEF_USER;
> -	}
>  
> -	choice->sym->def[S_DEF_USER].val = sym;
> -	choice->sym->flags |= SYMBOL_DEF_USER;
> +		/*
> +		 * Now, the user has explicitly enabled or disabled this symbol,
> +		 * it should be given the highest priority. We are possibly
> +		 * setting multiple symbols to 'n', where the first symbol is
> +		 * given the least prioritized 'n'. This works well when the
> +		 * choice block ends up with selecting 'n' symbol.
> +		 * (see sym_calc_choice())
> +		 */
> +		list_move(&menu->sym->choice_link, &choice->choice_members);
> +	}
>  
>  	if (changed)
>  		sym_clear_all_valid();
> -- 
> 2.43.0
> 

-- 
Kind Regards,
Niklas Söderlund

