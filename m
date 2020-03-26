Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DA641947F5
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2020 20:54:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727851AbgCZTyA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 26 Mar 2020 15:54:00 -0400
Received: from frisell.zx2c4.com ([192.95.5.64]:34917 "EHLO frisell.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727560AbgCZTyA (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 15:54:00 -0400
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e7128844;
        Thu, 26 Mar 2020 19:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
        :references:in-reply-to:from:date:message-id:subject:to:cc
        :content-type; s=mail; bh=f1lz/GYg7MmJePg+lVSsCStJm3U=; b=wqxyOy
        NeaYX7S/Bf3CiXu6WxweGGWX1Hfa4F0YCmVxtZZenj6BFaEHcT/FL+g2VXrlWpjp
        WT22EOvuNl095TFGcln/LNho4QnbNf4lIL7ilDO0aXIMYwBHqoGaqvij8vUuQdjw
        tZDMhZHoN/evmNLuyINgvEGnxU7pjbS0slvQPhI8K94LyCMTL5O//nkpc0WXsDkD
        5WDnNmI+SPwByl17mhH1Sbn3lAjpat2VMgDZHpMdAmK5bTT25g8OVj3S71RJc5Y2
        hE+E0XLV5QnlcbIkD3yqZFvLcn0DKOSni0/9AsUO9tXyZ/wXVzJu9lZ/4wbp61QE
        UBZIuyHD4moYKtYg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f3fb72b3 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO);
        Thu, 26 Mar 2020 19:46:32 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id 7so6624794ill.2;
        Thu, 26 Mar 2020 12:53:57 -0700 (PDT)
X-Gm-Message-State: ANhLgQ3bTj0XaIl73u2eFyaAYfd8mthlqRj0Rax669Wmi93WAvLoGLse
        w766mjjKEA78EU9HpXBp/NZ7OPIzahVoqFEaOPk=
X-Google-Smtp-Source: ADFU+vvmm3DgmItvaRXrVSSTSPN3EV2Lxto5YPkj/t2SJndqzbHfmaLbH/lj09YNUmXjFkl/j8dGix5cOzXToO3VP9U=
X-Received: by 2002:a92:798f:: with SMTP id u137mr7565295ilc.231.1585252436484;
 Thu, 26 Mar 2020 12:53:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200326080104.27286-1-masahiroy@kernel.org> <20200326080104.27286-11-masahiroy@kernel.org>
 <CAKwvOdk=MCePWHD=Kj3K7fD0y8TBZfiFLB0X+gnhPUd=RnrH6A@mail.gmail.com>
In-Reply-To: <CAKwvOdk=MCePWHD=Kj3K7fD0y8TBZfiFLB0X+gnhPUd=RnrH6A@mail.gmail.com>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Thu, 26 Mar 2020 13:53:44 -0600
X-Gmail-Original-Message-ID: <CAHmME9oD7DVSGVkWv2jAyr5eZUy2Ac+MWzss5dhKEmG3hq6AFg@mail.gmail.com>
Message-ID: <CAHmME9oD7DVSGVkWv2jAyr5eZUy2Ac+MWzss5dhKEmG3hq6AFg@mail.gmail.com>
Subject: Re: [PATCH v2 10/16] x86: probe assembler capabilities via kconfig
 instead of makefile
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@alien8.de>,
        Peter Zijlstra <peterz@infradead.org>,
        "H . Peter Anvin" <hpa@zytor.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Ingo Molnar <mingo@redhat.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 26, 2020 at 11:49 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Thu, Mar 26, 2020 at 1:02 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > From: "Jason A. Donenfeld" <Jason@zx2c4.com>
> >
> > Doing this probing inside of the Makefiles means we have a maze of
> > ifdefs inside the source code and child Makefiles that need to make
> > proper decisions on this too. Instead, we do it at Kconfig time, like
> > many other compiler and assembler options, which allows us to set up the
> > dependencies normally for full compilation units. In the process, the
> > ADX test changes to use %eax instead of %r10 so that it's valid in both
> > 32-bit and 64-bit mode.
>
> Does KConfig generate -D<foo> flags for KBUILD_CFLAGS and KBUILD_AFLAGS?

kconfig sticks everything it's got into include/generated/autoconf.h.
That's how you're able to use all those #ifdef CONFIG_* macros
already. This change moves things from a command line -D to the
autoconf.h file.

> Looks like lib/raid6/test/Makefile also generates some of these?

raid6 has its own crazy thing going on. The test directory compiles
that code for use in userspace. You might argue that its whole
situation is non-standard and weird and should be reworked
differently, but that seems like fodder for a different patchset on
the linux-raid list.
