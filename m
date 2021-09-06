Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 944CE401DFB
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Sep 2021 18:02:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243636AbhIFQDv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 Sep 2021 12:03:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232130AbhIFQDu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Sep 2021 12:03:50 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77F07C061575;
        Mon,  6 Sep 2021 09:02:45 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id lc21so14332475ejc.7;
        Mon, 06 Sep 2021 09:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aJurJiBEcqKhnCeRcasboYTcIcnrqnyGP+4g7iS0saM=;
        b=ohhc7LBfWaaQG/9Vc1z7wBqpwQBP0PjtoHzxhyZPQQwPO9Cw5EwQsFScQM6V2TRyNF
         bu/3e9fNvL2htNYH0/F6IU0sCXhqakGqHrsQWluxoqVWsqOz7Pp+WSqi2pDP6XFMkLco
         zl9iYBHnCL4Zt74ZdDqFUVSjffQlhdivQRqvidBLBm7Xbd3h6FJjd62tQ0X/EzLkz6Nr
         vnl3ke39qsKAgI+TwMRA8Zu8MPEGU+F7RavsNPFXwcsheNeHtWPgmDVQA3GTQX0S2rYK
         CZPvnlQ2Yx0wWpXaVo0oHcGiCdSSY1YU+MdqP02QRJE8w+2aqfqebM6y0rI/lojhxjJt
         hc+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aJurJiBEcqKhnCeRcasboYTcIcnrqnyGP+4g7iS0saM=;
        b=US43uJgALF/PnAWqxcR7vHkIWqfswWA1h4eKdN20FvD6q8TS76GSg9S95mvPjPchm5
         nHcNnMKnzePbByOJTXDBTcBvjGC2v29k1A9jAzEP52pSzKEnqPvRrcyHEK/j2r8tavfL
         Yc1kbPAec9TDSJFMA03KO9ca5H34Xp2TulLtbSbEB1cnAprMhjXks3zBtSwQJqckf6gv
         HYSZKSFcugirb2e7DdsTuKe3oqAbZwqKkN6IPeA964cYihMUbfmBDYNNQsbLHrftiQvu
         WIgL8OYFEjI1modJvSbNqoMQaUp0GENLAMZQLv3jITctkDTDOwJHjjVj4a0XAdyFTkMO
         WvcQ==
X-Gm-Message-State: AOAM530s8TvF6f2aYcQshSrGyFBzKNLv+OdEMBAfkxbnEFxL3dJgSUY9
        z2Y0oJ4uXX19DxZmP+woww==
X-Google-Smtp-Source: ABdhPJxYIp2RMP7zxyazj3uJQQFbnOIC36YrgK8niPIKLJXWsIBoNQw8tuxXOz3jfTvP2id5pJRyPQ==
X-Received: by 2002:a17:906:2a8e:: with SMTP id l14mr14037026eje.321.1630944163976;
        Mon, 06 Sep 2021 09:02:43 -0700 (PDT)
Received: from localhost.localdomain ([46.53.252.172])
        by smtp.gmail.com with ESMTPSA id d22sm4260617ejj.47.2021.09.06.09.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 09:02:43 -0700 (PDT)
Date:   Mon, 6 Sep 2021 19:02:41 +0300
From:   Alexey Dobriyan <adobriyan@gmail.com>
To:     Florian Weimer <fweimer@redhat.com>
Cc:     Linus Torvalds <torvalds@linuxfoundation.org>,
        Segher Boessenkool <segher@kernel.crashing.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        llvm@lists.linux.dev, linux-toolchains@vger.kernel.org
