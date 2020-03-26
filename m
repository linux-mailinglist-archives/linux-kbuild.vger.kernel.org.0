Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9145A194A48
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2020 22:13:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727937AbgCZVNC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 26 Mar 2020 17:13:02 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:20175 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727884AbgCZVNB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 17:13:01 -0400
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 02QLCux3029921;
        Fri, 27 Mar 2020 06:12:56 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 02QLCux3029921
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1585257177;
        bh=yUWTDQTSG+CELwmMJY3M4PyyjvvHxAi5WzaSE/lWqWs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=02ax5uD7o97ywHVTM+BzqvV5KxZq7HYns7pOohZvn/H/gS5KFk5dbFbsxwdf2UO4S
         1vqgsJtvu7G6cL6QxIOeeAfB7udsm/QfTFmvxTfuFM4wBO/O48Zk7DfzdkY6eJcLqZ
         IYWMLO9qD356FZlV4oG/s8OoRqthhbrehJW26Vcszqfnjt/CzHVWfnd/4452UUWixv
         BUNH6/d9yw/4kHTvTVnv/QzWGiv0H4p/k0G64hu8GCyt6Nv0WvyS4X5BxKhmC981/N
         xLS1cNma8U/X2FiQX7Cf+UbsbUdRi74RlEOVV/aDPSaYzz5d/uHwb4vaz8fAJ8XJJ5
         UsXN64bnn8b1A==
X-Nifty-SrcIP: [209.85.222.43]
Received: by mail-ua1-f43.google.com with SMTP id m18so2713958uap.9;
        Thu, 26 Mar 2020 14:12:56 -0700 (PDT)
X-Gm-Message-State: ANhLgQ1wJy6VNHDmUTF4zoy/Xjou+tK3TCuHIiyX+EJFSOELlH8aBnQ6
        NSvXwmg20K8b+nlWxqc+Wf3RfcAIpcVyzrNXBhE=
X-Google-Smtp-Source: ADFU+vt/pF+IMJk2I2eYB42/QwdxfxYfeO3mcmt/FNF9nUsRTsBXsBiH5xt4Zbky0X6BnYqInbOxR2tZvNrmVUvbcYI=
X-Received: by 2002:a9f:28c5:: with SMTP id d63mr8552249uad.25.1585257175580;
 Thu, 26 Mar 2020 14:12:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200326080104.27286-1-masahiroy@kernel.org> <CAHmME9pnAvgErYkcvvdakvfMY8ZGKfwHHNYzpVtJ913Tgp16CQ@mail.gmail.com>
 <20200326092213.GA100918@gmail.com> <CAK7LNAQ7-wpm+g=cXeJ01vGrO1nVjfP-ornKm=SXoDEn4x+DjQ@mail.gmail.com>
 <CAHmME9qnWWYV+eWVmx2yoADB9oecZKj=UgLkdSHe_=MnxedtSQ@mail.gmail.com>
In-Reply-To: <CAHmME9qnWWYV+eWVmx2yoADB9oecZKj=UgLkdSHe_=MnxedtSQ@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 27 Mar 2020 06:12:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQNx0TxWGCzNM-2JqfEJuyDKnLMcqJv8Be_9_Ty5wv5Lg@mail.gmail.com>
Message-ID: <CAK7LNAQNx0TxWGCzNM-2JqfEJuyDKnLMcqJv8Be_9_Ty5wv5Lg@mail.gmail.com>
Subject: Re: [PATCH v2 00/16] x86, crypto: remove always-defined CONFIG_AS_*
 and cosolidate Kconfig/Makefiles
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Ingo Molnar <mingo@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@alien8.de>,
        Peter Zijlstra <peterz@infradead.org>,
        "H . Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        "David S. Miller" <davem@davemloft.net>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Ingo Molnar <mingo@redhat.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Jim Kukunas <james.t.kukunas@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        NeilBrown <neilb@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Yuanhan Liu <yuanhan.liu@linux.intel.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        intel-gfx@lists.freedesktop.org,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Mar 27, 2020 at 5:46 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On Thu, Mar 26, 2020 at 2:44 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > I collected more Reviewed-by and Acked-by,
> > then pushed this series to
> >
> > git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
> > kbuild-asinstr
>
> But not the version of the penultimate patch that Nick ack'd....

Dropped Nick's Reviewed-by.


-- 
Best Regards
Masahiro Yamada
