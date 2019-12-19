Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE6F8125EC4
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2019 11:22:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726656AbfLSKWs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 19 Dec 2019 05:22:48 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:23534 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726636AbfLSKWr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 19 Dec 2019 05:22:47 -0500
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id xBJAMbgO005908
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Dec 2019 19:22:38 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com xBJAMbgO005908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1576750958;
        bh=lcfQLiyfrWhUgt2h6E2DAdopwz5Jk3IYzKOWCEPlscs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=OQqX5yH5R0ezgrEynlrPxPbb201MDX31yr2cMYeg6mEgJnVaLCNvCbkDAOrSOtPrh
         fGKNuBCI9EuNVsWSdXnQRdfNjpLCxQNrGFPh4gKeAFKOYvr2yibU3gIBw/WL2kPFnq
         zMPLH3SNQMPanJwjFfsRM/OX370f6bqT0/R/1VJQdUidZOK5UQIcMkWBbacmlvjULZ
         f0wJUqizcfgS3aeOAltFv8J15f9a9jnlB1vMnFBRWnW1NqbCHUeLvQEIMqbfxe0SIx
         LzBOTOD3udHTBpDGFViAeboB0rjBInPCVGnyoMj3AVR7P+bImLLhbjXEJcngcoFQsf
         gYxvVj+Umm3Jw==
X-Nifty-SrcIP: [209.85.217.52]
Received: by mail-vs1-f52.google.com with SMTP id t12so3414125vso.13
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Dec 2019 02:22:37 -0800 (PST)
X-Gm-Message-State: APjAAAV8KhbMsdui9RTr4uXUl+FnabIX3q+xQEqOHixwS2qdpfNOT9fS
        qWn2E8OVk7V58Bu0Ycp61UlEgxBu1JqeFCeSoFI=
X-Google-Smtp-Source: APXvYqwHGmF7K1VyZmZfKHBFDkyXWt8qH21GMQNnOU/zLto4XvqtGFi1tWiMos12dutyHv9zJTJu+RkaJ3uizIEY3VE=
X-Received: by 2002:a05:6102:3102:: with SMTP id e2mr4587969vsh.179.1576750956854;
 Thu, 19 Dec 2019 02:22:36 -0800 (PST)
MIME-Version: 1.0
References: <7e0f4a74-63c5-ad62-c619-c6277c4bc791@oracle.com>
 <20191210174826.5433-1-eugene.loh@oracle.com> <2a535000-e71e-fab9-cf6a-e7e5fb8053d8@oracle.com>
 <20191218222931.76131c6a@rorschach.local.home> <CAK7LNATJZCekCoj0ruPUGRv7sH_hcJP-dFPd-3_EOR5hFNW-Xg@mail.gmail.com>
In-Reply-To: <CAK7LNATJZCekCoj0ruPUGRv7sH_hcJP-dFPd-3_EOR5hFNW-Xg@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 19 Dec 2019 19:22:00 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ3ojOWTRXQBvkcuPmuJccZZ=a24eWxa5-0efQVXU8Sug@mail.gmail.com>
Message-ID: <CAK7LNAQ3ojOWTRXQBvkcuPmuJccZZ=a24eWxa5-0efQVXU8Sug@mail.gmail.com>
Subject: Re: [PATCH v4] kallsyms: add names of built-in modules
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Eugene Loh <eugene.loh@oracle.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        Jessica Yu <jeyu@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        Song Liu <songliubraving@fb.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Keller, Jacob E" <jacob.e.keller@intel.com>,
        Kris Van Hees <kris.van.hees@oracle.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Nick Alcock <nick.alcock@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Dec 19, 2019 at 1:28 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Thu, Dec 19, 2019 at 12:29 PM Steven Rostedt <rostedt@goodmis.org> wrote:
> >
> > On Wed, 18 Dec 2019 15:55:18 -0800
> > Eugene Loh <eugene.loh@oracle.com> wrote:
> >
> > > Ping.
> >
> > Couple of notes:
> >
> > 1) this affects code that doesn't really have a maintainer. I could
> > take it in my tree, but I would like to have acks from other
> > maintainers. Perhaps Jessica Yu (Module maintainer), and probably one
> > from Linus himself.
> >
> > 2) Do not send new versions of a patch as a reply to the old version. I
> > and many other maintainers sort our inbox by threads, and I look at the
> > top of the thread for patches. That is, if there's another version of a
> > patch that is a reply to a previous version, it is basically off my
> > radar, unless I happen to notice it by chance (which I did with this
> > email).
> >
> > You can send your v4 patch again, but please send it as its own thread,
> > that way it will be on the radar of other maintainers. Hopefully we can
> > get some acks on this as well.
> >
> > -- Steve
>
>
> I do not like this patch.
>
> scripts/Makefile.modbuiltin is really ugly.
> It traverses all the directories once again.
>
> This patch makes it even worse,
> Kbuild would traverse the
> whole directories three times.
>
> I was thinking to remove scripts/Makefile.modbuiltin
> and Kconfig's tristate.conf entirely
> because it is possible to generate modules.builtin more simply.

FYI: This is the idea I had in my mind:
https://lore.kernel.org/patchwork/project/lkml/list/?series=423205



--
Best Regards
Masahiro Yamada
