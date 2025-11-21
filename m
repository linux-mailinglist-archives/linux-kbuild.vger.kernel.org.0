Return-Path: <linux-kbuild+bounces-9758-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC39C7B58A
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Nov 2025 19:31:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 111C235E9C0
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Nov 2025 18:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB7012E8B83;
	Fri, 21 Nov 2025 18:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aQ0XoV1J"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C090128C00C;
	Fri, 21 Nov 2025 18:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763749849; cv=none; b=cPWpl3EfU2oDIrTKxnkgjQOLYsneVdxGrAa+GKsbqNGtxYZCKEF68JYAxXFPfPfqltV7ZEW4XElEBnXm6jus6BHM1XRxeuZru1Ji7os1S8xembIMjN9Lkh7VO7lKlrzEvdXdBOfZ9KtKZUU+sAtGRwnazweLhI3nMl0qtZCc1Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763749849; c=relaxed/simple;
	bh=dynPnDQXCBysHUbezhTrxlh1V3RrzJo7GtycaDcABFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=asz0fpqaiL5nfzoT7UBhmfWk34ygvCGC5FC3MW8YFhtagkSGYuOOWeojauDO/lVOzUcZuMJZtr0MNlVpRZO+UtwXpeRx7DdagO2z8yDRCmbYGgijWua+WmdC0j7NlKPhXN2CpFsl7HNFdWy+8T0BylZw+13H+402nfXc5nQpRr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aQ0XoV1J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D001C116C6;
	Fri, 21 Nov 2025 18:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763749849;
	bh=dynPnDQXCBysHUbezhTrxlh1V3RrzJo7GtycaDcABFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aQ0XoV1JK5vaHX8pc7t3u9zX/umsZfMr+wtQnKtTkm0+azIoS2yVFsyBYElrenJlE
	 l5mtWsagMZD0CawTwx0KULAeYveR5eUZ3MV+iOVO1pMrWXoE51w2ME2c6sri6w2hbI
	 frA889vWItqA93U1FFZPlxvS9+d9gjhe9WkSBtvLdyAmHyXwmf966s8v4aY+cqOG8K
	 LKDAqBUncorSC1OFkqAFqTIRpL7iFozPxOSHSEc7ncahIriMxpZhR+4fQdjDAGmImD
	 xgu0A7kfq2J1MycfSKIGTw6Uq05IeA/8Zh4mWFT9AO0Z7B9+OWRueFi7/swrVSgm/U
	 +2AXm83hvdceQ==
Date: Fri, 21 Nov 2025 10:30:48 -0800
From: Kees Cook <kees@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: "Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, linux-kbuild@vger.kernel.org,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Tamir Duberstein <tamird@gmail.com>, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] kbuild: Enable GCC diagnostic context for value-tracking
 warnings
Message-ID: <202511211027.864DFA90@keescook>
References: <20251119224426.work.380-kees@kernel.org>
 <20251120064923.GA3320872@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120064923.GA3320872@ax162>

On Wed, Nov 19, 2025 at 11:49:23PM -0700, Nathan Chancellor wrote:
> On Wed, Nov 19, 2025 at 02:44:31PM -0800, Kees Cook wrote:
> > Enable GCC 16's coming "-fdiagnostics-show-context=2" option[1] to
> > provide enhanced diagnostic information for value-tracking warnings, which
> > displays the control flow chain leading to the diagnostic. This covers our
> > existing use of -Wrestrict and -Wstringop-overread, and gets us closer to
> > enabling -Warray-bounds, -Wstringop-overflow, and -Wstringop-truncation.
> > 
> > The context depth of 2 provides the immediate decision path that led to
> > the problematic code location, showing conditional checks and branch
> > decisions that caused the warning. This will help us understand why
> > GCC's value-tracking analysis triggered the warning and makes it easier
> > to determine whether warnings are legitimate issues or false positives.
> 
> Would we ever want a depth more than 2? In other words, should this be
> customizable in case there is a warning that needs more context?

Honestly, I'm not sure yet. I think if we find it to be true, we can
add it then. So far, everything I've found works with =1, but I went
with =2 just to be conservative. (And I did build time comparisons --
there is no measurable difference between off, 1, or 2.)

> > For example, an array bounds warning will now show the conditional
> > statements (like "if (i >= 4)") that established the out-of-bounds access
> > range, directly connecting the control flow to the warning location.
> > This is particularly valuable when GCC's interprocedural analysis can
> > generate warnings that are difficult to understand without seeing the
> > inferred control flow.
> 
> Not that it is that different from what you describe here but having an
> actual example of the insight that this gives using a problematic case
> from the past (such as one that resulted in these various warnings
> getting disabled) might be useful for future travellers.

Yeah, I can list some of the prior fixes.

> > Link: https://github.com/gcc-mirror/gcc/commit/6faa3cfe60ff9769d1bebfffdd2c7325217d7389 [1]
> 
> I have a small preference for using links that the project controls,
> i.e.
> 
>   https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=6faa3cfe60ff9769d1bebfffdd2c7325217d7389
> 
> but I am guessing that mirror is not going anywhere and we have the hash
> regardless so consider it a nit.

I regularly have gcc.gnu.org time out for me, so I've been using github
for trees and references, but I can change this.

> 
> > Signed-off-by: Kees Cook <kees@kernel.org>
> > ---
> 
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Thanks!

> Should we take this via Kbuild or do you want to take it via the
> hardening tree?

I figured I'd take it via the hardening tree, but I have no strong
rationale for that. ;)

-Kees

-- 
Kees Cook

