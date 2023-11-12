Return-Path: <linux-kbuild+bounces-18-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C327E8DC1
	for <lists+linux-kbuild@lfdr.de>; Sun, 12 Nov 2023 01:55:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 75CBDB20A59
	for <lists+linux-kbuild@lfdr.de>; Sun, 12 Nov 2023 00:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76632187C;
	Sun, 12 Nov 2023 00:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eWIdIwNO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C46117EC;
	Sun, 12 Nov 2023 00:55:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B3C5C433A9;
	Sun, 12 Nov 2023 00:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699750546;
	bh=XrSajqyIX/GMIupsbLdryjwZSJcnce+GPP7KDkPQhtc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=eWIdIwNOLNdqkngfPRmCRaOwzQqWEdVf4fyQfsJ9hX51PDQ3bhmSI9QZtsMgYrcIF
	 8aHZMYs4gOL/4gSqcMm7IRvWe1PcqRpqOtwPinsNQE/yPNH1jAjAZc0qUF+cE2rkNp
	 nglRwyteoICzPFjGnf2iZ6kKToydLI7h8VBgwrPRWc0yrSSWvf4CHXHy6ARxGcy9DF
	 YIFq9xAbPweOOdZvVR9AfcNgB3Ga1hsegS0aAjb+9DN11BMP4pAVieNjxsE9qae8rb
	 FS/26AIT3WSbus8G7Vwa6iQL37+L3sU0hhWl6PyV4EpenSbokJHdqOpR8gqAekhlG3
	 5K+C9ET1I0p3w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 68EEAE0008E;
	Sun, 12 Nov 2023 00:55:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 1/2] kbuild: unify vdso_install rules
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <169975054642.11360.1289704479646976676.git-patchwork-notify@kernel.org>
Date: Sun, 12 Nov 2023 00:55:46 +0000
References: <20231014105436.2119702-1-masahiroy@kernel.org>
In-Reply-To: <20231014105436.2119702-1-masahiroy@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-um@lists.infradead.org,
 loongarch@lists.linux.dev, sparclinux@vger.kernel.org, x86@kernel.org,
 svens@linux.ibm.com, nicolas@fjasle.eu, guoren@kernel.org, deller@gmx.de

Hello:

This series was applied to riscv/linux.git (fixes)
by Masahiro Yamada <masahiroy@kernel.org>:

On Sat, 14 Oct 2023 19:54:35 +0900 you wrote:
> Currently, there is no standard implementation for vdso_install,
> leading to various issues:
> 
>  1. Code duplication
> 
>     Many architectures duplicate similar code just for copying files
>     to the install destination.
> 
> [...]

Here is the summary with links:
  - [v2,1/2] kbuild: unify vdso_install rules
    https://git.kernel.org/riscv/c/56769ba4b297
  - [v2,2/2] kbuild: unify no-compiler-targets and no-sync-config-targets
    https://git.kernel.org/riscv/c/9d361173edc4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



