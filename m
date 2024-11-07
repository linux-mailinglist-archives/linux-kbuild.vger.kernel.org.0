Return-Path: <linux-kbuild+bounces-4548-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7639C0AAC
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2024 17:01:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55849B229FF
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2024 16:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCD47212F0E;
	Thu,  7 Nov 2024 16:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hxRpCXWW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BDD185B56;
	Thu,  7 Nov 2024 16:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730995306; cv=none; b=kDr04ihUAIQB+G8qceL71sASy26fCXNWAwgi5Bkq5TdFkWIdLnvuUpJ8wMlh6ky5y/6lEVN3eRK5TnKDsgModL1qMytqhTpYbhUtVkuQN8CRk3AVXwKVCfWdo2mbQysERIJmnczpfEynZY4ZmcucTyEqUawpGrj5bQfjydTJfSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730995306; c=relaxed/simple;
	bh=hMklc/6WmXMZ09yE5NJe+P85xdMeI48PhxKfCNy5kXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nSRUqGUAJ1uPtKVcII81AZ7nNJxHK+G2bIIcRSLAy9fKlAeYnyZgywjcZa5uYbO1v7KPP3PJoorhr/fsukwXIVzRUYrJqMJyeI+8ZVmpmmH7zfClYp36BoSFvCtLCbQNjyFQhxgOm/+tAIxWdbMuonBDQLQyj87is9jP2VG59+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hxRpCXWW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E48AC4CECC;
	Thu,  7 Nov 2024 16:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730995306;
	bh=hMklc/6WmXMZ09yE5NJe+P85xdMeI48PhxKfCNy5kXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hxRpCXWWnuqesbDNX7V0sh5CLPpZrsc2X058EnX9uOD2aoCCp3jbaGCnHl0biBuTU
	 1kGpxAnG7rsNmbdlwXq1HdGkDYni+E6g35oKUfovtBtYaQyM4rLKvm6mXfD0BpegqX
	 MULRkO5xotXaEUDb+VBx9nluqS3CFP01Cq56ARCHu8J7Yna9hkW3bps/sUkVHp15hU
	 KG6NkSQRPzOnd/BX0AA6BBcixahnv1BiI7QE0yGIVZ9SMtK7NnPwTzQATjDly4qEwt
	 o3QupO2W1COCQ+iwXYOnoKJJVGCWErJyatlq8OtSi3xoYgbwRWhGfjDYRZf62moAN/
	 yuBqSBzkMtULA==
Date: Thu, 7 Nov 2024 09:01:43 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Koakuma <koachan@protonmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, glaubitz@physik.fu-berlin.de,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Jonathan Corbet <corbet@lwn.net>, sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 1/2] sparc/build: Put usage of -fcall-used* flags
 behind cc-option
Message-ID: <20241107160143.GA1328360@thelio-3990X>
References: <20241029-sparc-cflags-v3-0-b28745a6bd71@protonmail.com>
 <20241029-sparc-cflags-v3-1-b28745a6bd71@protonmail.com>
 <20241029222421.GA2632697@thelio-3990X>
 <rYw6ZTCE58uNrfyK1pJXSaAnn3kXRYBiLf-TYQI8tnJSU3ECWG01RkUahjZC_rkJomCiROTUUvg6Jf1u5VfyBfIalrSF2jHtGqI94MGK8zg=@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rYw6ZTCE58uNrfyK1pJXSaAnn3kXRYBiLf-TYQI8tnJSU3ECWG01RkUahjZC_rkJomCiROTUUvg6Jf1u5VfyBfIalrSF2jHtGqI94MGK8zg=@protonmail.com>

On Thu, Nov 07, 2024 at 04:59:14AM +0000, Koakuma wrote:
> Nathan Chancellor <nathan@kernel.org> wrote:
> > 
> > Clang builds now succeed with this series and builds with GCC 14.2.0
> > continue to pass and boot successfully.
> > 
> > Reviewed-by: Nathan Chancellor nathan@kernel.org
> > 
> > Tested-by: Nathan Chancellor nathan@kernel.org
> > 
> > One comment below, please carry these tags forward if there are future
> > revisions without substantial technical changes.
> 
> Forgive me for still being unfamiliar with the term, but does this mean that

No worries, it is definitely a customary thing.

> when I send a v4 I should paste the Reviewed-by and Tested-by lines into the
> commit message of the patch?

Yes, you should add them either right above or right below your signoff.
It is up to the submitter to add tags that have been sent on prior
revisions when sending an updated version, assuming that there has not
been a reason to drop them, such as substantial changes from a prior
version that might require a new review or testing. In that case, I
typically add a note in the changelog as to why I did not carry them
forward.

The tip documentation 4.2.3 through 4.2.6 has some good information
about some other Linux kernel commit message expectations if you find
yourself submitting more patches in the future:

https://docs.kernel.org/process/maintainer-tip.html#changelog

> > > -KBUILD_CFLAGS += -m32 -mcpu=v8 -pipe -mno-fpu -fcall-used-g5 -fcall-used-g7
> > > +KBUILD_CFLAGS += -m32 -mcpu=v8 -pipe -mno-fpu $(call cc-option,-fcall-used-g5) $(call cc-option,-fcall-used-g7)
> > 
> > 
> > Small nit, this (and the one in the vdso) could probably be one
> > cc-option call? Is it likely that one flag would be implemented in the
> > compiler without the other?
> > 
> > $(call cc-option,-fcall-used-g5 -fcall-used-g7)
> 
> Ah, didn't know it's possible to do that, the other uses of it I see seem
> to use one flag per call. I'll test and send a new revision, thanks.

Yeah, I would agree that it is typical to use cc-option for one flag at
a time but the entire string just gets passed to $(CC), so there is
technically no limitation for how many flags can be tested. This happens
to be a rare instance where the flags share a common internal compiler
implementation so we know that one cannot be implemented without the
other.

Cheers,
Nathan

