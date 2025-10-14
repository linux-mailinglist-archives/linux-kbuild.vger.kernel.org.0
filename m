Return-Path: <linux-kbuild+bounces-9115-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 606DBBD6F8C
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Oct 2025 03:19:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E7404240F9
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Oct 2025 01:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52C4B2222B7;
	Tue, 14 Oct 2025 01:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MvlkGI6Z"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221C619F48D;
	Tue, 14 Oct 2025 01:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760404343; cv=none; b=PGwp97z2hwzOB7M8KRLH7QMQU6xqRuY8GGhHhhE5aT6GmNJz5/tIuA19uoCCpqEsORJAqYqUsPZgpfGCc+uU5GDD17MMqZyoiYJrEXBXaNZT3/KUTqPwG4o/f3ILYzD2ZA5TveacqCOfEJJvn5meQwsc/vsPrm+wjTGNK+fyBdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760404343; c=relaxed/simple;
	bh=v1eh061b6dkek5M9HJLBkji6LBvb2K8CkWCnfAVgFRU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=nYt46O1RHc3ie5Ib901AClk3LOfqlFcvFt0uNvM4/7pn4+Gy91eh19Fgu+dcdsco52vNkidK77zkoSI+oU/29LNW8DxHl1frvgvGRScmZwW/st8j/AT/NDCQdrSSn0HcSP9SI+scieBpgua7H3Sm2hM/gtSrZkf4yHiQkHU//as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MvlkGI6Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1278C4CEE7;
	Tue, 14 Oct 2025 01:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760404342;
	bh=v1eh061b6dkek5M9HJLBkji6LBvb2K8CkWCnfAVgFRU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MvlkGI6Z2YTW1djrM0AQMX/ZnMuujXo3RFRqY6qbgf1EEsX2N1t830Khh849kvBzF
	 5XsljbgJAS2NHJbFyF1cKlJhfnN1ZVZ/PAYxTTvdWTn0L1g/K0piBjFw/AzquP2mKp
	 mHVJFtptmyIYe/JM+FEQvob7UIwecA+O9CFExGSCat4HrcwSbSokflIx2IqqWpXDni
	 BGaDKMl0aXHjOHSUCQd1MSZTigEu3VtW5WFHx0pZQ+L4K+CunYhkS9tT99qBwuwm2J
	 tEvNvig7VqXOi2COajpKaRKMotsvjloIm+Cnyb6meKSzOnr3W9jumwEB6nQ0uQwtHi
	 U30g6rEx8OFoQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70DC6380A962;
	Tue, 14 Oct 2025 01:12:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/5] kcfi: Prepare for GCC support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <176040432799.3390136.12370033021047300981.git-patchwork-notify@kernel.org>
Date: Tue, 14 Oct 2025 01:12:07 +0000
References: <20250825141316.work.967-kees@kernel.org>
In-Reply-To: <20250825141316.work.967-kees@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: linux-riscv@lists.infradead.org, peterz@infradead.org,
 samitolvanen@google.com, dwmw2@infradead.org, linus.walleij@linaro.org,
 mark.rutland@arm.com, puranjay@kernel.org, corbet@lwn.net, nathan@kernel.org,
 x86@kernel.org, linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org

Hello:

This series was applied to riscv/linux.git (for-next)
by Peter Zijlstra <peterz@infradead.org>:

On Mon, 25 Aug 2025 07:25:47 -0700 you wrote:
> Hi,
> 
> With KCFI support in GCC coming[1], we need to make some (relatively
> small) changes in the kernel to deal with it:
> 
> - move __nocfi out of compilers-clang.h (so GCC can see it too)
> - add cfi=debug so future Kees can find breakage easier
> - remove problematic __noinitretpoline usage
> - rename CONFIG_CFI_CLANG to CONFIG_CFI (otherwise is it quite confusing)
> 
> [...]

Here is the summary with links:
  - [1/5] compiler_types.h: Move __nocfi out of compiler-specific header
    https://git.kernel.org/riscv/c/038c7dc66e27
  - [2/5] x86/traps: Clarify KCFI instruction layout
    https://git.kernel.org/riscv/c/628a15e0536a
  - [3/5] x86/cfi: Add option for cfi=debug bootparam
    (no matching commit)
  - [4/5] x86/cfi: Remove __noinitretpoline and __noretpoline
    https://git.kernel.org/riscv/c/0b815825b1b0
  - [5/5] kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



