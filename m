Return-Path: <linux-kbuild+bounces-8675-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01413B3DF02
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Sep 2025 11:51:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DD4A3AB38A
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Sep 2025 09:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 179922EFD83;
	Mon,  1 Sep 2025 09:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="m63Y1nxV";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="solHVNiZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A841B1C862E;
	Mon,  1 Sep 2025 09:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756720273; cv=none; b=nx7sQ0lM/Ig8e+5WdvuvncbJXPyu/tUHeltTXmcusGU0Rv5nkwrdcW0JmgKx5WQqgoz04SEt1tLYPKmRzT2DHKUDcFfm2DGNP/VkStldDFL91c87wEUB1CfFclEn0nI+7P/7lqiCuZrsTCBGxY+oIzp14VVEqWkPmKWCgeqrvGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756720273; c=relaxed/simple;
	bh=wvzyVV3KRjAs+xblwn4772K7SStlqJ0Z6F7/4ovlrp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HIkfGYWQx+qk6TgQ7fExzGglyZva3Q/asH9VLUOXOxw3k7NeK1lxVcxzx99RghGSTBbkRbE4zcapkg0D8ESR2tLxb091v/sp27aD5CJim1WX80b/985lPFiaCDf95ap6gsuXxIiylaWXbRVvBbY1dZumF1bchgoU7op2/FZXi60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=m63Y1nxV; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=solHVNiZ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Mon, 1 Sep 2025 11:51:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1756720268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rxsm9S/NTtsx8WH9JSZwQYNc5IHcQefxbfSvhikEFTA=;
	b=m63Y1nxVsVkTnr9wRvrhR8TdGXPCqjYawfzp6m9wp9NGGHput1YmJR8WKDulvz9B34AwSd
	kv6JZ/kcASeOeq1Rhx6tiQyk9/SXFBB3pXqDZIOa7TqhPmPm+MSKnLV90Xrg9ZAJmKNsIh
	ErxmJAFKIWaNd/0hXq0GNbP71DoF4N8AmLZkvxjEzVUUEOnufPG1sAmLR+ywmRdIo1+yYq
	D6Tf0nstI/rS58VnMUFxcvg3e+oI6DMGGX/KRg1RfDF7v10jXzYtJzHd1lLENc/aFye+SZ
	8hbYWaIn9EmOmjaMCDm7/P+y7WuBmDtM9bEhPovEz/5MXCOIDVgcdpwXZSkoBw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1756720268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rxsm9S/NTtsx8WH9JSZwQYNc5IHcQefxbfSvhikEFTA=;
	b=solHVNiZgne0fnB3vejkHUbDY3nNqjtSdCUR989I+ZD9DOdLA1L8mlMYeh59GI3GuG0IPs
	p0ksYGhJ+uGwU3AA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas.schier@linux.dev>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 2/2] kbuild: userprogs: also inherit byte order and ABI
 from kernel
Message-ID: <20250828083747-e819430a-986f-4f71-bbc8-e402e339c9a2@linutronix.de>
References: <20250813-kbuild-userprogs-bits-v1-0-2d9f7f411083@linutronix.de>
 <20250813-kbuild-userprogs-bits-v1-2-2d9f7f411083@linutronix.de>
 <20250827075334-3332c08d-66f3-427d-b0b2-4460e779f261@linutronix.de>
 <20250827224935.GB414199@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250827224935.GB414199@ax162>

