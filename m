Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 204C87AD8A
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2019 18:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727381AbfG3QaV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 30 Jul 2019 12:30:21 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:39695 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725889AbfG3QaV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jul 2019 12:30:21 -0400
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id x6UGU4IO020919;
        Wed, 31 Jul 2019 01:30:04 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com x6UGU4IO020919
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1564504205;
        bh=deEeiknpVEJHhu6POdmodbTCpbJqhNZXh+u7IBm1me8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=CMJOvTwdI+WZmQ0j1Lr8co4V99LWTLSfKq10KH0QvsrQdeEmyYlcguVLC96J3hwJG
         fWSCpFYQtlsAWVSfWa2bPFe8y2D45b0iqpT5IThac5R96/ymjyO2lgAmuh8mU8OTOz
         +Evp/SC2jl39Ob50nLQN28Fg+bjh7zQH3tv5OBskxFar9od6kUj5RC8KlCAqXHq/gM
         VA+yP8ia/01lROlxxqFFejrHRwrCzHJLjL3IMpqtRF3NyUsGWkn/atgouyKpXn5usF
         sKAP2oLfiE7iIRcjgA52wSqUDQuYq5Tj3tHOUT3CtqIRYYqQQtaw3+YQN42j/UP/Ad
         Cx47djzPy6PKA==
X-Nifty-SrcIP: [209.85.217.45]
Received: by mail-vs1-f45.google.com with SMTP id m8so43989493vsj.0;
        Tue, 30 Jul 2019 09:30:04 -0700 (PDT)
X-Gm-Message-State: APjAAAXgAenOGGCtzWXZBXBr6s5SHTg2xHXtuGKOnbtF12YJB2VCyj5Z
        9U+Ihe3hR97pxwSlCauSmVuS7q6G8LZ+ja0Qs+U=
X-Google-Smtp-Source: APXvYqzsLAzQi8QjYxsC9kzAbo65xczrjMlJAwBpr3yC2oxpGh3Zay09658qMGYvyb6AXEAG0peXUQasA+Rkj+7zfrk=
X-Received: by 2002:a67:8e0a:: with SMTP id q10mr49990008vsd.215.1564504203698;
 Tue, 30 Jul 2019 09:30:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190714152817.24693-1-efremov@linux.com> <20190729141801.31333-1-efremov@linux.com>
 <20190730082618.5bb5edf3@canb.auug.org.au> <1b6f749c-2a25-219a-3eb3-0f2c7a542426@linux.com>
In-Reply-To: <1b6f749c-2a25-219a-3eb3-0f2c7a542426@linux.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Wed, 31 Jul 2019 01:29:27 +0900
X-Gmail-Original-Message-ID: <CAK7LNATnC6eVmahn=44F-j3Uf-x+cUWuP0q7QuP800biL9QJiA@mail.gmail.com>
Message-ID: <CAK7LNATnC6eVmahn=44F-j3Uf-x+cUWuP0q7QuP800biL9QJiA@mail.gmail.com>
Subject: Re: [PATCH v3] modpost: check for static EXPORT_SYMBOL* functions
To:     Denis Efremov <efremov@linux.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Michal Marek <michal.lkml@markovi.net>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jul 30, 2019 at 4:00 PM Denis Efremov <efremov@linux.com> wrote:
>
> On 30.07.2019 01:26, Stephen Rothwell wrote:
> > Hi Denis,
> >
> > On Mon, 29 Jul 2019 17:18:01 +0300 Denis Efremov <efremov@linux.com> wrote:
> >>
> >> This patch adds a check to warn about static EXPORT_SYMBOL* functions
> >> during the modpost. In most of the cases, a static symbol marked for
> >> exporting is an odd combination that should be fixed either by deleting
> >> the exporting mark or by removing the static attribute and adding the
> >> appropriate declaration to headers.
> >
> > OK, this is now in linux-next and I am getting what look like false
> > positives :-(
> >
> > My powerpc builds produce these:
> >
> > WARNING: "ahci_em_messages" [vmlinux] is the static EXPORT_SYMBOL_GPL
> > WARNING: "ftrace_set_clr_event" [vmlinux] is the static EXPORT_SYMBOL_GPL
> > WARNING: "empty_zero_page" [vmlinux] is the static EXPORT_SYMBOL
> > WARNING: "jiffies" [vmlinux] is the static EXPORT_SYMBOL
> >
> > empty_zero_page (at least) is not static.  It is defined in assembler ...
>
> This could be fixed either by adding the type, for example:
> --- a/arch/x86/kernel/head_64.S
> +++ b/arch/x86/kernel/head_64.S
> @@ -478,6 +478,7 @@ EXPORT_SYMBOL(phys_base)
>
>          __PAGE_ALIGNED_BSS
>   NEXT_PAGE(empty_zero_page)
> +.type empty_zero_page, STT_OBJECT
>          .skip PAGE_SIZE
>   EXPORT_SYMBOL(empty_zero_page)

This would require us to fix-up
all assembly files, wouldn't it?


> Or by updating the check in the patch:
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1988,7 +1988,9 @@ static void read_symbols(const char *modname)
>                  unsigned char bind = ELF_ST_BIND(sym->st_info);
>                  unsigned char type = ELF_ST_TYPE(sym->st_info);
>
> -               if (type == STT_OBJECT || type == STT_FUNC) {
> +               if (type == STT_OBJECT ||
> +                   type == STT_FUNC ||
> +                   type == STT_NOTYPE) {
>
> Do I need to resend the whole patch or create new "patch-on-patch"?

I prefer this, but why do you need to check type?

Doesn't this work?

for (sym = info.symtab_start; sym < info.symtab_stop; sym++) {
        unsigned char bind = ELF_ST_BIND(sym->st_info);

        struct symbol *s = find_symbol(remove_dot(info.strtab +
                                                  sym->st_name));

        if (s && (bind == STB_GLOBAL || bind == STB_WEAK))
                s->is_static = 0;
}




-- 
Best Regards
Masahiro Yamada
