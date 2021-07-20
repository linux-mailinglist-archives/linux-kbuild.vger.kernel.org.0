Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F9133D0321
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jul 2021 22:46:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230375AbhGTT7X (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 20 Jul 2021 15:59:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235119AbhGTThj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Jul 2021 15:37:39 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CB40C061762
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Jul 2021 13:18:15 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id f30so31080347lfv.10
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Jul 2021 13:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A9yhnAOKnkpaIpXwQ4S44wQp2Z5wbSnHNxsdlMsfhZg=;
        b=AkPrJswLeZIna9xYH5/IZ7Y2Iixa+rSYTNzJ/f5zTdwVI5FoEcHarhzMeDCDwwAJOW
         cuFEzaqi6+MLh3aA8xCnACXzvsvlp3dU9g7J7rkKGBk4ksNd/76c/JRmSBSQLN7KHraZ
         aRoyqHGje3w6i2EySEFAhaMdNo8zJPYjziyj7wTIWFSNgsiCN6oihCzLg6Azc0t3hAJN
         bvnOIDX+koQ3nH4EQBRYv/uZfoVyF55xpz7J46jejt5xzdYF3i3c41lePR9gPDYyzfKz
         afnkxLZBeA0bifxPzLD0QpyTpfyQEleZdUrcAXl3xT7YjkJId6anWJs67J+SOmYMCRbA
         HlTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A9yhnAOKnkpaIpXwQ4S44wQp2Z5wbSnHNxsdlMsfhZg=;
        b=BsAXVU4qu98ctDteRcpASLKk3ZOPA/d1UHapivxZKjReM15kSpBDT8w0l06ckkx4kg
         rbkGXy6kH81gkXkDaXZUa3JJinWSw4GGhjc18jm+UOGw15ud7OAlWqzz1t0FYnkTgW/+
         7aQqfOmR0FsFzJpZqeWQDQ+cRVSfNBGJOUwc6K0X1z9QUpEHRb15BKwlHFQKK9hNy9WB
         CF6kNYxtUWt+mfFngGKScIdY13ywjdk1CpyKSQB+LStJ+VvkuNlE5oeVLJVmLrNdMcBd
         4HZ5nCbyp/Nw88zrIKTJkpJjdUKan3Nn6GObkSFmLCWCQOCiNLBSBLImxybkVuBr2rsE
         wVkg==
X-Gm-Message-State: AOAM532QgEEfj5f0IfRaOx8x6jNDsMd3cjpy5PYUZU8sH6yCYdcIwq7X
        eXfTUCRygCjslPLBL2n3CD4/Y1znCxa/Rmi0YyeJDQ==
X-Google-Smtp-Source: ABdhPJySetWCDgaJU6+K2rRIahVT3YVfnnSgHpEEMLcXaFJUGdU2bQU2g+SNnqYrUYICdy5652MEKxCSG6bUd/MJ2i4=
X-Received: by 2002:ac2:59db:: with SMTP id x27mr23163928lfn.547.1626812292943;
 Tue, 20 Jul 2021 13:18:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210708232522.3118208-1-ndesaulniers@google.com>
 <20210708232522.3118208-3-ndesaulniers@google.com> <CAK7LNARye5Opc0AdXpn+DHB7hTaphoRSCUWxJgXu+sjuNjWUCg@mail.gmail.com>
 <CAHk-=wgGxu4_hgzdYpFuKd95SfnkJbPTWAQ9-fMgmMN1Oxs2xQ@mail.gmail.com> <CAK8P3a3=JBQow-Ws6tt81k93aw+OCV5C2CtSWxASkv=iQZPGUw@mail.gmail.com>
In-Reply-To: <CAK8P3a3=JBQow-Ws6tt81k93aw+OCV5C2CtSWxASkv=iQZPGUw@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 20 Jul 2021 13:18:02 -0700
Message-ID: <CAKwvOdm6yK3jK45AV2FULQAw614nfJi17RVAESH+wV11i+pMLw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Makefile: infer CROSS_COMPILE from SRCARCH for
 LLVM=1 LLVM_IAS=1
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jul 20, 2021 at 12:58 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Tue, Jul 20, 2021 at 7:43 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> > On Tue, Jul 20, 2021 at 1:05 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > We do most of the other heavy lifting in this area in Kconfig anyway,
> > why not add that compiler choice?
> >
> > Obviously it would be gated by the tests to see which compilers are
> > _installed_ (and that they are valid versions), so that it doesn't ask
> > stupid things ("do you want gcc or clang" when only one of them is
> > installed and/or viable).
>
> I don't see a good way of making Kconfig options both select the
> compiler and defining variables based on the compiler, since that
> would mean teaching Kconfig about re-evaluating all compiler
> dependent settings whenever the first option changes.

Right, there are many Kconfigs that are predicated on knowing whether
the user is building with gcc vs clang.  We probably could note the
users preference in Kconfig, but we would need to guarantee that we
evaluate that ASAP and before most other Kconfigs were checked.
-- 
Thanks,
~Nick Desaulniers
