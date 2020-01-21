Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C72AD14411E
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Jan 2020 17:00:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729043AbgAUP77 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 21 Jan 2020 10:59:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:40928 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728852AbgAUP77 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Jan 2020 10:59:59 -0500
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ADE6B21569;
        Tue, 21 Jan 2020 15:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579622397;
        bh=ryf1s+gQkLfUmVXGBywSimmGcdpJgK+HxZZJfSBIFhA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=EhsEHuxDhVOLCiO1c7kh12A+l2iwiN/13+hO4LTeGIvXKRDRuaxsOicJ6oOPUFfDb
         Glz7zIZlaURfw/ONUFMCKP7zO2FoHAQCimn+hedNDRiHqGoQWze21cK/nOR8vFdKAN
         Rhg8ITcOa+hLH7VCYmc7rARBIcyb3veYEq5gycIA=
Received: by mail-qt1-f172.google.com with SMTP id c24so3002255qtp.5;
        Tue, 21 Jan 2020 07:59:57 -0800 (PST)
X-Gm-Message-State: APjAAAV3NSd3hGwoIkkfpmk9ubk9fpbIfmKn96JivlCPEpZFkvfWxAQz
        2jSeT7p2f1zJfQoi58LB8shVYWx9Cu6tZzMoyw==
X-Google-Smtp-Source: APXvYqyhEHRvR0Nvy8KWtOPte04rNrGpogJKTbMYfC57yAr3m8dtvfb8qRkQZAniz9MpperHjlzEEBK/uxyyndNsOTI=
X-Received: by 2002:ac8:1415:: with SMTP id k21mr5218660qtj.300.1579622396814;
 Tue, 21 Jan 2020 07:59:56 -0800 (PST)
MIME-Version: 1.0
References: <20200113181625.3130-1-alexandre.torgue@st.com>
 <20200113181625.3130-2-alexandre.torgue@st.com> <20200116005741.GB54439@umbus>
 <d2594b79-a45d-dcac-3642-90016a1408b8@st.com> <20200117090937.GU54439@umbus>
 <CAL_JsqKTsX9efYDMjGahFDxj0cEfzozeNrY1Nq1bECzgOZGqdQ@mail.gmail.com> <20200119063916.GD54439@umbus>
In-Reply-To: <20200119063916.GD54439@umbus>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 21 Jan 2020 09:59:44 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+-O0cpw9YtVGAjFWstu-=uXVgK0ccgyRj+bjR93gPriw@mail.gmail.com>
Message-ID: <CAL_Jsq+-O0cpw9YtVGAjFWstu-=uXVgK0ccgyRj+bjR93gPriw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] dtc: Add dtb build information option
To:     David Gibson <david@gibson.dropbear.id.au>
Cc:     Alexandre Torgue <alexandre.torgue@st.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Simon Glass <sjg@chromium.org>, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
        Steve McIntyre <steve.mcintyre@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Jan 19, 2020 at 12:41 AM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> On Fri, Jan 17, 2020 at 08:43:23AM -0600, Rob Herring wrote:
> > On Fri, Jan 17, 2020 at 6:26 AM David Gibson
> > <david@gibson.dropbear.id.au> wrote:
> > >
> > > On Thu, Jan 16, 2020 at 09:58:23AM +0100, Alexandre Torgue wrote:
> > > > Hi David
> > > >
> > > > On 1/16/20 1:57 AM, David Gibson wrote:
> > > > > On Mon, Jan 13, 2020 at 07:16:23PM +0100, Alexandre Torgue wrote:
> > > > > > This commit adds the possibility to add build information for a DTB.
> > > > > > Build information can be: build date, DTS version, "who built the DTB"
> > > > > > (same kind of information that we get in Linux with the Linux banner).
> > > > > >
> > > > > > To do this, an extra option "-B" using an information file as argument
> > > > > > has been added. If this option is used, input device tree is appended with
> > > > > > a new string property "Build-info". This property is built with information
> > > > > > found in information file given as argument. This file has to be generated
> > > > > > by user and shouldn't exceed 256 bytes.
> > > > > >
> > > > > > Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
> > > > >
> > > > > At the very least, this patch of the series will need to be sent to
> > > > > upstream dtc first.
> > > >
> > > > Ok sorry. I thought that sending all the series would give more
> > > > information.
> > >
> > > That's fair enough, but in order to merge, you'll need to post against
> > > upstream dtc.
> > >
> > > > > I'm also not terribly clear on what you're trying to accomplish here,
> > > > > and why it's useful.
> > > >
> > > > Let's take Kernel boot at example (but could be extend to other DTB "users"
> > > > like U-Boot). When Linux kernel booting we get a log that gives useful
> > > > information about kernel image: source version, build date, people who built
> > > > the kernel image, compiler version. This information is useful for debug and
> > > > support. The aim is to get same kind of information but for the DTB.
> > > >
> > > > > Since you're doing this specifically for use with dtbs built in the
> > > > > kernel build, could you just use a:
> > > > >     Build-info = /incbin/ "build-info.txt";
> > > > > in each of the in-kernel .dts files?
> > > >
> > > > My first idea was to not modify all existing .dts files. Adding an extra
> > > > option in dtc is (for me) the softer way to do it. I mean, compile
> > > > information should come through compiler without modify .dts files outside
> > > > from dtc. In this way it will be easy to everybody using dtc (inside our
> > > > outside Linux tree) to add dtb build info (even if they don't how to write a
> > > > dts file).
> > >
> > > But you're not really having this information coming from the
> > > compiler.  Instead you're adding a compiler option that just force
> > > includes another file into the generated tree, and it's up to your
> > > build scripts to put something useful into that file.
> > >
> > > I don't really see that as preferable to modifying the .dts files.
> > >
> > > I also dislike the fact that the option as proposed is much more
> > > general than the name suggests, but also very similar too, but much
> > > more specific than the existing /incbin/ option.
> > >
> > > What might be better would be to have a dtc option which force appends
> > > an extra .dts to the mail .dts compiled.  You can then put an overlay
> > > template in that file, something like:
> > >
> > > &{/} {
> > >         linux,build-info = /incbin/ "build-info.txt;
> > > }
> >
> > I like this suggestion either as an include another dts file or an
> > overlay.
>
> Sorry, to be clear what I'm talking about here is just including
> another dts file, and using the compile-type overlay syntax.  This is
> not the same as .dtbo style runtime overlays (though the final result
> is about the same in this case).

Ah, okay. That's probably easier to implement.

> > The latter could be useful as a way to maintain current dtb
> > files while splitting the source files into base and overlay dts
> > files.
> >
> > But no, let's not prepend this with 'linux'. It's not a property
> > specific for Linux to consume.
>
> It's not really about who consumes it.  It's about defining a
> namespace for the new property to exist in, since it's not part of a
> relevant standard (if we wanted to make it such, we should pin down
> what goes in there with much more precision).

I can't think of any cases of the 'linux' prefix not being about who
consumes it. And we often end up dropping 'linux' because it turns out
to not be Linux specific. I don't care to see u-boot,build-info,
freebsd,build-info, etc. when a given dtb can only have 1 of those.

My intent is this property name is added to the DT spec, but I don't
agree we should define what's in it beyond a string. It is information
that is useful for humans identifying what the dtb was built from.

Rob
