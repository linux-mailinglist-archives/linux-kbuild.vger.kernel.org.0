Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41308371460
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 May 2021 13:36:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233505AbhECLhJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 3 May 2021 07:37:09 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:55267 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233108AbhECLhJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 May 2021 07:37:09 -0400
Received: from mail-wr1-f52.google.com ([209.85.221.52]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mgvan-1l53CN3ueb-00hON9; Mon, 03 May 2021 13:36:14 +0200
Received: by mail-wr1-f52.google.com with SMTP id l13so3572321wru.11;
        Mon, 03 May 2021 04:36:14 -0700 (PDT)
X-Gm-Message-State: AOAM533+SVOPQRH66lK1NWnm96PcQhTvICbcmV5CdYKe9WZYIZhOjBj0
        xtXEk/jbRMd+2/1cQ2A8Vs3QjJfeyYmvglYFIQ8=
X-Google-Smtp-Source: ABdhPJwIvsv/yMchaa4sUSYzSCPmfiG5zkCBHBNNq2yUma7fb0HtVe+fV0tBIbTslxWLhW72fs4l8PW7OasotEimGEc=
X-Received: by 2002:adf:d223:: with SMTP id k3mr24144176wrh.99.1620041774578;
 Mon, 03 May 2021 04:36:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210501151538.145449-1-masahiroy@kernel.org> <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
 <20210502183030.GF10366@gate.crashing.org> <81a926a3bdb70debe3ae2b13655ea8d249fb9991.camel@perches.com>
 <20210502203253.GH10366@gate.crashing.org> <CAHk-=wjGJskk5EwnDCccs6DcLytE2yx76+P_W-n1-B5zq0M3KA@mail.gmail.com>
 <20210502223007.GZ1847222@casper.infradead.org>
In-Reply-To: <20210502223007.GZ1847222@casper.infradead.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 3 May 2021 13:35:30 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1Vt17Yry_gTQ0dwr7_tEoFhuec+mQzzKzFvZGD5Hrnow@mail.gmail.com>
Message-ID: <CAK8P3a1Vt17Yry_gTQ0dwr7_tEoFhuec+mQzzKzFvZGD5Hrnow@mail.gmail.com>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
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
X-Provags-ID: V03:K1:1RT98D034H4bxxDqcqvK/MknfpiMAh8Lj4Uy75Z3t8nH3cflvjo
 H6yy2gNcNqK9Jg4nPt/RPIBgmwzm63L8Raf4Ic89saHYXIZLOtYjJEsErtRqbwvav+A6udE
 UK8gtI2rn/CrjlaUVh1AXel7fBzW/u7o5sbjcTYnP6Ew9jAFJxSIJYShpo8XhmWRKWktj4a
 y+mm+WmOsW9ZrxuOd5/jA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:V1gpe3VkJCY=:eJuu2sZvKATbOTT5MUVkAI
 HzCn1Funnm7je4+9ugbIwHj6Pz9oDbrvi4SV92+nnlercW0BSEfcMeDAyrD6fcw8ggEWSDbP5
 dzPF3Oj9t+s9iLeUckYECnrLQiQpcstFflleS1CM0xvjBMbxtGi5+ohcnL+oDPz1q6YjY7z0k
 KgZYWlm24aKyVQZnQDlOR4HnYx0DVNxI8ay0ZQdlOougDebe46/lR23qmyuMKU1AXf88PcGN4
 XcX1//kWryXT6+awD9JfUgVSqsQ2SuZbgDsVsndBe3/9c3vAikBXq6b46fUP9pQeUest3vkvn
 Bteb+oCWKhE0JfRt54CZU7D16MCX5ThAvQvb0+YevN5jD6lXeuuf/c+ptP96ZVFZksxmx8sV0
 PuHM/3TcEaQ9tt54+FpYStLIL68KVnm7tbWA2cXdJonCS++PFoySkPxI2WiXRmHrD5RyjfHnA
 o5lr5IaBjYkTcgt9r9It8jO3zSVcIGQmdQfkRUtmaGAAMd9PX2reVxOTwmBLqrFgGrs+3XcXX
 l8jBBKh/9rWHuE+vAlAq5D2msofQO1rQrXoWgLA2iEA79SOfnVKpYIfGi0HamxiJtGatlLQcX
 BKPcKHzVccGQs7WJ6lPhFPG+LsvPyC4/+WHhu4IFqQNEX53hDNBUtwnCKjNcXfL3YSP8BqyX3
 VPhM=
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, May 3, 2021 at 12:32 AM Matthew Wilcox <willy@infradead.org> wrote:
> On Sun, May 02, 2021 at 02:08:31PM -0700, Linus Torvalds wrote:
> > What is relevant is what version of gcc various distributions actually
> > have reasonably easily available, and how old and relevant the
> > distributions are. We did decide that (just as an example) RHEL 7 was
> > too old to worry about when we updated the gcc version requirement
> > last time.
> >
> > Last year, Arnd and Kirill (maybe others were involved too) made a
> > list of distros and older gcc versions. But I don't think anybody
> > actually _maintains_ such a list. It would be perhaps interesting to
> > have some way to check what compiler versions are being offered by
> > different distros.
>
> fwiw, Debian 9 aka Stretch released June 2017 had gcc 6.3
> Debian 10 aka Buster released June 2019 had gcc 7.4 *and* 8.3.
> Debian 8 aka Jessie had gcc-4.8.4 and gcc-4.9.2.
>
> So do we care about people who haven't bothered to upgrade userspace
> since 2017?  If so, we can't go past 4.9.

I would argue that we shouldn't care about distros that are officially
end-of-life. Jessie support ended last July according to the official
Debian pages at https://wiki.debian.org/LTS.

It's a little harder for distros that are still officially supported, like the
RHEL7 case that Linus mentioned, Debian Stretch (gcc-6.3),
Slackware 14.2 (gcc-5.3), or Ubuntu 18.04 (gcc-7.3). For any of
these you could make the argument one way or the other: either
say we care as long as the distro cares, or the users that want
to build their own kernels can be reasonably expected to either
upgrade their distro or install a newer compiler manually.

Looking at the Debian case specifically, I see these numbers
from https://popcon.debian.org/:

testing/unstable: 16730
buster/stable: 113881
stretch/oldstable: 39147
jessie/oldoldstable: 19286

Assuming the numbers of users that installed popcon are
proportional to the actual number of users, that's still a large
chunk of people running stretch or older. Presumably,
these users are actually less likely to build their own kernels.

       Arnd
