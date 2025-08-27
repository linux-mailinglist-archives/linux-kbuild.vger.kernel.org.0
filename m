Return-Path: <linux-kbuild+bounces-8636-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD236B38EB4
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Aug 2025 00:49:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E6F21887D56
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Aug 2025 22:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9793305E19;
	Wed, 27 Aug 2025 22:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ocX7D9UB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918DF30CD9C;
	Wed, 27 Aug 2025 22:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756334979; cv=none; b=VtXyUUvosC1oIZeKGVgjx+ON+SiimDPdpC0d6F2Eru/BibTJ7BQxpY/Ydg2caqnSMamo6n+MXKRguQmuzA0Gzw7O0rIAXnOqowln7AT2WD087Ihon1dovwIq0q8yAgzFkNXE3chWX4bvoKy5HBVd3/U6NI3u/YnOrGAhNExaLLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756334979; c=relaxed/simple;
	bh=ybnfv5G/UHvJ1FV2+oMrm4MyyGYbL0FpiszOiePMzGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FyC2NPgyFUbwJseEzec7SN1x1guGVSdeFGHgq75LHBJUMVB2rx1658g3sCVvsJbTQCJX9Um1LKkC5ru4aD0o0HhhWAYrH/WjsldtO2rKGUqX8D0wiZaA/pofbX1NV5H0Noj3RcV+/IrnsImh2DpDA12HzxFezDFUuAiLklQ+Qf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ocX7D9UB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCC68C4CEEB;
	Wed, 27 Aug 2025 22:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756334979;
	bh=ybnfv5G/UHvJ1FV2+oMrm4MyyGYbL0FpiszOiePMzGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ocX7D9UBVYze+yjlww4QFREVgkeu1y0cTcIewEiMl481Vq1waDGRmAToN0KNJi37C
	 g3H3fK/lloeGSxSlw6ON+Tou4PvOzGt32XX5obxB7pwxAQpz9sEwMlT1mZ4RYo38bj
	 KrYlDESV+p9lh5WmRZlkPgEj8Ik5mmG00nodJ8VqOlas4dbSzDlz9xPo84Pgjx/XLV
	 QSQB8+i9Zdatsi21s7iEAdJiNo1oSEpR9Y9xwqTlG6q24lBSkS9ikSdoTnxv9PK9jf
	 NDXx1oc5iEIIL+hilfI0ooGhHoFsdC9qHxOSrlkZG/+Mt8NjBTU8Z7tjm19L3WrjQi
	 DZKqiDWDS73zQ==
Date: Wed, 27 Aug 2025 15:49:35 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nicolas Schier <nicolas.schier@linux.dev>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 2/2] kbuild: userprogs: also inherit byte order and ABI
 from kernel
Message-ID: <20250827224935.GB414199@ax162>
References: <20250813-kbuild-userprogs-bits-v1-0-2d9f7f411083@linutronix.de>
 <20250813-kbuild-userprogs-bits-v1-2-2d9f7f411083@linutronix.de>
 <20250827075334-3332c08d-66f3-427d-b0b2-4460e779f261@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250827075334-3332c08d-66f3-427d-b0b2-4460e779f261@linutronix.de>

Hi Thomas,

On Wed, Aug 27, 2025 at 08:31:00AM +0200, Thomas Weißschuh wrote:
> On Wed, Aug 13, 2025 at 07:43:41AM +0200, Thomas Weißschuh wrote:
...
> > diff --git a/Makefile b/Makefile
> > index d0f5262a9c0f3b4aa79a91c20cc149d034ffa0b7..7d40f84d5efde18ed3a2f4d8cf7a9b1ec3610ed4 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1137,8 +1137,8 @@ ifneq ($(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS),)
> >  LDFLAGS_vmlinux	+= --emit-relocs --discard-none
> >  endif
> >  
> > -# Align the bit size of userspace programs with the kernel
> > -USERFLAGS_FROM_KERNEL := -m32 -m64 --target=%
> > +# Align the bit size, byte order and architecture of userspace programs with the kernel
> > +USERFLAGS_FROM_KERNEL := -m32 -m64 -mlittle-endian -mbig-endian -EL -EB --target=% -march=% -mabi=%
> >  KBUILD_USERCFLAGS  += $(filter $(USERFLAGS_FROM_KERNEL), $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
> >  KBUILD_USERLDFLAGS += $(filter $(USERFLAGS_FROM_KERNEL), $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
> 
> I looked some more at the breakage reported from -next [0].

Thanks for looking into this.

> For architectures with multiple possible byte orders or ABIs the toolchain
> might be able to build the kernel for all combinations but might not have a
> matching libc for them. Currently userprogs uses the default byteorder and
> ABI from the compiler, which will match the included libcs if there is any.
> However the resulting binary might not run on the built kernel.
> CC_CAN_LINK can be extended to generically handle different byte orders, as
> for those we have standard kconfig symbols. But handling ABIs would need to
> be architecture specific and a bit more complex.
> 
> We can't use KBUILD_*FLAGS for CC_CAN_LINK, as they are not yet set during
> the configuration stage.

Right, this was the biggest thing that I noticed, which would really
help us out...

> I see the following options:
> 
> * Add byte order and architecture-specific ABI handling to CC_CAN_LINK

How do you envision this? Different default lines for each combination?
Feels like that could get complicated quickly but this would probably be
the objectively most robust and "hands off" option.

> * Accept that userprogs might not be runnable on the built kernel

I do wonder how common running the userprogs are. Obviously you hit this
in testing but I am curious if others have reported this.

> * Let the user manually set CC_CAN_LINK to override the autodetection

I am not sure I like this one but maybe we could have a hidden
CC_MAY_LINK with something like the current CC_CAN_LINK then CC_CAN_LINK
could be turned into something like

    config CC_CAN_LINK
        bool "Toolchain can link userspace executables" if !COMPILE_TEST
        default CC_MAY_LINK

I am not surethat would actually help us here plus I still do not like
the idea of throwing this back to the user.

> * Add separate handling for runnable userprogs

What do you mean by this?

> * Use tools/include/nolibc/ for userprogs instead of the toolchain libc
>   (unlikely, but I wanted do mention the option)

This could be interesting to explore but I assume using a cross libc
could be desirable for some people depending on the testing?

Cheers,
Nathan

