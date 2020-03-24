Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4225191761
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Mar 2020 18:17:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727257AbgCXRRS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Mar 2020 13:17:18 -0400
Received: from frisell.zx2c4.com ([192.95.5.64]:56245 "EHLO frisell.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727223AbgCXRRS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Mar 2020 13:17:18 -0400
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1c5cebc9;
        Tue, 24 Mar 2020 17:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
        :references:in-reply-to:from:date:message-id:subject:to:cc
        :content-type; s=mail; bh=DhTaC0p0jO4cL4z/my6GjFo2Zwk=; b=0sDFVo
        8RX/48dqq7bcu0DjCkiRd8uYMGVIbzVoBXlWvK9w2/3T8dPlf1E9VjNDahJvTyk4
        HMhEzp13dN6iVASsVL9FVjQ1q1GmadB9/8ZQC7X5wOaOR8iiaxhHuf0s8ztV9c6p
        CHrISGrikhpVv5wXP/yJsBz8LjXjnyr0hrGztN6T+T0EZKlyv7I3K94JzR3IJVVa
        e0wPUHkQNtq++UwGPhvDf1F2o9uKHBE+oVWnpbuulMDgQjxpqxb6z/PcLZLpbK1f
        aDY76FGmChvVX308/NKuSISxwOFlGA1N1pyo07KK7a9GBK/rmMPBRi5d7zOFzU6s
        7J5M8CVXG/R0NpVw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 63d78b98 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO);
        Tue, 24 Mar 2020 17:10:05 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id m7so13396645ilg.5;
        Tue, 24 Mar 2020 10:17:14 -0700 (PDT)
X-Gm-Message-State: ANhLgQ0rC39iqkMlvA1q40E+LDC/Mphv6gNR2gBVvwRd+TY31/Eu3l69
        QSGyS/u46lVBu0Us671f6mZuiuIFY7p0qDWQCYE=
X-Google-Smtp-Source: ADFU+vvq6QHYBsYQUIfTGwSCF2bT4P+yYt7YDtnQ2NvIIx1389odToJpAzQytqGAvEdM+gxfjq2azQWNorXcO8ZDt9Q=
X-Received: by 2002:a92:cd4e:: with SMTP id v14mr28304232ilq.231.1585070233190;
 Tue, 24 Mar 2020 10:17:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200324084821.29944-1-masahiroy@kernel.org> <20200324084821.29944-12-masahiroy@kernel.org>
 <CAKwvOdkj3dDNcbY4hwyManfviPdFoBooJJmFOAKL2YJCZNuhtA@mail.gmail.com>
In-Reply-To: <CAKwvOdkj3dDNcbY4hwyManfviPdFoBooJJmFOAKL2YJCZNuhtA@mail.gmail.com>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Tue, 24 Mar 2020 11:17:02 -0600
X-Gmail-Original-Message-ID: <CAHmME9pV93Zey2=XghxzThTHbZarFrnxwnGatXHyQjevPf7R=g@mail.gmail.com>
Message-ID: <CAHmME9pV93Zey2=XghxzThTHbZarFrnxwnGatXHyQjevPf7R=g@mail.gmail.com>
Subject: Re: [PATCH 11/16] x86: probe assembler capabilities via kconfig
 instead of makefile
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
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

On Tue, Mar 24, 2020 at 11:01 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Can 11 just be rebased with 8 dropped?

8 adds comments to one place. 11 moves them to another place, while
doing other things.

Your desire is to skip the first step? I guess there's no problem with
this, but I'm curious to learn why.
