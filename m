Return-Path: <linux-kbuild+bounces-9584-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 56757C50A01
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Nov 2025 06:36:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0257D349B89
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Nov 2025 05:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6656C28FFF6;
	Wed, 12 Nov 2025 05:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fKeksJdS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9B721019C;
	Wed, 12 Nov 2025 05:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762925782; cv=none; b=Q+8tl3YA/MBnTLv8RpcZSa/5bcXZHsBAnse6YA8Bucdsw7ava8NLPZffPDvJJCEpN1ywfw0Ch7eoTWrWANcXb94MhKFGPFpRyslDmNJHclYoYwjA1ZJK/vX6RwUF3MhC1jFvauAEsrizVg3b0qUcz/XMIQpeHyPDEld5iwACR7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762925782; c=relaxed/simple;
	bh=VsAgB7MIl/p4euo1gNH/Xe91mjL1pMa+DzgWZJ/7QSg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=stfVuJrNiEDYhX58JLRDhowMvFmEzXPZffKMWIo8ttMKZVD6sjS9xALjJUtQI/G8Bf2WL8b9+XABTn/v5vzUm0l6peU7pqF5P9Q4Bgv1K0m1OkcrZASneYUfMyasDF24IXUqqm6eUBSQQlkDR461lktw3ZVCmc6xcEEV8iBwryo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fKeksJdS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8C24C4CEF8;
	Wed, 12 Nov 2025 05:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762925782;
	bh=VsAgB7MIl/p4euo1gNH/Xe91mjL1pMa+DzgWZJ/7QSg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fKeksJdSHnGiuf4mIzkL09Q5q3gyXyNupoIVpeTqDHj1uMpqmndgtqDIVbeAoAyBu
	 2SLS5hAFSdekai70D+rHptapjKiSSH344PScHKsf2gpjwyqfx6S7eCa+JxWMCy6N+X
	 ovQyOttOqoyXANAXKxy7FwNOxoHJ4TDt/AQ5Ppm/m4rpsUNaJ5heM7c7t469I/5giM
	 Aq9oZ6J6Q1eAci6TKy1xDLjAZuJUH+TBrA+zd0sxmWlCjC3GJ01K0HMzFt3NjVq64w
	 wrAdcK28g2c4rnsIstGbm2+N3cHp9nFA3qb1nrbobP8zpXMV//TUah9NxW9Y5oguOP
	 0iJIKvfXmfx0A==
From: Nathan Chancellor <nathan@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Masahiro Yamada <masahiroy@kernel.org>, Abel Vesa <abel.vesa@linaro.org>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251111-kbuild-install-extmod-build-fix-cc-expand-third-try-v2-1-15ba1b37e71a@linaro.org>
References: <20251111-kbuild-install-extmod-build-fix-cc-expand-third-try-v2-1-15ba1b37e71a@linaro.org>
Subject: Re: [PATCH v2] kbuild: install-extmod-build: Properly fix CC
 expansion when ccache is used
Message-Id: <176292578048.1288921.4035245057559031915.b4-ty@kernel.org>
Date: Tue, 11 Nov 2025 22:36:20 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev

On Tue, 11 Nov 2025 08:43:51 +0200, Abel Vesa wrote:
> Currently, when cross-compiling and ccache is used, the expanding of CC
> turns out to be without any quotes, leading to the following error:
> 
> make[4]: *** No rule to make target 'aarch64-linux-gnu-gcc'.  Stop.
> make[3]: *** [Makefile:2164: run-command] Error 2
> 
> And it makes sense, because after expansion it ends up like this:
> 
> [...]

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-fixes

Thanks!

[1/1] kbuild: install-extmod-build: Properly fix CC expansion when ccache is used
      https://git.kernel.org/kbuild/c/4ab2ee3079835

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted.

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


