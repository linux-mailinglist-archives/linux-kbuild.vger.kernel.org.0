Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01DC319932E
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2020 12:11:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730358AbgCaKLZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 31 Mar 2020 06:11:25 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:41277 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729997AbgCaKLZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Mar 2020 06:11:25 -0400
Received: by mail-ot1-f67.google.com with SMTP id f52so21420699otf.8;
        Tue, 31 Mar 2020 03:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TSC+0pXXb8JE+C3nC01SaCOV0GhldDpmDHlN1rI42O0=;
        b=ZgBMTzNUT+M3hV96FGzVZhTe6qkygxN3dgFc5BsrgocdbRHpn/kXCsDdfqnibEvHwl
         SBjnT59UhHW0ztwiG9VWrIcwup/WXqygcUvoMNvIofGJA5W4VY3fozMToRyvKI258Rlo
         tv/U/erPwAR/nyuUYPKu0UJg1N/h2FZckEiupD0Vz3kyN9SZjzX9nlJ4EbBYBM2+anve
         LbXUbyyXg4/If3Ty2AUFqmY2MphlGi6vM5rcAfzo/h+h9KLAzpr7xDu/cPYwzSOiedcf
         GkdWaXTAc2A6bQFbmITKfIZ7gMJ2x3t4xGeUEmzpWHXGBZ8vtOAAiFqUOU2QzWnbRKm8
         1jOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TSC+0pXXb8JE+C3nC01SaCOV0GhldDpmDHlN1rI42O0=;
        b=uEz3yoD/HCJgdveDTUe6IWM8AV0TcoGYNQWv8xJupQUi67ezzkSM9N+hSXzliNzXx3
         46SVlYZ6jGvfZTZQ2Kcw2j7iVmGKjcQVKoU/+bZr3Xdha//lFxMrJgz4XShXc1snaqfU
         hGsVD0raSl2KBNUBdyGysBbb7RyqVX7Prc6/bvctfyHopRcGXxPsglRNpfy1zU172+GV
         5MXJdreW3VRf8ivnz0kn+7IBRHb+ffoIFK5ckWz8xJ5LRvGwHGyrTl8zL8edVhif4WWs
         GoBMtyHBIO3h+K7I0V2F3fi4gHidEoiJ8c679BHsEoY9nyf1+q8Uk4kkDbjyaNBnhJfr
         FLdw==
X-Gm-Message-State: ANhLgQ3Z5fBpsM302FmtwOOR4Y9WghTQ31TcRshkWiNjukfzm7yHjYKf
        1ZjcqxfNIOjqv7gJ4Cj5JIU=
X-Google-Smtp-Source: ADFU+vtAidXLTOjpYfi+tZB4/wUS4dvh6EqabczyA+t3MwrRQEUB8l3mb+b2r8tIQpFw160mUFGsAw==
X-Received: by 2002:a4a:8e59:: with SMTP id z25mr12638332ook.86.1585649484349;
        Tue, 31 Mar 2020 03:11:24 -0700 (PDT)
Received: from ubuntu-m2-xlarge-x86 ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id b2sm5030457oii.20.2020.03.31.03.11.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Mar 2020 03:11:23 -0700 (PDT)
Date:   Tue, 31 Mar 2020 03:11:22 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH v2] kbuild: Enable -Wtautological-compare
Message-ID: <20200331101122.GA6292@ubuntu-m2-xlarge-x86>
References: <20200326194155.29107-1-natechancellor@gmail.com>
 <CAK7LNAQ8uHtuhd7DiGGOLbkEX524rPjfUuWAHjU-_92Ow3_1Pg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAQ8uHtuhd7DiGGOLbkEX524rPjfUuWAHjU-_92Ow3_1Pg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Mar 29, 2020 at 08:31:26PM +0900, Masahiro Yamada wrote:
> On Fri, Mar 27, 2020 at 4:42 AM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > Currently, we disable -Wtautological-compare, which in turn disables a
> > bunch of more specific tautological comparison warnings that are useful
> > for the kernel such as -Wtautological-bitwise-compare. See clang's
> > documentation below for the other warnings that are suppressed by
> > -Wtautological-compare. Now that all of the major/noisy warnings have
> > been fixed, enable -Wtautological-compare so that more issues can be
> > caught at build time by various continuous integration setups.
> >
> > -Wtautological-constant-out-of-range-compare is kept disabled under a
> > normal build but visible at W=1 because there are places in the kernel
> > where a constant or variable size can change based on the kernel
> > configuration. These are not fixed in a clean/concise way and the ones
> > I have audited so far appear to be harmless. It is not a subgroup but
> > rather just one warning so we do not lose out on much coverage by
> > default.
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/488
> > Link: http://releases.llvm.org/10.0.0/tools/clang/docs/DiagnosticsReference.html#wtautological-compare
> > Link: https://bugs.llvm.org/show_bug.cgi?id=42666
> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> > ---
> >
> > v1 -> v2: https://lore.kernel.org/lkml/20200219045423.54190-7-natechancellor@gmail.com/
> >
> > * Expand commit message a bit by adding more reasoning behind change.
> > * Disable -Wtautological-constant-out-of-range-compare under a normal
> >   build but allow it to show up at W=1 for easy auditing.
> >
> > I hope this can be accepted for 5.7. There are two warnings that I see
> > still across a bunch of allyesconfig/allmodconfig builds that have
> > patches sent but not accepted. I will ping them today.
> >
> > * https://lore.kernel.org/lkml/20191023002014.22571-1-natechancellor@gmail.com/
> > * https://lore.kernel.org/lkml/20200220051011.26113-1-natechancellor@gmail.com/
> 
> 
> OK, I will queue this up and send it to Linus
> in the second week of MW.
> 
> I hope all warnings will be fixed by that time.

Just a follow up, those two patches have been picked up and should be in
this coming release:

https://git.kernel.org/balbi/usb/c/58582220d2d34228e5a1e1585e41b735713988bb
https://git.kernel.org/rostedt/linux-trace/c/bf2cbe044da275021b2de5917240411a19e5c50d

As of next-20200331, with the former applied (because it is not there
yet) along with this patch, I see no warnings on arm, arm64, x86_64
all{mod,yes}config.

Cheers,
Nathan
