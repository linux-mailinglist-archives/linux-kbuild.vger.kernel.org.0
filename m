Return-Path: <linux-kbuild+bounces-9618-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BE11FC5B4A1
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Nov 2025 05:16:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 76DE9351BB4
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Nov 2025 04:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7F1C285CAA;
	Fri, 14 Nov 2025 04:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KSsgwT3c"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E917280CF6;
	Fri, 14 Nov 2025 04:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763093793; cv=none; b=hiOCy1Uji55WuBvmBenXqtUCo8x+g7/Bug3n9KqbV0TkBZsj4uEJ3bsA1KIMRHWtpi0VWbS0SxX1mAQT5pxRBA1oOCIYstTwKQEeczWw43DjBatZHJYHr+0FA9Fd4qLh2xw4wWRx/Ir7D7/gULWEPhImwiuJscuTo3NIYOmgEcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763093793; c=relaxed/simple;
	bh=HAhE6FtIhUmokHujNmZ8HF+94iX3/6WIRpTw6g/VNkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rgV0zj05dUluUgdHRRbz0u/3oEuuIvYlcRl3hEhjACSnFBUK3Ve/wGW44TJ59Y52E3DlR4gGaaaxAuN0YCq0eh4T9cVDlxGnoIuOJ2in0OHSZ2G+9TCehZobHBa3SmYxGL1ECY/oKPcoNAzDxIbSircRFfIThQ87zfRmmgusYG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KSsgwT3c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7DF2C4CEF8;
	Fri, 14 Nov 2025 04:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763093793;
	bh=HAhE6FtIhUmokHujNmZ8HF+94iX3/6WIRpTw6g/VNkg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KSsgwT3cYme8tBlyOoVxdlJrlL+UlHtiM/bO8odl/nf4jUE7grL+5TdpnTtfzEX+w
	 tVrjyokHSHyFDPGrNi4puXfe0g8A78IFHcIKja9BNdvovCRNSNaZGZziWilxbc8I3c
	 6qZBqaO2dCCBlYW11suLVEei934DE49heOrOIG8q97cV/Zu8/xW/9CLdXmuT0wRR2y
	 CVi+R6Ug/b2x2C2uj1q51gqwSerA7rGPof6lnnD+pn9TXgqjaJB9Wq6ztF6oasUbap
	 VimpYm2KXXPClWU43P7a6GoOJjYaaJ0xZRcQo38TI0aNSbDQ1O6fC8hdOy2TshFUXE
	 Gr/OPJjAaaKbA==
Date: Thu, 13 Nov 2025 21:16:28 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Nicolas Schier <nicolas.schier@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH] modpost: drop '*_probe' from section check whitelist
Message-ID: <20251114041628.GA2566209@ax162>
References: <20251020091613.22562-1-johan@kernel.org>
 <20251022203955.GA3256590@ax162>
 <aRS6VQCKB7dXGbXx@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aRS6VQCKB7dXGbXx@hovoldconsulting.com>

Hi Johan,

On Wed, Nov 12, 2025 at 05:48:21PM +0100, Johan Hovold wrote:
> Daniel has queued the clocksource fix for 6.19 now so I guess we can
> just wait until both fixes hit mainline and either send this one to
> Linus after that for -rc1 (or -rc2), or just wait until 6.20.
> 
> I'll send a reminder when both are in Linus's tree.

Thanks for the heads up! I think I would prefer having it bake in -next
for a cycle so I will plan to apply it to kbuild-next once 6.19-rc1 is
out. Then we should be able to catch any instances that crop up in new
code from -next testing.

Cheers,
Nathan

