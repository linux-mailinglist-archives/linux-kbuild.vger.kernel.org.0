Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5DAEC9F69
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Oct 2019 15:29:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730378AbfJCN33 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 3 Oct 2019 09:29:29 -0400
Received: from mail-yw1-f67.google.com ([209.85.161.67]:46858 "EHLO
        mail-yw1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730370AbfJCN33 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Oct 2019 09:29:29 -0400
Received: by mail-yw1-f67.google.com with SMTP id 201so985317ywn.13
        for <linux-kbuild@vger.kernel.org>; Thu, 03 Oct 2019 06:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sruffell-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kOoernM9b/xRCotCwpMbUEaYeTQlIdok4in8RGonI+A=;
        b=N3zEfPy0XhC1NQEJu8b4xQu51mQsobpPwaNt3+VJYUszWsJTebDXCUX28x0Sl7vK4k
         hOgHg28teJQF6QEWFzspF7GU9bzrWQF9ovI1agDeXtydyw5XXexmqrMofdJCvkzPgcwG
         pNU3bD4MBPeDnwvjZk2tltT2I5OyLWiZG3dvbvcMnbZWidap560Le9mai54eEXeF+Y57
         5sC4X+0OIq0ZCWJe7sAhYbyrxxQi5Gtd0ScXQS2ZakWOsFnawTkmfDtGl79YC1qc/48v
         BLZMJaGhVL47S8OjWaPb+0BHsvfNpBmd7NVYbA4TwGLnMEyKO3vuNj5grgkwE5VhQLOu
         pU5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kOoernM9b/xRCotCwpMbUEaYeTQlIdok4in8RGonI+A=;
        b=liLBqIdZAFButADX8eqjLTuQW8r0a56THMbEmwruOk9JxDouBvcplADQ55TSi/narV
         6+bIKt/Rxkzki9xt7aIgobvZ5ESF81Mb9YzbVbKwaauOYmbKBADJVB53eOb/MTqZ0HWm
         sSy4MDqK6X78IlmUndEnd8DHXxuBboIn4CUNQvmJ50pYbBQLWOYNmt8hrWtJvppBGU5r
         sC7qDlPh40Fb/FCmvNx2bgN/RdIyUx1f6+XIdoUReVtSzfK/gBY1blD2yaVJdl5LZuU7
         RB8hsfhX6YCT9hM56fuNZ/vCd6ysWKJwjtj0tDgRlZiGi+GGZY/aBPGW51KdbOcwd1Qp
         TAxw==
X-Gm-Message-State: APjAAAXRJbfi9+2QCGXN7kDinVkD9YKVzQ1ZZUxwo5oIHTskbKZcWdUE
        JuCiuCu0hgTY8VrUw+ghIvqa
X-Google-Smtp-Source: APXvYqxS96TphH8ymk7qkNH/6K+V1iyKTNpUK0LQfI04rDzlYEBFnSm1cwEwHTKojnLpwUDQqnnk8A==
X-Received: by 2002:a81:4c95:: with SMTP id z143mr6550351ywa.417.1570109367570;
        Thu, 03 Oct 2019 06:29:27 -0700 (PDT)
Received: from sruffell.net ([136.53.91.217])
        by smtp.gmail.com with ESMTPSA id l11sm635876ywh.34.2019.10.03.06.29.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Oct 2019 06:29:26 -0700 (PDT)
Date:   Thu, 3 Oct 2019 01:29:27 -0500
From:   Shaun Ruffell <sruffell@sruffell.net>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Jessica Yu <jeyu@kernel.org>,
        Matthias Maennich <maennich@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kbuild@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] modpost: fix broken sym->namespace for external
 module builds
Message-ID: <20191003062927.4pusu3sfjyfayigy@sruffell.net>
References: <20191003075826.7478-1-yamada.masahiro@socionext.com>
 <20191003075826.7478-3-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191003075826.7478-3-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Oct 03, 2019 at 04:58:22PM +0900, Masahiro Yamada wrote:
