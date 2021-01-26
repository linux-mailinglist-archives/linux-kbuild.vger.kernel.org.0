Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87634304513
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Jan 2021 18:23:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391264AbhAZRWT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 26 Jan 2021 12:22:19 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:59803 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389729AbhAZIO1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Jan 2021 03:14:27 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 34A9ED30;
        Tue, 26 Jan 2021 03:13:37 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 26 Jan 2021 03:13:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=z3CgsX2Q3UZcJEN+GpCQOg4Ir/z
        7oA+6ArewKns30U4=; b=rDOx/6ZUI8TxCbWGJMIlD0dDFF+rn5534ywQhMzaZgo
        wlTks+D+m1RZPuayaeTh/hZQKMRCBZavryl3wDlV/wlX1KPdTidi1u6PahE4YVwH
        GUo+sEV4VRwKLh7qQX0kkhrRfwK5VkpTIwmhr05TiXguICe2axplJmwN8Gfn6o36
        XH8vN55EEO8iTdqBnIQNzXgpDaJ7Oz+p5St4JaFbaNOmIddAAtqQWbTUIXo6cYxM
        JMqAmxeOqZcppaZyOPOUSAnjiw5hxi17Rxq1KONgLQrWQmgg2rTz2Ver4cb3l8Ga
        X8vSRk8Nt8tj1G3nicBmbSg6QRBif1A/PBy5Je6ja0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=z3CgsX
        2Q3UZcJEN+GpCQOg4Ir/z7oA+6ArewKns30U4=; b=G0oY0yN9dgNm73u2QNcNdi
        kJdzcO+BDT9qJLU6GVcv8raPqZ1oejgrCvMLyaSuJlOcFSbkB6GkMOtYLBKfcMKi
        66xQ8C+XxwfholykK+KT2yzbXj9gEnIrlIocNrOmha403OmEPAggFAgRL1oPdsnN
        tPR+CN2Su0Pckmjup/TFEfAiU1shKHoyjvxm4YzDS80tTwxK3DAp8PguANIUxL03
        UXTpGZZpJqHMWvhqlLt2BoTq+airlge5tPEBUOB+nZUWqZcXE489ah0i4li+bg/b
        3Dcg+vxLFCTEf4rp7R4N7vzd5HQVhwxLekPkJ8yqsDH86FEVueXdbkU0lidqFysA
        ==
X-ME-Sender: <xms:MM8PYPzuJ03ON_420FBPtsMUHZ7cJcyB_HeGBogs2xY7IT1z4vu9QA>
    <xme:MM8PYHRF_dogLECYepX7eTGZ_dInBPDqZO1LoIFqYWazR0JbaaVkRnpCgPcbjQqR6
    0tMu-Kfu2sqgw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeggdduudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
    rdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:MM8PYJUijWAi3Z-j74UZ6LAe1bGYGXbxyVzrlooUHuktt16f6vWbIQ>
    <xmx:MM8PYJgDaUV_anrq6PVb05FHzqxWsGWRpP-Nv2wBsFtLSwo07rCRUA>
    <xmx:MM8PYBDcVEN8yqndJ5_d6437iiQf06ypk_HKwQJnZLcIcG1qIIsJAQ>
    <xmx:MM8PYLAU03_Rb3lEmc2-tgg7WwaD52WXhGYc7ibT5bnTwe4epaHx2A>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 18DFA1080063;
        Tue, 26 Jan 2021 03:13:35 -0500 (EST)
Date:   Tue, 26 Jan 2021 09:13:33 +0100
From:   Greg KH <greg@kroah.com>
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-hardening@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Justin Forbes <jforbes@redhat.com>,
        Ondrej Mosnacek <omosnace@redhat.com>
Subject: Re: [PATCH RFC] gcc-plugins: Handle GCC version mismatch for OOT
 modules
Message-ID: <YA/PLdX5m9f4v+Yl@kroah.com>
References: <efe6b039a544da8215d5e54aa7c4b6d1986fc2b0.1611607264.git.jpoimboe@redhat.com>
 <CAK7LNAS=uOi=8xJU=NiKnXQW2iCazbErg_TX0gL9oayBiDffiA@mail.gmail.com>
 <20210125212755.jfwlqogpcarmxdgt@treble>
 <CAK7LNAS+EG9doX3qUmu4M3=mRNmdybSv4180Xnuubiwmsq0Agw@mail.gmail.com>
 <20210125220757.vxdsf6sttpy46cq7@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210125220757.vxdsf6sttpy46cq7@treble>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jan 25, 2021 at 04:07:57PM -0600, Josh Poimboeuf wrote:
> On Tue, Jan 26, 2021 at 06:44:35AM +0900, Masahiro Yamada wrote:
> > > > If people use a different compiler, they must be
> > > > prepared for any possible problem.
> > > >
> > > > Using different compiler flags for in-tree and out-of-tree
> > > > is even more dangerous.
> > > >
> > > > For example, CONFIG_GCC_PLUGIN_RANDSTRUCT is enabled
> > > > for in-tree build, and then disabled for out-of-tree modules,
> > > > the struct layout will mismatch, won't it?
> > >
> > > If you read the patch you'll notice that it handles that case, when it's
> > > caused by GCC mismatch.
> > >
> > > However, as alluded to in the [1] footnote, it doesn't handle the case
> > > where the OOT build system doesn't have gcc-plugin-devel installed.
> > > Then CONFIG_GCC_PLUGIN_RANDSTRUCT gets silently disabled and the build
> > > succeeds!  That happens even without a GCC mismatch.
> > 
> > 
> > Ah, sorry.
> > 
> > I responded too early before reading the patch fully.
> > 
> > But, I do not like to make RANDSTRUCT a special case.
> > 
> > I'd rather want to stop building for any plugin.
> 
> Other than RANDSTRUCT there doesn't seem to be any problem with
> disabling them (and printing a warning) in the OOT build.  Why not give
> users that option?  It's harmless, and will make distro's (and their
> users') lives easier.
> 
> Either GCC mismatch is ok, or it's not.  Let's not half-enforce it.

As I said earlier, it's not ok, we can not support it at all.

thanks,

greg k-h
