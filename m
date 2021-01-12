Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48CB52F3DB2
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Jan 2021 01:44:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436627AbhALVhJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 Jan 2021 16:37:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:37926 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437035AbhALUrU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Jan 2021 15:47:20 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C5F4822DFA;
        Tue, 12 Jan 2021 20:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610484399;
        bh=6C4FcXaTex9YSJhTt/hDbVABmaMZGgd5xL/KaWRt3iY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=RehPUdGa+mBVp0ZUVaEOPx1noJiGroSWcESAiiR4uz6CLTaZd4YjLjgKovIkkivcd
         xjV02oeA6iZFg2KTyU2At7vjDB3tnRDPJVlEjhxgik1b5dnUa1BCHrW0v4pI48DlRb
         1Qv3ROg7LijMPadsxZtldjWhxQFylhy4560fpq9dQiZtfKKhKdS45P7s2XgzWTsMv8
         cr3lWv5qyeydCccj4cm6qr72u307nqHKP+ffjhG0PwrGASJaIfV0aHRWLwxZYIxNNq
         4F/xfNWU2jlVMODd4z6k4eW5fi6Ezmaza7PqzQ/GEpXzyU5GUXKh27xjn1tq5o2/6v
         68QFCT+Q/Mziw==
Received: by mail-ed1-f52.google.com with SMTP id h16so3864335edt.7;
        Tue, 12 Jan 2021 12:46:38 -0800 (PST)
X-Gm-Message-State: AOAM5300WqA+F1VF9IWkhi7KgcJGEEGavzIARx/j2Z7/sJHtzvL9YhKj
        kHc7UBJBSufP6Ch/Mq7uanvB3WK1XSfFLuk0Bg==
X-Google-Smtp-Source: ABdhPJzHL8hEzkUMk94Hn1de+iimXy75BRTADHer8kKo3ydsZMgHK9uauUzifJrV5kKxlyNzhM/pJo24SVcTyeuLeBk=
X-Received: by 2002:a05:6402:541:: with SMTP id i1mr786962edx.289.1610484397247;
 Tue, 12 Jan 2021 12:46:37 -0800 (PST)
MIME-Version: 1.0
References: <be5cb12a68d9ac2c35ad9dd50d6b168f7cad6837.1609996381.git.viresh.kumar@linaro.org>
 <1e42183ccafa1afba33b3e79a4e3efd3329fd133.1610095159.git.viresh.kumar@linaro.org>
 <23e16d20-36eb-87d9-4473-142504ad8a95@gmail.com> <CAL_JsqKqSVGCjcue=ka2=bB1Os9pczNTCqDeaoFPFfRxnvsteQ@mail.gmail.com>
 <e549c7ce-d01e-08a3-9ed0-7325a34e9c29@gmail.com> <CAL_Jsq+W4X5H2myCzX1bGTEqJG9dpwLXdmqbpq6oGm5wpF7WMQ@mail.gmail.com>
 <de50f7a5-d0d7-86b0-a1eb-84a91438b586@gmail.com>
In-Reply-To: <de50f7a5-d0d7-86b0-a1eb-84a91438b586@gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 12 Jan 2021 14:46:25 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLMeX_f-TpX4j5tgxJOxDafP9tiunvcF_Ed4MGV90982A@mail.gmail.com>
Message-ID: <CAL_JsqLMeX_f-TpX4j5tgxJOxDafP9tiunvcF_Ed4MGV90982A@mail.gmail.com>
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

