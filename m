Return-Path: <linux-kbuild+bounces-2026-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DACFB9005F3
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Jun 2024 16:12:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FD971F27053
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Jun 2024 14:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1AA2193097;
	Fri,  7 Jun 2024 14:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="YyrtcjUX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YRsTiXvq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7D514F11B;
	Fri,  7 Jun 2024 14:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717769533; cv=none; b=MguXsrUj3ztjjWm3c/zA4jQvciv5hc0Qh7ZIQdE+vhez/1gVuSSzUJ0Wd2HGzU3cojZrLj1/VTlUog+hzFrfTGxI6sqnhTe7Uj7w/+8D4ohWl700+0fhQMkRfhGC2XPtsliQuhthCu3MNQ4rJoO4anrmltrqbzdACU1AjFbQ1Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717769533; c=relaxed/simple;
	bh=s3Z3gwcM2mExYmHr73HG/w9dhoTKFqZX8pMjtLuupXI=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=KayM546S2KCcRn7+QDF8MylspQp/uRO6F72vEcN6knBzfXLe9IrNHPznwjN+bs8DoE8LHoA44eBqr1omCMOI8oBuWW1nlJ13mYaV/zcfI4c0SItTsmFLqyJ8mOHUXrnWFmzC5OHJrBSD0Lle/X3ukGbILMMTU8UjnOkSx9JY+iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=YyrtcjUX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YRsTiXvq; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 6B36B13800D4;
	Fri,  7 Jun 2024 10:12:10 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Fri, 07 Jun 2024 10:12:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1717769530; x=1717855930; bh=INQDVUt3zv
	kdBbSzkPvyjoHwhwcMzQA7bETzh/itaN8=; b=YyrtcjUXNNnFS59RukiM2VgRDV
	7NzuuzQnmtFqKzlZoI6yOs7QLxWYq2iwRhw3mKKxvCRKa6LCMqRN+dOZ/jYOYr2S
	xaBy781VNVw7/8PnWD8dewvpQ0iUoILS8HKhAF4zLrRH+7HQ6Zlqayda9oTtPSZt
	Rfy6raVdB55pVAiLBue3tpVWZ4wS26pkYUix6nfmaUse0LUUOGUCh2dgSTqCY9RW
	4sLsc/ftzjC1NqnRty68kISenbb0/hKXvO6GQnGIRdTCT28p2IdGtErcJBX9hu7s
	Ia7FWIVrU+AG4Y0e5ezduYoTM8x8fcIcPeRSMFZvpjtGy3C8HHw9bF+xgLbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1717769530; x=1717855930; bh=INQDVUt3zvkdBbSzkPvyjoHwhwcM
	zQA7bETzh/itaN8=; b=YRsTiXvqVEiSCF5FjBDzt4UspukrE6jRNuQrOQTL+zfd
	QX0qERkqzp/UV11ZVEf+88FyR0D52HKgakrg6nhnQFDP5wWPGhUEHYqvQ2z9XyAc
	SBfE5S9XsHMeGzfU6VfBaRL38/SiU1Z04zjgQ0vTOU8fN97eS5+TW0ZtDKsRy717
	XPpSi1siN1eifuIRbYRnEVcGLmHVOB2IGuGjsAKQruRWbi8vEOLaQPszzGivVY52
	uU26p6Fc2fPN8kJ/JJRUuUrLVrkRdTeRJOwNNFHNQbdD+H26IuJHuehEPsxVffOH
	u93XYskDZa6gfqupgxuiluS+vk+Xu75w4xpXcl+sWw==
X-ME-Sender: <xms:ORVjZv3zJ0YztQZcHJsy_txTMcc4h7eyPzJ51gQAIgNgNRDSgmOffg>
    <xme:ORVjZuFMal_-XCJFWzUMS-ZaEPu4s0H0YB-ukvHK5pR8Olo5WQjW6wmaMTd3m3U4t
    x_JE-7JF9pDHnRlkEA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedtuddggeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:ORVjZv45IRbbg0GLh6zoKd-Bz1XyjfNc5JYAiV8W9hT5AemWrLC39g>
    <xmx:ORVjZk1RS0UkNN5y33fPqqrTeB-k3ND6cn7QuycKjfgOBJHFQufp1w>
    <xmx:ORVjZiGQXCFqb5tGyNOPm7ZRcTRDIGtjORriP1hGK8h2hEUHhCiGQg>
    <xmx:ORVjZl-gOVsrm3-xW_11CdcRTMRpdIveiHbh9xscMlrqoro8VCe31w>
    <xmx:OhVjZq9s-3CG3GOJlRiOBjDMpI9Z5a5d2QKyYdbwZi5urMECgoMurNzn>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 31CB8B6008D; Fri,  7 Jun 2024 10:12:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-497-g97f96844c-fm-20240526.001-g97f96844
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <23ddf649-f70b-47b0-90df-af572fd50504@app.fastmail.com>
In-Reply-To: <87frtoq5yz.fsf@mail.lhotse>
References: <20240607061629.530301-1-arnd@kernel.org>
 <87frtoq5yz.fsf@mail.lhotse>
