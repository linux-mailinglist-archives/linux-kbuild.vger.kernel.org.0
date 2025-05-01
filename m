Return-Path: <linux-kbuild+bounces-6826-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91076AA594D
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 May 2025 03:20:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0ACAE4A4F24
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 May 2025 01:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A46C01E8331;
	Thu,  1 May 2025 01:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J9UPb7O1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D5E2F3E;
	Thu,  1 May 2025 01:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746062426; cv=none; b=sZaFBgUJEVb4LIYtigfeGrvXUXs2KUPp2MP2lOvkPWJa4Q50zK35XIbxnNsGGYdibj91O7fhGg5vMBli2gyS0JTCIjj2GSWZKnRscufHpKJlPqK8ebiXQ9NoGJsac12LAmW7zuirJEC9XZzwYjajAuDI1X3brFsRcUIHMfBHR58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746062426; c=relaxed/simple;
	bh=3IyZpzgUFuYEN0HmGWoxBd+Pp4s52MegKxt/UbLbtvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EHH5HBLOvtTWB+rvg5AJ3n0s/dQ0lkDJ2XPg5aBKyOJ0N/U58TytEEp4ry+7it/0B96/lAHtXsZJzhoSVQhyUKbsZSFx63UwHhmw5uZpds3Hxg2mKjeGaTtr2uBoIWADRaErB/HB2vWfEYsfChTFqCYsx7GiHyFU0AAj8vjotSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J9UPb7O1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 545A9C4CEE7;
	Thu,  1 May 2025 01:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746062426;
	bh=3IyZpzgUFuYEN0HmGWoxBd+Pp4s52MegKxt/UbLbtvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J9UPb7O1+IshFa6WZXkApQ+FAeIYpgBX1gm3DnzTRPPQniIbPxJ0mnpDgNXksCSiw
	 EiJIpHndVFV8TFZZCn6y2qiQZH1kVyjHWdpHdppasynomKAKRbF4h5DqAK5w9+Zm60
	 QriVa44hdz8SuzrcePVcBIwga5odCZZ6gD5julo/1T0vNwHonX11BZMgwXxZ+oayVh
	 khxVRgiJoOOawXBjR2NBlKgczD0G5fJZAPypc7ef60eeVLmIQf/Hb9nJeWAcMWJbsZ
	 /VDKz6t8/rfltnt5CKqzQ6S+9RLALBQytoDgEg7IrJyKEYk7FBml01PKKNc0i6CJ6w
	 nmofEm/B5nCvQ==
Date: Wed, 30 Apr 2025 18:20:19 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Rong Xu <xur@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alice Ryhl <aliceryhl@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Rafael Aquini <aquini@redhat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Stafford Horne <shorne@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Teresa Johnson <tejohnson@google.com>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] kbuild: distributed build support for Clang ThinLTO
Message-ID: <20250501012019.GB3762678@ax162>
References: <20250420010214.1963979-1-xur@google.com>
 <CAF1bQ=RWmNt1xnnoQrsBG6-TXzSiqX6e-_Squ22UOSmUi-Tr8w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF1bQ=RWmNt1xnnoQrsBG6-TXzSiqX6e-_Squ22UOSmUi-Tr8w@mail.gmail.com>

Hi Rong,

On Tue, Apr 29, 2025 at 01:34:00PM -0700, Rong Xu wrote:
> Just wanted to gently follow up on this patch that I sent previously.
> 
> From a toolchain and compiler perspective, I genuinely believe that
> kernel ThinLTO builds should use this. I really want to get some feedback
> and reviews on this patch.

My apologies for some radio silence, other regressions and issues have
been higher priority until now. I will try to take a closer look at this
soon but I do have one comment based on your comment above and the
Kconfig help text...

> On Sat, Apr 19, 2025 at 6:02 PM <xur@google.com> wrote:
...
> > diff --git a/arch/Kconfig b/arch/Kconfig
> > index b0adb665041f1..cbeeeb9b076d8 100644
> > --- a/arch/Kconfig
> > +++ b/arch/Kconfig
> > @@ -810,6 +810,18 @@ config LTO_CLANG_THIN
> >             https://clang.llvm.org/docs/ThinLTO.html
> >
> >           If unsure, say Y.
> > +
> > +config LTO_CLANG_THIN_DIST
> > +       bool "Clang ThinLTO in distributed mode (EXPERIMENTAL)"
> > +       depends on HAS_LTO_CLANG && ARCH_SUPPORTS_LTO_CLANG_THIN
> > +       select LTO_CLANG
> > +       help
> > +         This option enables Clang's ThinLTO in distributed build mode.
> > +         In this mode, the linker performs the thin-link, generating
> > +         ThinLTO index files. Subsequently, the build system explicitly
> > +         invokes ThinLTO backend compilation using these index files
> > +         and pre-linked IR objects. The resulting final object files
> > +         are with the .final_o suffix.
> >  endchoice

This says what the option does but it does not really say why the user
would want to use this over CONFIG_LTO_CLANG_THIN_DIST; even as someone
relatively familiar with these technologies, I am not sure what this
means for the build or resulting kernel. Is there any reason why a user
would want to use in-process ThinLTO instead of distributed? You seem to
make the case above and in Discourse that the kernel would benefit from
this, so should we just wholesale replace in-process ThinLTO with the
distributed one?

Cheers,
Nathan

