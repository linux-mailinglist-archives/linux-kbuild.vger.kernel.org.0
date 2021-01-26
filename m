Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48AC33041B8
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Jan 2021 16:12:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406032AbhAZPFa (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 26 Jan 2021 10:05:30 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:57315 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2391685AbhAZPBR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Jan 2021 10:01:17 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id 91DBD5C013F;
        Tue, 26 Jan 2021 10:00:09 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 26 Jan 2021 10:00:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=RxGrw4hivLca49l2H8oMyP442gk
        kW/4nM01MSeyUdWo=; b=mxqBwILucR51+LHBNd2vSh0ewj0OG+ILVW7UXsKoX5S
        PA1RPa0O0lFdfdCdyIoof6MhyRXAL/mm7lnVWSj2OINUEvfNovU5Ln7Ly8O0gSc/
        Sx7coDxRbueB5VzcpaNbNg2wiKc2fYGbimyiDOtD2LPxdIjK6lnDQr/UDcgWbGnd
        qlelsUlkPePH2rKR9onY+BpjaYuntZBIIQYtdLPuGm/d7tretx4khpwi1tfQG+Vw
        z4AUnPbCygMJd8BJx5A43kxrIFbv2yr5ykq1EgV50355YQVb5vks1BDxMVvTt4Mi
        XMWOEe7ntzLr922eqIRD6PKVwkPtIDuqaLiruXHGBMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=RxGrw4
        hivLca49l2H8oMyP442gkkW/4nM01MSeyUdWo=; b=dbiSckWbPvvkF8ChOq5LCb
        LTQZSW8EiJwDwX4nTdgPULNyr9EYkDs7aZVdRP7rJ91pHyI4EIyyXGIYmpE6E/me
        m7RuOeuWQMGhsO3G3LDHoyym7YGLm3aP8MLSovmKAkURK5hbWrRg+idCXJyVDEUx
        W2or3m+YHC2XqY8WeKE3Ji+7xnOcRETD9+CU4NUu0oIlRaGTAW5qRPEG8iiOgwGp
        1o+GQpX4AZ1CmpXTLH40PVBM1mZ1gxsQhMMglmx7lDg6ETOO9CHIOWxv1/p7KvpF
        onLYNvj5aGv1Uxik4j3oryq/X6mwvln/CAn/p4h1WT5e8ibklGM6yDwXI/yDvEPw
        ==
X-ME-Sender: <xms:dy4QYMVxgLLRxU_JfppUvMn9m8Q2xrR1nBuOMjxg7VSI5GzY7HF_MA>
    <xme:dy4QYKMhGPpFz0M87uqLGBrwDe2_HDmSaEeNcw6D4z1dmC0ZLVFjZu8iAdhSgHAiE
    2elTH3w_fBx3A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeigddutdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuheejgf
    ffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecukfhppeekfedr
    keeirdejgedrieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:dy4QYAa8lDiqPsDFZxz5FlarEC2GFtcj8nZwL-c7sL09aNwfkKoyVA>
    <xmx:dy4QYOp6R3ZLjefQcQgmdUplfECrsnr7koSvJvYIV33ymZpWqZQOFQ>
    <xmx:dy4QYEYVYLkhk_cWKLuL3-pLS4UUUcZ_Tk9XIF1z5_cTrD2xk3c7Gw>
    <xmx:eS4QYM5-pLfTSO3ZwuuITLfmMimatnyrj5cpgewmBa-g45JtrYgX-g>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id E97D8240067;
        Tue, 26 Jan 2021 10:00:06 -0500 (EST)
Date:   Tue, 26 Jan 2021 16:00:05 +0100
From:   Greg KH <greg@kroah.com>
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Justin Forbes <jforbes@redhat.com>,
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
Message-ID: <YBAuddhlne9Dz/7M@kroah.com>
References: <efe6b039a544da8215d5e54aa7c4b6d1986fc2b0.1611607264.git.jpoimboe@redhat.com>
 <CAK7LNAS=uOi=8xJU=NiKnXQW2iCazbErg_TX0gL9oayBiDffiA@mail.gmail.com>
 <20210125212755.jfwlqogpcarmxdgt@treble>
 <CAK7LNAS+EG9doX3qUmu4M3=mRNmdybSv4180Xnuubiwmsq0Agw@mail.gmail.com>
 <20210125220757.vxdsf6sttpy46cq7@treble>
 <YA/PLdX5m9f4v+Yl@kroah.com>
 <CAFbkSA0m1pqmXh29j6wJ9fG05yC72T1kNC0QU3rF7Oh2NoMwYQ@mail.gmail.com>
 <YBAeYaDReAc9VscA@kroah.com>
 <20210126145155.kcfbnzfqg5qugvcl@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210126145155.kcfbnzfqg5qugvcl@treble>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jan 26, 2021 at 08:51:55AM -0600, Josh Poimboeuf wrote:
> On Tue, Jan 26, 2021 at 02:51:29PM +0100, Greg KH wrote:
> > On Tue, Jan 26, 2021 at 06:44:44AM -0600, Justin Forbes wrote:
> > > On Tue, Jan 26, 2021 at 2:21 AM Greg KH <greg@kroah.com> wrote:
> > > >
> > > > On Mon, Jan 25, 2021 at 04:07:57PM -0600, Josh Poimboeuf wrote:
> > > > > On Tue, Jan 26, 2021 at 06:44:35AM +0900, Masahiro Yamada wrote:
> > > > > > > > If people use a different compiler, they must be
> > > > > > > > prepared for any possible problem.
> > > > > > > >
> > > > > > > > Using different compiler flags for in-tree and out-of-tree
> > > > > > > > is even more dangerous.
> > > > > > > >
> > > > > > > > For example, CONFIG_GCC_PLUGIN_RANDSTRUCT is enabled
> > > > > > > > for in-tree build, and then disabled for out-of-tree modules,
> > > > > > > > the struct layout will mismatch, won't it?
> > > > > > >
> > > > > > > If you read the patch you'll notice that it handles that case, when it's
> > > > > > > caused by GCC mismatch.
> > > > > > >
> > > > > > > However, as alluded to in the [1] footnote, it doesn't handle the case
> > > > > > > where the OOT build system doesn't have gcc-plugin-devel installed.
> > > > > > > Then CONFIG_GCC_PLUGIN_RANDSTRUCT gets silently disabled and the build
> > > > > > > succeeds!  That happens even without a GCC mismatch.
> > > > > >
> > > > > >
> > > > > > Ah, sorry.
> > > > > >
> > > > > > I responded too early before reading the patch fully.
> > > > > >
> > > > > > But, I do not like to make RANDSTRUCT a special case.
> > > > > >
> > > > > > I'd rather want to stop building for any plugin.
> > > > >
> > > > > Other than RANDSTRUCT there doesn't seem to be any problem with
> > > > > disabling them (and printing a warning) in the OOT build.  Why not give
> > > > > users that option?  It's harmless, and will make distro's (and their
> > > > > users') lives easier.
> > > > >
> > > > > Either GCC mismatch is ok, or it's not.  Let's not half-enforce it.
> > > >
> > > > As I said earlier, it's not ok, we can not support it at all.
> > > >
> > > 
> > > Support and enforce are 2 completely different things.  To shed a bit
> > > more light on this, the real issue that prompted this was breaking CI
> > > systems.  As we enabled gcc plugins in Fedora, and the toolchain folks
> > > went through 3 different snapshots of gcc 11 in a week. Any CI process
> > > that built an out of tree module failed. I don't think this is nearly
> > > as much of a concern for stable distros, as it is for CI in
> > > development cycles.
> > 
> > It's better to have an obvious break like this than to silently accept
> > things and then have a much harder issue to debug at runtime, right?
> 
> User space mixes compiler versions all the time.  The C ABI is stable.
> 
> What specifically is the harder issue you're referring to?

Have you not noticed include/linux/compiler.h and all of the different
changes/workarounds we do for different versions of gcc/clang/intel
compilers?  We have never guaranteed that a kernel module would work
that was built with a different compiler than the main kernel, and I
doubt we can start now.

thanks,

greg k-h
