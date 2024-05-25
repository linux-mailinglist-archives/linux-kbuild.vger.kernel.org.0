Return-Path: <linux-kbuild+bounces-1933-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 705CF8CF020
	for <lists+linux-kbuild@lfdr.de>; Sat, 25 May 2024 18:36:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E8CAB20DE5
	for <lists+linux-kbuild@lfdr.de>; Sat, 25 May 2024 16:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFA9084FB0;
	Sat, 25 May 2024 16:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CXKevis5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABEA9473
	for <linux-kbuild@vger.kernel.org>; Sat, 25 May 2024 16:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716654981; cv=none; b=nPMoQMAnv4vxm+9BVqadF4A+sckkYO3d9qXSsmk0UIt/fxypf00QIG7VrJvbnpWUusO3CCcVTVeXPR4+1aFZLbWPFaFy4Wgb2OIdEZkFmYls2ZlmYRgPMG6FW7fhpCNdX6f+GWYFCguMu+dRsFDsuUUjgyo1cfEIeJ2ZUvFRB9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716654981; c=relaxed/simple;
	bh=5wnGE6GExmVoGgpNAGZ+MstfvsJXCgdwdodoS9dKjw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ngSLvoyu1Xyf6XRACvqoHuJLmz5BYfB45PGf/BfQjcmQNRLmurPbm6W+RxZDKEYrueI+bIfWRFUGMx71E6lBTUaH1v50ReJjBNN/XTT0nR6KOPCM30TO72AD5qKt+QjHvEA1M/MKxIxBjnP5uIBeB8FftPho8NGoX4HbyfQGktY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CXKevis5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67C25C32781
	for <linux-kbuild@vger.kernel.org>; Sat, 25 May 2024 16:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716654981;
	bh=5wnGE6GExmVoGgpNAGZ+MstfvsJXCgdwdodoS9dKjw0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CXKevis5oZesYhBS1baQJHT4rMqWcMALeeK/gF3CxRTVHuHFyLBZvITWHTGTLPEJO
	 /kfzaPGLWaxs6dBkcUzdanSJLIEe0iOxuduK8NW2SDAzBAV3E0x7RK/HimZaoYHhOr
	 k52PBdVLHQ53pfRdiXIYvI18DrVoNZFL9dw/77IKrMzRUs7xtKx8LtHpFr+in4dr6U
	 aJ1VWkPss2ffIWgolt4HXO31QULXkCvnIhb5+xA2LGPd+lIfj7+3QlJA3A+uq18fxk
	 nDOTGtVr5sQODs5hlaziFXaLdh3rB/oGqB/8gsz/zqlNdxpQ8G1U0KHZa2GO/553o7
	 3ZECLmUPBUCbQ==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2e73359b900so65385821fa.2
        for <linux-kbuild@vger.kernel.org>; Sat, 25 May 2024 09:36:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWRGI401CkZvELGl3FojJArP3Sg3Oxx3I9QM8XfZV/sVOfH1XzBrakID5AUBe3o7CXzjEB8rAij1U8T/JAtCn1NMtxqcIfkCqdN+OBq
X-Gm-Message-State: AOJu0YxhYWDKBYfE0a2hbW7J2m42wQwWR7LkIfC5+OA2/R6j3CjnbLoU
	sP7Aq1WoCrKyGG3IGQvfLcz144fT2+IC79vK+SuEwE1r+Tci1aKJTFRL/4zWSb3nzJPnOzXLEFf
	hIm1SpXjd5un/nWeNNuV3Roann1o=
X-Google-Smtp-Source: AGHT+IHRJmQpGZmHXBbhNInYESh9PiiXCzfxE8PrZhAdH7yyhD6CpWRzfHrpzlR4+RLzxvaQP/9Br3k62sX7NGn7HWs=
X-Received: by 2002:a19:4352:0:b0:51f:4a03:a053 with SMTP id
 2adb3069b0e04-529645e22e0mr2920223e87.4.1716654980057; Sat, 25 May 2024
 09:36:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZGVi9HbI43R5trN8@bhelgaas> <CAK7LNAQPXapu3Ydh9XaB2ggGqgfYX5mo0pHPNHDcnm=w3ubYag@mail.gmail.com>
 <Zk-C5Eg84yt6_nml@google.com>
