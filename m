Return-Path: <linux-kbuild+bounces-4728-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7884C9D27EE
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Nov 2024 15:18:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31BFD1F26A0E
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Nov 2024 14:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D3041CCB47;
	Tue, 19 Nov 2024 14:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qKHJuYQt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E724C22067;
	Tue, 19 Nov 2024 14:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732025892; cv=none; b=FQ+a+jVeWMf8AiEzJmKoqlW7BuSn3yFOzkXcEnADqE12++7F63Uic6OYyQQfjYyE0tAIY6X1AbV6eM/Ar1PGQ9tJ6Gg8ZOONTD7vz+CH6nhliwb9ql2g5fUThMd/HvN7RmCsm90ffug9rIKnyqFtJ0A8IFhnflBWUEKc7DnxFjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732025892; c=relaxed/simple;
	bh=mJzC5a4daWwZ8YlClCAB1o6tEvWR2J0Qw7lYayToIhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ENYS822T2DwmH5zQKDkAEVRRRRor8C29/POKj+AS2wcaNjocw2xgKU+7RQGQbskVcs1LWjP88jn6kYrMr85xpj7EuFC93phco2LoHTtGjMmDLf8s7yLDvaEII3tvOGpmPyX7NuLKGvF/qUaBCgMjRbMn7qR6YALS/hD7o0SQml4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qKHJuYQt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 746A4C4CECF;
	Tue, 19 Nov 2024 14:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732025891;
	bh=mJzC5a4daWwZ8YlClCAB1o6tEvWR2J0Qw7lYayToIhk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qKHJuYQtJsCsQXYCy45OMr5zPFQNPD8h322uGOIxi0tF3m+t3g3MkQd8pvTCLHs+Y
	 TI4eeNEH40RhQ4QdirKv+virVSd1t9zMqCtdhD+TFfRHCkhTj2w3XbUTam86nRSBsT
	 dQ+bcqsZzbEvXTeZVCv8Vt/XhjP/N8X5tp+r1ZSfb7q0zodwvDr64EfQ/jl3s0BvkQ
	 qxU4oxvagoUyuVbM5cpETU2G80TPJ7CY+0p1kOtj3EnkgM3+NPumiRD0gvrRGA+gbO
	 tRo2qcvoAFBafXGbIQ8t1bkz9+OUkfkK7xp5RtpmXMQChlo9Emce6+B0AkVGHuGywE
	 xoLSniFKlkKLw==
Date: Tue, 19 Nov 2024 07:18:09 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Sam James <sam@gentoo.org>,
	Kostadin Shishmanov <kostadinshishmanov@protonmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: Re: Build failure with GCC 15 (-std=gnu23)
Message-ID: <20241119141809.GA2196859@thelio-3990X>
References: <4OAhbllK7x4QJGpZjkYjtBYNLd_2whHx9oFiuZcGwtVR4hIzvduultkgfAIRZI3vQpZylu7Gl929HaYFRGeMEalWCpeMzCIIhLxxRhq4U-Y=@protonmail.com>
 <20241118205629.GA15698@thelio-3990X>
 <8734joj5gn.fsf@gentoo.org>
 <20241119041550.GA573925@thelio-3990X>
 <10db3077-9409-446d-8e50-1a2a803db767@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10db3077-9409-446d-8e50-1a2a803db767@app.fastmail.com>

On Tue, Nov 19, 2024 at 07:53:37AM +0100, Arnd Bergmann wrote:
> On Tue, Nov 19, 2024, at 05:15, Nathan Chancellor wrote:
> > On Tue, Nov 19, 2024 at 02:57:28AM +0000, Sam James wrote:
> >> 
> >> -std=gnu11 certainly isn't there.
> >
> > Ugh, this is because drivers/firmware/efi/libstub does not use
> > KBUILD_CFLAGS from the rest of the kernel when targeting x86:
> >
> > $ sed -n '9,21p' drivers/firmware/efi/libstub/Makefile
> > # non-x86 reuses KBUILD_CFLAGS, x86 does not
> > cflags-y                        := $(KBUILD_CFLAGS)
> >
> > cflags-$(CONFIG_X86_32)         := -march=i386
> > cflags-$(CONFIG_X86_64)         := -mcmodel=small
> > cflags-$(CONFIG_X86)            += -m$(BITS) -D__KERNEL__ \
> >                                    -fPIC -fno-strict-aliasing 
> > -mno-red-zone \
> >                                    -mno-mmx -mno-sse -fshort-wchar \
> >                                    -Wno-pointer-sign \
> >                                    $(call cc-disable-warning, 
> > address-of-packed-member) \
> >                                    $(call cc-disable-warning, gnu) \
> >                                    -fno-asynchronous-unwind-tables \
> >                                    $(CLANG_FLAGS)
> >
> > This isn't the first time this peculiarity has bitten us :/ sticking
> > '-std=gnu11' in there should resolve that issue.
> 
> Could we revisit the decision to make x86 special here and
> change it to use a modified KBUILD_CFLAGS like the other ones?

I am sure that we could have a discussion with Ard and the x86 folks
about it to see what flags need to be filtered and such but we will
still need something like I suggested in other areas of the kernel,
since this is not the only place where KBUILD_CFLAGS gets blown away.

> > arch/x86/boot/compressed/Makefile might need the same treatment. It
> > might make sense to introduce something like 'CSTD_FLAG := -std=gnu11'
> > then use that in the various places within the kernel that need it so it
> > can be consistently updated in the future whenever needed. I see that
> > flag in Makefile, arch/arm64/kernel/vdso32/Makefile, and
> > arch/x86/Makefile.
> 
> I actually have a patch to make the entire kernel use -std=gnu2x,
> but I never sent that because that requires gcc-9 or higher, and
> has no real upsides: the main difference is the handling of 'bool'
> types, and the std=gnu1x variant is simpler here because it avoids
> using the compiler-provided "stdbool.h".

Ah, that's what I thought the conclusion was but I could not remember
exactly.

Cheers,
Nathan

