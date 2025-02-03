Return-Path: <linux-kbuild+bounces-5607-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB357A263A2
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Feb 2025 20:20:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64C061887A81
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Feb 2025 19:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C202135C5;
	Mon,  3 Feb 2025 19:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CP9wBOEd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D18F2135C0;
	Mon,  3 Feb 2025 19:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738610141; cv=none; b=FaFaZNzC/B8hS0/jqgETDX9OsfnqWuwLphcgBft7sxaSlVC+8lPAFOt0FVogicRl8V7CnWG25aKdguRbPogfd9TAZw8LnWcTo51Fp0dusBccBQ7ka1EclH55Frq3aBlscOKmq2ThPOGZpYEivyCGbB2eloYplYkkxbI+Riq2G70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738610141; c=relaxed/simple;
	bh=xz0jRw7fKEYg6LFccxDsRd+E/z4UDBdzHD1PSB2cIcc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=mjxtKovfS50z9DIpvOPR2EiRSyauQ+lbDNoCNYSaNbPd66urwQpL67zXrleEMgc+tlVMSav/0TluljkHYH9IfBtoPovFWQX0RtnjSazacylLk7jc3R133udnxOaABQD2ckhtuMf6THW0st0wnpg0QIYYj+k2NoxGxNWQxGQorCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CP9wBOEd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BC21C4CED2;
	Mon,  3 Feb 2025 19:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738610141;
	bh=xz0jRw7fKEYg6LFccxDsRd+E/z4UDBdzHD1PSB2cIcc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=CP9wBOEdlHOYgvjLPcp91qUnJDEZViKBPU60bzI9y4BimssDzee+ISOo3fCR+xGWv
	 s2T+n3riEPV5hZxCWD/xlT5fSS7R5WD8UAcTVqxttDuEEPkcW9KhyzsLiSWCVOnwMZ
	 QAePmdT2lbGGYxd3/GIK/2fQ4rqVNTNW4EX0/m8ZVn723VOkwNOWlJd62GBSTFtdTy
	 8mBP3oXLVXaCfr5BiODU/oNEvaJiPAov1BbT9kC28BA/mFwW+brBtYekBcFjn4OUhm
	 cf1WwRp78zmH5SfhyobW1b5j4n0ZekFT6C+cbkbLpiRQbEwsMFLS+c71oCe7HhqVs9
	 ptLaW263k1jaw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70E84380AA67;
	Mon,  3 Feb 2025 19:16:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] kbuild: Strip runtime const RELA sections correctly
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <173861016800.3409359.5303891262863199475.git-patchwork-notify@kernel.org>
Date: Mon, 03 Feb 2025 19:16:08 +0000
References: <20250113155306.1922992-2-ardb+git@google.com>
In-Reply-To: <20250113155306.1922992-2-ardb+git@google.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, ardb@kernel.org, torvalds@linux-foundation.org,
 masahiroy@kernel.org, linux-s390@vger.kernel.org, re@w6rz.net

Hello:

This patch was applied to riscv/linux.git (fixes)
by Masahiro Yamada <masahiroy@kernel.org>:

On Mon, 13 Jan 2025 16:53:07 +0100 you wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Due to the fact that runtime const ELF sections are named without a
> leading period or double underscore, the RSTRIP logic that removes the
> static RELA sections from vmlinux fails to identify them. This results
> in a situation like below, where some sections that were supposed to get
> removed are left behind.
> 
> [...]

Here is the summary with links:
  - [v3] kbuild: Strip runtime const RELA sections correctly
    https://git.kernel.org/riscv/c/71d815bf5dfd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



