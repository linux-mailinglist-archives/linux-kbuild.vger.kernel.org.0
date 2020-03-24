Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FEF3191786
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Mar 2020 18:22:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727231AbgCXRWS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Mar 2020 13:22:18 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:51052 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727223AbgCXRWS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Mar 2020 13:22:18 -0400
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 02OHM8hB027872;
        Wed, 25 Mar 2020 02:22:08 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 02OHM8hB027872
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1585070529;
        bh=bPCRwIwldAM4HwybdFdRYHiHqpgNqlDdX4WV8XKCpgQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=AAffemBMcj/pRI1GXSqDaRqeVNwXvSgGAJMx5lv0WUkBJKpxHMQEFBTQ0dSb77Th9
         T/lQ+GowmCoBmXu38B/OVfdN0YCzrB3mzSJM3oGZa8d0WQjoGs70HLz8NIu2WXJZcs
         E7W81ziHmBmRtUTjyDJ2qQVpf0aR8G3kQGjPxyZpxf7Buqhfkq9xH5p+VVCouwqSW3
         JcxYssSq/v1DpR8KH3LS+FGPkl6DH+jKdw1xVaiPpLmu6GHcecjAn47x2SGZ3yJmvp
         LMIpasWLGNKKsw5JHg5NblRyu1gd5qTxrZLTkxmoTX95kayf4As7oMIQ/99DjdU4Mh
         WPjtDq4IqCNeQ==
X-Nifty-SrcIP: [209.85.217.48]
Received: by mail-vs1-f48.google.com with SMTP id s10so3220589vsi.9;
        Tue, 24 Mar 2020 10:22:08 -0700 (PDT)
X-Gm-Message-State: ANhLgQ3iI96xpUmSzkHLCOxQaJ1liDtLFrKe2XoX0rTcCieB70Grg8Eb
        vbxIPgG9glyydn5w3ive4YoH+iE7SARCXmYKYNA=
X-Google-Smtp-Source: ADFU+vtUc5X8HF0cd25yHwBLsXgCCmhP5dTghG8L4rR7TJM9y01vynxbjz5/o6OhEUXD89jZqGHaOyPYng8JpiRE1WA=
X-Received: by 2002:a67:8745:: with SMTP id j66mr19305626vsd.181.1585070522434;
 Tue, 24 Mar 2020 10:22:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200324084821.29944-1-masahiroy@kernel.org> <20200324084821.29944-12-masahiroy@kernel.org>
 <CAKwvOdkj3dDNcbY4hwyManfviPdFoBooJJmFOAKL2YJCZNuhtA@mail.gmail.com> <CAHmME9pV93Zey2=XghxzThTHbZarFrnxwnGatXHyQjevPf7R=g@mail.gmail.com>
In-Reply-To: <CAHmME9pV93Zey2=XghxzThTHbZarFrnxwnGatXHyQjevPf7R=g@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 25 Mar 2020 02:21:26 +0900
X-Gmail-Original-Message-ID: <CAK7LNATV4GeDDYwecZWNH7xxikZjY2VFZ3EYgXAbnbbVsVM+MQ@mail.gmail.com>
Message-ID: <CAK7LNATV4GeDDYwecZWNH7xxikZjY2VFZ3EYgXAbnbbVsVM+MQ@mail.gmail.com>
Subject: Re: [PATCH 11/16] x86: probe assembler capabilities via kconfig
 instead of makefile
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        LKML <linux-kernel@vger.kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" 
        <linux-crypto@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@alien8.de>,
        Peter Zijlstra <peterz@infradead.org>,
        "H . Peter Anvin" <hpa@zytor.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Mar 25, 2020 at 2:17 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On Tue, Mar 24, 2020 at 11:01 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > Can 11 just be rebased with 8 dropped?
>
> 8 adds comments to one place. 11 moves them to another place, while
> doing other things.
>
> Your desire is to skip the first step? I guess there's no problem with
> this, but I'm curious to learn why.

If desired, I will swap the order of 8 and 11.


-- 
Best Regards
Masahiro Yamada
