Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 628733C1998
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Jul 2021 21:06:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbhGHTJG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 8 Jul 2021 15:09:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230120AbhGHTJF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Jul 2021 15:09:05 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 476DCC061574
        for <linux-kbuild@vger.kernel.org>; Thu,  8 Jul 2021 12:06:22 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id v14so18300493lfb.4
        for <linux-kbuild@vger.kernel.org>; Thu, 08 Jul 2021 12:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6+ObdsFBNceXxQMGRQLsnrEHm6C0Lskp1Geuon+6uw8=;
        b=bq27k7ehTq6PP6GLXwIhD4/bRzbmj/DGO6KYwn7DSNlyDy5iuDsu54K4B885W1VYVb
         U8yXKixUGFYhcXFJk9eY0jQRsjzrEQe9T1yY/vZIf715+544XLHyZreWR/hh5MF9Hy/X
         yU0Y1TPJCIqQd5WtT0KsTKrcChaGafn5YOrPdpyjofJL05W3C4P+nQ4EQ1e3WIZ1SJfa
         7b1VCG0oElp56PfW5ZIMFhSmIN0GnwUypgXmut3Q0g45NJ6w+S3fswk45z2j7ZEeOGNn
         G7yD9Yu/BUAlme72wrplZ2qss8ncByV8Ottx/mzLfLhWN0GcIAoDJmNikJSnDNKWLcjl
         a3WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6+ObdsFBNceXxQMGRQLsnrEHm6C0Lskp1Geuon+6uw8=;
        b=pw2wPOpgloomf6XlOQ1rEerYH6M7uSn/YMl8Bw/grRKw/fpkJIsQyZv+y6XYz7oV+8
         ZIv0il9vB0iuyQ84JKMf8XkYWV/Pc3jmufavLXuY1JBBYV3JoDso++aUgYVyYJmB3vcI
         QTrIkjPmgAb+ihNJpvfpZkefcgh5q5vGMYTwD9XFNGNfQ7cuKVkj7bP5Vu+ODfuy8lrL
         71LjWJFTSbefnHKu8yzGy/93qQ7s71afgLHAzp8I9i1q4K4+nelzQwxEJeKHYxbUjRTM
         iGNTkap0NsCCVywg8nyMIYK2afRyO9G+zYzR6Keb5U0tGbJd5o9RWWb/aOcJHrFie2xu
         OanA==
X-Gm-Message-State: AOAM533oYYEI1y2hHhByotoyZJDkceLR/a0Nzjy9vHH1utLgec+O8A53
        3/2sObHpKl/nKvt2c4oLjG9lLj7piZJePBXOw3GkWA==
X-Google-Smtp-Source: ABdhPJz4LAL596K6alYRyJay2//b2wtiw4hkERI0ktoOb61Rp/LnXvF6gWSEZEvMbdZtMGvKakFM26BpcVZLdEswaGk=
X-Received: by 2002:a19:5f04:: with SMTP id t4mr25643332lfb.297.1625771180373;
 Thu, 08 Jul 2021 12:06:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210707224310.1403944-1-ndesaulniers@google.com>
 <20210707224310.1403944-3-ndesaulniers@google.com> <CAK7LNAR66iE0w4bjpMVEz6W==mnc59MEnRWm1MXrqApP0aE4Qw@mail.gmail.com>
 <CAK8P3a1MW9hYzDT-iL4CpwaJ5NUuQODT3XgheocrnF7496GKFw@mail.gmail.com>
In-Reply-To: <CAK8P3a1MW9hYzDT-iL4CpwaJ5NUuQODT3XgheocrnF7496GKFw@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 8 Jul 2021 12:06:09 -0700
Message-ID: <CAKwvOdnV0j6u84aFrsNW1cfQmEQ4106uhq3dK-pEjSVDmq8pLg@mail.gmail.com>
Subject: Re: [PATCH 2/2] Makefile: drop CROSS_COMPILE for LLVM=1 LLVM_IAS=1
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jul 8, 2021 at 4:45 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Thu, Jul 8, 2021 at 12:23 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > On Thu, Jul 8, 2021 at 7:43 AM 'Nick Desaulniers' via Clang Built
> >
> > We must rely on this behavior of Clang because
> > --target (which is contained in CLANG_FLAGS)
> > must be specified before the Kconfig time.
> > Then, a user can toggle CONFIG_64BIT any time
> > from menuconfig etc.
> >
> > With this in mind, using $(ARCH) as if-else
> > switches is pointless.
> > $(SRCARCH) is the only meaningful input.
> >
> >
> >   else ifeq ($(ARCH),i386)
> >   CLANG_FLAGS    += --target=i686-linux-gnu
> >   else ifeq ($(ARCH),x86)
> >   CLANG_FLAGS    += --target=x86_64-linux-gnu
> >   else ifeq ($(ARCH),x86_64)
> >   CLANG_FLAGS    += --target=x86_64-linux-gnu
> >
> > should be replaced with:
> >
> >   else ifeq ($(SRCARCH),x86_64)
> >   CLANG_FLAGS    += --target=x86_64-linux-gnu
>
> I think we usually only have to provide the architecture
> name, as in "--target=x86_64", though for arm I get a
> warning "clang: warning: unknown platform, assuming
> -mfloat-abi=soft" unless I provide the full triple.

Right, Fangrui also made that suggestion, but for that reason (the
error for various architectures when using 2-component triples) I'd
prefer to just always specify a full triple.  I picked some to have a
starting point; unless they NEED to change, I'll refrain from
modifying them further.

Technically, I think they can have 4 components, not sure why we still
call them a "target triple." I guess I wouldn't be surprised if they
can contain more than 4 components at this point.
-- 
Thanks,
~Nick Desaulniers
