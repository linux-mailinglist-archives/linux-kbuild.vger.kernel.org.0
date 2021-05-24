Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A507B38E21F
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 May 2021 10:03:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232347AbhEXIEl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 24 May 2021 04:04:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232266AbhEXIEl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 May 2021 04:04:41 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C9E8C061756
        for <linux-kbuild@vger.kernel.org>; Mon, 24 May 2021 01:03:13 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id z130so14422607wmg.2
        for <linux-kbuild@vger.kernel.org>; Mon, 24 May 2021 01:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=r1MKnvZ6A/JoCs5aUiOd4Aom1NuletnEZa+phzDnz5M=;
        b=X1/dQWoPBV5rYZo35v4oSYZmM96aocbipBey7dGJEdpLl///Dtl0Q5Y9+YvTIXf6hW
         Wd02NxeqdIlKUKtQi0ZVil0bvKImEbqf/dIqzkrewLjb5iXWR9TpR2UmEKkmMvLhzlJi
         nb8tDjCjD01v9mKbpSAmwuVRFnUzLzmgtKWFHpoUfhBfvMlaUQQ2Jn5U+0bxpSe1SRO6
         9A+eTiDgC6dRIbMyhOUGfwQAEdUfiT2h2CeEdD/56NqnmJyWT5S/mAZ2cv9MV20GHkel
         MuLXaB9fbnKd9W4Zw6taLe4xZTpO2u5t8NYvNTN6nhsgY6cqmdFU4K+LBiQ4zvidgHZd
         XvUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=r1MKnvZ6A/JoCs5aUiOd4Aom1NuletnEZa+phzDnz5M=;
        b=nAmgPL/9SgB2EMUuB/vZpPTXPenNgtDITYoo9jdf4DH9rVeJ11mFMAmEgX32xbysLg
         BJbAbOcnFVlYsZWZ89K5ziBwVhbzTi83CXrb6s/rf9svVyzg/dbgWDH6iC/GSPbiwgME
         LWqi7+ecJodAFVkvQ87xKyiAxwUZXhUgU/e257eoxO5ZvVppz5wLhh8hb5zppd9eynVD
         NXfOCbOJ1gbEata5rjGVQADWazRM6AJs8BOY7byd4YsRVVFqGDy+nneJPiNLPgNC7EW2
         55QsMdEY75x08gOCzmKJHzYcX49Db+iVvbgwNVZ1azZC9RegSW9PXCJHOLH0yiNVEm0n
         vwjg==
X-Gm-Message-State: AOAM530/+WtFce/s7/AP1cPnwCkpTPh5pIF8hTyP7x67RBRilyShEQhk
        Gp54DOV+6lSMKLWTqzOXGEFAEw==
X-Google-Smtp-Source: ABdhPJzIQXFWcFfr5Y+IlsHJjhYafYThK6faqxY8JbqLqAZiiNXK/BvqIFilS1tXTvhsYkqkaot+Bw==
X-Received: by 2002:a05:600c:4ecb:: with SMTP id g11mr19311104wmq.46.1621843392021;
        Mon, 24 May 2021 01:03:12 -0700 (PDT)
Received: from dell ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id 10sm7186159wmi.7.2021.05.24.01.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 01:03:11 -0700 (PDT)
Date:   Mon, 24 May 2021 09:03:09 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Fangrui Song <maskray@google.com>,
        Elliot Berman <eberman@quicinc.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Peter Collingbourne <pcc@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Makefile: fix GDB warning with CONFIG_RELR
Message-ID: <20210524080309.GK2549456@dell>
References: <20210319000708.1694662-1-ndesaulniers@google.com>
 <20210323190532.eiqxmskiankf7hn3@archlinux-ax161>
 <CAF2Aj3i3-bev_iS6OrBUTzt==4d0f7UiTeY1YPur6eKFqToFYQ@mail.gmail.com>
 <CAK7LNAS_LpZnweujqVwZ1kL0eDYR726k35U_yx1djqNE0bk6Rw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAS_LpZnweujqVwZ1kL0eDYR726k35U_yx1djqNE0bk6Rw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, 22 May 2021, Masahiro Yamada wrote:

> On Fri, May 21, 2021 at 6:36 PM Lee Jones <lee.jones@linaro.org> wrote:
> >
> > On Tue, 23 Mar 2021 at 19:06, Nathan Chancellor <nathan@kernel.org> wrote:
> >>
> >> On Thu, Mar 18, 2021 at 05:07:06PM -0700, Nick Desaulniers wrote:
> >> > GDB produces the following warning when debugging kernels built with
> >> > CONFIG_RELR:
> >> >
> >> > BFD: /android0/linux-next/vmlinux: unknown type [0x13] section `.relr.dyn'
> >> >
> >> > when loading a kernel built with CONFIG_RELR into GDB. It can also
> >> > prevent debugging symbols using such relocations.
> >> >
> >> > Peter sugguests:
> >> >   [That flag] means that lld will use dynamic tags and section type
> >> >   numbers in the OS-specific range rather than the generic range. The
> >> >   kernel itself doesn't care about these numbers; it determines the
> >> >   location of the RELR section using symbols defined by a linker script.
> >> >
> >> > Link: https://github.com/ClangBuiltLinux/linux/issues/1057
> >> > Suggested-by: Peter Collingbourne <pcc@google.com>
> >> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> >>
> >> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> >
> >
> >  Masahiro,
> >
> > Would you mind sharing your plans for this reviewed patch please?
> 
> 
> Do you want me to pick up this?
> 
> Or, do you think it should be done by the committer of
> 5cf896fb6be3effd9aea455b22213e27be8bdb1d ?

Not sure it matters a whole bunch TBH.  If you have the bandwidth and
are willing to merge it, please feel free to do so.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