Subject: Re: [GIT PULL v2] Kbuild updates for v5.15-rc1
Message-ID: <YTY7oYPJPYstU1+f@localhost.localdomain>
References: <CAK7LNAQ0Q6CdXaD-dVGj_e3O3JYs_crpejWKpXHYQJYxyk-1VQ@mail.gmail.com>
 <CAHk-=wgoX0pVqNMMOcrhq=nuOfoZB_3qihyHB3y1S8qo=MDs6w@mail.gmail.com>
 <3b461878-a4a0-2f84-e177-9daf8fe285e7@kernel.org>
 <878s0c4vng.fsf@oldenburg.str.redhat.com>
 <20210904131911.GP1583@gate.crashing.org>
 <871r644bd2.fsf@oldenburg.str.redhat.com>
 <CAHk-=wi+XKYN+3u=_fm=ExqpEaHdER0XuKxVauHYVCPKpKR97Q@mail.gmail.com>
 <87a6kq2nze.fsf@oldenburg.str.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87a6kq2nze.fsf@oldenburg.str.redhat.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Sep 06, 2021 at 08:54:13AM +0200, Florian Weimer wrote:
> * Linus Torvalds:
> 
> > On Sat, Sep 4, 2021 at 8:19 AM Florian Weimer <fweimer@redhat.com> wrote:
> >>
> >> In any case, it would be nice to know what the real motivation is.
> >
> > I don't know about the original motivation, but the reason I like that
> > patch after-the-fact is that I've actually been in situations where I
> > test out self-built compilers without installing them.
> 
> Does this really simplify matters?  Why wouldn't the gcc compiler driver
> find cc1, but not be able to pass the right path options, so that the
> include/ subdirectory can be located as well?
> 
> > Then it's convenient to have a completely standalone kernel tree.
> 
> The final patch in the series is here:
> 
>   isystem: delete global -isystem compile option
>   <https://lore.kernel.org/linux-kernel/YQhY40teUJcTc5H4@localhost.localdomain/>
> 
> It's still not self-contained.

What do you mean?

Mainline has 1/3 and 2/3 now:

	c0891ac15f0428ffa81b2e818d416bdf3cb74ab6 isystem: ship and use stdarg.h
	39f75da7bcc829ddc4d40bb60d0e95520de7898b isystem: trim/fixup stdarg.h and other headers

3/3 is stuck in -next:

	https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git/log/?h=for-next

I'm not sure why. If the patch is bad it should be dropped from -next
as well. If it is good, it should be in mainline, otherwise more
compile time failures will happen.

>  And it seems that there has been quite a
> bit of fallout from the removal of <stddef.h>.
> 
> > Nobody cares about things like <stdatomic.h> They are completely
> > irrelevant for the kernel, exactly because we've always just done our
> > own, or used __builtin_xyz() for things.
> 
> Apparently, some people care enough about <stdatomic.h> to prevent its
> use.  I still have not seen an explanation.  Maybe it's because we
> haven't Cc:ed the patch author so far (oops).
> 
> Alexey, why are <stdatomic.h> and <float.h> so special that you called
> them out in your patch?
> 
> If it's about unintended use of libatomic, then maybe we should work on
> a proper compiler option that also works for __atomic builtins and the
> _Atomic keyword.

stdatomic.h isn't magic really. I looked at what gcc here ships and
found these headers. Clearly kernel doesn't want alien stdatomic.h
injections because kernel has their own atomic model.

Kernel doesn't want any floating point shenanigans either.
I think I saw 1 instance of "float" usage but it was harmless (some
macro which is converted to an integer at compile time)

Kernel doesn't want any future stuff either unless vetted.

I can only repeat what I wrote when sending previous versions:
kernel clearly isolates itself from userspace, -isystem merely step in
the same direction.

Other direction (kernel uses what standard says should be available) is
fine in principle but it is not my decision to make. And it is more
painful, just try to s/u8/uint8_t/g and see what happens. Or, worse,

	#define and &&
	#define or  ||

Just try it.

I also want to note that kernel version are slightly incompatible,
but better!

* bool should be a macro (module_param(bool) breaks) but it better
  for everyone if it is a typedef,

* true and false should be macros, but they look better in preprocessor
  output if they are enum.

* SHRT_MAX is of type "int",
  which is silly because typeof(short) != typeof(SHRT_MAX)

Practice of many trivial headers is in general worse for compile times,
because open/read/parse/close can't be faster than global -Dnoreturn=_Noreturn
