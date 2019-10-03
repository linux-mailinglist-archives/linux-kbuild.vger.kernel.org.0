Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CC83CA089
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Oct 2019 16:43:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729951AbfJCOnY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 3 Oct 2019 10:43:24 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:55551 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729155AbfJCOnY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Oct 2019 10:43:24 -0400
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id x93EhHsS014114;
        Thu, 3 Oct 2019 23:43:18 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com x93EhHsS014114
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1570113798;
        bh=2uX9FlvoFv9PAGnc6PFVcvKoCZoTSdf4bfoiey6StRE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=dcF8XA3M9haOCK3uY6pF0bSoxBVx/loYgyAUsqSTUtV+TfNVwilTdhAUwyoMKTsOA
         tD+xBaz5naDOb9NiC7suV/CGB0j2oTO6O6rbOPbxh47XZllC33njUI1N/AGwIOzIYj
         AJHpHhs9no2ikf2y+rQeEtFynuU5vxy3DNRrjGThUxkaIsB9xi22/0US4tyEZaZCgn
         eSvv4gNLFXFGQuCExvVrvk7qg6pEi/XViqJXamyZ4uSxWBvXNEr+evFrJsIKm2H9ir
         6h/2JOqECObLDi2vUP7cTyCfukhFOV17hmP3qHmd3B17yBd7hsfpWlxiDKGggpXUmA
         vJgJD5wLwGBIg==
X-Nifty-SrcIP: [209.85.217.44]
Received: by mail-vs1-f44.google.com with SMTP id v10so1878530vsc.7;
        Thu, 03 Oct 2019 07:43:18 -0700 (PDT)
X-Gm-Message-State: APjAAAX8BQAqc5o/8suGQCXLveG9YWSpad6Em2UV7DFJI/J6jCYhfhtB
        2DvCI0VjhIma4FUWq+LnY0UI4LGL8JU0BTVl++c=
X-Google-Smtp-Source: APXvYqyqbyGMQmaaqfexFnp1PibqhG2j4kWGQ32Ys9W2cguM53ljPGnfB//Kh1oVnAcwMzwbUiJnZlOb8rqT48gnsFw=
X-Received: by 2002:a67:1e87:: with SMTP id e129mr5458987vse.179.1570113797118;
 Thu, 03 Oct 2019 07:43:17 -0700 (PDT)
MIME-Version: 1.0
References: <20191003075826.7478-1-yamada.masahiro@socionext.com>
 <20191003075826.7478-3-yamada.masahiro@socionext.com> <20191003062927.4pusu3sfjyfayigy@sruffell.net>
In-Reply-To: <20191003062927.4pusu3sfjyfayigy@sruffell.net>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Thu, 3 Oct 2019 23:42:40 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQqAsLPjoptMa52jNsDaogwbcQQHe+PvArarG6k+2oNRw@mail.gmail.com>
Message-ID: <CAK7LNAQqAsLPjoptMa52jNsDaogwbcQQHe+PvArarG6k+2oNRw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] modpost: fix broken sym->namespace for external
 module builds
To:     Shaun Ruffell <sruffell@sruffell.net>
Cc:     Jessica Yu <jeyu@kernel.org>,
        Matthias Maennich <maennich@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Shaun,

