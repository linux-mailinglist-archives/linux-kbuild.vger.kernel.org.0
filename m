Return-Path: <linux-kbuild+bounces-5179-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C919F6DC0
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Dec 2024 20:04:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9453D163BD2
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Dec 2024 19:04:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A22D1FBCA6;
	Wed, 18 Dec 2024 19:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J4FT7QqR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3B61FA828;
	Wed, 18 Dec 2024 19:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734548649; cv=none; b=keBVOG+TJm0nEmFeY6FYQTYcURQbmD8P2nt4CQeIBTM2ieS1nI2kxQRqECxLfzfHSfFekcmLkYrQ/JpofCnX4FNdw3dBk48xBjgi+BCWaO5bYr65WiPhkKDrs8X25x/D+V64junvT+JTaLd/zpImuySxAuo/0i73V6tgmQdjlu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734548649; c=relaxed/simple;
	bh=6ytiEW2OYIdVIau6ph2H15rZaYjxdlxo8DWQpFsB2p0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bP6+JYoF9JqIrU554ocKvKJ8mpG9vpG3aGIHvQFq+6XGNELZFwPxqZ8JKsyBTKtMS24zn8th+ufmcmBsnWDd96d/+lxxuA7mBUP21AQxA9pekFnKOpxrvtI9jMOfLY3fXUiNXSHQErQ+YhCAt5wnwCxpPaJ0TM3T0SbnUNIpYIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J4FT7QqR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6722FC4CECD;
	Wed, 18 Dec 2024 19:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734548648;
	bh=6ytiEW2OYIdVIau6ph2H15rZaYjxdlxo8DWQpFsB2p0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J4FT7QqRDN9MoHqkAD9us8r8t0wAvqm/oqNyjqUrL0k54qNwuSKBZtPVGjv1VzojC
	 U2dzGY5zRNV/jNcl07LfCwIWZwo/LUFlEv9tjXiTtjvIbwHzuOh5bIX7iXltuV6xaE
	 OaGbLvkVxj63nwqPRufcbEqnVPGZIANPfmvMmKhsB6vkmWTdM4kT/ARLU+5PPCer6t
	 ON+CHMrxWRYIvKvuvtmQ0u0iv40uo29rm6Y/TDRks/4yL3bWdselWHy04H+ZSbzZTO
	 9EhjttTcLRHgvh8xWQy4f2CcMQYHrS03txY9/qeAMmKehAmaxwQD1YaSHzjF8oCUBZ
	 5wFSJyzGTP9Kw==
Date: Wed, 18 Dec 2024 11:04:06 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Brendan Jackman <jackmanb@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 2/2] kbuild: Add option to fail build on vmlinux
 objtool issues
Message-ID: <20241218190406.gbemqsbf3rxtione@jpoimboe>
References: <20241218-objtool-strict-v2-0-a5297c961434@google.com>
 <20241218-objtool-strict-v2-2-a5297c961434@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241218-objtool-strict-v2-2-a5297c961434@google.com>

On Wed, Dec 18, 2024 at 02:58:56PM +0000, Brendan Jackman wrote:
> NOINSTR_VALIDATION is pretty helpful for detecting bugs, it would be
> helpful for the build to fail when those bugs arise.
> 
> If necessary it would be possible to enable this for individual
> warnings, it seems unlikely there's a use-case for that though. So
> for now just add a global setting.
> 
> Signed-off-by: Brendan Jackman <jackmanb@google.com>

The patch looks good to me, though the subject and commit log still need
to be updated.  It's no longer specific to vmlinux or
NOINSTR_VALIDATION.  And the justification is similar to what I
mentioned before: objtool warnings (even seemingly "harmless" ones)
often indicate serious bugs which can break the kernel.

-- 
Josh

