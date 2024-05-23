Return-Path: <linux-kbuild+bounces-1930-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2968CD986
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 May 2024 19:54:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C73A71C2112F
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 May 2024 17:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E3EC7D086;
	Thu, 23 May 2024 17:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ba0uMqih"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09F02628D
	for <linux-kbuild@vger.kernel.org>; Thu, 23 May 2024 17:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716486888; cv=none; b=FtWg500+61iTe52ZFa0Zv7CDLEP0/Eu1EebwUoxzhXOnf71t7C3YJYDrusphKSHyPdWzu94cthll+55Y0OlQ58ALEDyCfammspmDLCNMedaOzgqZWO3YWCohNVP9nLCybRXnoK7MvQRrn1lCHQR/mhHOj/wLwuzPXC546Mi9lHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716486888; c=relaxed/simple;
	bh=c67DBU0JOOdQ31c7v15ZkH1hGs/C0NgonECxREvfppY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZcdT/b/YXeF3WkbGGbleAZKxbdGPo/pOBqXr0EnuYGHUWrp4Lki7/f3vvMNodED+Au/UdUf8JqD5ecs7HCBWvqB/4+Bzp80rVlio5S1trTG2ENAW0dXmXQ6rQI3BCtxYkbXckJPSaUDAHJESV/MnOPPOiLIquw/qJyjvQ3vt1mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ba0uMqih; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6f8ec7e054dso26037b3a.2
        for <linux-kbuild@vger.kernel.org>; Thu, 23 May 2024 10:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716486886; x=1717091686; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=47lC7ijtn547x0R0hPQ82p/mqVSFuj8kT3KqISy3d6U=;
        b=ba0uMqihAQ38cDyfJ91mYfo9e2jH24DEKbNe30DTBT0Z2UpolsXYkRGE9/OckaYuG4
         G77lyRF8EjQmcTOmu6IG5CXjTB8xgGm3+tfDbmZ8bUtt4acK9sd9/b7+bCpJG1khJc4Y
         +M3iR0PXQKBjJgTdU6D7RTMo539HoVsjz2S+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716486886; x=1717091686;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=47lC7ijtn547x0R0hPQ82p/mqVSFuj8kT3KqISy3d6U=;
        b=hFReY8Ak2frAfcdJpWim65eTV9h8SOKn/afu9cCONrqh0TKNJwZ1iW9ahdjeizByAx
         QoOz5o8pnBiXVfLfUYvDtCeQ6okwQWKID5j3RXQaeSRWZI7baaiIx1FbAf7P4aiBWKlH
         9cyX9i0CkwHpi32ARHoDL+k4z7zZIbccE137y1Ci4SpJq2SURtrG+/iWB5Z3rxOWMuWN
         cCkR/A0FUqF7xBE2FaTS8Ex2lObdARM90DF+EC3zQx1qz22HvQqdWivzrUFydpGRJlOK
         N17X4qGTkCBxoXsg+QUWPaPVq9yX5KIh0sGhDOtuosOJm7P1YTrtnTp+1V42Y7els5s7
         E1Nw==
X-Forwarded-Encrypted: i=1; AJvYcCXwpkkFeXB05Gr/t1AERheTW7F09j+3z6ZKkiJPg/msQFgRr0CEVpaMI7rFzpYx7r/zWuWzc2tfhx9v7mdta0X+LrNKAyQCROsZWdZe
X-Gm-Message-State: AOJu0Yz8KVNw9M78LycDT1JyaeA686XRzhE0V7bfE2wWetzCEQskFV1R
	OUNTFLPSr4TESygYlCPPfhHumpD/JPmusa1ErpJlItxhZQB8NRsaLGz6yG0CMQ==
X-Google-Smtp-Source: AGHT+IG7Xl8MphHhX52hRJgi/F884JNQH7Otm0rVjbjgufYm1NmBktuLBdUx8CSOA0ZQpCDizRyNsA==
X-Received: by 2002:a05:6a20:5526:b0:1b1:c745:ea2c with SMTP id adf61e73a8af0-1b212e32cb1mr182602637.56.1716486885802;
        Thu, 23 May 2024 10:54:45 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:63d1:d6fd:f357:4e52])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-6f4d2ae0f62sm24335843b3a.103.2024.05.23.10.54.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 May 2024 10:54:45 -0700 (PDT)
