Return-Path: <linux-kbuild+bounces-7041-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EB9AB0070
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 May 2025 18:30:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98FAC9E68BB
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 May 2025 16:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14AF02836BE;
	Thu,  8 May 2025 16:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H8yVftdY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94A22836A7;
	Thu,  8 May 2025 16:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746721794; cv=none; b=dy6p1Ae4r7A5xV9Gcrpkgm7+sxnTkZ9qsjz6lz53kTL/IYbFCC+QSYerUdSIKGUqn0I1Wx2mAypXbxPane9x9H2mBsSqn5AWMYrScBDm1ediw5GjXbEPkVCg87luSYuIx0B+7+s+/qsyB8WBuOW0X+GRrcwSyAmDAaFGrGCQdhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746721794; c=relaxed/simple;
	bh=td0/W1n9aOEtk0epnkPwUaZiByTowJBXnpm1ysKQLbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GM09O/JQl1vd0ne40J8HJ1yrHSh2CDjlSNtYWWYFWHArbJeVZ3BcocfF4TyZdJGCUZ2bpitvWwt+AU+QggDJOmchnumsaRhvPDxvKyIX63T7z159eY6cIKsMqMnV9sLT4Vu3P3nzVBtnMyTJGg+c5YYrEx2be8fPixT5G+PyfcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H8yVftdY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 575D7C4CEEB;
	Thu,  8 May 2025 16:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746721793;
	bh=td0/W1n9aOEtk0epnkPwUaZiByTowJBXnpm1ysKQLbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H8yVftdYn0Keq8UVjV3B31mLlJzlC/VdjbYSrnPZgX9bB5sLHwM3uJAM+wusIR2R7
	 N8FHP7zm0LXVWL2BTs+spGkZRHcuAi9E9me72T90cxkcvlD/6UhrvwivbYiVVNEnj6
	 cbaJRk89RE+6FBBXvhlMNQxep0axJwkaa3vowHzGLQBe7wiYIf5D3/ABf8MC2CGeqK
	 FTOR3/Ij3Kb13VxjqNs/0sWcy8zacL5fyfcUkmGMs1Z071OpPUTv7kblhdnLmW+/k4
	 KumLLr3FRRu8uIiXlxGzhgCjt1vw2dmSeccMukJ3XRp1pNQjBP/wM5Mvfz02oaaWCP
	 1WAXwqdFmj5hQ==
Date: Thu, 8 May 2025 09:29:50 -0700
From: Kees Cook <kees@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Mostafa Saleh <smostafa@google.com>, kvmarm@lists.linux.dev,
	kasan-dev@googlegroups.com, linux-hardening@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, will@kernel.org,
	oliver.upton@linux.dev, broonie@kernel.org, catalin.marinas@arm.com,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	elver@google.com, andreyknvl@gmail.com, ryabinin.a.a@gmail.com,
	akpm@linux-foundation.org, yuzenghui@huawei.com,
	suzuki.poulose@arm.com, joey.gouly@arm.com, masahiroy@kernel.org,
	nathan@kernel.org, nicolas.schier@linux.dev
Subject: Re: [PATCH v2 0/4] KVM: arm64: UBSAN at EL2
Message-ID: <202505080929.95B2310@keescook>
References: <20250430162713.1997569-1-smostafa@google.com>
 <202504301131.3C1CBCA8@keescook>
 <868qn8hfnp.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <868qn8hfnp.wl-maz@kernel.org>

On Wed, May 07, 2025 at 11:35:38AM +0100, Marc Zyngier wrote:
> On Wed, 30 Apr 2025 19:32:23 +0100,
> Kees Cook <kees@kernel.org> wrote:
> > 
> > On Wed, Apr 30, 2025 at 04:27:07PM +0000, Mostafa Saleh wrote:
> > > Many of the sanitizers the kernel supports are disabled when running
> > > in EL2 with nvhe/hvhe/proctected modes, some of those are easier
> > > (and makes more sense) to integrate than others.
> > > Last year, kCFI support was added in [1]
> > > 
> > > This patchset adds support for UBSAN in EL2.
> > 
> > This touches both UBSAN and arm64 -- I'm happy to land this via the
> > hardening tree, but I expect the arm64 folks would rather take it via
> > their tree. What would people like to have happen?
> 
> FWIW, I have now taken this in kvmarm/next. A stable branch is
> available at [1] for anyone to pull and resolve potential conflicts.

Thanks!


-- 
Kees Cook

