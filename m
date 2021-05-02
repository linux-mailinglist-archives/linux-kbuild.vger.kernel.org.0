Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BFE7370F41
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 May 2021 23:14:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232421AbhEBVO7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 2 May 2021 17:14:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232338AbhEBVO6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 2 May 2021 17:14:58 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D5ECC06174A
        for <linux-kbuild@vger.kernel.org>; Sun,  2 May 2021 14:14:05 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id c22so4099668edn.7
        for <linux-kbuild@vger.kernel.org>; Sun, 02 May 2021 14:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ztLe0PUCKTK2LtdP2HGMOWnOHEgLtC71r4QQFdpNTzw=;
        b=YBiD6aB1h/sCqYhKTphH+dg0wIZGGo6mw2O+h2UbBPaKs2j+amxCQcnTb6T4EcSFDi
         569RK7dsnKNOuJGN1Zq3Sl1+5gAq1k0k2Eo073vJURqtQ79ulv+UTiBKQN1QHx0TnXJL
         8kMigLRMuOZq6Z9mW4YA2S0oPDLTJFBkJG6AU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ztLe0PUCKTK2LtdP2HGMOWnOHEgLtC71r4QQFdpNTzw=;
        b=i/xzorw8ILiYM/bxhcJ9I1OG+WSseF7uZDuMhW0MkmBH0zk7Da9MGqfJL9YgHTFIya
         oMw7reK5OxP9NYRakqwUc+qVe9MqyuHse7fY2EX5YsZhbOrqpt+ZJEj/ROm8DJrTrsZX
         XsC685jTJLVbeq4JvqxWZ5Nn2dfJLocDjies7MNbMmGJpH8UOBmzoHvG6csAEZeCBJbg
         p3vJ/iHdrp7hwzU94TqtzH5JqWWH92Pj+THbKnzORqCqLmudBMi0NxU2Nb1fl2rjfq3H
         wuy9dCplzSY1wIzBPDW1Ppn20ofWItQu5Sw2n9PL+IyVvcUq6UrKCadMKkbVp9Z2cP/g
         eSgA==
X-Gm-Message-State: AOAM531U6QvPSg8l3Q6Mv64nKScFxhpVdzvyw4lUTpZg1Tngdl3i+3aE
        vDwA9jxCtz9rHlbg44HuV1aA77txbaNNNHkqzrM=
X-Google-Smtp-Source: ABdhPJwNubO1XOKy+yi/Py41KN75TwruB6B8L1uCY2odqrY362KF0MOSTWQuHujIE+xCQwqfuoGVuw==
X-Received: by 2002:a05:6402:682:: with SMTP id f2mr16514282edy.297.1619990044049;
        Sun, 02 May 2021 14:14:04 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id j8sm10780317edq.67.2021.05.02.14.14.03
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 May 2021 14:14:03 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id i3so4132071edt.1
        for <linux-kbuild@vger.kernel.org>; Sun, 02 May 2021 14:14:03 -0700 (PDT)
X-Received: by 2002:a2e:330f:: with SMTP id d15mr11126850ljc.251.1619989727157;
 Sun, 02 May 2021 14:08:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210501151538.145449-1-masahiroy@kernel.org> <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
 <20210502183030.GF10366@gate.crashing.org> <81a926a3bdb70debe3ae2b13655ea8d249fb9991.camel@perches.com>
 <20210502203253.GH10366@gate.crashing.org>
In-Reply-To: <20210502203253.GH10366@gate.crashing.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 2 May 2021 14:08:31 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjGJskk5EwnDCccs6DcLytE2yx76+P_W-n1-B5zq0M3KA@mail.gmail.com>
Message-ID: <CAHk-=wjGJskk5EwnDCccs6DcLytE2yx76+P_W-n1-B5zq0M3KA@mail.gmail.com>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
To:     Segher Boessenkool <segher@kernel.crashing.org>
Cc:     Joe Perches <joe@perches.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Paul Mackerras <paulus@samba.org>,
        linux-riscv@lists.infradead.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Will Deacon <will@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, May 2, 2021 at 1:38 PM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> The point is, you inconvenience users if you require a compiler version
> they do not already have.  Five years might be fine, but three years is
> not.

So this should be our main issue - not how old a compiler is, but how
our compiler version limitations end up possibly making it harder for
users to upgrade.

Of course, one issue there is whether said users would have upgraded
regardless - if you have a very old distribution, how likely are you
to upgrade the kernel at all?

But we do very much want to encourage people to upgrade their kernels,
even if they might be running otherwise fairly old user space. If for
no other reason than that it's good for our kernel coverage testing -
the more different distributions people test a new kernel with, the
better. And some of the less common architectures have their own
issues, with distros possibly not even supporting them any more (if
they ever did - considering all the odd ad-hoc cross-compiler builds
people have had..)

This is why "our clang support requires a very recent version of
clang" is not relevant - distributions won't have old versions of
clang anyway, and even if they do, such distributions will be
gcc-based, so "build the kernel with clang" for that situation is
perhaps an exercise for some intrepid person who is willing to do odd
and unusual things, and might as well build their own clang version
too.

So I really wish people didn't get hung about some "three years ago"
or similar. It's not relevant.

What is relevant is what version of gcc various distributions actually
have reasonably easily available, and how old and relevant the
distributions are. We did decide that (just as an example) RHEL 7 was
too old to worry about when we updated the gcc version requirement
last time.

Last year, Arnd and Kirill (maybe others were involved too) made a
list of distros and older gcc versions. But I don't think anybody
actually _maintains_ such a list. It would be perhaps interesting to
have some way to check what compiler versions are being offered by
different distros.

           Linus