Date: Thu, 23 May 2024 10:54:44 -0700
From: Brian Norris <briannorris@chromium.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, linux-kbuild@vger.kernel.org,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: possible dependency error?
Message-ID: <Zk-C5Eg84yt6_nml@google.com>
References: <ZGVi9HbI43R5trN8@bhelgaas>
 <CAK7LNAQPXapu3Ydh9XaB2ggGqgfYX5mo0pHPNHDcnm=w3ubYag@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAQPXapu3Ydh9XaB2ggGqgfYX5mo0pHPNHDcnm=w3ubYag@mail.gmail.com>

Necromancing an old thread, since it identifies the same problem I've
been poking at recently:

On Thu, May 18, 2023 at 05:26:28PM +0900, Masahiro Yamada wrote:
> (+CC: Josh Poimboeuf,Peter Zijlstra, objtool maintainer)
> 
> On Thu, May 18, 2023 at 8:27 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
> >
> > This is on v6.4-rc1.  I fat-fingered the make target (I intended
> > "pciehp.o", not "pciehp.c"), then interrupted the build when I noticed
> > my mistake:
> >
> >   06:04:15 ~/linux (hotplug)$ make drivers/pci/hotplug/pciehp.c
> >     SYNC    include/config/auto.conf.cmd
> >   ^Cmake: *** [include/config/auto.conf.cmd] Deleting file 'include/generated/rustc_cfg'
> >   make: *** [include/config/auto.conf.cmd] Deleting file 'include/generated/autoconf.h'
> >   make[2]: *** [scripts/kconfig/Makefile:77: syncconfig] Interrupt
> >   make[1]: *** [Makefile:692: syncconfig] Interrupt
> >   make: *** [Makefile:793: include/config/auto.conf.cmd] Interrupt
> >
> > Subsequent builds now fail ("pciehp.o" is *also* an incorrect target,
> > but doesn't seem related to the error):
> >
> >   06:04:22 ~/linux (hotplug)$ make drivers/pci/hotplug/pciehp.o
> >     SYNC    include/config/auto.conf.cmd
> >     UPD     include/config/kernel.release
> >     UPD     include/generated/utsrelease.h
> >     UPD     include/generated/compile.h
> >     CC      scripts/mod/empty.o
> >     MKELF   scripts/mod/elfconfig.h
> >     HOSTCC  scripts/mod/modpost.o
> >     CC      scripts/mod/devicetable-offsets.s
> >     HOSTCC  scripts/mod/file2alias.o
> >     HOSTCC  scripts/mod/sumversion.o
> >     HOSTLD  scripts/mod/modpost
> >     CC      kernel/bounds.s
> >     CC      arch/x86/kernel/asm-offsets.s
> >     CALL    scripts/checksyscalls.sh
> >     DESCEND objtool
> >     HOSTCC  /home/bjorn/linux/tools/objtool/fixdep.o
> >     HOSTLD  /home/bjorn/linux/tools/objtool/fixdep-in.o
> >     LINK    /home/bjorn/linux/tools/objtool/fixdep
> >   make[4]: *** No rule to make target '/usr/include/x86_64-linux-gnu/bits/sys_errlist.h', needed by '/home/bjorn/linux/tools/objtool/libsubcmd/exec-cmd.o'.  Stop.
> >   make[3]: *** [Makefile:80: /home/bjorn/linux/tools/objtool/libsubcmd/libsubcmd-in.o] Error 2
> >   make[2]: *** [Makefile:78: /home/bjorn/linux/tools/objtool/libsubcmd/libsubcmd.a] Error 2
> >   make[1]: *** [Makefile:73: objtool] Error 2
> >   make: *** [Makefile:1440: tools/objtool] Error 2
> >
> > I finally got the right target, but the build still fails:
> >
> >   06:04:39 ~/linux (hotplug)$ make drivers/pci/hotplug/
> >     CALL    scripts/checksyscalls.sh
> >     DESCEND objtool
> >   make[4]: *** No rule to make target '/usr/include/x86_64-linux-gnu/bits/sys_errlist.h', needed by '/home/bjorn/linux/tools/objtool/libsubcmd/exec-cmd.o'.  Stop.
> >   make[3]: *** [Makefile:80: /home/bjorn/linux/tools/objtool/libsubcmd/libsubcmd-in.o] Error 2
> >   make[2]: *** [Makefile:78: /home/bjorn/linux/tools/objtool/libsubcmd/libsubcmd.a] Error 2
> >   make[1]: *** [Makefile:73: objtool] Error 2
> >   make: *** [Makefile:1440: tools/objtool] Error 2
> >
> > After "make distclean", everything works as expected, so maybe this is
> > just the expected behavior after my initial user error?  I dunno; it
> > seemed surprising.  Just FYI.

I believe we've been hitting a similar issue at $JOB, which looks like
the following (this is on a 5.15-ish kernel, but AFAICT everything is
still relevant):

make[5]: *** No rule to make target '[...]/tools/include/linux/compiler.h', needed by '[...]/tools/bpf/resolve_btfids/libsubcmd/exec-cmd.o'.  Stop.
make[4]: *** [Makefile:59: [...]/tools/bpf/resolve_btfids/libsubcmd/libsubcmd-in.o] Error 2
make[3]: *** [Makefile:45: [...]/tools/bpf/resolve_btfids//libsubcmd/libsubcmd.a] Error 2
make[2]: *** [Makefile:72: bpf/resolve_btfids] Error 2
make[1]: *** [[...]/Makefile:1401: tools/bpf/resolve_btfids] Error 2

This particular case happens for us when the source tree is moving, but
we're sharing an O= cache. This may or may not be a good idea, but
AFAICT there still is a real bug underneath, which I explore below.

> I do not know what is happening on your build machine,
> but judging from the error log, something went wrong
> while building objtool.
> 
> objtool Makefile is not a part of Kbuild.
> The maintainers of objtool may have some insight.

I'm no maintainer, but I found that the .exec-cmd.o.cmd dep file is
generated incorrectly due to improper fixdep dependencies:

$ head -2 [...]/tools/bpf/resolve_btfids/libsubcmd/.exec-cmd.o.cmd
# cannot find fixdep ([...]/tools/bpf/resolve_btfids/libsubcmd//fixdep)
# using basic dep data

Now, this soft error is normally OK, as long as you don't have any
missing or moved headers. But if these moved around, then normally the
fixdep'd dependencies would help rebuild (and regenerate .cmd files with
new paths) silently.

The bad .cmd file is reliably reproduced by:

# for an easier-to-build target that also builds libsubcmd:
cd tools/objtool
# for maximum cleanliness:
git clean -xfd ..
make
head -2 libsubcmd/.exec-cmd.o.cmd

(NB: if you look hard enough, you'll notice that we have a similar
"cannot find fixdep" error for tools/.../.fixdep.o.cmd too. I have some
analysis at https://issuetracker.google.com/313508829#comment32 --
this one is publicly accessible -- but its solution would be more
complex. I may raise a separate thread.)

The following patch fixes libsubcmd stuff for me. I can resubmit in a
proper patch form if desired, or feel free to scrape it as-is.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

diff --git a/tools/lib/subcmd/Makefile b/tools/lib/subcmd/Makefile
index b87213263a5e..59b09f280e49 100644
--- a/tools/lib/subcmd/Makefile
+++ b/tools/lib/subcmd/Makefile
@@ -76,7 +76,7 @@ include $(srctree)/tools/build/Makefile.include
 
 all: fixdep $(LIBFILE)
 
-$(SUBCMD_IN): FORCE
+$(SUBCMD_IN): fixdep FORCE
 	@$(MAKE) $(build)=libsubcmd
 
 $(LIBFILE): $(SUBCMD_IN)

