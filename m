Return-Path: <linux-kbuild+bounces-7045-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4941AAB00B8
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 May 2025 18:51:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E8F37B58AE
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 May 2025 16:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70172853F2;
	Thu,  8 May 2025 16:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BvkUaHrD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3EB2853EE;
	Thu,  8 May 2025 16:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746723091; cv=none; b=Oc5YeeMnBfJBkO4/EQdYUH6Ym96/AE6Vo+jWG5uPP8O4t2+hjKUXXKQTmYK1+ekYuRalZ+8p6rtjSqyjKHxst1E1c4n25WzxbKax9gSM1050YvEjFvs0KhF4Mb0leXFTa80skXyRRWkl9h3SQcQB7SkjFGhcvq2IJMTtQ3o1bnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746723091; c=relaxed/simple;
	bh=CqM/OHPCyhT3HBcTk1o6Jg2KbU0I9Kyg6nGIy8ZyWcc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=KD3ppDfNjO0B8x/WP77Z5ZdRKoKs0RkOOSxP/s7/dL9GEnYhXa4xHK1iyTwT87ZLqWDVb4POn5a2MOOlXpNjUZN6iFqYRpx3WyvTR2QOni5stW4yyOq7b/4q+WVwFkeeqpbZaA/oPl9qIMnlaSoLwjIqs0ewIJZXnzMXq57PQgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BvkUaHrD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FAD0C4CEE7;
	Thu,  8 May 2025 16:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746723091;
	bh=CqM/OHPCyhT3HBcTk1o6Jg2KbU0I9Kyg6nGIy8ZyWcc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BvkUaHrD0/kpfGObaoE8TbmREcP+uL/31YLX+6W9iH+SxgQAJCsbKETziKG4OOGu+
	 2p1dpeFjCi1KufIB7qrmuPXVIxLrCVmvOUKQFtUM96rIILswHxkxjQ4Fk9n9H5Uj8l
	 rBDzZXx+rnu3DzuvB0pC6omHtojlWbZS5yiPh5fLNIp6mtjIRRa87BiF97UPPljCjp
	 IHM66prCCZnB2pvGRR8xn4OYVbYIdbyaDDmdS0I0sMMx6a0dnUv+ikPxyeIu3iEKKv
	 orP/z8CdD3MPKiJuIoDjjCYDY15DnJcF/bYYHC8ZA7TYu/d4ZA+aojdRTiMLdlm2oV
	 XuXkvfAylVw6A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEA0380AA70;
	Thu,  8 May 2025 16:52:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] scripts: Do not strip .rela.dyn section
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174672312974.2976395.10364863541225876459.git-patchwork-notify@kernel.org>
Date: Thu, 08 May 2025 16:52:09 +0000
References: <20250408072851.90275-1-alexghiti@rivosinc.com>
In-Reply-To: <20250408072851.90275-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, alex@ghiti.fr, bjorn@rivosinc.com, masahiroy@kernel.org,
 nathan@kernel.org, nicolas@fjasle.eu, ardb@kernel.org, charlie@rivosinc.com,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (fixes)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Tue,  8 Apr 2025 09:28:51 +0200 you wrote:
> The .rela.dyn section contains runtime relocations and is only emitted
> for a relocatable kernel.
> 
> riscv uses this section to relocate the kernel at runtime but that section
> is stripped from vmlinux. That prevents kexec to successfully load vmlinux
> since it does not contain the relocations info needed.
> 
> [...]

Here is the summary with links:
  - [v3] scripts: Do not strip .rela.dyn section
    https://git.kernel.org/riscv/c/e9d86b8e17e7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



