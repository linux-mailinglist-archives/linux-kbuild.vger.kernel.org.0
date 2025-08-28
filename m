Return-Path: <linux-kbuild+bounces-8639-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E16AB39B5D
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Aug 2025 13:20:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E74C7B3531
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Aug 2025 11:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7588930E0F3;
	Thu, 28 Aug 2025 11:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tT2AGNL3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A3730E0CD;
	Thu, 28 Aug 2025 11:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756379999; cv=none; b=Qh6myQGEE7X/T301Vc8u4pv/cJSGYk7ETpivCMyFK5rL0h5UDRFzYvDABp8Em08ctvrxYXVA+2fBG2SNYMlGnhcewbK6hFfNXUEBE2DjB0rhyYHqYgLZAKeqnO7EO2zdDZEDektpLAB92YLcaEySpgw0zQ/alrmlwBSidVVl9GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756379999; c=relaxed/simple;
	bh=frdlG3+kh5qgL7PtXHeDD67wOUv9xgX2Te86jmXktSA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Lyfq1GsuolHsMctEolwyGK0Et026P7LquxWNVkjct/cgYZwsU/R83A9L5Jcn6nX/sC0ZGw0Q8g4Q7AWKC+EGMMxvYGBVTe9iE8zYsa/pGztKexPuk7Yi5K+o/2JlKMGIiOThbcbXrFSxio23ZagrL6LWbxO/qEwIuxKB5w94mQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tT2AGNL3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDB02C4CEEB;
	Thu, 28 Aug 2025 11:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756379998;
	bh=frdlG3+kh5qgL7PtXHeDD67wOUv9xgX2Te86jmXktSA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tT2AGNL3YS1CL2QqvOsxmX0nSaO7uOLw+qAeUOY4ouo+UksO+Anv3jaQKjsj7MXWG
	 9yR+sHIaS8GS9rnhyTMXNsW0dERkF4iF04H50EIeJrN4XE+Pk2BMlGrJ8Qx+MAPnxZ
	 ZpTSdQ7zuc7yc+2FOCOIMz2uy/HVyjaDN6m/4udoKxI1vjKixdJvdZB9aBp/CBx0l0
	 fRBfDZD3nxteEcDp+F5lUij83h1lRrVyxPMq7BCGIvMU2lP9VCDfImVIt0VEBT3zJI
	 hpnf+4yeqv5g0LiTgO6K8+JruiHRxUMnA8kZ3oVOjayU5ICrtvLks+Dgv/AGVZgvVf
	 epSRRWHnOzFKQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33AFC383BF63;
	Thu, 28 Aug 2025 11:20:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] uapi: wrap compiler_types.h in an ifdef
 instead
 of the implicit strip
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <175638000567.1415973.16656703462086266081.git-patchwork-notify@kernel.org>
Date: Thu, 28 Aug 2025 11:20:05 +0000
References: <20250825201828.2370083-1-kuba@kernel.org>
In-Reply-To: <20250825201828.2370083-1-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 dhowells@redhat.com, kees@kernel.org, gustavoars@kernel.org,
 aleksander.lobakin@intel.com, tstruk@gigaio.com

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 25 Aug 2025 13:18:28 -0700 you wrote:
> The uAPI stddef header includes compiler_types.h, a kernel-only
> header, to make sure that kernel definitions of annotations
> like __counted_by() take precedence.
> 
> There is a hack in scripts/headers_install.sh which strips includes
> of compiler.h and compiler_types.h when installing uAPI headers.
> While explicit handling makes sense for compiler.h, which is included
> all over the uAPI, compiler_types.h is only included by stddef.h
> (within the uAPI, obviously it's included in kernel code a lot).
> 
> [...]

Here is the summary with links:
  - [net-next,v2] uapi: wrap compiler_types.h in an ifdef instead of the implicit strip
    https://git.kernel.org/netdev/net-next/c/c2a756891bb4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



