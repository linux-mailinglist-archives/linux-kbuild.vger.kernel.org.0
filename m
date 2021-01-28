Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E70E0307FAA
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Jan 2021 21:29:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231488AbhA1U0N (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 28 Jan 2021 15:26:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229830AbhA1UZq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Jan 2021 15:25:46 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4966C061573
        for <linux-kbuild@vger.kernel.org>; Thu, 28 Jan 2021 12:25:05 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id v24so9343588lfr.7
        for <linux-kbuild@vger.kernel.org>; Thu, 28 Jan 2021 12:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1tACUR/LflNb3xiypGIJAOB6qg90kRzu1Bn+isppjuU=;
        b=Z0wOnR+xWLEEYZyJtmF4cIaKTBfBVVe1eeYhMK7xw537F0yzoHCspxlEXjdVuTdK0G
         joZeBK9AflS4N3Vv3DI2P9WSeG9IFXDCJSlQ2a0zsffUznIcHhMevwVEhYdoBUBL29S2
         wnPDvU9qQiBA4rJIkIBFyJ9BVUzB/oe2EmzfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1tACUR/LflNb3xiypGIJAOB6qg90kRzu1Bn+isppjuU=;
        b=iaUufrMwOeOEi2qnMzYasaoAF7hGndvbr9/rJbYfKLyg2F6YzVa0H+aoL6ZDG/jZQS
         bkJJeOF4HEIGBfEZaRNynQsnphTdNNQxutwZu4ch8cc7tCwWkOvXJyl/aOq9AB+NWuyX
         YdXBM86L3lqinD5Em4WDvY8gdhIDIXjtOSYh3HHVyaf+rC6n7l7D2hh5K8oWSltixT05
         yem2Zofdl5WGwA1lAfIiWqoY/UYtqPWKj5Yih9eCc4nspAq2wbnOxxMTgEkJhem6HKYA
         oZc9x+vgy/CvNmwC4ajqz629br+S0w68drCl3MsCaTY4FcIZDLQQ4IcXhRu+3yf4i9Wd
         /x7w==
X-Gm-Message-State: AOAM533adnaQzblqPP9PtcRulKYAD7vnOsQolVMZMU7vh7vFpTc/W4y3
        BW0g07gei3DPv5yJ10yzJNZ/dOOQoKvr0Q==
X-Google-Smtp-Source: ABdhPJzmBEL9zOufenn8tbgIV08TjaRikEROHMQBi4yP9MIV19hL8HR079VTGhb9ZogCC5BOvIVB3A==
X-Received: by 2002:a19:456:: with SMTP id 83mr391130lfe.113.1611865504027;
        Thu, 28 Jan 2021 12:25:04 -0800 (PST)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id 129sm1776479lfb.148.2021.01.28.12.25.02
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jan 2021 12:25:03 -0800 (PST)
Received: by mail-lf1-f45.google.com with SMTP id f1so9375074lfu.3
        for <linux-kbuild@vger.kernel.org>; Thu, 28 Jan 2021 12:25:02 -0800 (PST)
X-Received: by 2002:a05:6512:2287:: with SMTP id f7mr379911lfu.40.1611865502453;
 Thu, 28 Jan 2021 12:25:02 -0800 (PST)
MIME-Version: 1.0
References: <fff056a7c9e6050c2d60910f70b6d99602f3bec4.1611863075.git.jpoimboe@redhat.com>
In-Reply-To: <fff056a7c9e6050c2d60910f70b6d99602f3bec4.1611863075.git.jpoimboe@redhat.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 28 Jan 2021 12:24:45 -0800
X-Gmail-Original-Message-ID: <CAHk-=wih0rLHsPXodpXJw_0F3bJqu=Pb_YNmPCSsYU_huoMwZA@mail.gmail.com>
Message-ID: <CAHk-=wih0rLHsPXodpXJw_0F3bJqu=Pb_YNmPCSsYU_huoMwZA@mail.gmail.com>
Subject: Re: [PATCH RFC] kbuild: Prevent compiler mismatch with external modules
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        linux-hardening@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Justin Forbes <jforbes@redhat.com>,
        Ondrej Mosnacek <omosnace@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        Miroslav Benes <mbenes@suse.cz>,
        David Laight <David.Laight@aculab.com>,
        Jessica Yu <jeyu@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jan 28, 2021 at 12:08 PM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
>
> Add a check for compiler mismatch, but only check the major version.

I think this is wrong for multiple reasons.

The most fundamental reason is that it's pointless and doesn't
actually do what you claim it does.

Just doing a "make oldconfig" will reset the CONFIG_xyz_VERSION to
whatever is installed, and now your check doesn't actually do
anything, since you're not actually checking what the kernel was
compiled with!

So I think that check is pointless and entirely misleading. It doesn't
do what you want it to do, and what you claim it does.

I'm not convinced about the whole magic vs minor argument either. The
whole "new compiler features" thing is a red herring - even if you do
have new compiler features, that in itself has very little to do with
whether the resulting object files are compatible or not.

So I say NAK, on the basis that the patch is nonsensical, tests the
wrong thing, and doesn't really have a technical reason for it.

             Linus
