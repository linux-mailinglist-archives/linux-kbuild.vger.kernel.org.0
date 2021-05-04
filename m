Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CEEA3729D4
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 May 2021 14:08:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230149AbhEDMJg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 4 May 2021 08:09:36 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:56487 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230043AbhEDMJf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 May 2021 08:09:35 -0400
Received: from mail-wr1-f43.google.com ([209.85.221.43]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MvJwN-1lMEPW3Sgz-00rHnB; Tue, 04 May 2021 14:08:39 +0200
Received: by mail-wr1-f43.google.com with SMTP id d11so9134302wrw.8;
        Tue, 04 May 2021 05:08:39 -0700 (PDT)
X-Gm-Message-State: AOAM5323p+xJ3HNHWVo/C6X5jNiHqkRyGpvSF6PrGoG6wGwy3bcwcki6
        4EOBM7Ka0zoDo6ZZgWibpPh7AiI7mawWbAh0qQo=
X-Google-Smtp-Source: ABdhPJw20yUwLjuDm4O2f4JNErVjYHf0sVRY4Y7yimcYIwg2TBud2AGVYmDyXDJ9tJQqulD0dlHRWOk7iwc1IQFkZg8=
X-Received: by 2002:a5d:4452:: with SMTP id x18mr32138876wrr.286.1620130119473;
 Tue, 04 May 2021 05:08:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210501151538.145449-1-masahiroy@kernel.org> <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
 <20210502183030.GF10366@gate.crashing.org> <81a926a3bdb70debe3ae2b13655ea8d249fb9991.camel@perches.com>
 <20210502203253.GH10366@gate.crashing.org> <CAHk-=wjGJskk5EwnDCccs6DcLytE2yx76+P_W-n1-B5zq0M3KA@mail.gmail.com>
 <20210502223007.GZ1847222@casper.infradead.org> <YI+nhMcPSTs/5Ydp@ada-deb-carambola.ifak-system.com>
 <CAK8P3a0kV4ZfMEFh0DcMDjXqxA0yhj8a8CL-YFGV6B4pszHeGg@mail.gmail.com> <YJDb9uLQBgoy94Ub@ada-deb-carambola.ifak-system.com>
In-Reply-To: <YJDb9uLQBgoy94Ub@ada-deb-carambola.ifak-system.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 4 May 2021 14:07:58 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0Ono1gMwt9tKUZtV_jX8iFxLp9rWiWUuE8jXQNhZ+yWA@mail.gmail.com>
Message-ID: <CAK8P3a0Ono1gMwt9tKUZtV_jX8iFxLp9rWiWUuE8jXQNhZ+yWA@mail.gmail.com>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
To:     Arnd Bergmann <arnd@arndb.de>,
        Matthew Wilcox <willy@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Segher Boessenkool <segher@kernel.crashing.org>,
        Joe Perches <joe@perches.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
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
X-Provags-ID: V03:K1:79C00jnZg6LFfyaLcLjeBZWQD73W4KFV8436WMQ0Hknknbdb62Z
 GtrgX/lccZtMXdDm1QKhRJ+KsKhDEdNPnxGrxizvKw7jO4lmGMottmDfL9Ou15mSEiOvco/
 HUbObczoox4sfY9pBcZBwykZ45iwwiX1bpA445g8xnXvhZj2EjLw7SrLJb6mSFidR8uIvpL
 1zrCyG/wf/x/4FCnoqF9w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8IvNsk8rgqQ=:u2/+e82gtSJOjs8+OcSLJs
 RnnbuLA+Xqnolg0UTWqA3+c9azzV3OyyuJH7GdXwCkTusH7TonwM5TvqhmTu/mtg8oYvd/DSp
 RGwx2ksHLFcUipFyqSvAALV9ignzxiNGC+C2WC+HCBrgMK7ESMeasMFQuTBifWdC1dTdQr1se
 Oikf13h4JBHSlbs1beoEp9a4gHtiC0cPffdrtJzx6RWnYwne4qS8IOynOF5aQUfRwNfwd93N3
 bSRxQggmBd7RfO+1mV/uGy8vG1cWNeIc59uVWJwMpr5es4bivgRUZE0Lk0KQJkyAMy0cXZ2XZ
 fNPInrK2u1kCsH+UH4DY7RMME06DKyWAp8RaTtswrhmZ/uVprOCroQln0gpHMNNG0n2YYTgK+
 TR+4LuCSV6H23v0v8kOZBhLe9GEpxazugsBdRlAQnkS4YMiNTcNzDaKrN6WbjqJuTV62zxZZu
 HEP/7YO6FAHn+IbFoywPZG0H2/2qcEqny8q0bI4PucYgVT7jXFHnaMYBasf6JvrVQd8cBVKs3
 quGI95/hxYwqW/sawmm3vD6awk9xvxUYOBiAbQBfrH5oGvJGjXngasb/VwZOjyR4eprrcLHkL
 ErSBkEDkKgAPLOq5O7kTVfKq3bVteM9P3p4pRsoNuCcGqPT3x31VX1UzrNTgDtLijnZJjUIJR
 EcQ0=
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, May 4, 2021 at 7:31 AM Alexander Dahl <ada@thorsis.com> wrote:
> Am Mon, May 03, 2021 at 11:25:21AM +0200 schrieb Arnd Bergmann:
> > On Mon, May 3, 2021 at 9:35 AM Alexander Dahl <ada@thorsis.com> wrote:
> > >
> > > Desktops and servers are all nice, however I just want to make you
> > > aware, there are embedded users forced to stick to older cross
> > > toolchains for different reasons as well, e.g. in industrial
> > > environment. :-)
> > >
> > > This is no show stopper for us, I just wanted to let you be aware.
> >
> > Can you be more specific about what scenarios you are thinking of,
> > what the motivations are for using an old compiler with a new kernel
> > on embedded systems, and what you think a realistic maximum
> > time would be between compiler updates?
>
> One reason might be certification. For certain industrial applications
> like support for complex field bus protocols, you need to get your
> devices tested by an external partner running extensive test suites.
> This is time consuming and expensive.
>
> Changing the toolchain of your system then, would be a massive change
> which would require recertification, while you could argue just
> updating a single component like the kernel and building everything
> again, does not require the whole testing process again.
>
> Thin ice, I know.

As Christophe said, I don't think this is a valid example. I agree that
if rebuilding everything with a new toolchain requires certification, you
shouldn't rebuild everything.

If replacing the kernel does not require recertification for your
specific system, that is fine, but that does not mean the new kernel
should be built with an outdated toolchain. If the certification
allows replacing linux-3.18 with linux-5.10 but doesn't allow building
the kernel with a different toolchain compared to the rest, then
the point of the certification is rather questionable.

Do you know specific certifications that would require you to
do this?

> One problem we actually ran into in BSPs like that (we build with
> ptxdist, however build system doesn't matter here, it could as well
> have been buildroot etc.) was things* failing to build with newer
> compilers, things we could not or did not want to fix, so staying with
> an older toolchain was the obvious choice.
>
> *Things as in bootloaders for an armv5 platform.
...
>
> What we actually did: building recent userspace and kernel with older
> toolchains, because bootloader.

It sounds like you are trying to make an argument in favour of
deprecating old toolchains *earlier* in new kernels ;-)

If we simply made it impossible to have users build kernels with
the same old toolchain that is needed for building the old bootloader
or the old user space, it sounds like more people would do the
right thing and build the updated kernels with a better tested
toolchain, or update their bootloader as well. The only downside
is that some users would choose to remain on the older kernels,
so it shouldn't be too aggressive either.

         Arnd
