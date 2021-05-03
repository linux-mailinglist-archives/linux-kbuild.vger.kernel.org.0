Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E69D3712F5
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 May 2021 11:26:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233076AbhECJ1B (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 3 May 2021 05:27:01 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:54297 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231531AbhECJ1A (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 May 2021 05:27:00 -0400
Received: from mail-wm1-f44.google.com ([209.85.128.44]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MFspV-1lmdVZ06bn-00HLv6; Mon, 03 May 2021 11:26:06 +0200
Received: by mail-wm1-f44.google.com with SMTP id i128so918590wma.5;
        Mon, 03 May 2021 02:26:05 -0700 (PDT)
X-Gm-Message-State: AOAM532/q9G146qrkVL/mfrZW70yKi+6l1Zlx7XSvGHsAPiGMVXCn68f
        41sWx97x3zwPypWOvC1Fjk4mQuX1U9PYEhYqjcQ=
X-Google-Smtp-Source: ABdhPJyImR0lXDOWh/rFmKSSJQOuX4SzDcgMMWQ8OtmjXS6cOp8lf5wEACKwu1MdktyqNDYlMn4UdggeZ8LLn0fAS0M=
X-Received: by 2002:a7b:c344:: with SMTP id l4mr30642981wmj.120.1620033965603;
 Mon, 03 May 2021 02:26:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210501151538.145449-1-masahiroy@kernel.org> <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
 <20210502183030.GF10366@gate.crashing.org> <81a926a3bdb70debe3ae2b13655ea8d249fb9991.camel@perches.com>
 <20210502203253.GH10366@gate.crashing.org> <CAHk-=wjGJskk5EwnDCccs6DcLytE2yx76+P_W-n1-B5zq0M3KA@mail.gmail.com>
 <20210502223007.GZ1847222@casper.infradead.org> <YI+nhMcPSTs/5Ydp@ada-deb-carambola.ifak-system.com>
In-Reply-To: <YI+nhMcPSTs/5Ydp@ada-deb-carambola.ifak-system.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 3 May 2021 11:25:21 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0kV4ZfMEFh0DcMDjXqxA0yhj8a8CL-YFGV6B4pszHeGg@mail.gmail.com>
Message-ID: <CAK8P3a0kV4ZfMEFh0DcMDjXqxA0yhj8a8CL-YFGV6B4pszHeGg@mail.gmail.com>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
To:     Matthew Wilcox <willy@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Segher Boessenkool <segher@kernel.crashing.org>,
        Joe Perches <joe@perches.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Arnd Bergmann <arnd@arndb.de>,
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
X-Provags-ID: V03:K1:I/gsU3RbqaIRE+KdOLKT4bEkOO4frLNAEzQL12xugLqWiiJxUqo
 ZqghVLMD/GUpTP4K38iEuh9Sfiy5CCwVV18DD937YPcFl/NYol0MHqUOoJAeI9GRipH6RCQ
 rNNVp6g/4xhZJnewZxlGDYgFJFAvTflxs6mTgf8Ccuv/J6+jN73IZ7ufQBMUQJ2wF5E0H8T
 2Xh+GD0sFyVuKr4w25OXQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qdR9Si/Ru1A=:7j1bygQueRVWljbbzNPkyF
 ad5Pd/8bG5uytvKX8LkT3utJfYUm3W/5y3mllEvsU3k0+DzTbZ8KUuULWnkbvah+EeeEaG89U
 yD3pbzGHpbhSxIl9vrooM6/7tEwC6ixZBXr/b6V9L/hhlqnMUOgne7ZCnGqjJU5YxcY7BCRyQ
 mTAoIN9eusOwJZiiNi30SToBv20+IDLkCQOx5ivtuAypz/1LNEaaRUT3lMmX+EdA7CDD6Vzz0
 mjpqEKxd9rTJ9/w8Abnu7LrlB4/DU8h42gulxxZQcAAmT+yV5DhLZmZ8+L2InBj5Na40QQrPl
 JP2krHBJA+Q95+FDLJBzhWQs2AGVI4WDsih1HlBStSQwu1gPKwz2J3F9SILvanGcdhwFXs0sV
 EfWcXHvmyyqhWniu8M2V/J8oGmDB9M/iJUJmtJ6ys+ww8t8BSH9Azi1t9PfWtW0Nzw+lLUo09
 awJVfYOUAs6QqMiEfaqZrl+otdBGNfir6D7sZVWBGQ5MkRL0n/O3/BD/9C3P+AeeSPgGibbE9
 TGun0Wcy1UNCDKqjzdU7R2BjmcPiCS94+8FumZbLrI9AS0+SdocVypRQ+OrSW8C0FkzG4Q9yG
 5AZKhopNGwzf90XIokEWNN5X7cucuwxYu1q4PAWPC8C6/MiTRvgPKnQiMfZ/rACo8f8X0vLf6
 jqLY=
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, May 3, 2021 at 9:35 AM Alexander Dahl <ada@thorsis.com> wrote:
>
> Desktops and servers are all nice, however I just want to make you
> aware, there are embedded users forced to stick to older cross
> toolchains for different reasons as well, e.g. in industrial
> environment. :-)
>
> This is no show stopper for us, I just wanted to let you be aware.

Can you be more specific about what scenarios you are thinking of,
what the motivations are for using an old compiler with a new kernel
on embedded systems, and what you think a realistic maximum
time would be between compiler updates?

One scenario that I've seen previously is where user space and
kernel are built together as a source based distribution (OE, buildroot,
openwrt, ...), and the compiler is picked to match the original sources
of the user space because that is best tested, but the same compiler
then gets used to build the kernel as well because that is the default
in the build environment.

There are two problems I see with this logic:

- Running the latest kernel to avoid security problems is of course
  a good idea, but if one runs that with ten year old user space that
  is never updated, the system is likely to end up just as insecure.
  Not all bugs are in the kernel.

- The same logic that applies to ancient user space staying with
  an ancient compiler (it's better tested in this combination) also
  applies to the kernel: running the latest kernel on an old compiler
  is something that few people test, and tends to run into more bugs
  than using the compiler that other developers used to test that
  kernel.

       Arnd