On Wed, Aug 27, 2025 at 03:49:35PM -0700, Nathan Chancellor wrote:
> On Wed, Aug 27, 2025 at 08:31:00AM +0200, Thomas Weißschuh wrote:
> > On Wed, Aug 13, 2025 at 07:43:41AM +0200, Thomas Weißschuh wrote:
> ...
> > > diff --git a/Makefile b/Makefile
> > > index d0f5262a9c0f3b4aa79a91c20cc149d034ffa0b7..7d40f84d5efde18ed3a2f4d8cf7a9b1ec3610ed4 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -1137,8 +1137,8 @@ ifneq ($(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS),)
> > >  LDFLAGS_vmlinux	+= --emit-relocs --discard-none
> > >  endif
> > >  
> > > -# Align the bit size of userspace programs with the kernel
> > > -USERFLAGS_FROM_KERNEL := -m32 -m64 --target=%
> > > +# Align the bit size, byte order and architecture of userspace programs with the kernel
> > > +USERFLAGS_FROM_KERNEL := -m32 -m64 -mlittle-endian -mbig-endian -EL -EB --target=% -march=% -mabi=%
> > >  KBUILD_USERCFLAGS  += $(filter $(USERFLAGS_FROM_KERNEL), $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
> > >  KBUILD_USERLDFLAGS += $(filter $(USERFLAGS_FROM_KERNEL), $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))

(...)

> > For architectures with multiple possible byte orders or ABIs the toolchain
> > might be able to build the kernel for all combinations but might not have a
> > matching libc for them. Currently userprogs uses the default byteorder and
> > ABI from the compiler, which will match the included libcs if there is any.
> > However the resulting binary might not run on the built kernel.
> > CC_CAN_LINK can be extended to generically handle different byte orders, as
> > for those we have standard kconfig symbols. But handling ABIs would need to
> > be architecture specific and a bit more complex.
> > 
> > We can't use KBUILD_*FLAGS for CC_CAN_LINK, as they are not yet set during
> > the configuration stage.
> 
> Right, this was the biggest thing that I noticed, which would really
> help us out...
> 
> > I see the following options:
> > 
> > * Add byte order and architecture-specific ABI handling to CC_CAN_LINK
> 
> How do you envision this? Different default lines for each combination?

Exactly. The normal cases can be handled generically. For example the kconfig
below works for architectures which only differ in byte order and 32bit/64bit,
which are most of them. MIPS should require more logic.
Also I'm ignoring x32, as it is never the kernel's native ABI.

 config CC_CAN_LINK
        bool
+       default $(cc_can_link_user,$(m64-flag) -mlittle-endian) if 64BIT && CPU_LITTLE_ENDIAN
+       default $(cc_can_link_user,$(m64-flag) -mbig-endian) if 64BIT && CPU_BIG_ENDIAN
        default $(cc_can_link_user,$(m64-flag)) if 64BIT
+       default $(cc_can_link_user,$(m32-flag) -mlittle-endian) if CPU_LITTLE_ENDIAN
+       default $(cc_can_link_user,$(m32-flag) -mbig-endian) if CPU_BIG_ENDIAN
        default $(cc_can_link_user,$(m32-flag))


> Feels like that could get complicated quickly but this would probably be
> the objectively most robust and "hands off" option.

Agreed.

> > * Accept that userprogs might not be runnable on the built kernel
> 
> I do wonder how common running the userprogs are. Obviously you hit this
> in testing but I am curious if others have reported this.

I'm not aware of any reports. Usage of userprogs seems to be fairly low in
general, judging by the issues I ran into which nobody reported or fixed
before. One of the original reasons for the introduction of userprogs were
usermode drivers. These indeed required execution. But the whole framework
was removed recently, although it might come back at some point.

> > * Let the user manually set CC_CAN_LINK to override the autodetection

(...)

> I am not surethat would actually help us here plus I still do not like
> the idea of throwing this back to the user.

Agreed. My personal preference would be my proposal from above.

> > * Add separate handling for runnable userprogs
> 
> What do you mean by this?

I see two possibilities.
* New kconfig and FLAGS mirroring the existing ones to build runnable
  userprogs.
* Introspection of the userprog executable ELF to see if it can run on the
  current kernel configuration.

> > * Use tools/include/nolibc/ for userprogs instead of the toolchain libc
> >   (unlikely, but I wanted do mention the option)
> 
> This could be interesting to explore but I assume using a cross libc
> could be desirable for some people depending on the testing?

Yes, probably. Although the test code in samples/ should interact directly with
the kernel, without much involvement from libc.


Thomas

