Return-Path: <linux-kbuild+bounces-5987-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F27A55EC7
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Mar 2025 04:43:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ECB0C7A4584
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Mar 2025 03:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B53018DB00;
	Fri,  7 Mar 2025 03:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WoGU3bhI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096BB14AD0D;
	Fri,  7 Mar 2025 03:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741318923; cv=none; b=qczlsTR8TXxf4pWxpgcRqQ2OLU2jKtB3/kzMqERgV4AI2d1WPsmH7/HS9O16+xxYYJ35BIrMJ6g5IJOZFJ7uvoJMrCW6qdL7GcWjLsCV4fJNytaqcJ/ip7iIoEPEwfWF9HkJMGP/Fx3G7mJX+Fr/+LzoNFrBjFQWIBEwt+2cWHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741318923; c=relaxed/simple;
	bh=7ZKmaLDPkgzayTW7zs8/xwX8IdPe6S/kyUqYROT1Tkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jxMPr9nkxznTDegmeePDNGaaT4nE+Y/g/XPl4uNvs+Bwz878fawekUW+hHhTpN+LLfwBBEoK4AqIf82qe/vC3SnAJcXNU7zTjA6vOflMUEF6PiLP/bqS+o9xfweYik4N+jJw0sRa4y8RJCdNVgTBxOCemuzxKRT+gvDSiDJu+h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WoGU3bhI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59E67C4CED1;
	Fri,  7 Mar 2025 03:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741318922;
	bh=7ZKmaLDPkgzayTW7zs8/xwX8IdPe6S/kyUqYROT1Tkw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WoGU3bhIbmj/RgbH4PG/wcamx2JxqjI4P/F+zRU/wQxDnHv1lJFvQmgSLL+IgRmRE
	 sOLjdcQiryXV5ei9ZgXApTIIe0mm3mSOsWo1Eshg0EF5yWMSycDMpbSPG3wQSEeOPX
	 dKykgdVeye4scfjjTOvPHSNB5C968bDsFBsyL+q6NPAYKPPHI/dLSJ2waVf0xvPJm7
	 jyec22eqjat8dDN7W6wO+aPHZzuUWePjb8q3M9DANp/jBzGSFUwh/+CeJEGEhZLnPk
	 4l9UVcHb8KGemAZJ886iLxmiBg35EoWpiG8b95Hg6+SpVKwdaFfP3MJ2y3TGLlZMqN
	 O9TCcizARoOnA==
Date: Thu, 6 Mar 2025 19:41:59 -0800
From: Kees Cook <kees@kernel.org>
To: David Gow <davidgow@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: clang: Support building UM with SUBARCH=i386
Message-ID: <202503061939.AAC6EF5A44@keescook>
References: <20250304162124.it.785-kees@kernel.org>
 <CABVgOSnEaTVUfZB6KACFJE4mM=oSWnUtcrf7ETHFq8h_k=mFTw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABVgOSnEaTVUfZB6KACFJE4mM=oSWnUtcrf7ETHFq8h_k=mFTw@mail.gmail.com>

On Thu, Mar 06, 2025 at 04:59:53PM +0800, David Gow wrote:
> On Wed, 5 Mar 2025 at 00:21, Kees Cook <kees@kernel.org> wrote:
> >
> > The UM builds distinguish i386 from x86_64 via SUBARCH, but we don't
> > support building i386 directly with Clang. To make SUBARCH work for
> > i386 UM, we need to explicitly test for it.
> >
> > This lets me run i386 KUnit tests with Clang:
> >
> > $ ./tools/testing/kunit/kunit.py run \
> >         --make_options LLVM=1 \
> >         --make_options SUBARCH=i386
> > ...
> >
> > Fixes: c7500c1b53bf ("um: Allow builds with Clang")
> > Signed-off-by: Kees Cook <kees@kernel.org>
> > ---
> 
> Thanks for this -- I'd been using `--kconfig_add CONFIG_64BIT=n` as a
> way to build i386 UML kernels, which seems to work even without this
> patch -- but this is definitely an improvement.

Thanks! Yeah, I figured there must have been a way to get at it. I
wanted to make it work the "normal" way.

> It may be worth noting that CONFIG_FORTIFY_SOURCE is incompatible with
> clang + i386, which seems to affect UML as well. (That might actually
> not be required, as I think UML doesn't use any of the strange
> -mregparm calling convention stuff which appears to be what breaks
> FORTIFY_SOURCE here.)

Also fixed! :)
https://lore.kernel.org/lkml/20250303214929.work.499-kees@kernel.org/

> Tested-by: David Gow <davidgow@google.com>

Thanks for testing; I've updated the trailers in my tree.

-Kees

-- 
Kees Cook

