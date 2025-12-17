Return-Path: <linux-kbuild+bounces-10129-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EFCCC6975
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Dec 2025 09:32:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B93C300AC5A
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Dec 2025 08:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A56327FD7C;
	Wed, 17 Dec 2025 08:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UBCuDEIX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6C615B971;
	Wed, 17 Dec 2025 08:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765960328; cv=none; b=a9HNF4hFNJKuE8dMmSrSbBo3IESsXzJ2W2ID9xrlpOzvbhuG8Ja3YxeWTf+FmFoKehJAcV68a9Q8dJ9fzQm5hmXDh+wWlpDrJ5WfVSUFCTSXGnlyuboTdJ5jzPC9dUk/vKmtEKDYTo0dLslmtSO0IazLDzZFAXW+wfkqsCfVigM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765960328; c=relaxed/simple;
	bh=1xN0KXofvYvsOordnySdzaBKIAhJzwiBadQIF97UaLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MHJoiSQKgtWuf6NLqiWyGjC8YDi7RHS1Oz3gswDnyMknEGoMzu2JxwNz0p0WWPAIgt/m7cCrJauRywasdZAtonP8ULCIYfp8RBPdjLrnd3DmfynqDFIaH8W6SCfdPxnIsoH1i/MFMiFBQaQTIiOQYUYcb0ksdybFC7c5GH3OczY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UBCuDEIX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EA38C4CEF5;
	Wed, 17 Dec 2025 08:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765960327;
	bh=1xN0KXofvYvsOordnySdzaBKIAhJzwiBadQIF97UaLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UBCuDEIXlnKrz9CPy/D6+QPAsoXqYuiQ9aLoBp6nXmhurJicpDQWAe4YZzgKwlpVv
	 6hHBZ/oUEZxpzR3O07YfOztM/FB3IUZJQg8c0yPHHavoOk2WepBmeViwFe94BOEYXa
	 xVifcdnfmD6H5Ht1DOG9j7ztF5sF3Oai4JyW62mNHDgFkpCARGnUooqB9FexMCB+6j
	 CnMsqmvVlR/NsfKICTtkwwkH7TpHgUVzzZBvwU8GJesB69YxE6FV+W2pK4uWKRxcZ2
	 TGSreTMU3XbW+K6Tnjy0MXVFKdeYlKqw+/CXH7M6ZoDTJyboBP2iK1qrpKEuX3meRo
	 xLGpZqKbXGeUQ==
Date: Wed, 17 Dec 2025 17:32:02 +0900
From: Nathan Chancellor <nathan@kernel.org>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: Nicolas Schier <nsc@kernel.org>, patso@likewhatevs.io,
	Justin Stitt <justinstitt@google.com>, eddyz87@gmail.com,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [GIT PULL] kbuild changes for v6.19
Message-ID: <20251217083202.GA2118121@ax162>
References: <aS22QhwdrHN24ToD@levanger>
 <CACT4Y+Z8aCz0XcoJx9XXPHZSZHxGF8Kx9iUbFarhpTSEPDhMfg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACT4Y+Z8aCz0XcoJx9XXPHZSZHxGF8Kx9iUbFarhpTSEPDhMfg@mail.gmail.com>

On Wed, Dec 17, 2025 at 05:16:02PM +0900, Dmitry Vyukov wrote:
> On Mon, 1 Dec 2025 at 16:38, Nicolas Schier <nsc@kernel.org> wrote:
> > Pat Somaru (1):
> >       scripts/clang-tools: Handle included .c files in gen_compile_commands
> 
> /\/\/\/\/\/\/\
> 
> This commit breaks invocation of clang tools for me.
> 
> For example I now have this fake entry for mock_uncore.c which
> pretends to produce intel_uncore.o (along with 2 other commands which
> produce the same object file):
...
> An attempt to invoke a clang tool using this database legitimately
> fails with the following errors (the file is not supposed and can't
> compile on its own):
> 
> clang-tool: drivers/gpu/drm/i915/selftests/mock_uncore.c: exit status 1
> drivers/gpu/drm/i915/selftests/mock_uncore.c:47:2: error: call to
> undeclared function 'ASSIGN_RAW_WRITE_MMIO_VFUNCS'; ISO C99 and later
> do not support implicit function declarations
> [-Wimplicit-function-declaration]
>    47 |         ASSIGN_RAW_WRITE_MMIO_VFUNCS(uncore, nop);
>       |         ^
> drivers/gpu/drm/i915/selftests/mock_uncore.c:47:39: error: use of
> undeclared identifier 'nop'; did you mean 'nopv'?
>    47 |         ASSIGN_RAW_WRITE_MMIO_VFUNCS(uncore, nop);
>       |                                              ^~~
>       |                                              nopv
> /arch/x86/include/asm/hypervisor.h:71:13: note: 'nopv' declared here
>    71 | extern bool nopv;
>       |             ^
> drivers/gpu/drm/i915/selftests/mock_uncore.c:48:2: error: call to
> undeclared function 'ASSIGN_RAW_READ_MMIO_VFUNCS'; ISO C99 and later
> do not support implicit function declarations
> [-Wimplicit-function-declaration]
>    48 |         ASSIGN_RAW_READ_MMIO_VFUNCS(uncore, nop);
>       |         ^
> drivers/gpu/drm/i915/selftests/mock_uncore.c:48:38: error: use of
> undeclared identifier 'nop'; did you mean 'nopv'?
>    48 |         ASSIGN_RAW_READ_MMIO_VFUNCS(uncore, nop);
>       |                                             ^~~
>       |                                             nopv
> /arch/x86/include/asm/hypervisor.h:71:13: note: 'nopv' declared here
>    71 | extern bool nopv;
>       |             ^
> 4 errors generated.
> Error while processing /drivers/gpu/drm/i915/selftests/mock_uncore.c.
> 
> 
> What am I doing wrong?

Nothing. As you note, ASSIGN_RAW_WRITE_MMIO_VFUNCS is defined in
drivers/gpu/drm/i915/intel_uncore.c but it is used in
drivers/gpu/drm/i915/selftests/mock_uncore.c, which is not designed to
be built standalone. We could potentially move
ASSIGN_RAW_WRITE_MMIO_VFUNCS into a common header to avoid this but I
think I would rather just revert 9362d34acf91, as I already figured that
this was going to be fragile:

  https://lore.kernel.org/20251007163338.GA547361@ax162/

I would rather discourage including .c files if folks want clangd to
work properly since this seems fundamentally unsolvable if developers
have written .c files in this manner. I am open to other thoughts
though.

Cheers,
Nathan