On Thu, Oct 3, 2019 at 10:29 PM Shaun Ruffell <sruffell@sruffell.net> wrote:
>
> On Thu, Oct 03, 2019 at 04:58:22PM +0900, Masahiro Yamada wrote:
> > Currently, external module builds produce tons of false-positives:
> >
> >   WARNING: module <mod> uses symbol <sym> from namespace <ns>, but does not import it.
> >
> > Here, the <ns> part shows a random string.
> >
> > When you build external modules, the symbol info of vmlinux and
> > in-kernel modules are read from $(objtree)/Module.symvers, but
> > read_dump() is buggy in multiple ways:
> >
> > [1] When the modpost is run for vmlinux and in-kernel modules,
> > sym_extract_namespace() allocates memory for the namespace. On the
> > other hand, read_dump() does not, then sym->namespace will point to
> > somewhere in the line buffer of get_next_line(). The data in the
> > buffer will be replaced soon, and sym->namespace will end up with
> > pointing to unrelated data. As a result, check_exports() will show
> > random strings in the warning messages.
> >
> > [2] When there is no namespace, sym_extract_namespace() returns NULL.
> > On the other hand, read_dump() sets namespace to an empty string "".
> > (but, it will be later replaced with unrelated data due to bug [1].)
> > The check_exports() shows a warning unless exp->namespace is NULL,
> > so every symbol read from read_dump() emits the warning, which is
> > mostly false positive.
> >
> > To address [1], sym_add_exported() calls strdup() for s->namespace.
> > The namespace from sym_extract_namespace() must be freed to avoid
> > memory leak.
> >
> > For [2], I changed the if-conditional in check_exports().
> >
> > This commit also fixes sym_add_exported() to set s->namespace correctly
> > when the symbol is preloaded.
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > Reviewed-by: Matthias Maennich <maennich@google.com>
> > ---
> >
> > Changes in v2:
> >   - Change the approach to deal with ->preloaded
> >
> >  scripts/mod/modpost.c | 13 ++++++++-----
> >  1 file changed, 8 insertions(+), 5 deletions(-)
> >
> > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> > index 2c644086c412..936d3ad23c83 100644
> > --- a/scripts/mod/modpost.c
> > +++ b/scripts/mod/modpost.c
> > @@ -166,7 +166,7 @@ struct symbol {
> >       struct module *module;
> >       unsigned int crc;
> >       int crc_valid;
> > -     const char *namespace;
> > +     char *namespace;
> >       unsigned int weak:1;
> >       unsigned int vmlinux:1;    /* 1 if symbol is defined in vmlinux */
> >       unsigned int kernel:1;     /* 1 if symbol is from kernel
> > @@ -348,7 +348,7 @@ static enum export export_from_sec(struct elf_info *elf, unsigned int sec)
> >               return export_unknown;
> >  }
> >
> > -static const char *sym_extract_namespace(const char **symname)
> > +static char *sym_extract_namespace(const char **symname)
> >  {
> >       char *namespace = NULL;
> >       char *ns_separator;
> > @@ -373,7 +373,6 @@ static struct symbol *sym_add_exported(const char *name, const char *namespace,
> >
> >       if (!s) {
> >               s = new_symbol(name, mod, export);
> > -             s->namespace = namespace;
> >       } else {
> >               if (!s->preloaded) {
> >                       warn("%s: '%s' exported twice. Previous export was in %s%s\n",
> > @@ -384,6 +383,8 @@ static struct symbol *sym_add_exported(const char *name, const char *namespace,
> >                       s->module = mod;
> >               }
> >       }
> > +     free(s->namespace);
> > +     s->namespace = namespace ? strdup(namespace) : NULL;
> >       s->preloaded = 0;
> >       s->vmlinux   = is_vmlinux(mod->name);
> >       s->kernel    = 0;
> > @@ -670,7 +671,8 @@ static void handle_modversions(struct module *mod, struct elf_info *info,
> >       unsigned int crc;
> >       enum export export;
> >       bool is_crc = false;
> > -     const char *name, *namespace;
> > +     const char *name;
> > +     char *namespace;
> >
> >       if ((!is_vmlinux(mod->name) || mod->is_dot_o) &&
> >           strstarts(symname, "__ksymtab"))
> > @@ -745,6 +747,7 @@ static void handle_modversions(struct module *mod, struct elf_info *info,
> >                       name = symname + strlen("__ksymtab_");
> >                       namespace = sym_extract_namespace(&name);
> >                       sym_add_exported(name, namespace, mod, export);
> > +                     free(namespace);
> >               }
> >               if (strcmp(symname, "init_module") == 0)
> >                       mod->has_init = 1;
> > @@ -2193,7 +2196,7 @@ static int check_exports(struct module *mod)
> >               else
> >                       basename = mod->name;
> >
> > -             if (exp->namespace) {
> > +             if (exp->namespace && exp->namespace[0]) {
> >                       add_namespace(&mod->required_namespaces,
> >                                     exp->namespace);
> >
>
> This looks good to me and is better than what I had originally proposed.
> I confirmed that I can still build an external module without any
> warnings. (But I did have to convince myself that it was OK to store
> empty namespace strings in the symbol structure and that check_exports()
> would cover it sufficiently)

You have a point.

The change to check_exports() looks strange.
It is actually related to my previous patch submission.

See this patch:
https://lore.kernel.org/patchwork/patch/1131970/


Currently, the NULL pointer means no namespace.

I noticed passing an empty string as the namespace
simplified <linux/export.h> a lot.

So, I changed it in a way that
an empty string also means no namespace.


Anyway, Matthias took over the refactoring work.
So, I am not sure if this change is still helpful...


If it is no longer useful, I am happy to send v3
with the following:


diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 442d5e2ad688..bdd3956e89c9 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2453,6 +2453,8 @@ static void read_dump(const char *fname,
unsigned int kernel)
                        mod = new_module(modname);
                        mod->skip = 1;
                }
+               if (namespace[0] == '\0')
+                       namespace = NULL;
                s = sym_add_exported(symname, namespace, mod,
                                     export_no(export));
                s->kernel    = kernel;




-- 
Best Regards
Masahiro Yamada
