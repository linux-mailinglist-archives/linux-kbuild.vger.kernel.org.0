Return-Path: <linux-kbuild+bounces-8474-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8A9B26F3F
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 20:47:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0036FB81C3E
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 18:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3962F22A7F2;
	Thu, 14 Aug 2025 18:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iKQ+ZEUF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE5A22576E;
	Thu, 14 Aug 2025 18:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755197211; cv=none; b=Ms7Qvr0QRZdtNDx9F9vrGoPHL8HrAJYWiTv3JzgyoLyGxTwKsU3fy6cJlmywSHUq+aQfWV44uu+1PiCIHlgvITCGep5n+lOEciwiGFNFALmCvkTUpHrYtogrBHSazL2plART1/hb+TfEOXEjb3RjHtQ2lTDGefXs0Hv4E2gCsIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755197211; c=relaxed/simple;
	bh=nyCz6wi3/Jli/FR7aojQQn6mt7QUjuEOw5FnZ5WrdxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qW33jxI7leygB2w6UsQnCw+FxRdySxVu9jitFdyCf0kc3U/rcV+9xdzFZ7wK4fvnqYALXMFb67sCr3kJOGybrXUn+feqhX1vwIvMFYAL5UzG5N9glpwnkhc7VJDYP10FwVp0pWL+3HwUBanddmj9E1+r8GkCfNvzeOkLaCEolBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iKQ+ZEUF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B530C4CEED;
	Thu, 14 Aug 2025 18:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755197210;
	bh=nyCz6wi3/Jli/FR7aojQQn6mt7QUjuEOw5FnZ5WrdxA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iKQ+ZEUFWzpPlBe+ZW8qMEbA0MivzYSKW3+qMDvkTx2J0ViMoxNLIENi5SmO9hQxS
	 FSVxmN8RH2QXSgu59mqMu0IEB4L6D6umlxKt5oiZVhW5gjkTiFPKqMDzFoqIpABZpf
	 6nPDNStIWYRsDjLIjnABCKgc81QrfBKFdpqFxzIekkSwHOuId0t7DCkA9h+vAXTLs/
	 iz8Ugg01CLYXmwO1hSRhPBACI3X+BN8DlaSTC20gIh5HYaglN9lpZLF+rHA0sWsZn/
	 eYdekXSiZ8Axaoy/QjgfwYfzHvJgwBk7lZ17cEQqYAYxA/P8v/3wV18UAno3A+f4nr
	 y7uhCPVz3dyhA==
Date: Thu, 14 Aug 2025 11:46:46 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nicolas Schier <nicolas.schier@linux.dev>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 0/2] kbuild: userprogs: also inherit byte order and ABI
 from kernel
Message-ID: <20250814184646.GA1764877@ax162>
References: <20250813-kbuild-userprogs-bits-v1-0-2d9f7f411083@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250813-kbuild-userprogs-bits-v1-0-2d9f7f411083@linutronix.de>

On Wed, Aug 13, 2025 at 07:43:39AM +0200, Thomas Weißschuh wrote:
> Make sure the byte order and ABI of the userprogs matches the one of the
> kernel, similar to how the bit size is handled.
> Otherwise the userprogs may not be executable.
> This happens for example on powerpc little endian, or riscv32.
> 
> These patches where originally part of my series "kunit: Introduce UAPI
> testing framework" [0], but that isn't going anywhere right now and the
> patches are useful on their own.
> 
> [0] kunit: Introduce UAPI testing framework
> ---
> Thomas Weißschuh (2):
>       kbuild: userprogs: avoid duplication of flags inherited from kernel
>       kbuild: userprogs: also inherit byte order and ABI from kernel

Seems reasonable to me. Should I fast track this via kbuild-fixes or
should I just apply it to kbuild-next? I am guessing you only noticed
this in the context of developing [0] so it might not be a big issue in
the wild?

Cheers,
Nathan

