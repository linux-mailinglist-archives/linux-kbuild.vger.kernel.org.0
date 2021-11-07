Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 327B44476B7
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Nov 2021 00:33:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235164AbhKGXgd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 7 Nov 2021 18:36:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:46634 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234597AbhKGXgc (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 7 Nov 2021 18:36:32 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 586F761354
        for <linux-kbuild@vger.kernel.org>; Sun,  7 Nov 2021 23:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636328029;
        bh=As7rslntzOXWqUSdzg4fuhQ7LHlP9EDsU4MRHSE4mCs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fYtVX1jq74HWxGYK6Bjik7bJ2Av2pwrGlgJggLMFmuY08o1VHpBlwFr0QTQ3/eUX6
         28IbllDCnf7wxvBOYMFC024QEoeIna8YWqXVXCcEzx37vuHWDYw+QNOMg7Mc0Lh89C
         QL+zQR2Iu6gXAbNsU0B6z7HULbaTWvFMhS5zf+1mDRfChAvuOegodzC1ny63fsBs3l
         FTdiYcMVDyYlaVrb+5fMIb1f3IkE9Ael2ErreE5HHGrWiAMu0g7nHESlDKR9fDP5Mv
         ZFOMTAq1p0SykfcOQjfahkR4AUTqkUky/xyXqB6gcKWb8bgHgyeWl2BWmKKta6Fc3t
         OF0MwcmWFgsvg==
Received: by mail-ot1-f52.google.com with SMTP id h16-20020a9d7990000000b0055c7ae44dd2so6893027otm.10
        for <linux-kbuild@vger.kernel.org>; Sun, 07 Nov 2021 15:33:49 -0800 (PST)
X-Gm-Message-State: AOAM530qskwH33p0k+IL8DzRGclH6RDSWiXl+EnNZRZYIiqfvu40XXoC
        JMaflde1rxuogzevxq4dTYfu3WgI/LWyZn5Js94=
X-Google-Smtp-Source: ABdhPJyDB3nYgKHl8awFr+mrMXfojZzkih7uTCcHjmYJxrAANBdydOiXEdom22n9tYUDKYVsjCZpYjSyqoturqMfe7E=
X-Received: by 2002:a05:6830:1514:: with SMTP id k20mr384442otp.147.1636328028662;
 Sun, 07 Nov 2021 15:33:48 -0800 (PST)
MIME-Version: 1.0
References: <560695744.1785825.1636169664203.ref@mail.yahoo.com>
 <560695744.1785825.1636169664203@mail.yahoo.com> <CAK7LNASUeUxDcfA-C9vFC6y7J=YzO7K7RbS99mxGguAFwKhTnA@mail.gmail.com>
 <CAMj1kXH=R45ovS43z9uDMJsMKwwv9E8M2LwKYmY7W4jNF6_sBg@mail.gmail.com>
 <1604600353.1975912.1636259046097@mail.yahoo.com> <CAMj1kXFC=SNp7aqbOm9qdYrJ2+ubgDfpRzYL344A7CgX37Hh5w@mail.gmail.com>
 <CAMj1kXF18CSvDZQZT5ZnyoJEnrLmDgaahZUdD90wxFbv4iCDPA@mail.gmail.com> <1856945835.2113194.1636325673974@mail.yahoo.com>
In-Reply-To: <1856945835.2113194.1636325673974@mail.yahoo.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Mon, 8 Nov 2021 00:33:37 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFP8p5FBgq+YMt4wuUMmfm7hGKKd-kZJKZA7O1TjZUYzQ@mail.gmail.com>
Message-ID: <CAMj1kXFP8p5FBgq+YMt4wuUMmfm7hGKKd-kZJKZA7O1TjZUYzQ@mail.gmail.com>
Subject: Re: Given an x32 userspace with a gcc to match (ie defaults to -mx32)
 then CONFIG_EFI_STUB is unavailable
To:     Seed Of Onan <seedofonan@yahoo.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, 7 Nov 2021 at 23:54, Seed Of Onan <seedofonan@yahoo.com> wrote:
>
> What follows is just IMHO. Seriously -- I sincerely appreciate you even c=
onsidering doing anything at all about my nothing issue, and I expect no fu=
rther involvement in the decision as to what is done about it.
>
> > I don't follow. All compilers that we support implement this so why tes=
t for it?
> Okay. And how does one discover if one's compiler (and environment and pl=
atform) is one "that we support" for any given combination of kernel config=
urations and mix of options? For instance, is mine and how do I find out? I=
'm presently under the spell of thinking that the contents of Kconfig DEFIN=
ES what "we" support. So in answer to your question, I'm thinking we keep t=
he existing test because it specifies a real, additional burden on any past=
/present/future compiler, and without it we are saying that any past/presen=
t/future compiler should (is supported to) work now because there is no lon=
ger any such additional burden -- older x86_64 compilers and environments t=
hat once failed the -mabi=3Dms test, they are now supported if no other tes=
t says otherwise. In short, I don't know if "we" should keep it (modified, =
I hope) or not, but I expect you (all) are better qualified to decide both =
that and the philosophical point of Kconfig in the first place.
>

It's very simple: we support GCC 5.1 or newer. But as you pointed out,
the -m64 option is missing from the ms_abi test, leading to false
negatives if m64 is not the default.

Anyone is free to shoot themselves in the foot if they want to try and
build the kernel with a non-supported compiler: the only impact that
dropping this config check will have is that instead of disabling
CONFIG_EFI_STUB automatically, it may get enabled and cause a build
error. This is not a big deal as a) the compiler was not supported to
begin with, and b) the user can just disable it, as the feature was
not available to them in the first place.

> > Note that 32-bit UEFI code uses __attribute__((regparm(0)))
> > as the calling convention not ms_abi
> Interesting, thanks. So that leads me to think the test should be, for hy=
pothetical macro cc-attribute, like:
> (X86_64 && $(cc-attribute, ms_abi)) || (X86_32 && $(cc-attribute, regparm=
(0)))
>

Again, the check is pointless so it needs to be dropped. It only
decides whether or not EFI_STUB can be enabled or not, and with a
non-supported compiler, we are in DYI territory anyway, so the user
should just disable it themselves if their compiler is not compatible
with the option.
