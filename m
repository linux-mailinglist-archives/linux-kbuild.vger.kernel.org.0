Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D3701CFEED
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 May 2020 22:06:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730200AbgELUGr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 May 2020 16:06:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725938AbgELUGr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 May 2020 16:06:47 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E6C5C061A0C;
        Tue, 12 May 2020 13:06:47 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id s10so15518739iog.7;
        Tue, 12 May 2020 13:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=5gYRNxsl+AJhtF04Scdhgt92FgaaH0tr9cW3OfY8ghg=;
        b=B1dEFzwlpmVU422p3FMoQ/2Agz+JD5HFnJJsznQT+Z6BVKUFOD5nzaX4Ej3qjl6jYg
         eGzz4yRKzXJFTRYRogi/CoJ+OQ+mHWn7sIIW4N+TeaBqwx3d21TOo9lAMPfb7h9Lk28o
         0aUs8bp90sNxhLpRZ4wBvZboDtXnRKvALd2evsPxeH3+K8eja74l+rRaXUqimN8n7RoV
         10W9YoewtKR/WVS4Qlq5wT2kZyrc94NIqbYRVGDz4jOTU97moeAOMFb+D5KCag4FzN09
         soOTCuTxN6OqY8h3z6+AJrphAmn2UlSAnXXqIX3R4Zg+ZhBOAMJx/+6ZFdQf1NydboQK
         EDdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=5gYRNxsl+AJhtF04Scdhgt92FgaaH0tr9cW3OfY8ghg=;
        b=Bq1+Flr+JGW5s4I6Yh0MYbAlDL+AHpMkqJw4hbz4d4VWN/M7IAyXVhYRiBhklH8mYc
         0UMdZ6o17TUqwZ+3bAaZftS0kE2j8z+VuIK//aIZaT6d2DYNPZwBmmo/QeNqxlIw2w9l
         t6XwtVrxb3kkTH37uuHpfClFpciwIn05U8VEGKsw+8kZtrQx1cJ/vys+AgOiGJ1nsiec
         xb5161j/7uE5lFUVuGF89lVoURMPtOmo5zVt2OIrGliFtc13bZc7x7SmXs7nC383T2Kx
         /wVVKzXP8kvDiNvQGCgYYPqaGaD3UWJo8bzUUwkKRA0E0840JeTjNS4bx77epd+nCXwa
         sN4Q==
X-Gm-Message-State: AGi0PubefBPY63/B9Mt1Bzz21ZSGqdBNlpsJJhBa9N5Sfu+mZvhjS4ob
        qJWU4GAbU7MPpoHeaM674Gs6bEJdO95ydfVDyY4=
X-Google-Smtp-Source: APiQypI5Ez6wBRTtNiR23CWKmDd9v/YKydLRgNpwuOsa0fEFEnN+OfJIe5g9k7ceLDoqDWAa1KQhb2WwbUuKYGrID9Q=
X-Received: by 2002:a6b:7d4a:: with SMTP id d10mr22667811ioq.70.1589314006427;
 Tue, 12 May 2020 13:06:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200504031340.7103-1-nick.desaulniers@gmail.com>
 <CA+icZUUOaqeKeh6n4BJq2k6XQWAfNghUj57j42ZX5qyd3iOmLw@mail.gmail.com>
 <20200505004738.ew2lcp27c2n4jqia@google.com> <CAK7LNAR7-VMEWBcJ_Wd+61ZDHEa0gD8FaSs63YPu7m_FgH8Htg@mail.gmail.com>
 <CAKwvOdmEP9Auuc+M+MqPoQmx+70DgdsPYZQ6pg=8oGnfCviqRA@mail.gmail.com> <20200512200114.64vo5lbl7wk2tzxk@google.com>
In-Reply-To: <20200512200114.64vo5lbl7wk2tzxk@google.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Tue, 12 May 2020 22:06:35 +0200
Message-ID: <CA+icZUUvdso=R3579RReTFk=ts0rNNCwcx9ydGGsG++sT8=abQ@mail.gmail.com>
Subject: Re: [PATCH] Makefile: support compressed debug info
To:     Fangrui Song <maskray@google.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <nick.desaulniers@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Changbin Du <changbin.du@intel.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, May 12, 2020 at 10:01 PM Fangrui Song <maskray@google.com> wrote:
>
> On 2020-05-12, Nick Desaulniers wrote:
...
> >I have a patch series that enables dwarf5 support in the kernel that
> >I'm working up to.  I wanted to send this first.  Both roughly reduce
> >the debug info size by 20% each, though I haven't measured them
> >together, yet.  Requires ToT binutils because there have been many
> >fixes from reports of mine recently.
>
> This will be awesome! I also heard that enabling DWARF v5 for our object
> files can easily make debug info size smaller by 20%. Glad that the
> kernel can benefit it as well:)

Please CC me on your pathcset - 20% smaller - I flip out.

- Sedat -
