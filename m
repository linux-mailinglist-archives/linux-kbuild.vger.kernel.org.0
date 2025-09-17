Return-Path: <linux-kbuild+bounces-8837-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F92AB7E5D3
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Sep 2025 14:47:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F20DF3AA6EB
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Sep 2025 06:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC40A247291;
	Wed, 17 Sep 2025 06:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SZsqPIvW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7452629D;
	Wed, 17 Sep 2025 06:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758091751; cv=none; b=ChY4KDPuGDu2N+dmusm0FYNcOri9mn489MDeTb+n5YlsQmpYiHreP5wGPwM3B8c2ZURQ/hdLqQvtQ/IGx10T2H3LAPI4ZVjbfiE1J32NNpJIupXmlNr1Dxr264tN/xDEAVYzCUHORn8+8OHMbMcU7DM6+qNODvpilc7QRe8XK8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758091751; c=relaxed/simple;
	bh=hp7Yz1S2kHTO0qwTAezzgUOk9pUddyG5XB6EsyJvNEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iNzFf488RFR5AesROFAhccalHu3yeNJRa+78K1js+al9Ppwr9KOCM0f8gtTE7nH+Fqvd07pHr6ZpR7U8EzQF4KI643BOEWufOIQC9NjH5eCnMkGl5bErjwSzUoBRPfUE9oYpXijzcNLMgZYZpgYd06G5X21An5RGZuTkdJWBm7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SZsqPIvW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5CF3C4CEF0;
	Wed, 17 Sep 2025 06:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758091751;
	bh=hp7Yz1S2kHTO0qwTAezzgUOk9pUddyG5XB6EsyJvNEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SZsqPIvWt3Xhy9tCaKqp208t+70uypGsX5qeq20ozCnIGQE/nCrgQuMYZK8WOiuFZ
	 gHGn/lGfCrfhenGkx2Lyjbm6rfj5L0n7CWdVpOsLJYr8kaKhS4U/G5hBWHi++ousra
	 tSsdeYgU6eUTMOF4uiL370gN2G0R/hKoPcdV1O/9RQ/yBOudYo6qvmXTuUMu+BchJU
	 DpK3vYz42piUpDo+hhBfX5gBPS01bqbJ18icANgK7mngqr6TOl2+cvBlVWaSbnTUcS
	 VAYGUifjtKemMOQTnmS0GR4XDQIMCo8sCRuj+M85fuRtNuIwQMO/TcqrMTUWaVAoa2
	 gTaUV5FECLbGw==
Date: Wed, 17 Sep 2025 08:49:05 +0200
From: Alexey Gladkov <legion@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v7 3/8] kbuild: keep .modinfo section in
 vmlinux.unstripped
Message-ID: <aMpZ4Q6VFMFtXEkH@example.org>
References: <cover.1755535876.git.legion@kernel.org>
 <4d53c72293d88b663257a0d723ebf3473a08b374.1755535876.git.legion@kernel.org>
 <aMeqgPVfJcjBLhl8@levanger>
 <aMkN1m55vejTii_H@example.org>
 <aMkvtg55F1gJ5feM@levanger>
 <aMlKTPpNXrRW6v_7@example.org>
 <aMlbSEnwGOPM39Op@levanger>
 <aMlgMkB2nL31K2OB@example.org>
 <aMll6cHPhIY2yswz@levanger>
 <20250917011010.GA3106929@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917011010.GA3106929@ax162>

On Tue, Sep 16, 2025 at 06:10:10PM -0700, Nathan Chancellor wrote:
> On Tue, Sep 16, 2025 at 03:28:09PM +0200, Nicolas Schier wrote:
> > yeah, it's actually because I dislike modifying vmlinux.unstripped in
> > the vmlinux rule.
> > 
> > But it may be that Nathan does not see it this way.
> 
> Yeah, I would agree that it is good form to avoid modifying the inputs
> of a rule.
> 
> This warning is pretty annoying since it is intentional but we do not
> have great tools to hide just this one instance it seems... This is
> probably worth a comment.
> 
> It would be nice if this section could be marked as NOLOAD from the
> beginning but that will mess with extracting .modinfo via objcopy from
> my brief testing.
> 

Yeah, I was thinking about that too.

Ok, I will make a new version of the patchset with fixes.

-- 
Rgrds, legion


