Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A52340BEB0
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Sep 2021 06:00:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbhIOECB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 15 Sep 2021 00:02:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229465AbhIOECA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Sep 2021 00:02:00 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8ADDC061762
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Sep 2021 21:00:41 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id x27so3229272lfu.5
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Sep 2021 21:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jLp7NBVpEmFUDWBBFiXkybAZlpHFnSOjtzW3fWt0ZTs=;
        b=CFr7I9nOS0o4V8Hk2T4m/boN2g5hFYtOg2KVDMucV4phyKCGKabCPwXrBLJGkjW41w
         TmU156jwHpntdfg0ckGeWINBuBgiJqQq6wIJp/Ls+R9YKxEpzt6gVWCLejwaj7zCdC/a
         WOHEL/ms5locbfgXMX3F70O4yy6F7zmJZIywWwvjRe3dQU6qj4XEeMFdWhMhlAcc2Zft
         iQhc2DX24U5yjWlvwT1hrrGP52L3FlowSyIVteeyznDTpuiw+imzKJ2t4MWyE3k1/oAH
         MjherCgAFTJJKOiXMAu93U3u2/3WYMsLHAjCtkXWMGWnxUhPqME/9/dkr3thJ7PWctKi
         qm1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jLp7NBVpEmFUDWBBFiXkybAZlpHFnSOjtzW3fWt0ZTs=;
        b=Lrzf/R1Wc/EiW08k9iYhFdbBK5FEjdBRMNz9RXrQ2nzk/mprhmdKICZUBI47tAeXy0
         6AfhWT5/PD/CM22wwQutsBn7KIPkzrVPVcs8UHTCLrxxsW9kEhom0GA/pi5BnBZmXHJK
         RxIuMOP0rpMxMR5kMiwxdZw1/KVFz8/doWNvSPEPhhSQKSH08wwSDfkIYqmmxHNXtoqD
         KwDE8jqk6Mn4lZy6KwILo5gJZ+fT2zzKj5ypqj0dsTKJSTGnv1RYxggfd6KKGQp7g9uk
         2vbMJ/qVvTjb0NmndUo0pklSDCWoPYkMVGkZuglY/l8I+Uy4n2OwEn+aDLdz7tDznksg
         LhcA==
X-Gm-Message-State: AOAM532+Zc//TkFTbjwbvCtYa7xBCRsYU6w1VPW4eY65+6reaDtyX00N
        RwX+OExCbx8MElXQ/zl0Z4PXsTAtlkFcjOSdNYdOBsdV7g4=
X-Google-Smtp-Source: ABdhPJyzjnun9lDYirXRORDXGZ5axoryqVk9NUUldqkcHOuBtsk+yoEXL9Cj+4WR47lg4bGVPJe6bVEaeX+9YOFx9l4=
X-Received: by 2002:a05:6512:2291:: with SMTP id f17mr15942387lfu.489.1631678439952;
 Tue, 14 Sep 2021 21:00:39 -0700 (PDT)
MIME-Version: 1.0
References: <c1b1a299-c60d-28a4-07ab-1ecd211d6da9@i-love.sakura.ne.jp>
 <3bf6f4f4-9c96-6e0c-951d-5509175dddfe@kernel.org> <bb40c26c-dd0f-f7c2-59b7-d6ad361a0cdb@i-love.sakura.ne.jp>
 <CAHk-=wiiJ47YP7Q4AJC=YSfJdY-HK-8Bh7W=+hrZRqdM2UrAFg@mail.gmail.com>
In-Reply-To: <CAHk-=wiiJ47YP7Q4AJC=YSfJdY-HK-8Bh7W=+hrZRqdM2UrAFg@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 14 Sep 2021 21:00:28 -0700
Message-ID: <CAKwvOdktDDgeD+-S41x-9PdTdmbQiixgTvEw-7okFCzgecqdRg@mail.gmail.com>
Subject: Re: linux: build failure: error: "__has_attribute" is not defined
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        LKML <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Sep 14, 2021 at 7:59 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, Sep 14, 2021 at 6:05 PM Tetsuo Handa
> <penguin-kernel@i-love.sakura.ne.jp> wrote:
> >
> > It would be nice if Makefile can also check gcc version used for building tools.
>
> I think the real problem is that the tool headers are cut-down from
> the real kernel headers, but not cut down enough, so they are still
> very complex, often with stuff that just isn't worth it in user space
> at all.
>
> And they _look_ like kernel headers - both in naming and in contents.
> But they really aren't.
>
> And it turns out there are two independent bugs here.
>
> Bug #1 is that the tool header files look _so_ much like the main
> kernel header files, that Nick thought that the
>
>    #if GCC_VERSION >= 40300
>
> was about the compiler we compile the kernel with.
>
> But no, it's about the host compiler.
>
> Easy mistake to make when the naming is so similar and the contents
> are often also fairly closely related too.

No, I got that.

I don't get why you wouldn't keep those in sync, at least the minimum
supported compiler version for both.  Sure, for cross compiling HOSTCC
and CC could be wildly different versions, but why should the minimum
supported version differ between the two?

Do we even document anywhere what's the lowest support compiler
version for tools/ or HOSTCC?

> But basically, commit 4e59869aa655 ("compiler-gcc.h: drop checks for
> older GCC versions") was buggy, because it took the kernel compiler
> version logic ("we require 5.1 to build the kernel") and applied it to
> the tooling header files too (we do _not_ require the kernel compiler
> for host tools).

That the minimum versions don't need to match between the two is
surprising to me.  Probably to the reviewers of those patches, too.
--
Thanks,
~Nick Desaulniers
