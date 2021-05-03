Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DAF637134A
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 May 2021 11:58:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233166AbhECJ7I (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 3 May 2021 05:59:08 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:58481 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232964AbhECJ7I (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 May 2021 05:59:08 -0400
Received: from mail-wm1-f48.google.com ([209.85.128.48]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mum6l-1lKsOT1GhX-00rnLh; Mon, 03 May 2021 11:58:14 +0200
Received: by mail-wm1-f48.google.com with SMTP id t11-20020a05600c198bb02901476e13296aso3180621wmq.0;
        Mon, 03 May 2021 02:58:14 -0700 (PDT)
X-Gm-Message-State: AOAM531UpuHB9WHP8EAlk0dNcPbE4N/mij0e/gJSlH75jkK7aLXP2ojv
        zpRriXUapPDYcKbUMdREi0VWoa/Fmllb5O4EkJI=
X-Google-Smtp-Source: ABdhPJwLwM4+7HWAumVwBVTy8mKR1bNlDKElkSrFM6JnoDhONvF95iiZ55DXUZCRZ5QgHthYE50RJYfEuqYwOiecy7Q=
X-Received: by 2002:a7b:c4da:: with SMTP id g26mr20474973wmk.43.1620035893994;
 Mon, 03 May 2021 02:58:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210501151538.145449-1-masahiroy@kernel.org> <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
 <20210502183030.GF10366@gate.crashing.org> <81a926a3bdb70debe3ae2b13655ea8d249fb9991.camel@perches.com>
 <20210502203253.GH10366@gate.crashing.org> <fcffe807353391339a03106f175ffa71377752b1.camel@perches.com>
 <20210503004457.GI10366@gate.crashing.org>
In-Reply-To: <20210503004457.GI10366@gate.crashing.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 3 May 2021 11:57:30 +0200
X-Gmail-Original-Message-ID: <CAK8P3a19QJ_5tbbEq2f9=XKjVYUZcAy8QMvoM=8SNEdCnvmwyQ@mail.gmail.com>
Message-ID: <CAK8P3a19QJ_5tbbEq2f9=XKjVYUZcAy8QMvoM=8SNEdCnvmwyQ@mail.gmail.com>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
To:     Segher Boessenkool <segher@kernel.crashing.org>
Cc:     Joe Perches <joe@perches.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Paul Mackerras <paulus@samba.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Will Deacon <will@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:CBn9IPkT6tkuEYjVfUhmxPRdoyiqFCuEFn/8txieEcwFpjOsXRS
 6k6DCRXp1lMdbLMcB15EKHvkrtKoWgaPLsF7etZFk3O3/fcIRR6S8paiciSeloZC/jOcR3s
 G9CLhqF0TRNwcHTXZPDwqIXgYFJfaTCtmcET72nTqEDzsdAmoQtyuqWxYT7N8R8mjBI3K7M
 1Ww7IwdiTMxMfjNQW6+6g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NoA3z6bd4s0=:We+C5ow4YE6y4pJRKfh4Kt
 KY+iTPi9o5wpurABCw4jMSW5ZzmGhSKuDe/7ob8SBoOcHIoGRXwXpDE9chWWPo8VqSulosA9f
 c1Vr7vMf53Hi2q0MrAkOCeOvAkAsHQKDSOq6rCf2J68GmkEsy76vC9cmVObFeB2sduM5hDRBC
 ir5wzfa2/MCxA2QJGUtFf5TaJNsy/0poEsvKrsOFNNprBRRueAF8rYnw3J14mVMsed7vPD7jc
 3wNzOw63AjhU0EuKidZDslAEl+3lE9ra4v0zXz1Aq04KqnHyOtyTbE3DYiE5OQe9OF8Q5ttbu
 tEoD3XnZI3F54/4wthtTMkIWHkVOOkmZ/tDQZ961YlTeY4o6j5numryVTuNzqV/jlbrkqAywk
 1mb5fNAQR3YP9lh28QmNQiw9KbQth6lRX2uZh5jZJSsByh9upFIOJy6HysJhZsU0W5ntpVALN
 tOUXjl/FrPJ+cpy39hSCDRC/650iZ9ry64YleZeddByWJ8E1v+7Xfagt5QdnFC67FTTFyNyCd
 RWlAnU5X1gvACy5VxPmpLeR3fnrFA0U4L/AAmuTDt4p59vdjz+B7mz88DvczHlzAH26aUDu4/
 6loDbPCXBaZ8QkNdNA3kDPuMEVZkvjXRWu/EKhNAvMXl4pMb0zpmTsLdvy3da/19K6+YqFbZG
 4PVE=
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, May 3, 2021 at 2:44 AM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> On Sun, May 02, 2021 at 02:23:01PM -0700, Joe Perches wrote:
> > On Sun, 2021-05-02 at 15:32 -0500, Segher Boessenkool wrote:
> > > On Sun, May 02, 2021 at 01:00:28PM -0700, Joe Perches wrote:
> > []
> > > > Perhaps 8 might be best as that has a __diag warning control mechanism.
> > >
> > > I have no idea what you mean?
> >
> > ? read the last bit of compiler-gcc.h
>
> Ah, you mean
> #pragma GCC diagnostic
> (which has existed since GCC 4.2).  Does anything in this __diag stuff
> require GCC 8?  Other than that this is hardcoded here :-)

The '8' was just a kernel thing, we made it configurable to have version
specific warnings, and I have a header file that adds these macros
for all supported compilers, but the version that is in mainline only does
it for gcc-8 or later.

Early compilers only supported "#pragma GCC diagnostic", but I think
even gcc-4.6 supported the _Pragma() syntax that lets you do it inside
of a macro.

It's something we should improve with plumbing on top, e.g. I want
a macro that lets you locally turn off both -Woverride-init on gcc
and -Winitializer-overrides on clang. It's not a reason to mandate
a newer compiler though.

        Arnd