> Currently, external module builds produce tons of false-positives:
> 
>   WARNING: module <mod> uses symbol <sym> from namespace <ns>, but does not import it.
> 
> Here, the <ns> part shows a random string.
> 
> When you build external modules, the symbol info of vmlinux and
> in-kernel modules are read from $(objtree)/Module.symvers, but
> read_dump() is buggy in multiple ways:
> 
> [1] When the modpost is run for vmlinux and in-kernel modules,
> sym_extract_namespace() allocates memory for the namespace. On the
> other hand, read_dump() does not, then sym->namespace will point to
> somewhere in the line buffer of get_next_line(). The data in the
> buffer will be replaced soon, and sym->namespace will end up with
> pointing to unrelated data. As a result, check_exports() will show
> random strings in the warning messages.
> 
> [2] When there is no namespace, sym_extract_namespace() returns NULL.
> On the other hand, read_dump() sets namespace to an empty string "".
> (but, it will be later replaced with unrelated data due to bug [1].)
> The check_exports() shows a warning unless exp->namespace is NULL,
> so every symbol read from read_dump() emits the warning, which is
> mostly false positive.
> 
> To address [1], sym_add_exported() calls strdup() for s->namespace.
> The namespace from sym_extract_namespace() must be freed to avoid
> memory leak.
> 
> For [2], I changed the if-conditional in check_exports().
> 
> This commit also fixes sym_add_exported() to set s->namespace correctly
> when the symbol is preloaded.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Reviewed-by: Matthias Maennich <maennich@google.com>
> ---
> 
> Changes in v2:
>   - Change the approach to deal with ->preloaded
> 
>  scripts/mod/modpost.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 2c644086c412..936d3ad23c83 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -166,7 +166,7 @@ struct symbol {
>  	struct module *module;
>  	unsigned int crc;
>  	int crc_valid;
> -	const char *namespace;
> +	char *namespace;
>  	unsigned int weak:1;
>  	unsigned int vmlinux:1;    /* 1 if symbol is defined in vmlinux */
>  	unsigned int kernel:1;     /* 1 if symbol is from kernel
> @@ -348,7 +348,7 @@ static enum export export_from_sec(struct elf_info *elf, unsigned int sec)
>  		return export_unknown;
>  }
>  
> -static const char *sym_extract_namespace(const char **symname)
> +static char *sym_extract_namespace(const char **symname)
>  {
>  	char *namespace = NULL;
>  	char *ns_separator;
> @@ -373,7 +373,6 @@ static struct symbol *sym_add_exported(const char *name, const char *namespace,
>  
>  	if (!s) {
>  		s = new_symbol(name, mod, export);
> -		s->namespace = namespace;
>  	} else {
>  		if (!s->preloaded) {
>  			warn("%s: '%s' exported twice. Previous export was in %s%s\n",
> @@ -384,6 +383,8 @@ static struct symbol *sym_add_exported(const char *name, const char *namespace,
>  			s->module = mod;
>  		}
>  	}
> +	free(s->namespace);
> +	s->namespace = namespace ? strdup(namespace) : NULL;
>  	s->preloaded = 0;
>  	s->vmlinux   = is_vmlinux(mod->name);
>  	s->kernel    = 0;
> @@ -670,7 +671,8 @@ static void handle_modversions(struct module *mod, struct elf_info *info,
>  	unsigned int crc;
>  	enum export export;
>  	bool is_crc = false;
> -	const char *name, *namespace;
> +	const char *name;
> +	char *namespace;
>  
>  	if ((!is_vmlinux(mod->name) || mod->is_dot_o) &&
>  	    strstarts(symname, "__ksymtab"))
> @@ -745,6 +747,7 @@ static void handle_modversions(struct module *mod, struct elf_info *info,
>  			name = symname + strlen("__ksymtab_");
>  			namespace = sym_extract_namespace(&name);
>  			sym_add_exported(name, namespace, mod, export);
> +			free(namespace);
>  		}
>  		if (strcmp(symname, "init_module") == 0)
>  			mod->has_init = 1;
> @@ -2193,7 +2196,7 @@ static int check_exports(struct module *mod)
>  		else
>  			basename = mod->name;
>  
> -		if (exp->namespace) {
> +		if (exp->namespace && exp->namespace[0]) {
>  			add_namespace(&mod->required_namespaces,
>  				      exp->namespace);
>  

This looks good to me and is better than what I had originally proposed.
I confirmed that I can still build an external module without any
warnings. (But I did have to convince myself that it was OK to store
empty namespace strings in the symbol structure and that check_exports()
would cover it sufficiently)

If you would like, feel free to add my

Reviewed-by: Shaun Ruffell <sruffell@sruffell.net>
  or
Tested-by: Shaun Ruffell <sruffell@sruffell.net>

