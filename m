Return-Path: <linux-kbuild+bounces-10429-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BF64CCFB323
	for <lists+linux-kbuild@lfdr.de>; Tue, 06 Jan 2026 23:06:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C41CE3048D8E
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Jan 2026 22:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 144421D90DD;
	Tue,  6 Jan 2026 22:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ptECltNV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D972A19C54E;
	Tue,  6 Jan 2026 22:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767737175; cv=none; b=Nso9hERWFQzVBrcavE1QwovRuRb+c56BEV2Qj8eqn70VJgBje0X2NIN5VGVGmCYs+uJfJMrafCLjJ7NYzckP4u2oGS3ucP1hnSpWizzZHin8VZWI4rqzMWOJTPszYmZjCBx/VfH4IV7s0YTB6n6xspqz3vZE0+MOInN+ep8JQ9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767737175; c=relaxed/simple;
	bh=NoDVobT3ox9GC0NUo6XpbixfMopO7+GEqDPiWaE2WJ4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jnEgEr/ZNDsEHvxFO0bRfvQfXQLSGyuNC8abGZH8nGLOzO+TZFTGCX27AsWlOBc42wn3AOGEv49GVtXlRbtkr9PoHMstcyS6Z6NhOlM2tWg/fL3fEVAC1bkPjsp2rfMnsVedf2/ljQWmlZGsjZPrw9T//7zSya3Vv4S98UTzq64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ptECltNV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6EBBC116C6;
	Tue,  6 Jan 2026 22:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767737174;
	bh=NoDVobT3ox9GC0NUo6XpbixfMopO7+GEqDPiWaE2WJ4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ptECltNVOO9N0My07hRBndk9++uwYjOdJ10KM7+dPN4ypyBm/WmT/9WX7at0Jn8MA
	 wX3tTIi9zO3xeXG15SXAZzh9i3tKrayrf2RMICNDPRS6NkAuAwCY7EJ6ODBQtE2Zoj
	 exB5gU9rL6ZERqfG+ESsCSLapQj/+OXProame+se3Q2YEQxuJxBiGVoJMn5GUSAA9Q
	 h8/X5h/onTdnPIdHRRyHM9sJ3wDzLoVRVL/ZhnU8S6Wi6Bo2+A4MhaiAbQbWZDce5U
	 W570JkJZn8t/GU1cDk+K9DfvCCvIg9LBbqST+ftwSbzZ0ZaBZAmnUQUV4mVPlDtZSy
	 +BtCUCW3tmPhw==
From: Nathan Chancellor <nathan@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Graham Roff <grahamr@qti.qualcomm.com>
Cc: linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nicolas Pitre <nico@fluxnic.net>, 
 Arnd Bergmann <arnd@arndb.de>
In-Reply-To: <20251215-kconfig_conditional_deps-v3-1-59519af0a5df@qti.qualcomm.com>
References: <20251215-kconfig_conditional_deps-v3-1-59519af0a5df@qti.qualcomm.com>
Subject: Re: [PATCH v3] kconfig: Support conditional deps using "depends on
 X if Y"
Message-Id: <176773717252.1961405.1002180889329327680.b4-ty@kernel.org>
Date: Tue, 06 Jan 2026 15:06:12 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev

On Mon, 15 Dec 2025 15:06:54 -0800, Graham Roff wrote:
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
> [...]

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next-unstable

Thanks!

[1/1] kconfig: Support conditional deps using "depends on X if Y"
      https://git.kernel.org/kbuild/c/76df6815dab76

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