In-Reply-To: <Zk-C5Eg84yt6_nml@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 26 May 2024 01:35:43 +0900
X-Gmail-Original-Message-ID: <CAK7LNASrR2W-obUurSWaKLnQ+CB1o9iuoaM-hbHnv-zoazMzmQ@mail.gmail.com>
Message-ID: <CAK7LNASrR2W-obUurSWaKLnQ+CB1o9iuoaM-hbHnv-zoazMzmQ@mail.gmail.com>
Subject: Re: possible dependency error?
To: Brian Norris <briannorris@chromium.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, linux-kbuild@vger.kernel.org, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 24, 2024 at 2:54=E2=80=AFAM Brian Norris <briannorris@chromium.=
org> wrote:
>
> Necromancing an old thread, since it identifies the same problem I've
> been poking at recently:
>
> On Thu, May 18, 2023 at 05:26:28PM +0900, Masahiro Yamada wrote:
> > (+CC: Josh Poimboeuf,Peter Zijlstra, objtool maintainer)
> >
> > On Thu, May 18, 2023 at 8:27=E2=80=AFAM Bjorn Helgaas <helgaas@kernel.o=
rg> wrote:
> > >
> > > This is on v6.4-rc1.  I fat-fingered the make target (I intended
> > > "pciehp.o", not "pciehp.c"), then interrupted the build when I notice=
d
> > > my mistake:
> > >
> > >   06:04:15 ~/linux (hotplug)$ make drivers/pci/hotplug/pciehp.c
> > >     SYNC    include/config/auto.conf.cmd
> > >   ^Cmake: *** [include/config/auto.conf.cmd] Deleting file 'include/g=
enerated/rustc_cfg'
> > >   make: *** [include/config/auto.conf.cmd] Deleting file 'include/gen=
erated/autoconf.h'
> > >   make[2]: *** [scripts/kconfig/Makefile:77: syncconfig] Interrupt
> > >   make[1]: *** [Makefile:692: syncconfig] Interrupt
> > >   make: *** [Makefile:793: include/config/auto.conf.cmd] Interrupt
> > >
> > > Subsequent builds now fail ("pciehp.o" is *also* an incorrect target,
> > > but doesn't seem related to the error):
> > >
> > >   06:04:22 ~/linux (hotplug)$ make drivers/pci/hotplug/pciehp.o
> > >     SYNC    include/config/auto.conf.cmd
> > >     UPD     include/config/kernel.release
> > >     UPD     include/generated/utsrelease.h
> > >     UPD     include/generated/compile.h
> > >     CC      scripts/mod/empty.o
> > >     MKELF   scripts/mod/elfconfig.h
> > >     HOSTCC  scripts/mod/modpost.o
> > >     CC      scripts/mod/devicetable-offsets.s
> > >     HOSTCC  scripts/mod/file2alias.o
> > >     HOSTCC  scripts/mod/sumversion.o
> > >     HOSTLD  scripts/mod/modpost
> > >     CC      kernel/bounds.s
> > >     CC      arch/x86/kernel/asm-offsets.s
> > >     CALL    scripts/checksyscalls.sh
> > >     DESCEND objtool
> > >     HOSTCC  /home/bjorn/linux/tools/objtool/fixdep.o
> > >     HOSTLD  /home/bjorn/linux/tools/objtool/fixdep-in.o
> > >     LINK    /home/bjorn/linux/tools/objtool/fixdep
> > >   make[4]: *** No rule to make target '/usr/include/x86_64-linux-gnu/=
bits/sys_errlist.h', needed by '/home/bjorn/linux/tools/objtool/libsubcmd/e=
xec-cmd.o'.  Stop.
> > >   make[3]: *** [Makefile:80: /home/bjorn/linux/tools/objtool/libsubcm=
d/libsubcmd-in.o] Error 2
> > >   make[2]: *** [Makefile:78: /home/bjorn/linux/tools/objtool/libsubcm=
d/libsubcmd.a] Error 2
> > >   make[1]: *** [Makefile:73: objtool] Error 2
> > >   make: *** [Makefile:1440: tools/objtool] Error 2
> > >
> > > I finally got the right target, but the build still fails:
> > >
> > >   06:04:39 ~/linux (hotplug)$ make drivers/pci/hotplug/
> > >     CALL    scripts/checksyscalls.sh
> > >     DESCEND objtool
> > >   make[4]: *** No rule to make target '/usr/include/x86_64-linux-gnu/=
bits/sys_errlist.h', needed by '/home/bjorn/linux/tools/objtool/libsubcmd/e=
xec-cmd.o'.  Stop.
> > >   make[3]: *** [Makefile:80: /home/bjorn/linux/tools/objtool/libsubcm=
d/libsubcmd-in.o] Error 2
> > >   make[2]: *** [Makefile:78: /home/bjorn/linux/tools/objtool/libsubcm=
d/libsubcmd.a] Error 2
> > >   make[1]: *** [Makefile:73: objtool] Error 2
> > >   make: *** [Makefile:1440: tools/objtool] Error 2
> > >
> > > After "make distclean", everything works as expected, so maybe this i=
s
> > > just the expected behavior after my initial user error?  I dunno; it
> > > seemed surprising.  Just FYI.
>
> I believe we've been hitting a similar issue at $JOB, which looks like
> the following (this is on a 5.15-ish kernel, but AFAICT everything is
> still relevant):
>
> make[5]: *** No rule to make target '[...]/tools/include/linux/compiler.h=
', needed by '[...]/tools/bpf/resolve_btfids/libsubcmd/exec-cmd.o'.  Stop.
> make[4]: *** [Makefile:59: [...]/tools/bpf/resolve_btfids/libsubcmd/libsu=
bcmd-in.o] Error 2
> make[3]: *** [Makefile:45: [...]/tools/bpf/resolve_btfids//libsubcmd/libs=
ubcmd.a] Error 2
> make[2]: *** [Makefile:72: bpf/resolve_btfids] Error 2
> make[1]: *** [[...]/Makefile:1401: tools/bpf/resolve_btfids] Error 2
>
> This particular case happens for us when the source tree is moving, but
> we're sharing an O=3D cache. This may or may not be a good idea, but
> AFAICT there still is a real bug underneath, which I explore below.
>
> > I do not know what is happening on your build machine,
> > but judging from the error log, something went wrong
> > while building objtool.
> >
> > objtool Makefile is not a part of Kbuild.
> > The maintainers of objtool may have some insight.
>
> I'm no maintainer, but I found that the .exec-cmd.o.cmd dep file is
> generated incorrectly due to improper fixdep dependencies:
>
> $ head -2 [...]/tools/bpf/resolve_btfids/libsubcmd/.exec-cmd.o.cmd
> # cannot find fixdep ([...]/tools/bpf/resolve_btfids/libsubcmd//fixdep)
> # using basic dep data
>
> Now, this soft error is normally OK, as long as you don't have any
> missing or moved headers. But if these moved around, then normally the
> fixdep'd dependencies would help rebuild (and regenerate .cmd files with
> new paths) silently.
>
> The bad .cmd file is reliably reproduced by:
>
> # for an easier-to-build target that also builds libsubcmd:
> cd tools/objtool
> # for maximum cleanliness:
> git clean -xfd ..
> make
> head -2 libsubcmd/.exec-cmd.o.cmd
>
> (NB: if you look hard enough, you'll notice that we have a similar
> "cannot find fixdep" error for tools/.../.fixdep.o.cmd too. I have some
> analysis at https://issuetracker.google.com/313508829#comment32 --
> this one is publicly accessible -- but its solution would be more
> complex. I may raise a separate thread.)
>
> The following patch fixes libsubcmd stuff for me. I can resubmit in a
> proper patch form if desired, or feel free to scrape it as-is.
>
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
>
> diff --git a/tools/lib/subcmd/Makefile b/tools/lib/subcmd/Makefile
> index b87213263a5e..59b09f280e49 100644
> --- a/tools/lib/subcmd/Makefile
> +++ b/tools/lib/subcmd/Makefile
> @@ -76,7 +76,7 @@ include $(srctree)/tools/build/Makefile.include
>
>  all: fixdep $(LIBFILE)
>
> -$(SUBCMD_IN): FORCE
> +$(SUBCMD_IN): fixdep FORCE
>         @$(MAKE) $(build)=3Dlibsubcmd
>
>  $(LIBFILE): $(SUBCMD_IN)



