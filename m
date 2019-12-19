Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E3EC125A4B
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2019 05:29:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbfLSE3Q (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Dec 2019 23:29:16 -0500
Received: from conssluserg-03.nifty.com ([210.131.2.82]:27492 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726777AbfLSE3Q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Dec 2019 23:29:16 -0500
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id xBJ4T8VN026696
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Dec 2019 13:29:09 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com xBJ4T8VN026696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1576729749;
        bh=ibC6xTpj6Nl9VBZV9Omy4mldhNI7Q7bYqqsU3dG6Kto=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ufW3XgIorVtRdiQhkNcJSUT+EnaCg4YkBk433FLtAj9LdwA6U+q8PArmhkwPG6PPZ
         ZN/KLu2vvxhXCOPXRURNAYgztUBlKkn6BIzYV6wZ1RyhCwHWV7Xdr8VIt4qZK4/9tF
         VHAXsmFC35j1vshcxDQVCVRkF0ejQ/zHqsn7E0/AgNLZ/B+OEhiN56a1WKv2P95Fk8
         kf0rnJA1XbM2bm6DRsmNzDTImelB5qhkaGF7621NNHdJtuuiE28BNapupmCA4L3xm8
         bdZHXfVGTGRECqaj+1smrjy9pnyt+iJxdLxA+jwVhkMENAseQ1KIAoLr4YL9le08qZ
         fSikMe4OW8BOQ==
X-Nifty-SrcIP: [209.85.221.176]
Received: by mail-vk1-f176.google.com with SMTP id s142so1279866vkd.9
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Dec 2019 20:29:08 -0800 (PST)
X-Gm-Message-State: APjAAAUkXdhfx12p+coU0J5n40xeCeHJCZzjahqxTzz2TgUqOq/KBCyS
        tmFbk+A8mVJVEhElimd3wgBucoYZmHSlhGhhxAM=
X-Google-Smtp-Source: APXvYqyx31DuKbwm1n96KN1X4GcukJralaHNKqBrgJiQ0WcvWEJVnROSE0WcAiPWUygluF127D8od2N326+oRfm0Q6s=
X-Received: by 2002:a1f:6344:: with SMTP id x65mr4568590vkb.26.1576729747919;
 Wed, 18 Dec 2019 20:29:07 -0800 (PST)
MIME-Version: 1.0
References: <7e0f4a74-63c5-ad62-c619-c6277c4bc791@oracle.com>
 <20191210174826.5433-1-eugene.loh@oracle.com> <2a535000-e71e-fab9-cf6a-e7e5fb8053d8@oracle.com>
 <20191218222931.76131c6a@rorschach.local.home>
In-Reply-To: <20191218222931.76131c6a@rorschach.local.home>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 19 Dec 2019 13:28:31 +0900
X-Gmail-Original-Message-ID: <CAK7LNATJZCekCoj0ruPUGRv7sH_hcJP-dFPd-3_EOR5hFNW-Xg@mail.gmail.com>
Message-ID: <CAK7LNATJZCekCoj0ruPUGRv7sH_hcJP-dFPd-3_EOR5hFNW-Xg@mail.gmail.com>
Subject: Re: [PATCH v4] kallsyms: add names of built-in modules
To:     Steven Rostedt <rostedt@goodmis.org>
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
        Nick Alcock <nick.alcock@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Dec 19, 2019 at 12:29 PM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Wed, 18 Dec 2019 15:55:18 -0800
> Eugene Loh <eugene.loh@oracle.com> wrote:
>
> > Ping.
>
> Couple of notes:
>
> 1) this affects code that doesn't really have a maintainer. I could
> take it in my tree, but I would like to have acks from other
> maintainers. Perhaps Jessica Yu (Module maintainer), and probably one
> from Linus himself.
>
> 2) Do not send new versions of a patch as a reply to the old version. I
> and many other maintainers sort our inbox by threads, and I look at the
> top of the thread for patches. That is, if there's another version of a
> patch that is a reply to a previous version, it is basically off my
> radar, unless I happen to notice it by chance (which I did with this
> email).
>
> You can send your v4 patch again, but please send it as its own thread,
> that way it will be on the radar of other maintainers. Hopefully we can
> get some acks on this as well.
>
> -- Steve


I do not like this patch.

scripts/Makefile.modbuiltin is really ugly.
It traverses all the directories once again.

This patch makes it even worse,
Kbuild would traverse the
whole directories three times.

I was thinking to remove scripts/Makefile.modbuiltin
and Kconfig's tristate.conf entirely
because it is possible to generate modules.builtin more simply.


As I said, the name of builtin module is not fixed info.
And, this makes kallsyms fat just for less important info.


Masahiro Yamada

> >

> >
> > On 12/10/2019 09:48 AM, eugene.loh@oracle.com wrote:
> > > From: Eugene Loh <eugene.loh@oracle.com>
> > >
> > > /proc/kallsyms is very useful for tracers and other tools that need
> > > to map kernel symbols to addresses.
> > >
> > > It would be useful if there were a mapping between kernel symbol and
> > > module name that only changed when the kernel source code is changed.
> > > This mapping should not vanish simply because a module becomes built
> > > into the kernel.
> > >



-- 
Best Regards
Masahiro Yamada
