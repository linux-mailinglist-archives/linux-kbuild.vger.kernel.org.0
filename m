Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D0907AFB5
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2019 19:22:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728495AbfG3RWh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 30 Jul 2019 13:22:37 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:36781 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727532AbfG3RWh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jul 2019 13:22:37 -0400
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id x6UHMNKY020045;
        Wed, 31 Jul 2019 02:22:24 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x6UHMNKY020045
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1564507344;
        bh=Vqhm/EITINFOuWf1dLL2W5rIciZKR5IQ8djNbAIk8l8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Pl2jE7GBagAabKrLbkzMbY+ibYE8KzcXaQCbgrTVOGPadBcYxVRWeiIdEpNBqIZkY
         ++JX/YvtutxD+ZajE6BFbS8+UQWPF3TGIOtXo06hJDAGtGKt4Hsm1stRmNFMeRMspt
         V3vRpB+trdLqZuRh4ld+3BzztEFD+vWGFAEPx0zkm9c6vICZyx2JplO3zJ2v8o24Zj
         D3ey0N+/nH9ddHSlOXNMcKTKYLhFVJvrVrkSrt/sjFFo26scD7tG8QaZboa88lR0X3
         g2uskjOLXlkzzrA+Fkty0aITU5/0BIr1JbfYSx0Ko/g4xV1DqwQYEQmfnkh1cKILeJ
         ETqVKnZnnMj/g==
X-Nifty-SrcIP: [209.85.222.52]
Received: by mail-ua1-f52.google.com with SMTP id 34so25763419uar.8;
        Tue, 30 Jul 2019 10:22:24 -0700 (PDT)
X-Gm-Message-State: APjAAAU/42OeKrPpC4Q4JmHGr+8KfE17eqJORwQyTYnDRbDLMUdCHkZI
        E75Xzt+QmhSWFeb032VhEKv8AJgMMD5nHMW+wWQ=
X-Google-Smtp-Source: APXvYqy3BGApNcu5ckFZltFKmZUze8O4volLhzlTwrlr0H/D33JjuC1fK2GvMgHbwxT15AYYt6MdKJvik497vfe6C0Y=
X-Received: by 2002:a9f:2265:: with SMTP id 92mr59702366uad.121.1564507342867;
 Tue, 30 Jul 2019 10:22:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190714152817.24693-1-efremov@linux.com> <20190729141801.31333-1-efremov@linux.com>
 <20190730082618.5bb5edf3@canb.auug.org.au> <1b6f749c-2a25-219a-3eb3-0f2c7a542426@linux.com>
 <CAK7LNATnC6eVmahn=44F-j3Uf-x+cUWuP0q7QuP800biL9QJiA@mail.gmail.com> <d26ff0d1-fc45-d5b5-fe84-26fa9df09c3e@linux.com>
In-Reply-To: <d26ff0d1-fc45-d5b5-fe84-26fa9df09c3e@linux.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Wed, 31 Jul 2019 02:21:46 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS8fkV5b+Sk+_W_C97xe3GCK-JysYSGuhB9t35yoAuCzg@mail.gmail.com>
Message-ID: <CAK7LNAS8fkV5b+Sk+_W_C97xe3GCK-JysYSGuhB9t35yoAuCzg@mail.gmail.com>
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

On Wed, Jul 31, 2019 at 1:44 AM Denis Efremov <efremov@linux.com> wrote:
>
> On 30.07.2019 19:29, Masahiro Yamada wrote:
> > I prefer this, but why do you need to check type?
> >
> > Doesn't this work?
> >
> > for (sym = info.symtab_start; sym < info.symtab_stop; sym++) {
> >          unsigned char bind = ELF_ST_BIND(sym->st_info);
> >
> >          struct symbol *s = find_symbol(remove_dot(info.strtab +
> >                                                    sym->st_name));
> >
> >          if (s && (bind == STB_GLOBAL || bind == STB_WEAK))
> >                  s->is_static = 0;
> > }
>
> This works. However, I thought it will be too costly to call find_symbol
> on each symbol. Hence, 'type == STT_OBJECT || type == STT_FUNC || type
> == STT_NOTYPE' is a small performance optimization because we need to
> check only variables and functions. Is it worth to remove it in v4?
>
> Denis


I checked the symbol table for ppc64_defconfig.

The following is the number of entries
for each combination of type and bind.

[1]  type: STT_NOTYPE,  bind: STB_LOCAL   -> 39502 entries
[2]  type: STT_NOTYPE,  bind: STB_GLOBAL  -> 30161 entries
[3]  type: STT_NOTYPE,  bind: STB_WEAK    -> 5 entries
[4]  type: STT_OBJECT,  bind: STB_LOCAL   -> 60326 entries
[5]  type: STT_OBJECT,  bind: STB_GLOBAL  -> 4126 entries
[6]  type: STT_OBJECT,  bind: STB_WEAK    -> 11 entries
[7]  type: STT_FUNC,    bind: STB_LOCAL   -> 38816 entries
[8]  type: STT_FUNC,    bind: STB_GLOBAL  -> 56196 entries
[9]  type: STT_FUNC,    bind: STB_WEAK    -> 350 entries
[10] type: STT_SECTION, bind: STB_LOCAL   -> 9027 entries
[11] type: STT_FILE,    bind: STB_LOCAL   -> 2918 entries

Checking 'type' beforehand
saves only 11945 look-ups ( [10] + [11]).

You can check 'bind' before the look-up, not after.
If bind == STB_LOCAL, you do not need to lookup the hash-table,
since you do not do anything.
This saves [1], [4], [7], [10], [11].


I think the following is simpler, and works more efficiently.

for (sym = info.symtab_start; sym < info.symtab_stop; sym++) {
        unsigned char bind = ELF_ST_BIND(sym->st_info);

        if (bind == STB_GLOBAL || bind == STB_WEAK) {
                  struct symbol *s =
                               find_symbol(remove_dot(info.strtab +
                                                      sym->st_name));

                  if (s)
                            s->is_static = 0;
         }
}



-- 
Best Regards
Masahiro Yamada
