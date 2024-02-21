Return-Path: <linux-kbuild+bounces-1023-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 587CA85E890
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Feb 2024 20:59:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E1C01C21D4A
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Feb 2024 19:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03F9D12FF6B;
	Wed, 21 Feb 2024 19:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OW+iTfZ2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E83126F10;
	Wed, 21 Feb 2024 19:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708545029; cv=none; b=Me7xxIzh/rQH06btpSamn4YOJWsrnAk99wG0r+HVQsX2UXbVRdkpI7KiGGcDySKFJ+OWbtFxDhYL5zoIdEXaXlbQo9PmcdMBXJ6PfhGOjUK6ioGBKKufzcTUGNT4nhCjFSJxQweEpi1iLJVrJiUbxKOh57Mm/Zha/V0HwbOEJzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708545029; c=relaxed/simple;
	bh=P9XNMzb7yrJkUl8ylgZe9V6S39LQZndDJiB/yDEpT/k=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=e6k+rFT3vrjQVtrHJt0hrK+gif3vHzTktlH88TzEnj5h1r6rIoiApb6Mv5Jd5etcLQPrmv1El4gyLqysAK4Vs/KgywsKTJWqPkZJk54HrtlENoAtXZLF75IBlp84//hMS1nOnByIn5z/14yau7hQhHxVqOCPkuvEzogTMRA+uUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OW+iTfZ2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70ECCC433F1;
	Wed, 21 Feb 2024 19:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708545029;
	bh=P9XNMzb7yrJkUl8ylgZe9V6S39LQZndDJiB/yDEpT/k=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=OW+iTfZ2iL7h+tXJGNvJqPAfGvzAojx6Z/PSpeXYsAyurVOl8s+3iLeyb8SId2m22
	 IkMRoLD7pypQ8zmtBKx2zeh5H/3haEAMLidw9UmC9U4K2dKljBA0/k1++W43o+S0Ks
	 /fVDE5C+fidCZkXVM0exKbCcL3S2IEzx1e/omHSdGBsYPclAoXFh2TeCNU7JEE1Lhz
	 HoMWUjyPLmLL8VwoNoAJZ5CgjhMpcsys6DbOXUUD9dRFESO6R+/GUwWVgy4mWE5xxH
	 N0beU/EdiatulBzs0sxFFeD+BITTRP9WedtdcrQY2ORn04pHqjslD1NZypKazqYjvg
	 5zBhXiHk6UXkg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 54346C00446;
	Wed, 21 Feb 2024 19:50:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/2] RISC-V: Fix CONFIG_AS_HAS_OPTION_ARCH with tip of tree
 LLVM
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <170854502934.2044.9675160060874211968.git-patchwork-notify@kernel.org>
Date: Wed, 21 Feb 2024 19:50:29 +0000
References: <20240125-fix-riscv-option-arch-llvm-18-v1-0-390ac9cc3cd0@kernel.org>
In-Reply-To: <20240125-fix-riscv-option-arch-llvm-18-v1-0-390ac9cc3cd0@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, masahiroy@kernel.org,
 nicolas@fjasle.eu, andy.chiu@sifive.com, conor.dooley@microchip.com,
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev,
 stable@vger.kernel.org, ebiggers@kernel.org

Hello:

This series was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Thu, 25 Jan 2024 10:32:10 -0700 you wrote:
> Hi all,
> 
> Eric reported that builds of LLVM with [1] (close to tip of tree) have
> CONFIG_AS_HAS_OPTION_ARCH=n because the test for expected failure on
> invalid input has started succeeding.
> 
> This Kconfig test was added because '.option arch' only causes an
> assembler warning when it is unsupported, rather than a hard error,
> which is what users of as-instr expect when something is unsupported.
> 
> [...]

Here is the summary with links:
  - [1/2] kbuild: Add -Wa,--fatal-warnings to as-instr invocation
    https://git.kernel.org/riscv/c/0ee695a471a7
  - [2/2] RISC-V: Drop invalid test from CONFIG_AS_HAS_OPTION_ARCH
    https://git.kernel.org/riscv/c/3aff0c459e77

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



