Return-Path: <linux-kbuild+bounces-2216-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4342F90DFE2
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Jun 2024 01:30:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A399BB23401
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 23:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0415617E441;
	Tue, 18 Jun 2024 23:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RyBTIF4R"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61929185E70
	for <linux-kbuild@vger.kernel.org>; Tue, 18 Jun 2024 23:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718753372; cv=none; b=JfSv+gVhI17kEGbyHL87FHaBbsO2XgJhrshSlUcB76y1j4UrP+Y7VKQ/EMdNb8xbfmRnyUxI4dRPc+BcGMqM8Nff9KupJ5c2DV8XSZHXu7deftpYX40LbgQcaboei6XCl7bmrWBGV4o4wwDQkio1gFy4nAkJvkmYpYaIKj9599M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718753372; c=relaxed/simple;
	bh=E8G5hSF3gH09gGqdS4/BcWtT8QGdjoxiNQQafX5Yu9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NNag65fBigzAFAZz+KEIczM9f3Qt6pZLoNLztimyBVkTYI8KxaJb3lTNx63vawJhzVsr4Gpxi049cBQUU7HOvYKTHMOhK/kT74eIcogKsJPXgoWSOuwe7ipyLmaGXZqLYm/zjHAo4LgPeI2y9p7GqB4Ij95bKA7E+N0jM4JHX9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RyBTIF4R; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7062bf6d9a1so251666b3a.1
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Jun 2024 16:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718753371; x=1719358171; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1DT+XnTSYGnEqSakA/6gITqfUCRWY8Bgwvg7vAB2GZs=;
        b=RyBTIF4RmUTnr01INt2Ja9fqiGWchZok6C+88uFlZ77XTffL5zSlH6J0M6n8wF1LX0
         tOwRy68LDSboMerf7gI5B7l33y5Xy3OR3feD4BbcZBvzqJa4M11uYVqQczWfEzHOoEKa
         nAbBApjastLKIWvjHAW0LWVhtFI6fI6eSaCqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718753371; x=1719358171;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1DT+XnTSYGnEqSakA/6gITqfUCRWY8Bgwvg7vAB2GZs=;
        b=dVVa8eNEjyJ8K7ZyZrZoPv2LVXl3cayZlh1MZ/a1k6oWoX7YRwOEozJer1lo6Y1VZm
         8D6DaPy3AEt3xPauqAO+4VUNXYawCDiqOAHhumC3lYxOo9GpZDczrzwkdlJCRmAbg6e9
         QmZR28bWnF7AIOb8LYB8qe5+YisYgbTS2ACIRjhShrH7cn2IkOZUcqi31HWu6jyHrSMY
         kLk/xsS8wxMVed5xIXR9ObhbODL6YE/uSVEBcCCFHagck4BFvk2zcm9lyKAEbzi6lvV5
         PD9avigdA1i/5o2F9i4j/dTI7Ll2hOuQYce1ZGeNoanw6MTxJEuNhmSDZQ7Pom7A8PIH
         px2w==
X-Forwarded-Encrypted: i=1; AJvYcCUsWDORE513UqzYgrTQXDRv3gxDBoomeLYDgFbE8It0yxLqjq98fb8w0gu41hSGYA9dNM49uyiB8MsnY6OyzfC5YAverfORuhIsErfO
X-Gm-Message-State: AOJu0Yx2fTz29x8/dOjiW9zq0g7UPpJmzpPcdWxlrlQ/sP/tQXg0B9Sv
	k6MaBkxt1SseoL1zBx15ZU7MVdMSpq7xKeACbBXJeQWyCRFqutnwFbHKenmW1LQcmAnbRr12ZUw
	=
X-Google-Smtp-Source: AGHT+IHr6Or6cLZnh1EDBhWRCargHRQOQ35zCAilkZXGP2jgzr4IOTjQl1dYh4WhYEr0THgjHRDAaA==
X-Received: by 2002:a05:6a21:339a:b0:1b8:5e44:ea3c with SMTP id adf61e73a8af0-1bcbb5f400emr1189067637.48.1718753370769;
        Tue, 18 Jun 2024 16:29:30 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:390a:84d:6195:637e])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-6fee3ba48c1sm8561344a12.81.2024.06.18.16.29.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 16:29:30 -0700 (PDT)
Date: Tue, 18 Jun 2024 16:29:28 -0700
From: Brian Norris <briannorris@chromium.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, linux-kbuild@vger.kernel.org,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: possible dependency error?
Message-ID: <ZnIYWBgrJ-IJtqK8@google.com>
References: <ZGVi9HbI43R5trN8@bhelgaas>
 <CAK7LNAQPXapu3Ydh9XaB2ggGqgfYX5mo0pHPNHDcnm=w3ubYag@mail.gmail.com>
 <Zk-C5Eg84yt6_nml@google.com>
 <CAK7LNASrR2W-obUurSWaKLnQ+CB1o9iuoaM-hbHnv-zoazMzmQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNASrR2W-obUurSWaKLnQ+CB1o9iuoaM-hbHnv-zoazMzmQ@mail.gmail.com>

Hi Masahiro,

Thanks for the reply. I've been away for a bit, but I've poked at a few
more things now.