On Tue, Jan 12, 2021 at 2:05 PM Frank Rowand <frowand.list@gmail.com> wrote:
>
> On 1/12/21 1:41 PM, Rob Herring wrote:
> > On Tue, Jan 12, 2021 at 1:06 PM Frank Rowand <frowand.list@gmail.com> wrote:
> >>
> >> On 1/12/21 8:04 AM, Rob Herring wrote:
> >>> On Mon, Jan 11, 2021 at 4:06 PM Frank Rowand <frowand.list@gmail.com> wrote:
> >>>>
> >>>> On 1/8/21 2:41 AM, Viresh Kumar wrote:
> >>>>> Now that fdtoverlay is part of the kernel build, start using it to test
> >>>>> the unitest overlays we have by applying them statically.
> >>>>>
> >>>>> The file overlay_base.dtb have symbols of its own and we need to apply
> >>>>> overlay.dtb to overlay_base.dtb alone first to make it work, which gives
> >>>>> us intermediate-overlay.dtb file.
> >>>>>
> >>>>> The intermediate-overlay.dtb file along with all other overlays is them
> >>>>> applied to testcases.dtb to generate the master.dtb file.
> >>>>>
> >>>>> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> >>>>
> >>>> NACK to this specific patch, in its current form.
> >>>>
> >>>> There are restrictions on applying an overlay at runtime that do not apply
> >>>> to applying an overlay to an FDT that will be loaded by the kernel during
> >>>> early boot.  Thus the unittest overlays _must_ be applied using the kernel
> >>>> overlay loading methods to test the kernel runtime overlay loading feature.
> >>>
> >>> This patch doesn't take away from any of that and it completely orthogonal.
> >>
> >> Mea culpa.  I took the patch header comment at face value, and read more into
> >> the header comment than what was written there.  I then skimmed the patch
> >> instead of actually reading what it was doing.
> >>
> >> I incorrectly _assumed_ (bad!) that the intent was to replace applying the
> >> individual overlay dtb's with the master.dtb.  Reading more closely, I see
> >> that the assumed final step of actually _using_ master.dtb does not exist.
> >>
> >> So, yes, I agree that the patch as written is orthogonal to my concern.
> >>
> >> My updated understanding is that this patch is attempting to use the existing
> >> unittest overlay dts files as source to test fdtoverlay.  And that the resulting
> >> dtb from fdtoverlay is not intended to be consumed by the kernel unittest.
> >
> > The goal is not to test fdtoverlay. dtc unittests do that. The goal is
> > testing overlays we expect to be able to apply can actually apply and
> > doing this at build time. That's also the goal for all the 'real'
> > overlays which get added.
> >
> >> I do not agree that this is a good approach to testing fdtoverlay.  The
> >> unittest overlay dts files are constructed specifically to test various
> >> parts of the kernel overlay code and dynamic OF code.  Some of the content
> >> of the overlays is constructed to trigger error conditions in that code,
> >> and thus will not be able to be processed without error by fdtoverlay.
> >
> > Then those should be omitted.
> >
> >> Trying to use overlay dts files that are constructed to test runtime kernel
> >> code as fdtoverlay input data mixes two different test environments and
> >> objectives.  If fdtoverlay test cases are desired, then fdtoverlay specific
> >> dts files should be created.
> >>
> >>>
> >>>> I agree that testing fdtoverlay is a good idea.  I have not looked at the
> >>>> parent project to see how much testing of fdtoverlay occurs there, but I
> >>>> would prefer that fdtoverlay tests reside in the parent project if practical
> >>>> and reasonable.  If there is some reason that some fdtoverlay tests are
> >>>> more practical in the Linux kernel repository then I am open to adding
> >>>> them to the Linux kernel tree.
> >>>
> >>> If you (or more importantly someone else sending us patches) make
> >>> changes to the overlays, you can test that they apply at build time
> >>> rather than runtime. I'll take it! So please help on fixing the issue
> >>> because I want to apply this.
> >>
> >> If the tests can be added to the upstream project, I would much prefer
> >> they reside there.  If there is some reason a certain test is more
> >> suited to be in the Linux kernel source tree then I also would like
> >> it to be accepted here.
> >
> > Again, this is just about doing sanity checks at build time rather
> > than *only* rely on runtime.
>
> I'm fine with adding tests for applying overlays at build time (in
> other words, tests of fdtoverlay).

Again, it's not tests of fdtoverlay. It's a test of the dts files. We
are testing that an overlay dts can apply to the base dts we claim it
applies. If the overlay dts has crap then we'll catch it.

We shouldn't accept overlays that can't apply to a base in the kernel
tree. That's either because it's broken or because the base doesn't
exist. With the exception of overlays designed to fail for tests,
unittest overlays should not be any different.

> But the constraints on applying an overlay at build time are different
> than the runtime constraints.

Like what specifically? Runtime is more constrained than build time.
Or at least it should be. It's not really and that's why we have
limited runtime applied overlay support.

> The existing unittest overlay dts files are not designed to test applying
> overlays at build time.  Tests for fdtoverlay should be designed to test
> that overlays that meet the build time constraints can be applied
> properly by fdtoverlay, and that overlays that fail to meet those
> constraints are rejected by fdtoverlay.
>
> Trying to use the same data (dts) files for tests that have different
> constraints is likely to make both tests more fragile when a data file
> is modified for one environment without careful consideration of the
> other environment.

We're not changing nor constraining the data files. Just adding
another sanity test on them.

Rob