I may not fully understand the design policy of the tools/ build system,
but this fix is presumably correct because the 'fixdep' binary
is needed in each sub-directory for it to work correctly.

tools/bpf/resolve_btfids/libsubcmd/.exec-cmd.o.cmd must
be generated by tools/bpf/resolve_btfids/libsubcmd/fixdep
instead of by tools/bpf/resolve_btfids/fixdep.

But, fixing tools/lib/subcmd/Makefile is not enough.

*.cmd files under tools/bpf/resolve_btfids/libbpf/staticobjs/
are broken for the same reason.
So, this is fundamentally broken in many places.

And, as you noted, there is no easy way to fix .fixdep.o.cmd


Your description in
https://issuetracker.google.com/issues/313508829#comment32
is all correct.


"can we just use Kbuild?" is a good question.
I do not understand why they use fragile build systems,
where obviously they cannot do it correctly.


In fact, I submitted a patch to migrate objtool to Kbuild
because that fixes all the issues cleanly.

The objtool maintainers rejected it.
https://lore.kernel.org/linux-kbuild/1551764896-8453-3-git-send-email-yamad=
a.masahiro@socionext.com/


Not only the build system.
He also refused to participate in the standard Documentation
directory.
tools/objtool/Documentation/objtool.txt still resides in its own directory.





--=20
Best Regards
Masahiro Yamada