On Sun, May 26, 2024 at 01:35:43AM +0900, Masahiro Yamada wrote:
> On Fri, May 24, 2024 at 2:54 AM Brian Norris <briannorris@chromium.org> wrote:
> > --- a/tools/lib/subcmd/Makefile
> > +++ b/tools/lib/subcmd/Makefile
> > @@ -76,7 +76,7 @@ include $(srctree)/tools/build/Makefile.include
> >
> >  all: fixdep $(LIBFILE)
> >
> > -$(SUBCMD_IN): FORCE
> > +$(SUBCMD_IN): fixdep FORCE
> >         @$(MAKE) $(build)=libsubcmd
> >
> >  $(LIBFILE): $(SUBCMD_IN)
> 
> 
> 
> I may not fully understand the design policy of the tools/ build system,
> but this fix is presumably correct because the 'fixdep' binary
> is needed in each sub-directory for it to work correctly.
> 
> tools/bpf/resolve_btfids/libsubcmd/.exec-cmd.o.cmd must
> be generated by tools/bpf/resolve_btfids/libsubcmd/fixdep
> instead of by tools/bpf/resolve_btfids/fixdep.
> 
> But, fixing tools/lib/subcmd/Makefile is not enough.
> 
> *.cmd files under tools/bpf/resolve_btfids/libbpf/staticobjs/
> are broken for the same reason.
> So, this is fundamentally broken in many places.

I think I hacked something that works there too. It gets a bit uglier,
but not too bad IMO.

> And, as you noted, there is no easy way to fix .fixdep.o.cmd

I haven't come up with a *great* solution, but I came up with something
that works for the most part, by circumventing the normal Build /
Makefile.build split. It's getting pretty ugly too though...

> Your description in
> https://issuetracker.google.com/issues/313508829#comment32
> is all correct.
> 
> 
> "can we just use Kbuild?" is a good question.
> I do not understand why they use fragile build systems,
> where obviously they cannot do it correctly.
> 
> 
> In fact, I submitted a patch to migrate objtool to Kbuild
> because that fixes all the issues cleanly.
> 
> The objtool maintainers rejected it.
> https://lore.kernel.org/linux-kbuild/1551764896-8453-3-git-send-email-yamada.masahiro@socionext.com/
> 
> 
> Not only the build system.
> He also refused to participate in the standard Documentation
> directory.
> tools/objtool/Documentation/objtool.txt still resides in its own directory.

While I don't love having to solve the same problems repeatedly (once in
Kbuild; potentially-many in tools/), I'm also OK with trying to hack
fixes into the current duplicate build system if it's not prohibitively
complex to do so.

Here's what I have for now -- I might submit some or all of this as a
proper patchset if I can fix a few rough edges.

diff --git a/tools/build/Makefile b/tools/build/Makefile
index 17cdf01e29a0..fad93f64035d 100644
--- a/tools/build/Makefile
+++ b/tools/build/Makefile
@@ -43,11 +43,8 @@ ifneq ($(wildcard $(TMP_O)),)
 	$(Q)$(MAKE) -C feature OUTPUT=$(TMP_O) clean >/dev/null
 endif
 
-$(OUTPUT)fixdep-in.o: FORCE
-	$(Q)$(MAKE) $(build)=fixdep
-
-$(OUTPUT)fixdep: $(OUTPUT)fixdep-in.o
-	$(QUIET_LINK)$(HOSTCC) $(KBUILD_HOSTLDFLAGS) -o $@ $<
+$(OUTPUT)fixdep: $(srctree)/tools/build/fixdep.c
+	$(QUIET_CC)$(HOSTCC) $(KBUILD_HOSTLDFLAGS) -o $@ $<
 
 FORCE:
 
diff --git a/tools/build/Makefile.include b/tools/build/Makefile.include
index 8dadaa0fbb43..27b2090cb293 100644
--- a/tools/build/Makefile.include
+++ b/tools/build/Makefile.include
@@ -1,8 +1,16 @@
 # SPDX-License-Identifier: GPL-2.0-only
 build := -f $(srctree)/tools/build/Makefile.build dir=. obj
 
+# More than just $(Q), we sometimes want to suppress all command output from a
+# recursive make -- even the 'up to date' printout.
+ifeq ($(V),1)
+  SILENT_MAKE = $(Q)$(MAKE)
+else
+  SILENT_MAKE = $(Q)$(MAKE) --silent
+endif
+
 fixdep:
-	$(Q)$(MAKE) -C $(srctree)/tools/build CFLAGS= LDFLAGS= $(OUTPUT)fixdep
+	$(SILENT_MAKE) -C $(srctree)/tools/build CFLAGS= LDFLAGS= $(OUTPUT)fixdep
 
 fixdep-clean:
 	$(Q)$(MAKE) -C $(srctree)/tools/build clean
diff --git a/tools/lib/bpf/Makefile b/tools/lib/bpf/Makefile
index 2cf892774346..a8f34de1ca25 100644
--- a/tools/lib/bpf/Makefile
+++ b/tools/lib/bpf/Makefile
@@ -154,6 +154,8 @@ $(BPF_IN_SHARED): force $(BPF_GENERATED)
 	$(Q)$(MAKE) $(build)=libbpf OUTPUT=$(SHARED_OBJDIR) CFLAGS="$(CFLAGS) $(SHLIB_FLAGS)"
 
 $(BPF_IN_STATIC): force $(BPF_GENERATED)
+	$(call rule_mkdir)
+	$(SILENT_MAKE) -C $(srctree)/tools/build CFLAGS= LDFLAGS= OUTPUT=$(STATIC_OBJDIR) $(STATIC_OBJDIR)fixdep
 	$(Q)$(MAKE) $(build)=libbpf OUTPUT=$(STATIC_OBJDIR)
 
 $(BPF_HELPER_DEFS): $(srctree)/tools/include/uapi/linux/bpf.h
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

