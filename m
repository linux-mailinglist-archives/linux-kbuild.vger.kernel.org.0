Return-Path: <linux-kbuild+bounces-8274-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C842B18F86
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 Aug 2025 19:08:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1523B189A7C0
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 Aug 2025 17:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B11932236F7;
	Sat,  2 Aug 2025 17:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YgXGne1w"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F683210FB;
	Sat,  2 Aug 2025 17:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754154486; cv=none; b=shxmJm1vrRB5P6Xu34q6+IgTpUYfdNLZGw4dhg5LavNZ8+B2H9bPAiIOVPDJiZYCoRd9HngxXzRPckXwKkTYWyeqMIJV1lDQvo/PPYRM1J3+MH0LfV+NlZkID+Y2/imXEp9LnbpiFC9sQneQcYREi5+MvhGhN2JARNJxdcXwxnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754154486; c=relaxed/simple;
	bh=koY+wovV1Y+zqmUcBvYZi9Y5n5ThX1LuFvAQ6WMTQnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tW2ZYVE10kPpS6zXCtOuw3FUN/7Ym8sqiK+QqCC7slJK2NuJ2IJ0YrAoQy/ESyHDNwlE8KNJKSBbkYR4GN3HQVU/TKLiYM9HbTXPEl0COwD+v74aSK6NU7gofZ0Azs3bDa49MAO52V9lalc3720UWR6W7KRRjOJ6EeJS536t6mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YgXGne1w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13803C4CEEF;
	Sat,  2 Aug 2025 17:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754154486;
	bh=koY+wovV1Y+zqmUcBvYZi9Y5n5ThX1LuFvAQ6WMTQnk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YgXGne1whO0oUIzpVjPcP4pr/+Mip8taH/yYxcXYQhbovne9El4AZWADKIAW25H5V
	 s+Ubpn68t2b6DS7BkmyI7pQjdpxnyw4yMidtwB0TfZgx3cUYowAH03t8LY2veA/msR
	 PjZjWBcANQ4Rb/hzMHBEKfG3haCXZdkA4r34t1QvuBqd7BJhnGSZcwxtZjwc6aybYZ
	 eoiWxEAY9pxSCvK/MJD8gqdSK/V38LOWjhkPvlQZMtl6lPR73T8HXDNr1cRTrmglau
	 3tJjLVTl4ai9ajENAq1rWwSRTFpeMBYbHZ4emC3Wl179IxP0OzHJOGHrhELs6j9j2x
	 caBFdnYytvxnw==
Date: Sat, 2 Aug 2025 10:08:04 -0700
From: Kees Cook <kees@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kbuild@vger.kernel.org,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] kbuild: Re-enable -Wunterminated-string-initialization
Message-ID: <202508021005.B4BACEB735@keescook>
References: <20250802002733.work.941-kees@kernel.org>
 <20250802004316.GA3910513@ax162>
 <202508011754.BBDF043@keescook>
 <20250802011344.GA1736762@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250802011344.GA1736762@ax162>

On Fri, Aug 01, 2025 at 06:13:44PM -0700, Nathan Chancellor wrote:
> On Fri, Aug 01, 2025 at 05:55:27PM -0700, Kees Cook wrote:
> > On Fri, Aug 01, 2025 at 05:43:16PM -0700, Nathan Chancellor wrote:
> > > On Fri, Aug 01, 2025 at 05:27:40PM -0700, Kees Cook wrote:
> > > > With the few remaining fixes now landed, we can re-enable the option
> > > > -Wunterminated-string-initialization for GCC. (Clang does not yet fully
> > > > understand the "nonstring" attribute.)
> > > > 
> > > > Signed-off-by: Kees Cook <kees@kernel.org>
> > > 
> > > What else does Clang need? Are bugs filed? I had requested support for
> > > multidimensional arrays, which Aaron implemented pretty quickly (and the
> > > tests seem pretty expansive):
> > > 
> > > https://github.com/llvm/llvm-project/commit/e8ae77947154e10dbc05cbb95ec9e10d3b0be13e
> > 
> > Oh! I missed that commit. Did that end up in Clang 21? Let me try some
> > test builds with a more recent Clang...
> 
> Whoops, linked the wrong change (although that one is still good):
> 
> https://github.com/llvm/llvm-project/commit/3d4f979e271d2a1fe0906f4d1b16db108838f98f
> 
> But yes, both those changes are in 21.1.0-rc1. I uploaded -rc2 to
> kernel.org a couple of days ago: https://kernel.org/pub/tools/llvm/

Ah yeah! Let me get this retested with the 21.1 release. I think we
don't need any special handling.

-- 
Kees Cook

