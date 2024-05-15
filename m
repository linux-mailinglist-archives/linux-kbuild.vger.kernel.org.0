Return-Path: <linux-kbuild+bounces-1860-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A95D8C6791
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 May 2024 15:40:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AF781F233C6
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 May 2024 13:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8CF313AD17;
	Wed, 15 May 2024 13:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bPDeT2Ba"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B2B136983;
	Wed, 15 May 2024 13:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715780436; cv=none; b=OCCy7/HljZ+B92KqDTUAXb5eceaP12VDJnMKwiLvfPtkZkTFKkj8XJInmuvPDqhI31Zjgh/4ITIWfFOSh7fBMaUDmuUq+bOQEXBEaYdBbI4b8bSZ8aZPEmqhzxpuvAx/Fr9Zjr/r4Kx83Xzac25copUPuflKbmeXrBsQTIaQ1CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715780436; c=relaxed/simple;
	bh=H3ltUsrKOQdu0Za2sRAFpqsHbjoXich3cTJVW0+VNxk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=dqQ6dKH8Xzgv8oHT2c5oa4httP9NUf1M/yaFXcupnfihJoe82jPHsnreRubcWboPoMvlQvhCm2hLhzxrWedqIOqLMI1Xg6Rr+ZCOqHbWa1FnCLo3v0hFC6/bimAEJickzU6DOEQwSu3pHRX6VEtIBptIZfq7QEBmlq0GOchuGAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bPDeT2Ba; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 40AF0C116B1;
	Wed, 15 May 2024 13:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715780435;
	bh=H3ltUsrKOQdu0Za2sRAFpqsHbjoXich3cTJVW0+VNxk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bPDeT2Ba20TH4OKv5kpZ4Mjx40CDUAJezN25PViqjcU7QJ3at4B0CzmnmdLxlpDYE
	 yeT/yv4mz9gA7hRt0PZEADeizfw5kkSyei3Vf1JRhIDgab6O/LWNROORqZkSiELcmy
	 33+jDS2hshqM+RR7gKduD3aHQHld/2RC2CuJnS7aOhJGyksj7vVXuiYpo5Rne5HraB
	 sIVRmDGgECCPV91SanYaSvzIUaSjaJHFgAjT73vezryK9ubQ8t5CDYhxAt5hdc0yLE
	 eDhTojB8eDnrUq7U70tCOLSWzRmw9Oa//+RLh4XjhygwYsA+gdUy1v6GtTzK8Ng+gW
	 bFFx8b7g/EzEA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 38A30C4333A;
	Wed, 15 May 2024 13:40:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/2] riscv: make image compression configurable
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <171578043522.14005.5445713768197740936.git-patchwork-notify@kernel.org>
Date: Wed, 15 May 2024 13:40:35 +0000
References: <20240504193446.196886-1-emil.renner.berthing@canonical.com>
In-Reply-To: <20240504193446.196886-1-emil.renner.berthing@canonical.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu, terrelln@fb.com

Hello:

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Sat,  4 May 2024 21:34:37 +0200 you wrote:
> Masahiro's patch[1] made me wonder why we're not just using KBUILD_IMAGE
> to determine which (possibly compressed) kernel image to use in 'make
> tar-pkg' like other architectures do. It turns out we're always setting
> KBUILD_IMAGE to the uncompressed Image file and then compressing it into
> the Image.gz file afterwards.
> 
> This series fixes that so the compression method is configurable and
> KBUILD_IMAGE is set to the chosen (possibly uncompressed) kernel image
> which is then used by targets like 'make install' and 'make bindeb-pkg' and
> 'make tar-pkg'.
> 
> [...]

Here is the summary with links:
  - [v2,1/2] riscv: make image compression configurable
    https://git.kernel.org/riscv/c/c1f59d035966
  - [v2,2/2] riscv: show help string for riscv-specific targets
    https://git.kernel.org/riscv/c/5e3964ba8400

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



