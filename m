Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21A8D30F4FC
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Feb 2021 15:31:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236714AbhBDObR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 4 Feb 2021 09:31:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:36710 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236606AbhBDO0V (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Feb 2021 09:26:21 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2050F64F51;
        Thu,  4 Feb 2021 14:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612448737;
        bh=Gr4b/J785GlPvzDdYWqYJ53aK/gX7CDc6tMbxuNI4LY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=N+FbCqoimT9jtDMtjua4RPdqP0nWGCIuu7oOg8Bg8hwORSJ9qJLEZpcoWxyGkr0Ui
         tfi0B/xDWHGFkGEZES4uK+GyTQCGPyDEgf6VpsINGQyQOLEDXF0TgTaTRPWVS8g9d/
         R8eNIvxR4e/kUNcpL7+nILOp9OKSlh9Sai3AbRN7/xrsidExk34/cAGcBMS0LSXOOZ
         /Vj2D1KXMKbwNtVpiIpILqdCIyHu5vKH0Gw9xOlMKvHlJMtwZysuh+bfxtXGVWjWBI
         9BrdmM44NY8WdIJ61kZ41RLhdLziq3gi2wW/Q+AIxqG+oNLEDhaZDp6rmaPWT2V6Ju
         iYzfwu0vru/mg==
Received: by mail-ej1-f51.google.com with SMTP id b9so5515916ejy.12;
        Thu, 04 Feb 2021 06:25:37 -0800 (PST)
X-Gm-Message-State: AOAM531ZTUL6YTcJ4V8Gh2dOiBm8NTgkMtE3PGYvb8jJ+HoRVtQpZYnD
        a+p7aJMlmjVojsB4tmlPujSnvri4Z7SYlm9YPQ==
X-Google-Smtp-Source: ABdhPJw0ZvhHzSy2d7rADwFFVVYmHHpeI+dqVFEn7EHEW7VDQrK6kxdxSd1A1FMKHqv9FS3gOGNpvzuHIo2PPfq1Vew=
X-Received: by 2002:a17:906:25c4:: with SMTP id n4mr8217803ejb.359.1612448735635;
 Thu, 04 Feb 2021 06:25:35 -0800 (PST)
MIME-Version: 1.0
References: <cover.1610431620.git.viresh.kumar@linaro.org> <74f8aa8f-ffab-3b0f-186f-31fb7395ebbb@gmail.com>
 <20210120051740.yph4v7zldvs7szdz@vireshk-i7> <20210122063455.GE4400@yekko.fritz.box>
 <83242f56-19a5-6d32-c050-8d9f63ac1e47@gmail.com> <20210201040748.GB2251@yekko.fritz.box>
In-Reply-To: <20210201040748.GB2251@yekko.fritz.box>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 4 Feb 2021 08:25:23 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJjR7EknfnbA7RKckUtYVu9jmjf7L_DC=LmF=jMGfThgQ@mail.gmail.com>
Message-ID: <CAL_JsqJjR7EknfnbA7RKckUtYVu9jmjf7L_DC=LmF=jMGfThgQ@mail.gmail.com>
Subject: Re: [PATCH V4 0/3] scripts: dtc: Build fdtoverlay
To:     David Gibson <david@gibson.dropbear.id.au>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Anmar Oueja <anmar.oueja@linaro.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Jan 31, 2021 at 10:39 PM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> On Mon, Jan 25, 2021 at 09:42:21PM -0600, Frank Rowand wrote:
> > Hi David,
> >
> > On 1/22/21 12:34 AM, David Gibson wrote:
> > > On Wed, Jan 20, 2021 at 10:47:40AM +0530, Viresh Kumar wrote:
> > >> +David.
> > >>
> > >> On 19-01-21, 11:12, Frank Rowand wrote:
> > >>> On 1/12/21 2:28 AM, Viresh Kumar wrote:
> > >>>> We will start building overlays for platforms soon in the kernel and
> > >>>> would need fdtoverlay tool going forward. Lets start fetching and
> > >>>> building it.
> > >>>>
> > >>>> While at it, also remove fdtdump.c file, which isn't used by the kernel.
> > >>>>
> > >>>> V4:
> > >>>> - Don't fetch and build fdtdump.c
> > >>>> - Remove fdtdump.c
> > >>>>
> > >>>> Viresh Kumar (3):
> > >>>>   scripts: dtc: Add fdtoverlay.c to DTC_SOURCE
> > >>>>   scripts: dtc: Build fdtoverlay tool
> > >>>>   scripts: dtc: Remove the unused fdtdump.c file
> > >>>>
> > >>>>  scripts/dtc/Makefile             |   6 +-
> > >>>>  scripts/dtc/fdtdump.c            | 163 -------------------------------
> > >>>>  scripts/dtc/update-dtc-source.sh |   6 +-
> > >>>>  3 files changed, 8 insertions(+), 167 deletions(-)
> > >>>>  delete mode 100644 scripts/dtc/fdtdump.c
> > >>>>
> > >>>
> > >>> My first inclination was to accept fdtoverlay, as is, from the upstream
> > >>> project.
> > >>>
> > >>> But my experiences debugging use of fdtoverlay against the existing
> > >>> unittest overlay files has me very wary of accepting fdtoverlay in
> > >>> it's current form.
> > >>>
> > >>> As an exmple, adding an overlay that fails to reply results in the
> > >>> following build messages:
> > >>>
> > >>>    linux--5.11-rc> make zImage
> > >>>    make[1]: Entering directory '/local/frowand_nobackup/src/git_linus/build/dragon_linus_5.11-rc'
> > >>>      GEN     Makefile
> > >>>      CALL    /local/frowand_nobackup/src/git_linus/linux--5.11-rc/scripts/checksyscalls.sh
> > >>>      CALL    /local/frowand_nobackup/src/git_linus/linux--5.11-rc/scripts/atomic/check-atomics.sh
> > >>>      CHK     include/generated/compile.h
> > >>>      FDTOVERLAY drivers/of/unittest-data/static_test.dtb
> > >>>
> > >>>    Failed to apply 'drivers/of/unittest-data/overlay.dtb': FDT_ERR_NOTFOUND
> > >>>    make[4]: *** [/local/frowand_nobackup/src/git_linus/linux--5.11-rc/drivers/of/unittest-data/Makefile:96: drivers/of/unittest-data/static_test.dtb] Error 1
> > >>>    make[3]: *** [/local/frowand_nobackup/src/git_linus/linux--5.11-rc/scripts/Makefile.build:496: drivers/of/unittest-data] Error 2
> > >>>    make[2]: *** [/local/frowand_nobackup/src/git_linus/linux--5.11-rc/scripts/Makefile.build:496: drivers/of] Error 2
> > >>>    make[1]: *** [/local/frowand_nobackup/src/git_linus/linux--5.11-rc/Makefile:1805: drivers] Error 2
> > >>>    make[1]: Leaving directory '/local/frowand_nobackup/src/git_linus/build/dragon_linus_5.11-rc'
> > >>>    make: *** [Makefile:185: __sub-make] Error 2
> > >>>
> > >>>
> > >>> The specific error message (copied from above) is:
> > >>>
> > >>>    Failed to apply 'drivers/of/unittest-data/overlay.dtb': FDT_ERR_NOTFOUND
> > >>>
> > >>> which is cryptic and does not even point to the location in the overlay that
> > >>> is problematic.  If you look at the source of fdtoverlay / libfdt, you will
> > >>> find that FDT_ERR_NOTFOUND may be generated in one of many places.
> > >>>
> > >>> I do _not_ want to do a full review of fdtoverlay, but I think that it is
> > >>> reasonable to request enhancing fdtoverlay in the parent project to generate
> > >>> usable error messages before enabling fdtoverlay in the Linux kernel tree.
> > >
> >
> > > That's... actually much harder than it sounds.  fdtoverlay is
> > > basically a trivial wrapper around the fdt_overlay_apply() function in
> > > libfdt.  Matching the conventions of the rest of the library, really
> > > it's only way to report errors is a single error code.
> > >
> > > Returning richer errors is not an easy problem in a C library,
> > > especially one designed to be usable in embedded systems, without an
> > > allocator or much else available.
> > >
> > > Of course it would be possible to write a friendly command line tool
> > > specifically for applying overlays, which could give better errors.
> > > fdtoverlay as it stands isn't really that - it was pretty much written
> > > just to invoke fdt_overlay_apply() in testcases.
> >
> > Thank you for providing that context.
> >
> > I do not know if there is a way to enable the code that is currently in libfdt
> > to both be useful as an embedded library (for example, U-boot seems to often
> > have a need to keep memory usage very small) and also be part of a tool with
> > effective warning and error messages.
>
> Yeah, I don't know either.
>
> > Before having looked at libfdt only at a cursory level while debugging the proposed
> > use of fdtoverlay in Linux, my first thought was that maybe it would be possible
> > to add warning and error messages within "#ifdef" blocks, or other ways that
> > cause the error code to _not_ be compiled as part of library version of libfdt,
> > but only be compiled as part of fdtoverlay _when built in the Linux kernel_
> > (noting that the proposed Linux patch builds the libfdt files as part of
> > the fdtoverlay compile instead of as a discrete library).  After looking at
> > the libfdt source a tiny bit more carefully, I would probably shoot down this
> > suggestion, as it makes the source code uglier and harder to understand and
> > maintain for the primary purpose of being an embedded library.
>
> Oof.  That sounds really ugly, but maybe it could be pulled off.
>
> > Do you have any thoughts on how warning and error messages could be added,
> > or if it is even possible?  Or maybe your suggestion of writing a "friendly
> > command line tool specifically for applying overlays" is the path that
> > Viresh should pursue?
>
> I think at this stage it's a matter of trying a few approaches and
> seeing what works out.

Another way would be applying overlays to dtc's live tree. This could
apply overlays from dts in addition to dtb. It could be a plug-in if
we ever get that finished up.

The downside of this is not testing libfdt's code and possible
differences between 2 implementations.

Rob
