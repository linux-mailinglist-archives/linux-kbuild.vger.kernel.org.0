Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A92214238F
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Jan 2020 07:38:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725783AbgATGiw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 20 Jan 2020 01:38:52 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:60237 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbgATGiw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Jan 2020 01:38:52 -0500
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 00K6cXOb007492
        for <linux-kbuild@vger.kernel.org>; Mon, 20 Jan 2020 15:38:34 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 00K6cXOb007492
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1579502314;
        bh=msgHjgM1b6xOozKhqyTjl7p7S/FxV6O9V8BpnYfW+nc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=u/NSmSQnMDjgzt56354WPBlf+dJxv97D2rRD2BaqEP8buDFM85m/x+08wzf2Qu/mu
         DL1DV3+Jmg/fetMzTwvmOkju+a+zjMIwhGbbzI4mNeQ7aeq4U1/YMNsuyznKsdO1q6
         UHX2ciLroMb1eaxIX3zxxCKEcA1dZdj6ewoOQvvsvnPj7HcW5Z7CXedzid/OW62/Kr
         x186dfnoXgdAih3OLMiCwkn9z1A//6eZT+YazMyPAMwP7vIii/ZMH4+Z3kIGmThZ54
         fgHgAXdKgC1/Rk1yjRTCHJepyGnWtvVIRqTSCdbFlgqG6iTp8VPl0ZgAJwnzAKIl5d
         SIUjU4EDG7IVQ==
X-Nifty-SrcIP: [209.85.222.54]
Received: by mail-ua1-f54.google.com with SMTP id y3so11107702uae.3
        for <linux-kbuild@vger.kernel.org>; Sun, 19 Jan 2020 22:38:34 -0800 (PST)
X-Gm-Message-State: APjAAAWphpIOEDI0Thm/Cl74k1oa8zbHJX18lmJcXiWBXNf1YFBWofj/
        4wTOtOCu54gsoQ0/FZlKqUxL+XaTa5nE60XNoAs=
X-Google-Smtp-Source: APXvYqxOVdWQlS+I/O2zIgPaSZfB+h+KovETdZvpN8JJk41fvxPe7cDJFrmJdssosDw2FbRPcyGW//7ttKSaEHL0ZQY=
X-Received: by 2002:ab0:6509:: with SMTP id w9mr27709525uam.121.1579502313136;
 Sun, 19 Jan 2020 22:38:33 -0800 (PST)
MIME-Version: 1.0
References: <7e0f4a74-63c5-ad62-c619-c6277c4bc791@oracle.com>
 <20191210174826.5433-1-eugene.loh@oracle.com> <2a535000-e71e-fab9-cf6a-e7e5fb8053d8@oracle.com>
 <20191218222931.76131c6a@rorschach.local.home> <CAK7LNATJZCekCoj0ruPUGRv7sH_hcJP-dFPd-3_EOR5hFNW-Xg@mail.gmail.com>
 <aa165beb-a92c-c3b9-d57a-4046ba91f677@oracle.com>
In-Reply-To: <aa165beb-a92c-c3b9-d57a-4046ba91f677@oracle.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 20 Jan 2020 15:37:56 +0900
X-Gmail-Original-Message-ID: <CAK7LNATnYNpNXYF+Ttv9y6AcE85f1uN2USrR0+FnUffp40MKkw@mail.gmail.com>
Message-ID: <CAK7LNATnYNpNXYF+Ttv9y6AcE85f1uN2USrR0+FnUffp40MKkw@mail.gmail.com>
Subject: Re: [PATCH v4] kallsyms: add names of built-in modules
To:     Eugene Loh <eugene.loh@oracle.com>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
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

Hi Eugene,

On Thu, Jan 9, 2020 at 3:32 AM Eugene Loh <eugene.loh@oracle.com> wrote:
>
> On 12/18/2019 08:28 PM, Masahiro Yamada wrote:
>
> > On Thu, Dec 19, 2019 at 12:29 PM Steven Rostedt <rostedt@goodmis.org> wrote:
> >> Couple of notes:
> >> 1) this affects code that doesn't really have a maintainer. I could
> >> take it in my tree, but I would like to have acks from other
> >> maintainers. Perhaps Jessica Yu (Module maintainer), and probably one
> >> from Linus himself.
> >>
> >> 2) Do not send new versions of a patch as a reply to the old version. I
> >> and many other maintainers sort our inbox by threads, and I look at the
> >> top of the thread for patches. That is, if there's another version of a
> >> patch that is a reply to a previous version, it is basically off my
> >> radar, unless I happen to notice it by chance (which I did with this
> >> email).
> >>
> >> You can send your v4 patch again, but please send it as its own thread,
> >> that way it will be on the radar of other maintainers. Hopefully we can
> >> get some acks on this as well.
>
> Sorry.  I misunderstood some process doc.  But before I resend...
>
> > I do not like this patch.
> >
> > scripts/Makefile.modbuiltin is really ugly.
> > It traverses all the directories once again.
> >
> > This patch makes it even worse,
> > Kbuild would traverse the
> > whole directories three times.
> >
> > I was thinking to remove scripts/Makefile.modbuiltin
> > and Kconfig's tristate.conf entirely
> > because it is possible to generate modules.builtin more simply.
>
> Sorry about the delayed response, due in part to holidays.  Thank you
> for your on-going review and the pointer to
> https://lore.kernel.org/patchwork/project/lkml/list/?series=423205
>
> I agree your proposed patch simplifies some build code, but this is
> long-standing code.  Also, the build time -- either that would be saved
> by your patch or that would be incurred by a third traversal -- is
> miniscule.
>
> Further, I do not see how to add object-to-module information to your
> proposed scheme.  Can you suggest something?  If not, then it seems the
> proposed code simplification is limiting functionality.


The object-to-module information can be retrieved by a similar
way as I did in
https://lore.kernel.org/patchwork/project/lkml/list/?series=423205

But, even if modules_think.builtin is produced in a new way,
there would make no difference in the fact that
the build system needs to generate modules_think.builtin and
.tmp_vmlinux.range, and kallsyms must integrate a big
parser of them.

So, I think this patch lacks the taste as overall.


>
> > As I said, the name of builtin module is not fixed info.
> > And, this makes kallsyms fat just for less important info.
>
> The name of the builtin module can be ambiguous in some cases, but in
> most cases it is not.  Indeed, the extra information is typically
> useful, and comments from, e.g., Linus and Steve were positive about
> adding that information to kallsyms.  Further, we have even heard
> favorable feedback for adding such built-in-module information to
> available_filter_functions as well.

In my opinion, this should be determined by the balance
between the added value and the ugliness of the code.

(Real) module names are obvious, but as I stated,
built-in module names are somewhat subtle, so I do not
like to extend it too much.

Perhaps, I was the only person who reviewed the code in detail.
After looking at how this feature is integrated,
I do not believe this should go in. Sorry.

Masahiro Yamada


>
> >>> On 12/10/2019 09:48 AM, eugene.loh@oracle.com wrote:
> >>>> From: Eugene Loh <eugene.loh@oracle.com>
> >>>>
> >>>> /proc/kallsyms is very useful for tracers and other tools that need
> >>>> to map kernel symbols to addresses.
> >>>>
> >>>> It would be useful if there were a mapping between kernel symbol and
> >>>> module name that only changed when the kernel source code is changed.
> >>>> This mapping should not vanish simply because a module becomes built
> >>>> into the kernel.



-- 
Best Regards
Masahiro Yamada
