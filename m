Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCEB9303F51
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Jan 2021 14:52:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405443AbhAZNwZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 26 Jan 2021 08:52:25 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:42721 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2405000AbhAZNwV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Jan 2021 08:52:21 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id BBD105C0114;
        Tue, 26 Jan 2021 08:51:31 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 26 Jan 2021 08:51:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=VKiELK44/clfmPnkaIaZL4Nw3WJ
        m8IoUYvNKtK5zkDM=; b=lxj2Iicf5HYw5jsMZHILmC1AdXAc8psIN6EGe49AINU
        AkPzShEEOPU4dPsRYvHkTR12UIQ5C7/BSY5Asmv778Um34rNXkCTeB3ooEj4CVpJ
        QXdusUrJunHKxaaViPKkFEaWOtw4ME/JSQyfydbmwUEFaj1+3Frn2G17rSv1kL3B
        7vOTH/teNwHK+9OSez3qhvbcNv4CUhUthGZdfWyRUkvVUzvRrvvK4n9vuMr+Fo/x
        hPQgPioyDUqe2SSzrkSBOxiA5y8jnpbAJRjp2lzx0Gnj7q0yv9QNCiamx02lGQzr
        DLNv2IejI10E9wa15ol95Y1IwVdCTdBoi55hnklup2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=VKiELK
        44/clfmPnkaIaZL4Nw3WJm8IoUYvNKtK5zkDM=; b=NFrD6SIqFfPIwvf9YMFyQp
        Mv9mubkf64Er0dqpA83l1j63Co2IaZOE8/864vEHE9Jbr3CziUp+vImv77VCZ/rC
        akNGSCy/DnTGhvy8xWL/9wQga7ATsMzoRZ/xg0Qld1hXudjCKPxZtBuVkFG9PxuD
        JWSlEOcZvzf7Zb87nqCeVRsKOeCZ72ALITQBr0Vk17HXx31KEFEGt+0a/T3mVf3g
        sOgVhi91k3dKQEsPPZehVsE6zzj9xw6s2deSqpCWkjhW86RhNfKlcwdWvbQBfd1N
        y3PnS4PB9RuqSiULqGpkus1W0DMmHjF3bkHiWFnFmNmxFvWxALZ2UI4iezrvm9nw
        ==
X-ME-Sender: <xms:Yh4QYDzmJ-0emHPEMq1-TYQJqCarpQvpZo467mQfGjA95EqriM_F1g>
    <xme:Yh4QYLQLHWK2HrZs7pZT-ZtqmtcfNOoPXu_DwYcGmzBA-ar9f30CPVdeX7UdYd9xD
    7O4UWoazYNTvQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehgdehiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuheejgf
    ffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecukfhppeekfedr
    keeirdejgedrieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:Yx4QYNULMrijJqLEnXWG89WcCZjSK3yDD-REk6caGDYMehDOPc58VA>
    <xmx:Yx4QYNjTL0dJkBzI6hSD3u4RnRt9sQYenes0U1LgFAIiZIOCMRzUXQ>
    <xmx:Yx4QYFAHFR8oz23cWU1u2m5Yh3vNeDUj1A40U6-OnEUj6kriNGi4Xg>
    <xmx:Yx4QYPDqcOMYpSAiFtNreykdH8M3fzvmxsAZkyXCImU3DPj8bb5uQA>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 8E0C31080057;
        Tue, 26 Jan 2021 08:51:30 -0500 (EST)
Date:   Tue, 26 Jan 2021 14:51:29 +0100
From:   Greg KH <greg@kroah.com>
To:     Justin Forbes <jforbes@redhat.com>
Cc:     Josh Poimboeuf <jpoimboe@redhat.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-hardening@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ondrej Mosnacek <omosnace@redhat.com>
Subject: Re: [PATCH RFC] gcc-plugins: Handle GCC version mismatch for OOT
 modules
Message-ID: <YBAeYaDReAc9VscA@kroah.com>
References: <efe6b039a544da8215d5e54aa7c4b6d1986fc2b0.1611607264.git.jpoimboe@redhat.com>
 <CAK7LNAS=uOi=8xJU=NiKnXQW2iCazbErg_TX0gL9oayBiDffiA@mail.gmail.com>
 <20210125212755.jfwlqogpcarmxdgt@treble>
 <CAK7LNAS+EG9doX3qUmu4M3=mRNmdybSv4180Xnuubiwmsq0Agw@mail.gmail.com>
 <20210125220757.vxdsf6sttpy46cq7@treble>
 <YA/PLdX5m9f4v+Yl@kroah.com>
 <CAFbkSA0m1pqmXh29j6wJ9fG05yC72T1kNC0QU3rF7Oh2NoMwYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFbkSA0m1pqmXh29j6wJ9fG05yC72T1kNC0QU3rF7Oh2NoMwYQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jan 26, 2021 at 06:44:44AM -0600, Justin Forbes wrote:
> On Tue, Jan 26, 2021 at 2:21 AM Greg KH <greg@kroah.com> wrote:
> >
> > On Mon, Jan 25, 2021 at 04:07:57PM -0600, Josh Poimboeuf wrote:
> > > On Tue, Jan 26, 2021 at 06:44:35AM +0900, Masahiro Yamada wrote:
> > > > > > If people use a different compiler, they must be
> > > > > > prepared for any possible problem.
> > > > > >
> > > > > > Using different compiler flags for in-tree and out-of-tree
> > > > > > is even more dangerous.
> > > > > >
> > > > > > For example, CONFIG_GCC_PLUGIN_RANDSTRUCT is enabled
> > > > > > for in-tree build, and then disabled for out-of-tree modules,
> > > > > > the struct layout will mismatch, won't it?
> > > > >
> > > > > If you read the patch you'll notice that it handles that case, when it's
> > > > > caused by GCC mismatch.
> > > > >
> > > > > However, as alluded to in the [1] footnote, it doesn't handle the case
> > > > > where the OOT build system doesn't have gcc-plugin-devel installed.
> > > > > Then CONFIG_GCC_PLUGIN_RANDSTRUCT gets silently disabled and the build
> > > > > succeeds!  That happens even without a GCC mismatch.
> > > >
> > > >
> > > > Ah, sorry.
> > > >
> > > > I responded too early before reading the patch fully.
> > > >
> > > > But, I do not like to make RANDSTRUCT a special case.
> > > >
> > > > I'd rather want to stop building for any plugin.
> > >
> > > Other than RANDSTRUCT there doesn't seem to be any problem with
> > > disabling them (and printing a warning) in the OOT build.  Why not give
> > > users that option?  It's harmless, and will make distro's (and their
> > > users') lives easier.
> > >
> > > Either GCC mismatch is ok, or it's not.  Let's not half-enforce it.
> >
> > As I said earlier, it's not ok, we can not support it at all.
> >
> 
> Support and enforce are 2 completely different things.  To shed a bit
> more light on this, the real issue that prompted this was breaking CI
> systems.  As we enabled gcc plugins in Fedora, and the toolchain folks
> went through 3 different snapshots of gcc 11 in a week. Any CI process
> that built an out of tree module failed. I don't think this is nearly
> as much of a concern for stable distros, as it is for CI in
> development cycles.

It's better to have an obvious break like this than to silently accept
things and then have a much harder issue to debug at runtime, right?

Don't allow things that we know we will not support, this sounds like an
issue with your CI systems, not with the kernel build system, why not
just fix that?  :)

thnaks,

greg k-h