Date: Fri, 07 Jun 2024 16:11:25 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Michael Ellerman" <mpe@ellerman.id.au>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Masahiro Yamada" <masahiroy@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc: vdso: fix building with wrong-endian toolchain
Content-Type: text/plain

On Fri, Jun 7, 2024, at 14:42, Michael Ellerman wrote:
> Arnd Bergmann <arnd@kernel.org> writes:
>>
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> ---
>> I'm fairly sure this worked in the past, but I did not try to bisect the
>> issue.
>
> It still works for me.
>
> I use the korg toolchains every day, and kisskb uses them too.
>
> What commit / defconfig are you seeing the errors with?
>
> Is it just the 12.3.0 toolchain or all of them? I just tested 12.3.0
> here and it built OK.
>
> I guess you're building on x86 or arm64? I build on ppc64le, I wonder if
> that makes a difference.
>
> The patch is probably OK regardless, but I'd rather understand what the
> actual problem is.

I tested again and found that the problem is actually part of my
local build setup, which overrides the 'CPP' variable in the
top-level makefile that I use for building multiple kernels
concurrently.

This ends up clashing with this other line that only
powerpc sets:

arch/powerpc/Makefile:CPP               = $(CC) -E $(KBUILD_CFLAGS)

It's rare that someone overrides CPP, so quite possibly I'm
the only one that has seen this so far, but it also seems like
it should be possible to do that.

This patch seems to work as well for me, and is a little
more logical, but it's also more invasive and has a
higher regression risk:

8<---------
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 65261cbe5bfd..9ad4ca318e34 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -62,14 +62,14 @@ KBUILD_LDFLAGS_MODULE += arch/powerpc/lib/crtsavres.o
 endif
 
 ifdef CONFIG_CPU_LITTLE_ENDIAN
-KBUILD_CFLAGS  += -mlittle-endian
+KBUILD_CPPFLAGS        += -mlittle-endian
 KBUILD_LDFLAGS += -EL
 LDEMULATION    := lppc
 GNUTARGET      := powerpcle
 MULTIPLEWORD   := -mno-multiple
 KBUILD_CFLAGS_MODULE += $(call cc-option,-mno-save-toc-indirect)
 else
-KBUILD_CFLAGS += $(call cc-option,-mbig-endian)
+KBUILD_CPPFLAGS += $(call cc-option,-mbig-endian)
 KBUILD_LDFLAGS += -EB
 LDEMULATION    := ppc
 GNUTARGET      := powerpc
@@ -95,7 +95,7 @@ aflags-$(CONFIG_CPU_BIG_ENDIAN)               += $(call cc-option,-mbig-endian)
 aflags-$(CONFIG_CPU_LITTLE_ENDIAN)     += -mlittle-endian
 
 ifeq ($(HAS_BIARCH),y)
-KBUILD_CFLAGS  += -m$(BITS)
+KBUILD_CPPFLAGS        += -m$(BITS)
 KBUILD_AFLAGS  += -m$(BITS)
 KBUILD_LDFLAGS += -m elf$(BITS)$(LDEMULATION)
 endif
@@ -176,7 +176,6 @@ KBUILD_CPPFLAGS     += -I $(srctree)/arch/powerpc $(asinstr)
 KBUILD_AFLAGS  += $(AFLAGS-y)
 KBUILD_CFLAGS  += $(call cc-option,-msoft-float)
 KBUILD_CFLAGS  += $(CFLAGS-y)
-CPP            = $(CC) -E $(KBUILD_CFLAGS)
 
 CHECKFLAGS     += -m$(BITS) -D__powerpc__ -D__powerpc$(BITS)__
 ifdef CONFIG_CPU_BIG_ENDIAN
diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
index 1b93655c2857..3516e71926e5 100644
--- a/arch/powerpc/kernel/vdso/Makefile
+++ b/arch/powerpc/kernel/vdso/Makefile
@@ -59,7 +59,7 @@ ldflags-$(CONFIG_LD_IS_LLD) += $(call cc-option,--ld-path=$(LD),-fuse-ld=lld)
 ldflags-$(CONFIG_LD_ORPHAN_WARN) += -Wl,--orphan-handling=$(CONFIG_LD_ORPHAN_WARN_LEVEL)
 
 # Filter flags that clang will warn are unused for linking
-ldflags-y += $(filter-out $(CC_AUTO_VAR_INIT_ZERO_ENABLER) $(CC_FLAGS_FTRACE) -Wa$(comma)%, $(KBUILD_CFLAGS))
+ldflags-y += $(filter-out $(CC_AUTO_VAR_INIT_ZERO_ENABLER) $(CC_FLAGS_FTRACE) -Wa$(comma)%, $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
 
 CC32FLAGS := -m32
 LD32FLAGS := -Wl,-soname=linux-vdso32.so.1
--------->8

     Arnd

