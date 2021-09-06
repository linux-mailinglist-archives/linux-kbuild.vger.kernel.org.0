Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C7A0401F71
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Sep 2021 20:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236311AbhIFSNC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 Sep 2021 14:13:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243903AbhIFSNB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Sep 2021 14:13:01 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AC87C061757
        for <linux-kbuild@vger.kernel.org>; Mon,  6 Sep 2021 11:11:56 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id y34so14756773lfa.8
        for <linux-kbuild@vger.kernel.org>; Mon, 06 Sep 2021 11:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4/XxjtcwY9C34CiufMPdWiPHxUpCQ41YPVeJpbHXsEo=;
        b=aXJR99ishZmS0NLJzcIl7b22JdllM6L1T9ntyP9veJPfscOLnpuTWz0n9AT48yIZiJ
         cVL0co87uk5nLMDWONfpkQhA7k4EPdq6AwMECAK1GkKY92gZiYCIT+KPe1uPLPTT7xaf
         jzNOTdupwh3hyL1FNCDe1F/OJ5xpmpgQ5eAzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4/XxjtcwY9C34CiufMPdWiPHxUpCQ41YPVeJpbHXsEo=;
        b=lLVIweEDnv2PQmIjfcUb1v2VscxdwOjBcSqRFe6q64bKRggUrHJgsM0BqqX9UrVr5U
         CU2/Y0934K8vlkm4dEnMSj+l2V/iBimkPfR6oKUrZCD4B5na4k72iKA93LbK4xvDTy9b
         ltYjJqUAr7pHszQWBRWtXP8gVSveNeGkw/e5E+1aJpN45LbTjxs0r03p30TY7HYLJvKU
         +T9VQ3ZdEQQOYKLFuJksFrcaP91G6SADvfOuLAHdWIN5qjtiw8tF69M5M/se3dp9esZj
         urZYjNkCAa7Hz2FwFh3a4J3OCNBb0PK5NvF39iNDyGQxUUJ2yWbRIjVOKnoZ1FKh7sol
         ON2A==
X-Gm-Message-State: AOAM531TXqDYxQptQakLs3bihAdRkcW2lVhzIjh4asWlmWKNi2beLJOw
        Lb0WUT0ADWuyX9sMoT7reEzBek0nwbTDro6DpbI=
X-Google-Smtp-Source: ABdhPJzE6QIqRHEfjPvHV17r/BmLURQiuXgZ9E+ts5FmO+xQt/FDzsGRRhBLJ62lSlLAcrEk+ddkfw==
X-Received: by 2002:a05:6512:104c:: with SMTP id c12mr10174234lfb.270.1630951913969;
        Mon, 06 Sep 2021 11:11:53 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id l22sm795481lfc.218.2021.09.06.11.11.51
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Sep 2021 11:11:52 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id h1so12538757ljl.9
        for <linux-kbuild@vger.kernel.org>; Mon, 06 Sep 2021 11:11:51 -0700 (PDT)
X-Received: by 2002:a2e:8185:: with SMTP id e5mr11265751ljg.31.1630951911139;
 Mon, 06 Sep 2021 11:11:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wgoX0pVqNMMOcrhq=nuOfoZB_3qihyHB3y1S8qo=MDs6w@mail.gmail.com>
 <3b461878-a4a0-2f84-e177-9daf8fe285e7@kernel.org> <878s0c4vng.fsf@oldenburg.str.redhat.com>
 <20210904131911.GP1583@gate.crashing.org> <871r644bd2.fsf@oldenburg.str.redhat.com>
 <CAHk-=wi+XKYN+3u=_fm=ExqpEaHdER0XuKxVauHYVCPKpKR97Q@mail.gmail.com>
 <20210904191531.GS1583@gate.crashing.org> <CAHk-=wjc1rxah3xt8mKN=aCxQigjy3-hEf4xh_Y-r=MXAKVrag@mail.gmail.com>
 <20210906154642.GV1583@gate.crashing.org> <CAHk-=wj=WpWO_V86cZH99LgZGBbvdDb4wR26ce5van0hJqjzLA@mail.gmail.com>
 <20210906172701.GX1583@gate.crashing.org>
In-Reply-To: <20210906172701.GX1583@gate.crashing.org>
From:   Linus Torvalds <torvalds@linuxfoundation.org>
Date:   Mon, 6 Sep 2021 11:11:35 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh0MBVfA89WLWnCiSnJ2a=hSAoSxfG-jyf7JJeBDPK3ew@mail.gmail.com>
Message-ID: <CAHk-=wh0MBVfA89WLWnCiSnJ2a=hSAoSxfG-jyf7JJeBDPK3ew@mail.gmail.com>
Subject: Re: [GIT PULL v2] Kbuild updates for v5.15-rc1
To:     Segher Boessenkool <segher@kernel.crashing.org>
Cc:     Florian Weimer <fweimer@redhat.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        llvm@lists.linux.dev, linux-toolchains@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Sep 6, 2021 at 10:30 AM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> But this whole thread is about removing uses of <stdarg.h>, and
> eventually removing the
>   -nostdinc -isystem $(shell $(CC) -print-file-name=include)

Yes.

But your argument against it was based on that past argument of it
being compiler-specific, in ways that are not true any more.

Happily, it clearly is the case that compilers have standardized their
internal implementation of this in ways that means that we actually
_could_ do this for <stdarg.h>.

Exactly the way we do it for pretty much every other header file.

IOW, <stdarg.h> is no longer the special thing it used to be.

We use the compiler intrinsics without the C library header files for
everything else, so doing so for <stdarg.h> seems to actually be a
clarification and improvement.

             Linus
