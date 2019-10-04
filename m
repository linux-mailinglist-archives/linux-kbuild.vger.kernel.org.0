Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19CE8CBEA9
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Oct 2019 17:10:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389547AbfJDPKJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 4 Oct 2019 11:10:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:51096 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389384AbfJDPKJ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 4 Oct 2019 11:10:09 -0400
Received: from linux-8ccs (ip5f5adbaa.dynamic.kabel-deutschland.de [95.90.219.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 19E9D207FF;
        Fri,  4 Oct 2019 15:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570201807;
        bh=Br7RGlafBL1GnkLSggx3opMNYDXcg6mMPj+3qCpAw+c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aX3z33rapOk6LeyKyM3RXvXmfFk/sBSSrg3JWHBVqnJjBYX2A/gwEn/rr/v3u4mi0
         UbQajtIqezumg4On1fozKn0QD82lOHXimsxxZsyluJdlI3AGymqMuUaVx2ITgOZoXO
         SgagB0QTwps8nTlKbicwV1YMHZ6GMC/IKENBy9Z8=
Date:   Fri, 4 Oct 2019 17:10:02 +0200
From:   Jessica Yu <jeyu@kernel.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Shaun Ruffell <sruffell@sruffell.net>,
        Matthias Maennich <maennich@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/6] modpost: fix broken sym->namespace for external
 module builds
Message-ID: <20191004151002.GA4665@linux-8ccs>
References: <20191003075826.7478-1-yamada.masahiro@socionext.com>
 <20191003075826.7478-3-yamada.masahiro@socionext.com>
 <20191003062927.4pusu3sfjyfayigy@sruffell.net>
 <CAK7LNAQqAsLPjoptMa52jNsDaogwbcQQHe+PvArarG6k+2oNRw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAK7LNAQqAsLPjoptMa52jNsDaogwbcQQHe+PvArarG6k+2oNRw@mail.gmail.com>
X-OS:   Linux linux-8ccs 4.12.14-lp150.12.28-default x86_64
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

+++ Masahiro Yamada [03/10/19 23:42 +0900]:
>Hi Shaun,
>
>On Thu, Oct 3, 2019 at 10:29 PM Shaun Ruffell <sruffell@sruffell.net> wrote:
>>
>> On Thu, Oct 03, 2019 at 04:58:22PM +0900, Masahiro Yamada wrote:
>> > Currently, external module builds produce tons of false-positives:
>> >
>> >   WARNING: module <mod> uses symbol <sym> from namespace <ns>, but does not import it.
>> >
>> > Here, the <ns> part shows a random string.
>> >
>> > When you build external modules, the symbol info of vmlinux and
>> > in-kernel modules are read from $(objtree)/Module.symvers, but
>> > read_dump() is buggy in multiple ways:
>> >
>> > [1] When the modpost is run for vmlinux and in-kernel modules,
>> > sym_extract_namespace() allocates memory for the namespace. On the
>> > other hand, read_dump() does not, then sym->namespace will point to
>> > somewhere in the line buffer of get_next_line(). The data in the
>> > buffer will be replaced soon, and sym->namespace will end up with
>> > pointing to unrelated data. As a result, check_exports() will show
>> > random strings in the warning messages.
>> >
>> > [2] When there is no namespace, sym_extract_namespace() returns NULL.
>> > On the other hand, read_dump() sets namespace to an empty string "".
>> > (but, it will be later replaced with unrelated data due to bug [1].)
>> > The check_exports() shows a warning unless exp->namespace is NULL,
>> > so every symbol read from read_dump() emits the warning, which is
>> > mostly false positive.
>> >
>> > To address [1], sym_add_exported() calls strdup() for s->namespace.
>> > The namespace from sym_extract_namespace() must be freed to avoid
>> > memory leak.
>> >
>> > For [2], I changed the if-conditional in check_exports().
>> >
>> > This commit also fixes sym_add_exported() to set s->namespace correctly
>> > when the symbol is preloaded.
>> >
>> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> > Reviewed-by: Matthias Maennich <maennich@google.com>
>> > ---
>> >
>> > Changes in v2:
>> >   - Change the approach to deal with ->preloaded
>> >
>> >  scripts/mod/modpost.c | 13 ++++++++-----
>> >  1 file changed, 8 insertions(+), 5 deletions(-)
>> >
>> > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
>> > index 2c644086c412..936d3ad23c83 100644
>> > --- a/scripts/mod/modpost.c
>> > +++ b/scripts/mod/modpost.c
>> > @@ -166,7 +166,7 @@ struct symbol {
>> >       struct module *module;
>> >       unsigned int crc;
>> >       int crc_valid;
>> > -     const char *namespace;
>> > +     char *namespace;
>> >       unsigned int weak:1;
>> >       unsigned int vmlinux:1;    /* 1 if symbol is defined in vmlinux */
>> >       unsigned int kernel:1;     /* 1 if symbol is from kernel
>> > @@ -348,7 +348,7 @@ static enum export export_from_sec(struct elf_info *elf, unsigned int sec)
>> >               return export_unknown;
>> >  }
>> >
>> > -static const char *sym_extract_namespace(const char **symname)
>> > +static char *sym_extract_namespace(const char **symname)
>> >  {
>> >       char *namespace = NULL;
>> >       char *ns_separator;
>> > @@ -373,7 +373,6 @@ static struct symbol *sym_add_exported(const char *name, const char *namespace,
>> >
>> >       if (!s) {
>> >               s = new_symbol(name, mod, export);
>> > -             s->namespace = namespace;
>> >       } else {
>> >               if (!s->preloaded) {
>> >                       warn("%s: '%s' exported twice. Previous export was in %s%s\n",
>> > @@ -384,6 +383,8 @@ static struct symbol *sym_add_exported(const char *name, const char *namespace,
>> >                       s->module = mod;
>> >               }
>> >       }
>> > +     free(s->namespace);
>> > +     s->namespace = namespace ? strdup(namespace) : NULL;
>> >       s->preloaded = 0;
>> >       s->vmlinux   = is_vmlinux(mod->name);
>> >       s->kernel    = 0;
>> > @@ -670,7 +671,8 @@ static void handle_modversions(struct module *mod, struct elf_info *info,
>> >       unsigned int crc;
>> >       enum export export;
>> >       bool is_crc = false;
>> > -     const char *name, *namespace;
>> > +     const char *name;
>> > +     char *namespace;
>> >
>> >       if ((!is_vmlinux(mod->name) || mod->is_dot_o) &&
>> >           strstarts(symname, "__ksymtab"))
>> > @@ -745,6 +747,7 @@ static void handle_modversions(struct module *mod, struct elf_info *info,
>> >                       name = symname + strlen("__ksymtab_");
>> >                       namespace = sym_extract_namespace(&name);
>> >                       sym_add_exported(name, namespace, mod, export);
>> > +                     free(namespace);
>> >               }
>> >               if (strcmp(symname, "init_module") == 0)
>> >                       mod->has_init = 1;
>> > @@ -2193,7 +2196,7 @@ static int check_exports(struct module *mod)
>> >               else
>> >                       basename = mod->name;
>> >
>> > -             if (exp->namespace) {
>> > +             if (exp->namespace && exp->namespace[0]) {
>> >                       add_namespace(&mod->required_namespaces,
>> >                                     exp->namespace);
>> >
>>
>> This looks good to me and is better than what I had originally proposed.
>> I confirmed that I can still build an external module without any
>> warnings. (But I did have to convince myself that it was OK to store
>> empty namespace strings in the symbol structure and that check_exports()
>> would cover it sufficiently)
>
>You have a point.
>
>The change to check_exports() looks strange.
>It is actually related to my previous patch submission.
>
>See this patch:
>https://lore.kernel.org/patchwork/patch/1131970/
>
>
>Currently, the NULL pointer means no namespace.
>
>I noticed passing an empty string as the namespace
>simplified <linux/export.h> a lot.
>
>So, I changed it in a way that
>an empty string also means no namespace.
>
>
>Anyway, Matthias took over the refactoring work.
>So, I am not sure if this change is still helpful...

Hm, I agree that the inconsistency (empty string vs. NULL) is a bit confusing.

I do not mind too much either way - but if we allow both NULL and the
empty string to represent "no namespace", perhaps we should at least
document this in a comment next to the namespace field in struct
symbol and also next to the check in check_exports() so that it's
clear that both can mean no namespace.

>If it is no longer useful, I am happy to send v3
>with the following:
>
>
>diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
>index 442d5e2ad688..bdd3956e89c9 100644
>--- a/scripts/mod/modpost.c
>+++ b/scripts/mod/modpost.c
>@@ -2453,6 +2453,8 @@ static void read_dump(const char *fname,
>unsigned int kernel)
>                        mod = new_module(modname);
>                        mod->skip = 1;
>                }
>+               if (namespace[0] == '\0')
>+                       namespace = NULL;
>                s = sym_add_exported(symname, namespace, mod,
>                                     export_no(export));
>                s->kernel    = kernel;
>
