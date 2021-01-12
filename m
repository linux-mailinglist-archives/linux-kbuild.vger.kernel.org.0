Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1EAC2F3ACF
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Jan 2021 20:42:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406146AbhALTmR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 Jan 2021 14:42:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:55068 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2436543AbhALTmR (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Jan 2021 14:42:17 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id BE28A2310E;
        Tue, 12 Jan 2021 19:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610480496;
        bh=4Wxwoit4G6NqJNUR0MkSWA215CQPHEUvAJgqt10Do0U=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=OERL1NohnxXParTdzW8Snr8u/u2wRJDeXIz9C37QZhoGA+lFvxhJMf9JIYVyJ3pNF
         zL9jDLRxkGEKxgItAwQfFMKh5EMVRdBrQZTWZU9YYH+rx9+J2dYOJ+Nr2c9ZW8yPxK
         YKh4FYj528CxEEFXtCTrcWBEK3AmLKLUaKqCaKuT5X7L5nIcct227rVg/8ST5P2EbY
         y0YlyvCIZejZY5cp30jOTZhRxM20Q9isPav/DAYrhYanr2UFcDkcMQMDaA4HAg4Hhe
         KzMyLLER/xktazDbJdBAeLeKzqwodg/eMavgPLhrI+eRfQ5IX3rJhMyX/NWKDRyrzS
         NiOjTM56rv0+g==
Received: by mail-ej1-f50.google.com with SMTP id jx16so5144922ejb.10;
        Tue, 12 Jan 2021 11:41:35 -0800 (PST)
X-Gm-Message-State: AOAM533vJj+gquhoYlN3bkBiFubgX+BTKOi1rtJd87EG8ojF0QbErdwC
        PildWedU8/sdZwBPygPc0kv/xg57PxMGjRcO+A==
X-Google-Smtp-Source: ABdhPJwGDgQ/s7m0yd+ozKdQqc6SBtrRFa23ETnLWXyZwBshtrjJcgF8HqkKa4ftaXza7D0MHz+pQ++KJJco/u37goI=
X-Received: by 2002:a17:906:4146:: with SMTP id l6mr269918ejk.341.1610480494322;
 Tue, 12 Jan 2021 11:41:34 -0800 (PST)
MIME-Version: 1.0
References: <be5cb12a68d9ac2c35ad9dd50d6b168f7cad6837.1609996381.git.viresh.kumar@linaro.org>
 <1e42183ccafa1afba33b3e79a4e3efd3329fd133.1610095159.git.viresh.kumar@linaro.org>
 <23e16d20-36eb-87d9-4473-142504ad8a95@gmail.com> <CAL_JsqKqSVGCjcue=ka2=bB1Os9pczNTCqDeaoFPFfRxnvsteQ@mail.gmail.com>
 <e549c7ce-d01e-08a3-9ed0-7325a34e9c29@gmail.com>
In-Reply-To: <e549c7ce-d01e-08a3-9ed0-7325a34e9c29@gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 12 Jan 2021 13:41:22 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+W4X5H2myCzX1bGTEqJG9dpwLXdmqbpq6oGm5wpF7WMQ@mail.gmail.com>
Message-ID: <CAL_Jsq+W4X5H2myCzX1bGTEqJG9dpwLXdmqbpq6oGm5wpF7WMQ@mail.gmail.com>
Subject: Re: [PATCH] of: unittest: Statically apply overlays using fdtoverlay
To:     Frank Rowand <frowand.list@gmail.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
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

On Tue, Jan 12, 2021 at 1:06 PM Frank Rowand <frowand.list@gmail.com> wrote:
>
> On 1/12/21 8:04 AM, Rob Herring wrote:
> > On Mon, Jan 11, 2021 at 4:06 PM Frank Rowand <frowand.list@gmail.com> wrote:
> >>
> >> On 1/8/21 2:41 AM, Viresh Kumar wrote:
> >>> Now that fdtoverlay is part of the kernel build, start using it to test
> >>> the unitest overlays we have by applying them statically.
> >>>
> >>> The file overlay_base.dtb have symbols of its own and we need to apply
> >>> overlay.dtb to overlay_base.dtb alone first to make it work, which gives
> >>> us intermediate-overlay.dtb file.
> >>>
> >>> The intermediate-overlay.dtb file along with all other overlays is them
> >>> applied to testcases.dtb to generate the master.dtb file.
> >>>
> >>> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> >>
> >> NACK to this specific patch, in its current form.
> >>
> >> There are restrictions on applying an overlay at runtime that do not apply
> >> to applying an overlay to an FDT that will be loaded by the kernel during
> >> early boot.  Thus the unittest overlays _must_ be applied using the kernel
> >> overlay loading methods to test the kernel runtime overlay loading feature.
> >
> > This patch doesn't take away from any of that and it completely orthogonal.
>
> Mea culpa.  I took the patch header comment at face value, and read more into
> the header comment than what was written there.  I then skimmed the patch
> instead of actually reading what it was doing.
>
> I incorrectly _assumed_ (bad!) that the intent was to replace applying the
> individual overlay dtb's with the master.dtb.  Reading more closely, I see
> that the assumed final step of actually _using_ master.dtb does not exist.
>
> So, yes, I agree that the patch as written is orthogonal to my concern.
>
> My updated understanding is that this patch is attempting to use the existing
> unittest overlay dts files as source to test fdtoverlay.  And that the resulting
> dtb from fdtoverlay is not intended to be consumed by the kernel unittest.

The goal is not to test fdtoverlay. dtc unittests do that. The goal is
testing overlays we expect to be able to apply can actually apply and
doing this at build time. That's also the goal for all the 'real'
overlays which get added.

> I do not agree that this is a good approach to testing fdtoverlay.  The
> unittest overlay dts files are constructed specifically to test various
> parts of the kernel overlay code and dynamic OF code.  Some of the content
> of the overlays is constructed to trigger error conditions in that code,
> and thus will not be able to be processed without error by fdtoverlay.

Then those should be omitted.

> Trying to use overlay dts files that are constructed to test runtime kernel
> code as fdtoverlay input data mixes two different test environments and
> objectives.  If fdtoverlay test cases are desired, then fdtoverlay specific
> dts files should be created.
>
> >
> >> I agree that testing fdtoverlay is a good idea.  I have not looked at the
> >> parent project to see how much testing of fdtoverlay occurs there, but I
> >> would prefer that fdtoverlay tests reside in the parent project if practical
> >> and reasonable.  If there is some reason that some fdtoverlay tests are
> >> more practical in the Linux kernel repository then I am open to adding
> >> them to the Linux kernel tree.
> >
> > If you (or more importantly someone else sending us patches) make
> > changes to the overlays, you can test that they apply at build time
> > rather than runtime. I'll take it! So please help on fixing the issue
> > because I want to apply this.
>
> If the tests can be added to the upstream project, I would much prefer
> they reside there.  If there is some reason a certain test is more
> suited to be in the Linux kernel source tree then I also would like
> it to be accepted here.

Again, this is just about doing sanity checks at build time rather
than *only* rely on runtime.

> >
> > And yes, dtc has fdtoverlay tests. But this patch shows there's at
> > least 2 issues,
>
>
> > fdtoverlay can't apply overlays to the root
>
> A test of that definitely belongs in the upstream project.

Yes, agreed.

> > and using an overlay as the base tree in UML is odd IMO.
>
> Am I still not fully understanding the patch?  I'm missing how
> this patch changes what dtb is used as the base tree in UML.

This was more my theorising why Viresh is having problems in that
perhaps fdtoverlay can't take an overlay as a base DT while the kernel
can and does for UML. The fact that it works for UML seems wrong to
me.

Rob
