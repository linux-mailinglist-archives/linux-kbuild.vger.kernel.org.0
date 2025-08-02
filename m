Return-Path: <linux-kbuild+bounces-8273-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2392FB18A0A
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 Aug 2025 03:13:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52E1D58696E
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 Aug 2025 01:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 526971C28E;
	Sat,  2 Aug 2025 01:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="spktOSli"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D837A48;
	Sat,  2 Aug 2025 01:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754097229; cv=none; b=a/r0ZL4Kx8gZU9BqreuZqjO0I5b6IXcjttDmk9sWa1dNJF4zYJCk39nA0MXe4AMZE9X7FyuJg4agfSsrlL/pyMJE6HmpWlT4PlyEOnOAWg6dG87NoPbw8oc85jyWfr3zz9gQY3lNT5F0oT/JGXntHv9rWp3wgf5wstj4HCl9X3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754097229; c=relaxed/simple;
	bh=PE68cSFAKKaVRfpYXHfgNAEF0uPDacyx4LW4OjSkhvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UWHx+D1yEQ5ASB4ATsR3qy7e34Y0wPA5B0n6TakME6Nn34M7USq2wya7P0LDZS+Slmwvpa0PXLBMBXyaMy+e+CF/3EEHiVpb8U99vZb2CRTpZTbWnFTrlrcV4P55qGAH9zBk0k25MJoSLq39GagcOv5E/gsv+fZ+HxJ5mPTHy9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=spktOSli; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEFEEC4CEE7;
	Sat,  2 Aug 2025 01:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754097228;
	bh=PE68cSFAKKaVRfpYXHfgNAEF0uPDacyx4LW4OjSkhvU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=spktOSliW4eJUdXiHJ+mlQYutvXrlmjEIJrdxCsqvMmHKSakRWYLhYsqLoXgdy5Mi
	 HE3vher/oFLIHIFeEerbiZgPlgy9CvdJYNHsq7gM6cSnYh89DHlihad5mCoPEBtLps
	 5LbBVicOCWuSGlTnROSjwfwKBvZlmWYaBRDdV5jSb3ujLUF7sBkEG2ZxnOHiY1H5fS
	 8X0I0TwZz5dLZoLCr4kzCqThXkWYF7B+9V6GRBqki49013stNcDEICPwyTowRlnFj4
	 j9BVVGX6dRXyTN6o2UYMBURUW52cXJiauihN9oFSBfFieflhi06qBs+zDgigrWeMV1
	 ngysrxkGicVew==
Date: Fri, 1 Aug 2025 18:13:44 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kbuild@vger.kernel.org,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] kbuild: Re-enable -Wunterminated-string-initialization
Message-ID: <20250802011344.GA1736762@ax162>
References: <20250802002733.work.941-kees@kernel.org>
 <20250802004316.GA3910513@ax162>
 <202508011754.BBDF043@keescook>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202508011754.BBDF043@keescook>

On Fri, Aug 01, 2025 at 05:55:27PM -0700, Kees Cook wrote:
> On Fri, Aug 01, 2025 at 05:43:16PM -0700, Nathan Chancellor wrote:
> > On Fri, Aug 01, 2025 at 05:27:40PM -0700, Kees Cook wrote:
> > > With the few remaining fixes now landed, we can re-enable the option
> > > -Wunterminated-string-initialization for GCC. (Clang does not yet fully
> > > understand the "nonstring" attribute.)
> > > 
> > > Signed-off-by: Kees Cook <kees@kernel.org>
> > 
> > What else does Clang need? Are bugs filed? I had requested support for
> > multidimensional arrays, which Aaron implemented pretty quickly (and the
> > tests seem pretty expansive):
> > 
> > https://github.com/llvm/llvm-project/commit/e8ae77947154e10dbc05cbb95ec9e10d3b0be13e
> 
> Oh! I missed that commit. Did that end up in Clang 21? Let me try some
> test builds with a more recent Clang...

Whoops, linked the wrong change (although that one is still good):

https://github.com/llvm/llvm-project/commit/3d4f979e271d2a1fe0906f4d1b16db108838f98f

But yes, both those changes are in 21.1.0-rc1. I uploaded -rc2 to
kernel.org a couple of days ago: https://kernel.org/pub/tools/llvm/

Cheers,
Nathan

