Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FB602FF00F
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Jan 2021 17:21:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732141AbhAUQVl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 21 Jan 2021 11:21:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726574AbhAUQVQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Jan 2021 11:21:16 -0500
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02C28C061756;
        Thu, 21 Jan 2021 08:20:36 -0800 (PST)
Received: by mail-io1-xd2e.google.com with SMTP id u17so5138823iow.1;
        Thu, 21 Jan 2021 08:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=s5ioEialcPghhwYMEAzTyJUkH/AuGrrjAPbLEmiPOmA=;
        b=K+i9De1+0/AkY7DBtIlkJZK25ohudC1lVuRYF1Z6/dZFXwrazgV64k5wk5T0eo9bqM
         87rmLWVDCf9L20IE3Rwo4ljC5Bb2DzowliW/wbCU0M3LpO57MQvYLqzz20562+bdbIA6
         aG0joPrharX5N94cp48ktNLYUWD17Zyf2hIwsi5hD2SceCtUznuofBduBKjBSunVVPRK
         CUNNGl7edYMTEIVvFhJcG9IQZiIAEUOmrZkZijfWNf5NhvX4zcKzsVE2vNqpqe3fi143
         YBq6VWlnEht6RX5l1MoAIRWyaFmOdtUiVShBk0/fB+lTZ2xnyc3FdH9LdxHS+5XXvKyC
         db0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=s5ioEialcPghhwYMEAzTyJUkH/AuGrrjAPbLEmiPOmA=;
        b=kB+tH6jYhAW/qnZd+AOSQi4hYyEErR5NmRLJf1zgSEfACwl5h7nhz44LMiqiG5brKL
         05k8EXm3+JInJq3hN6OJICocibwof6hNJ7VGSow0kgmaH3UjRRs3LQcUoCT/xljBhBOz
         bwL8/WPCKKuMbkR0XZ6iGZYIHE5AnUbDpxwowQndXtZkSDUJ75Fx/BLwfaCrhTO5Bzr1
         OKjTSl9VdbvmrdcWBeI1Ls0G4lL+7g5ol2Nto7DZ4eHP2TCeShW1BycctHcJCci72d+J
         VBd+itIwwqWgHQM9GpA9DJoCo7S42/ENYcbVBWPqr4tc06oUaYPqyPgKNC2eIVOoS2pv
         mAow==
X-Gm-Message-State: AOAM5332Nt01TLrzrtVphMwUtMVGtsDoCDpCqrgkznGcRsTLGFF5fo3F
        iFRqOOIwFA1EDD9h+nppe3b3TM16PYK3eeMSyqE0pPuMyhopHa49
X-Google-Smtp-Source: ABdhPJyHlhtzbpWJkSohXFyxniXGmLQeTxR0Q60zG4XbeIWQ9LfdGeUBVwR6r85dVxewQCzImcwHQwwqvpLjrxaD7Z0=
X-Received: by 2002:a92:c5c8:: with SMTP id s8mr447401ilt.186.1611246035407;
 Thu, 21 Jan 2021 08:20:35 -0800 (PST)
MIME-Version: 1.0
References: <20210121160115.4676-1-lukas.bulwahn@gmail.com> <20210121161640.GA1101379@ubuntu-m3-large-x86>
In-Reply-To: <20210121161640.GA1101379@ubuntu-m3-large-x86>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Thu, 21 Jan 2021 17:20:23 +0100
Message-ID: <CA+icZUU8Oh03L2t39g1H3dOWQZF0iXZ=FSgPdsi_ZjZnFmGEAw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: adjust to clang-version.sh removal
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        Joe Perches <joe@perches.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Pia Eichinger <pia.eichinger@st.oth-regensburg.de>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jan 21, 2021 at 5:16 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Thu, Jan 21, 2021 at 05:01:15PM +0100, Lukas Bulwahn wrote:
> > Commit 6c8ad4427f6e ("kbuild: check the minimum compiler version in
> > Kconfig") removed ./scripts/clang-version.sh and moved its content to
> > ./scripts/cc-version.sh.
> >
> > Since then, ./scripts/get_maintainer.pl --self-test=patterns complains:
> >
> >   warning: no file matches    F:    scripts/clang-version.sh
> >
> > The CLANG/LLVM BUILD SUPPORT section in MAINTAINERS intends to track
> > changes in ./scripts/clang-version.sh; as the file is removed, track
> > changes in ./scripts/cc-version.sh instead now.
> >
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > ---
> > applies cleanly on next-20210121
> >
> > Masahiro-san, please pick this quick fix-up patch.
>
> Masahiro cannot pick this up because the patch to add clang-version.sh
> to MAINTAINERS is in mmotm.
>
> I think the better solution is for Andrew to drop the current version of
>
> maintainers-add-a-couple-more-files-to-the-clang-llvm-section.patch
>
> and pick up the second one I sent, which allows us to deal with this:
>
> https://lore.kernel.org/lkml/20210114171629.592007-1-natechancellor@gmail.com/
>
> I am not sure it is right for us to maintain cc-version.sh but I am open
> to it if Masahiro agrees.
>

Sounds like a good idea to integrate both patches from Lukas and
Nathan into a new version of "kbuild: check the minimum compiler
version in Kconfig".
...up to the maintainers.

- Sedat -

> >  MAINTAINERS | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index e5d7cf38ec82..aafbea806a82 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -4355,8 +4355,8 @@ B:      https://github.com/ClangBuiltLinux/linux/issues
> >  C:   irc://chat.freenode.net/clangbuiltlinux
> >  F:   Documentation/kbuild/llvm.rst
> >  F:   include/linux/compiler-clang.h
> > +F:   scripts/cc-version.sh
> >  F:   scripts/clang-tools/
> > -F:   scripts/clang-version.sh
> >  F:   scripts/lld-version.sh
> >  K:   \b(?i:clang|llvm)\b
> >
> > --
> > 2.17.1
> >
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210121161640.GA1101379%40ubuntu-m3-large-x86.
