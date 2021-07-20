Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE13D3D03C8
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jul 2021 23:17:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231549AbhGTUgL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 20 Jul 2021 16:36:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236169AbhGTUbB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Jul 2021 16:31:01 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF98DC061767
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Jul 2021 14:11:35 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id i5so68803lfe.2
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Jul 2021 14:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+VH/k2Wu9OUzA+EFcoMXodKgYXPRRgkgoLXFJfyCQtg=;
        b=XQbW4ZTf4eyK0pcFhApesUyXYPwBkXuG/ohBnhGpoxLsk3GjHVQ542pybZ34Ltq4Jq
         F5ScMrJEhILuheA7is0ByrzWo1rymV+PX3RDQcCzZJsJKMfJwYBxmwShbtUcgFL97//n
         zRd6nn2NgIhGJDwTtPzrFjb7Ap7QRfIxiTd5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+VH/k2Wu9OUzA+EFcoMXodKgYXPRRgkgoLXFJfyCQtg=;
        b=VJ73doM26mUHWO4kh7Kd8ioJe5yriAhjSzll6luG2JuayKO7SNfaPIcv7dkogYSkmG
         GZLSK9oev9HRnuSFTSeiDIbBFLwKN3z71py+AM6054UXsFpvWGXOU3sCTgcxbpMnCl3N
         QFyDDAwr1zffhsvp+xnWnobbPQvsmgr0lPNR6Nhk93Mwg+YlO9FHG83W7uZ89eulDUBQ
         B+O0QczrEVFa9T6C5HY1AtHU8XVgFcbONg801pG6JDJ5k5HhnnE2ri435bwsJvGDtyVu
         E31kZqsFF0APuVo9RSLhCPf7oQkcbfegiFqYhYTnuZbT9FLE62mG4IEk7fC3XgqjSAzh
         4XZw==
X-Gm-Message-State: AOAM532ldFnX0XzcOQCuIxLvTfsujUbRcyLa4i5tnJpNtMdFGVdHI4md
        BwzNf1QEdiAhVWz8pW7HIpG2vu4pjhXWusZF
X-Google-Smtp-Source: ABdhPJwPtw9UmuQeDEr+W2lSI/XDWT6s7nXwkLyP950h1jx0ZudlLZF0VdyuZtwC7PTIE28PaX6TsA==
X-Received: by 2002:ac2:4e09:: with SMTP id e9mr4598614lfr.431.1626815493961;
        Tue, 20 Jul 2021 14:11:33 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id u9sm593668lfc.278.2021.07.20.14.11.32
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jul 2021 14:11:32 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id q16so47991lfa.5
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Jul 2021 14:11:32 -0700 (PDT)
X-Received: by 2002:a05:6512:3f82:: with SMTP id x2mr21979284lfa.421.1626815492489;
 Tue, 20 Jul 2021 14:11:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210708232522.3118208-1-ndesaulniers@google.com>
 <20210708232522.3118208-3-ndesaulniers@google.com> <CAK7LNARye5Opc0AdXpn+DHB7hTaphoRSCUWxJgXu+sjuNjWUCg@mail.gmail.com>
 <CAHk-=wgGxu4_hgzdYpFuKd95SfnkJbPTWAQ9-fMgmMN1Oxs2xQ@mail.gmail.com> <CAKwvOdn065OJpow=7VF=ujagFoyN4sYMKAA_E2_39ZC7uThchg@mail.gmail.com>
In-Reply-To: <CAKwvOdn065OJpow=7VF=ujagFoyN4sYMKAA_E2_39ZC7uThchg@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 20 Jul 2021 14:11:16 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjDdDPDa6mfoC-QM=NZULsmQfcUbF2RdwMq0J4Ztm+UAw@mail.gmail.com>
Message-ID: <CAHk-=wjDdDPDa6mfoC-QM=NZULsmQfcUbF2RdwMq0J4Ztm+UAw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Makefile: infer CROSS_COMPILE from SRCARCH for
 LLVM=1 LLVM_IAS=1
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@kernel.org>,
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

On Tue, Jul 20, 2021 at 1:52 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> >     -CC = $(CROSS_COMPILE)gcc
> >     +CC = $(CROSS_COMPILE)clang
>
> So you haven't been using LLD... :( (imagine using more than one
> thread to link, and being faster than ld.gold)

I started out just building my own clang - nothing else.

And now that I'm using the distro clang, the linker isn't even _close_
to a performance issue. Since clang is a big, slow, bloated pig.

I posted profiles and performance numbers of clang being three times
slower than gcc, and it was all just clang itself, not the linker. All
due to insanely expensive startup costs.

I suspect a lot of clang users build bloated C++ code where the time
to compile a single object file is so big that the startup costs don't
even show up. But for the (fairly) lean C kernel header files that
don't bring in millions of lines of headers for some template library,
startup costs are a big deal.

So honestly, I don't care at all about "imagine being faster than ld.gold".

I can only _dream_ of clang itself not being 3x slower than gcc.

              Linus
