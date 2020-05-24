Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3134A1DFD95
	for <lists+linux-kbuild@lfdr.de>; Sun, 24 May 2020 09:48:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726910AbgEXHs0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 24 May 2020 03:48:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726796AbgEXHsZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 24 May 2020 03:48:25 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86D58C061A0E;
        Sun, 24 May 2020 00:48:25 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id f3so15913827ioj.1;
        Sun, 24 May 2020 00:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=lYyxQy2basMHk+ymmytrrORebX9PiLqKXhegfXyfuDw=;
        b=fnfN7GArFrWdQ6imDIwKvsDoM8g62KbimmJDHdZAEtNXkGDhzKR474F6WCKpe7VkgH
         vKCn+yo7zDppvxXUMZPbezY+z797+WqkukFSK4j4U1b0Z+4X7iDaQYJDB0o7oPI8JwT3
         yQd4VWo/xAuCDnas1301CsmqwFqt0zC7FykxMVBpV7SGXW+oIw3mApNINADYQZ+8a8D8
         Qen3uu9+SVITTc4EWZMcZD4FRl6EehjQOotowEFGpbfo5KHIV4fE4/4XbQkz/mlrJ23p
         hRC/P07PjeswM5JfAQc7A5zySgyVxvQNJ+kL0y5jU5Z9Td0ct3Ltg1E14a9kNGTTCTLJ
         f77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=lYyxQy2basMHk+ymmytrrORebX9PiLqKXhegfXyfuDw=;
        b=rX4RAn2W6WIWBJevmLoKm/vT1UmEvEB0cJdpADUQDEpXHzpTJEEclmT2//0bJ651IX
         tYdN0zF185niPKbSYDH2Yjsm2zLKauxZFR4GJE1cd2o2Tg+3PUJB3TecwGrZn6m6Jxtx
         zL9y8KeKrMvS1H9SCsBwEZQum8HlGcflZVUhc34XMZV84bkIRKLnw83VY24q2rwn07Kt
         /LLVr0Trc5QZ74QOsE+aoQ4mRsDyxvDcZIIA552h3f/fdmuO0RuAZjUALkHJj4hznnXJ
         MfUKVBiB7/tevnK3XzxUB3Vjb0YMiov0sq3G4pcGRJzQu93XELmshlEaqiTN0cIwWOCu
         zOPw==
X-Gm-Message-State: AOAM532I6amSIpkJewBpXE7AaZSD7C14xA7v6rOHfLYGTUhiYSAPBHO9
        YUwz4RGN7q1pmr9h0r4BrqJRiBR61U7Kbqib45s=
X-Google-Smtp-Source: ABdhPJwJVAexR5ySaZ4n6PBO4gsRhLU5FfLS57HEYMsi0KejAx+7Ur/7EbTkZT2fB4cOkegxZwgkaBIKRSMs+3wfSE4=
X-Received: by 2002:a02:ca18:: with SMTP id i24mr3984955jak.70.1590306504893;
 Sun, 24 May 2020 00:48:24 -0700 (PDT)
MIME-Version: 1.0
References: <10f4fb0b-1012-b0e6-af05-0aa5a906de21@redhat.com>
 <20200520193637.6015-1-ndesaulniers@google.com> <CAK7LNAS_PMz9r3e1UcuM+r18JC2KeM2RqGOms1u3kVzN_N1MmA@mail.gmail.com>
 <CAKwvOd=jOr4ZaLx-dSNTqZnGRATY1PZktUfu4JGWKRwRH=Ujnw@mail.gmail.com> <CAK7LNARofo7wawEF4EcA2-wxnQkKw+WFoJ36EOeYFTUrthRfrA@mail.gmail.com>
In-Reply-To: <CAK7LNARofo7wawEF4EcA2-wxnQkKw+WFoJ36EOeYFTUrthRfrA@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Sun, 24 May 2020 09:48:13 +0200
Message-ID: <CA+icZUXwNLG3ojWMhTuNkvR0AYtc1+BG6neOLZo56CB7ij01JQ@mail.gmail.com>
Subject: Re: [PATCH v2] Makefile: support compressed debug info
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Fangrui Song <maskray@google.com>,
        Nick Clifton <nickc@redhat.com>,
        David Blaikie <blakie@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Changbin Du <changbin.du@intel.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, May 24, 2020 at 5:57 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Fri, May 22, 2020 at 6:57 AM 'Nick Desaulniers' via Clang Built
