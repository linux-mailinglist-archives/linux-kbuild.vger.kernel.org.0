Return-Path: <linux-kbuild+bounces-10378-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F05CEA95C
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Dec 2025 21:08:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99F86301DB9D
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Dec 2025 20:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EE1A2D6E4B;
	Tue, 30 Dec 2025 20:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tr9CZpc0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F24233D85;
	Tue, 30 Dec 2025 20:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767125321; cv=none; b=B4l+JG/Oqwok/ii9jjWlgjlDqvpJkSEzcEZYSRoanVsgLfrajF2X3CHsJkBAe2uBsaJN+PFgFyP8VK8VfBrVkpWw0xPAv4/rRy7bYl1aTxfqBaG8z02CG4sL2djQQXcMuMWVUkhQ8Xqe8BQ/awrAwRVCQB9TWMcHgAWDJSmVJQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767125321; c=relaxed/simple;
	bh=paFxqrLzzpRwlQqMk9xXElTvr9VgZh5C3n+OQZYRs7E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MUJVhP5JgdGA5pPYRKIp39K7XmUz3PDP933SKmQsALokL/c7Bfny3mk8RALeZ3BmcsMThJfxHQFmyjIbG26Mk1bIpF05SNj5f0E80a86wvZLlna9ABzOU37vjBliUTkokgENPjR6527j1VJokyxXgdMqbECMmQgMRXOw47h0sps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tr9CZpc0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B07BC4CEFB;
	Tue, 30 Dec 2025 20:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767125321;
	bh=paFxqrLzzpRwlQqMk9xXElTvr9VgZh5C3n+OQZYRs7E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Tr9CZpc0DwbMZwQS0G52UFzehAHGVpmq8ZcNqAkVRMFpijp1zbPXpgUkeuS/wuyQr
	 v7wj6AsVIXANCeP6npvDZRRkJbvCLUa8nD7XZghDf1x8FoQ92G847/XYU4FZKabdw5
	 kC0TLnU28kJ/LBYB4P1bwdKEvBz1gEdPjTR7ig7vuWRYgXdRWSh1RTH25194N/7Taz
	 8ZanBZJww991KIxU+YKqH+i5ujczfIjIqHLDpSx+ZISE2COpN27HSarWZ01l5Yg1OG
	 FcKQ1whpSQ59e6XAbiNTSvyvghRK5iPFgdVn3dxyOp9mQEqZrbs2b9q7IQdoYNzCGz
	 z6nv7Sd1h4pcg==
From: Nathan Chancellor <nathan@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251230-uapi-check_config-v1-1-00ecec109f39@linutronix.de>
References: <20251230-uapi-check_config-v1-1-00ecec109f39@linutronix.de>
Subject: Re: [PATCH] kbuild: uapi: Drop check_config()
Message-Id: <176712531976.4072056.9156155764129336995.b4-ty@kernel.org>
Date: Tue, 30 Dec 2025 13:08:39 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev

On Tue, 30 Dec 2025 08:09:29 +0100, Thomas Weißschuh wrote:
> headers_install.sh already tests for CONFIG symbols. It does so in a
> more comprehensive way, by only checking for references in code and
> also running even if CONFIG_UAPI_HEADER_TEST is disabled.
> And check_config() has been disabled any case.
> 
> Drop the pointless check.
> 
> [...]

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next

Thanks!

[1/1] kbuild: uapi: Drop check_config()
      https://git.kernel.org/kbuild/c/1b5e068d598e1

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted.

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


