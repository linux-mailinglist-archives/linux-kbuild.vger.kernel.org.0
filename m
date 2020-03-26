Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AA501947D7
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2020 20:48:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727541AbgCZTsm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 26 Mar 2020 15:48:42 -0400
Received: from frisell.zx2c4.com ([192.95.5.64]:40083 "EHLO frisell.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726067AbgCZTsm (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 15:48:42 -0400
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b86917c3;
        Thu, 26 Mar 2020 19:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
        :references:in-reply-to:from:date:message-id:subject:to:cc
        :content-type; s=mail; bh=i1Ecy+SbHhe+7cdHbf2qrrbPYjU=; b=J0fGwC
        6M53fw1muJ2q5jritKZo3X4sjyIs9VAdPO6ktC+dnet4/NH0/xkO74ccuT/uCmBH
        ke012hoycOoUr5pRlyre24ICid0Dwid7xN5/gCwCrY9r7Yu+E6p8WPC+v6854gVJ
        2Ong6qTb/A8JJ+aPa8F7eINbK3dXyZWzYZiJTfqQdCFwwzWwVf3pV0gkWaS8KH23
        GnkCw+Y5LFA5fAvFmjdszXoItPpFXD/tdRJH9u68Lx5c/NCPRopsH2Dk5BLKqPc/
        lD16Em8aprMX2AMc4uhbHCqf0uWHHnP9oy+ybPHsBaQil62RPNlTHFapjV2txqJ1
        OLPg4KUPGugnF24g==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d6d6ba66 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO);
        Thu, 26 Mar 2020 19:41:14 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id q9so7434657iod.4;
        Thu, 26 Mar 2020 12:48:39 -0700 (PDT)
X-Gm-Message-State: ANhLgQ2DJPP8nlqJbDxXTxoUNUgjxjRO0+aRn76GfRDWf8I1iJ9ejDMA
        q1nUzCBhwsXKPhWzPLjAJIgLN7ME2tRHbEPUs30=
X-Google-Smtp-Source: ADFU+vuKHsBA2DJck9vjtxQQlzpQrEEemrhzFUhdOt5x4tIfSg3P4dh72sKsIDBOeS2Lq1BWtwmgRF1TMvrMFxeMiTY=
X-Received: by 2002:a6b:d012:: with SMTP id x18mr3320426ioa.80.1585252118168;
 Thu, 26 Mar 2020 12:48:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200326080104.27286-1-masahiroy@kernel.org> <20200326080104.27286-16-masahiroy@kernel.org>
 <CAKwvOdnG4F6+Ndfj+=BoV6OidJjWS_dYtjvyCEJ6nyxkSQc3rg@mail.gmail.com>
In-Reply-To: <CAKwvOdnG4F6+Ndfj+=BoV6OidJjWS_dYtjvyCEJ6nyxkSQc3rg@mail.gmail.com>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Thu, 26 Mar 2020 13:48:27 -0600
X-Gmail-Original-Message-ID: <CAHmME9p_N2cpMt20Gf1kWTRnj36nwrceFxEui2MU0kFu3WOdww@mail.gmail.com>
Message-ID: <CAHmME9p_N2cpMt20Gf1kWTRnj36nwrceFxEui2MU0kFu3WOdww@mail.gmail.com>
Subject: Re: [PATCH v2 15/16] x86: update AS_* macros to binutils >=2.23,
 supporting ADX and AVX2
To:     Nick Desaulniers <ndesaulniers@google.com>
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

On Thu, Mar 26, 2020 at 11:55 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
> I see four checks for CONFIG_AS_AVX2 in:
> net/netfilter/nft_set_pipapo.c
> net/netfilter/nf_tables_api.c
> net/netfilter/Makefile
> net/netfilter/nft_set_pipapo_avx2.h

That code isn't in Linus' tree right now is it? Does it make sense for
us to see which subsystem trees (crypto, netfilter, raid, etc) are
submitted to 5.7? Or would you rather this patchset be rebased now on
next?
