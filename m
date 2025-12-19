Return-Path: <linux-kbuild+bounces-10260-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 970BCCD1B38
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Dec 2025 20:57:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9B8C302CF7C
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Dec 2025 19:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 593582FD694;
	Fri, 19 Dec 2025 19:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SzlxzxG1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6234A27462;
	Fri, 19 Dec 2025 19:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766174223; cv=none; b=pyniwLi921hmA/PPzKSliCxjHWRTMSMuEfdq9r2xaDCn3xvQcuo2IcVAi1XNaMTtb6vPBAoXx5rJ8YoRnopEO6r9ZlqbnqTli00vaobU7oFx4a9nslKhrWBBT+h4g/ZOhskkCxVUATs/eeQZJtBNlflKBuBXX1MZqp9i0hXaxB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766174223; c=relaxed/simple;
	bh=QXYUHgzoi7YUM3awj7oLYTaUx5+oOvo2cZMtizNWYH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T5v0CGhKcumoMBxwCQVRglC/09fY3yr4kgSFbDeyS17nzDM9Cv2S7WVn34oPtFwBbJftWmVr1u4TvpgxUCtPdQhkJ4I4cudPemKhm4+2ukwY/bMpg6nVgbR/LpPGINDP3eFNx+tm5Bmcp3X+qQ4UDsKRXKt/kVpaY2z9kjBE/vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SzlxzxG1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0D0DC4CEF1;
	Fri, 19 Dec 2025 19:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766174222;
	bh=QXYUHgzoi7YUM3awj7oLYTaUx5+oOvo2cZMtizNWYH4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SzlxzxG13s5EhQyTTWJvFfCEn+qnmpeRS6YUeP9iANuM7OKD300GiC/kHVHnQ8PUJ
	 0ZsMKbHwRdd9Omnxz+nhtiBgJIUDLdjA/o55urtJpWBQ3yEbZdMCt5R+YbuolQE6xI
	 7vQAg5m5eTNpmim6gUYhHnx7heEIp1plA6JMt07420uIsi2/BMFopG/dltlKPmLV0i
	 UUAwQe2jY4FC4RXH9EZGJmYGjUA3wX+ZuxHsk+31jJtDdmh36vXwpBGaoxYiTZTqgl
	 oV82arJh2MEvEvLCAMujSwegM9eSvAXN3F1/4hOgD0DV0UqEcHbdJwXbmTb6YhrB8a
	 hPgwMvzNHM8lg==
Date: Fri, 19 Dec 2025 12:56:57 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Graham Roff <grahamr@qti.qualcomm.com>
Cc: Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Nicolas Pitre <nico@fluxnic.net>,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3] kconfig: Support conditional deps using "depends on X
 if Y"
Message-ID: <20251219195657.GA1404453@ax162>
References: <20251215-kconfig_conditional_deps-v3-1-59519af0a5df@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215-kconfig_conditional_deps-v3-1-59519af0a5df@qti.qualcomm.com>

Hi Graham,

On Mon, Dec 15, 2025 at 03:06:54PM -0800, Graham Roff wrote:
> From: Nicolas Pitre <nico@fluxnic.net>
> 
> Extend the "depends on" syntax to support conditional dependencies
> using "depends on X if Y". While functionally equivalent to "depends
> on X || (Y == n)", "depends on X if Y" is much more readable and
> makes the kconfig language uniform in supporting the "if <expr>"
> suffix.
> This also improves readability for "optional" dependencies, which
> are the subset of conditional dependencies where X is Y.
> Previously such optional dependencies had to be expressed as
> the counterintuitive "depends on X || !X", now this can be
> represented as "depends on X if X".
> 
> The change is implemented by converting the "X if Y" syntax into the
> "X || (Y == n)" syntax during "depends on" token processing.
> 
> Signed-off-by: Nicolas Pitre <nico@fluxnic.net>
> 
> [Graham Roff: Rewrote commit message, updated patch, added tests]
> 
> Signed-off-by: Graham Roff <grahamr@qti.qualcomm.com>

Thanks, I think this is a reasonable extension and the updates to v3
clear up all of my concerns.

I plan to apply this to kbuild-next in a week or so to give adequate
time for people to comment and review it.

Cheers,
Nathan

