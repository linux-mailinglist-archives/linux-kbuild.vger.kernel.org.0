Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8462F194811
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2020 20:58:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728685AbgCZT6X (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 26 Mar 2020 15:58:23 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:41707 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728587AbgCZT6W (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 15:58:22 -0400
Received: by mail-pg1-f193.google.com with SMTP id b1so3432844pgm.8
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Mar 2020 12:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OTZW/xLJ1BGsM+V9a0Wd+8MrhnBqRKDutU8ctncjlHo=;
        b=PcUVhKbSFbaawYyYC8+zR2qy1gp/S0ozs7s298FEoX75NUCNOTOxZpUwkL/2BUIKbU
         1UuJ46D+uHnscvV5NwwYd2RvxJVn1lErDXqA54/Vlor6COuKu6nGflBx5lrs48i7/ZtN
         MDbZWsbZGH13AgWUH7a3rjhfQdyNBesbopTiYcTHUKsDsB1EB38myZ9ZCY0wgMvH9VOK
         OBUFs2yI+vQmfSglrQOEMCEe26acxGIhqKOE3iQE1MkeNugqOljlZIvptYte5zZ3ns2O
         6rZC9FL6Pj9kl42VVhXVFVkdkqfXF7y4ikn8FRIvNTv5uvQg+PZ1lwoNMskxyzJQuqQ6
         Y7Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OTZW/xLJ1BGsM+V9a0Wd+8MrhnBqRKDutU8ctncjlHo=;
        b=Ag7vqQYPuWGd7zfMyvxpakdRgaFMQcovsLsYS6piUTFAmXfue6WAmjC9kH1uF9IIo6
         xj279SLKcwz+PjqbDJ1u3gzKt4wNBNJYzZA1VOh8pk60LBhs3PnZPt18+I82eNf1atRN
         RClg9mkBEke2F9VYwFSoQyl/xzoB4RJprQjY3qUl89b0WMclP8ZE/KDrvZF8myjqBgmB
         RiZVeBvORs9I8WSCoJaxG8REC6d9P9CvWdK0zVCS1lS8Skl9W3sm2NfhvNPGRSKTJS8H
         MkjZ7BYnqeeeqkHjK1hW+8qE+SFDSi2PJ7DYeBswIov0yXbA9t7aqmqS//htqMQxRmYj
         Uc1g==
X-Gm-Message-State: ANhLgQ0w2TnGvaReYFX2HIq671Ddnh3yUd91gRoUGAR6Mx85jl9F4EHz
        RzSBfbmMMmjMjR2wPFSzGlFrmZPIsjUb3QGRCLOR1w==
X-Google-Smtp-Source: ADFU+vv9iYKelWkUk09S1YsFIpTByaYuAZxyhNxkqT/sKiyO5bU/yo1RpcYkW97YrXfQw4yo3szrTepwkZwCv6bwvZA=
X-Received: by 2002:a63:4453:: with SMTP id t19mr9656195pgk.381.1585252699540;
 Thu, 26 Mar 2020 12:58:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200326080104.27286-1-masahiroy@kernel.org> <20200326080104.27286-16-masahiroy@kernel.org>
 <CAKwvOdnG4F6+Ndfj+=BoV6OidJjWS_dYtjvyCEJ6nyxkSQc3rg@mail.gmail.com> <CAHmME9p_N2cpMt20Gf1kWTRnj36nwrceFxEui2MU0kFu3WOdww@mail.gmail.com>
In-Reply-To: <CAHmME9p_N2cpMt20Gf1kWTRnj36nwrceFxEui2MU0kFu3WOdww@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 26 Mar 2020 12:58:06 -0700
Message-ID: <CAKwvOdmLWqVq_EQk2S4FUSUCU7yoppYD4oiL+P7taWoDTyrb9w@mail.gmail.com>
Subject: Re: [PATCH v2 15/16] x86: update AS_* macros to binutils >=2.23,
 supporting ADX and AVX2
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@alien8.de>,
        Peter Zijlstra <peterz@infradead.org>,
        "H . Peter Anvin" <hpa@zytor.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        "David S. Miller" <davem@davemloft.net>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Ingo Molnar <mingo@redhat.com>,
        "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" 
        <linux-crypto@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 26, 2020 at 12:48 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On Thu, Mar 26, 2020 at 11:55 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> > I see four checks for CONFIG_AS_AVX2 in:
> > net/netfilter/nft_set_pipapo.c
> > net/netfilter/nf_tables_api.c
> > net/netfilter/Makefile
> > net/netfilter/nft_set_pipapo_avx2.h
>
> That code isn't in Linus' tree right now is it? Does it make sense for

Indeed, it seems I was grepping in my checkout of -next.

> us to see which subsystem trees (crypto, netfilter, raid, etc) are
> submitted to 5.7? Or would you rather this patchset be rebased now on
> next?

I think rebasing on -next is the way to go.  I usually generate my
patches off of that, though some trees that don't feed into -next are
technically further ahead.

-- 
Thanks,
~Nick Desaulniers