> Linux <clang-built-linux@googlegroups.com> wrote:
> >
> > On Wed, May 20, 2020 at 7:48 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > >
> > > > Suggested-by: Fangrui Song <maskray@google.com>
> > >
> > >
> > > Suggested-by -> Reviewed-by
> > >
> > > https://patchwork.kernel.org/patch/11524939/#23349551
> >
> > Yes, my mistake.
> >
> > > > Suggested-by: Nick Clifton <nickc@redhat.com>
> > >
> > >
> > > I do not know where this tag came from.
> > >
> > > Nick Clifton taught us the version rule of binutils,but did not state
> > > anything about this patch itself.
> > >
> > > https://patchwork.kernel.org/patch/11524939/#23355175
> > >
> > >
> > > > Suggested-by: Sedat Dilek <sedat.dilek@gmail.com>
> > >
> > > I do not see the source of this tag, either...
> >
> > Not all contributions to open source need to be in the form of
> > patches.  Both Sedat and Nick gave suggestions which ultimately
> > informed the contents of this patch.  They should be rewarded for
> > their efforts, and incentivized to help improve the code base further.
> > I think suggested by tags are a good way to do that; but if it's
> > against a written convention or if you still disagree, it's not the
> > end of the world to me, and you may drop those tags from the v3.
>
>
> Documentation/process/submitting-patches.rst
> gives the guideline.
>
>
> "A Suggested-by: tag indicates that the patch idea is suggested by the person
> named and ensures credit to the person for the idea. Please note that this
> tag should not be added without the reporter's permission, especially if the
> idea was not posted in a public forum. That said, if we diligently credit our
> idea reporters, they will, hopefully, be inspired to help us again in the
> future."
>
>
> I think this tag should be given to people who
> gave the main idea to come up with
> the main part of the patch.
>
>
> Is that David Blaikie who suggested to
> compress the debug info ?
> If so, definitely he deserves to have Suggested-by tag.
>
> For the others, I do not think Suggested-by is a good fit.
>
> I appreciate their contribution to improve this patch.
> So, maybe you can give credit in other form, for example,
> mention it in the commit log explicitly?
>
> Nick Clifton helped us to provide the minimal binutils version.
> Sedat Dilet found an increase in size of debug .deb package.
>
>
> Thanks.

Hi,

first my last name is Dilek - just for the sake of completeness.
No, it is not my first name as Dilek is a female Turkish first name,
so I do not want to change my gender.

So this discussions come up again and again.

Thus some own words on this - this is my personal opinion.

Like the author of Curl and DOH said at FOSDEM 2019 in Bruessel:
I am doing all this work - first - for myself - in my build and
developing environment.
Very very egoistically!

"Share knowledge aggressively!"
...was Nick's words at First ClangBuiltLinux Meetup in Zurich 2020.
In a 2nd round I share my knowledge and I like this - that's why I am
doing Open Source.

For me it sounds like a "Suggested-by" tag or other credits like
"Reviewed-by" have a higher value than a Tested-by tag.

*** The opposite is the case. ***

Here, I am on a Samsung SandyBridge CPU/GPU aka 2nd generation
ultrabook series runing Debian/testing AMD64.

A slightly modified Debian-kernel linux-config takes me approx. 5 (in
words five) hours of compiling and generating Debian packages.

Plus, testing.
Plus, testing.
Plus, testing.

In Linux-next times I run the whole Linux-Test-Project tests plus some
FIO tests.

Finally, I decide depending from what is new and interesting to me to
attend a full single Linux-kernel release cycle.
The last was Linux v5.3 which was the first release to be
compile/link-able - with no modifications - with LLVM/Clang/LLD v9.0.
For upcoming Linux v5.7 I have built each single RC Linux-kernel and
used it in my daily work!
Since RC1 - for me running on bare metal counts - checking QEMU or
other VM is nice - but showed me that says sometimes nothing.

Plus, I am building llvm-toolchains (LLVM/Clang/LLD) and testing with
them (and report if needed).

"...if we diligently credit our idea reporters, they will, hopefully,
be inspired to help us again in the future."

These are some motivating words...

My Tested-by is like a certificate - like a "Made in Germany" seal :-).

Virtual Greeting from North-West Germany,
- Sedat -
