Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E822446DD0
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Nov 2021 13:06:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232950AbhKFMJQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 6 Nov 2021 08:09:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:39614 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234159AbhKFMJQ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 6 Nov 2021 08:09:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2182461262
        for <linux-kbuild@vger.kernel.org>; Sat,  6 Nov 2021 12:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636200395;
        bh=E8mGUt7qMEfod+3mEBTBVj0l2VZLSbPSY14cfZbCbcI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=rfV7+kcvru4aiTO7RLcxIFewToljwyB3yn6Ciu2r+ST0S6EmxgYwCgvYRfRUpK6c+
         /sD8SZAgTEj/NhrcqewQxY8QNFer9E8Gy5BMFMOaZQdlJEVwqUcjJZX/dQNc6CdxIG
         5yTEwrPDcPDMxB0rb5t51k1PC922BLXEX7/H77MsoD1XEmtJj4cEzplVpoQF5XXnkT
         z+lfd+RrJWs34e8Gu3rrFQVt2O0v2Td8OEdZN/Atw9SHuOvki5ksExNkKGAp25ox+Y
         RfOSyyazBjG9rt2ZUyWHQWZKtbBiNvXx1GM9cc7S4T1XC/gogEvTd6nKbAx2viv6j8
         rexG+ngHLjzSQ==
Received: by mail-ot1-f49.google.com with SMTP id v40-20020a056830092800b0055591caa9c6so17268476ott.4
        for <linux-kbuild@vger.kernel.org>; Sat, 06 Nov 2021 05:06:35 -0700 (PDT)
X-Gm-Message-State: AOAM533VnI82P+XGYwq2oUrTv9w3iyjEQUKVoPik84S0L5UrZK3Hp1nP
        3EV3dmVnZGZ4XCw6d3epQnU7hXZnKFyCn7pi+yg=
X-Google-Smtp-Source: ABdhPJwocrfRFSy+Asr9pyulD0uif2K7Zw5shjjFYfqx4VLF9zEi35vF19qhrB+3K8gu2JO5TW9ezE/IVd8KIifVb/0=
X-Received: by 2002:a9d:830:: with SMTP id 45mr24428863oty.112.1636200394394;
 Sat, 06 Nov 2021 05:06:34 -0700 (PDT)
MIME-Version: 1.0
References: <560695744.1785825.1636169664203.ref@mail.yahoo.com>
 <560695744.1785825.1636169664203@mail.yahoo.com> <CAK7LNASUeUxDcfA-C9vFC6y7J=YzO7K7RbS99mxGguAFwKhTnA@mail.gmail.com>
In-Reply-To: <CAK7LNASUeUxDcfA-C9vFC6y7J=YzO7K7RbS99mxGguAFwKhTnA@mail.gmail.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Sat, 6 Nov 2021 13:06:23 +0100
X-Gmail-Original-Message-ID: <CAMj1kXH=R45ovS43z9uDMJsMKwwv9E8M2LwKYmY7W4jNF6_sBg@mail.gmail.com>
Message-ID: <CAMj1kXH=R45ovS43z9uDMJsMKwwv9E8M2LwKYmY7W4jNF6_sBg@mail.gmail.com>
Subject: Re: Given an x32 userspace with a gcc to match (ie defaults to -mx32)
 then CONFIG_EFI_STUB is unavailable
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Seed Of Onan <seedofonan@yahoo.com>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, 6 Nov 2021 at 12:35, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Sat, Nov 6, 2021 at 12:34 PM Seed Of Onan <seedofonan@yahoo.com> wrote=
:
> >
> > Note that everything else about configuring, building, and executing th=
e kernel that results works great.
> >
> > The trouble appears to be because of the dependency test under CONFIG_E=
FI_STUB has $(cc-option,-mabi=3Dms) and (looking at that macro's definition=
 in scripts/Kconfig.include) CLANG_FLAGS doesn't have -m64 (but certainly i=
t is getting onto the command line of each invocation of gcc some other way=
) and gcc errors when combining -mabi=3Dms with (in this case defaulted) -m=
x32.
> >
> > I'm figuring that although it could be done in principle, the gcc folks=
 would object to establishing a meaning to the -mabi=3Dms calling conventio=
n for x32 primarily because Microsoft doesn't support that and the "ms" her=
e stands for "Microsoft", I presume.
> >
> > In any case, what do you think? Shouldn't the cc-option macro be more c=
omplete -- if "-m64" is being added because the build config system knows t=
hat it is needed, then it should be included in the command line used by cc=
-option macro? Perhaps the "-m64" happens to be in the same environment var=
iable as the "-mabi=3Dms" part, in which case couldn't instead one just cha=
nge the dependency test to be like $(cc-option,-m64 -mabi=3Dms)?
> >
> > Or am I missing the mark and there's a better fix in another place?
> >
> > Please help. Thank you,
> > -Gary
> >
>
>
>
> I was not invoked in anyway in the following commit.
>
> commit 8f24f8c2fc82f701866419dcb594e2cc1d3f46ba
> Author: Ard Biesheuvel <ardb@kernel.org>
> Date:   Tue Dec 24 16:10:12 2019 +0100
>
>     efi/libstub: Annotate firmware routines as __efiapi
>
>
>
> I added Ard to Cc.
>
>
>
> At least, please describe your problem properly.
> What error did you get? How to reproduce it?
>

IIUC, the issue is in

config EFI_STUB
       bool "EFI stub support"
       depends on EFI && !X86_USE_3DNOW
       depends on $(cc-option,-mabi=3Dms) || X86_32

where the cc-option check is failing due to the use of -mx32 for the
core kernel, whereas the EFI stub will be built with -m64 regardless.

Given that __attribute__((ms_abi)) should be supported on any GCC
versions 4.8 or newer, I think we can just drop this depends line
entirely. Would that solve your issue?
