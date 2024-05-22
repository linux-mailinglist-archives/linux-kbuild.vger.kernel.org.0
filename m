Return-Path: <linux-kbuild+bounces-1924-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CB98CC9AA
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 May 2024 01:32:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 29268B20E4E
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 May 2024 23:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64E2C14D2A4;
	Wed, 22 May 2024 23:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lmSKxxId"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB8514D28F;
	Wed, 22 May 2024 23:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716420744; cv=none; b=R5/7VNllVlyp5+ooavWK7JJVn1klz0jfwb7V1S973Ul7l66KCzqGHtvO4PZklHTOhZ0eH7Y8GxROisYH9qITiWKMq/oseJkJFZ7kBDPVuN+R+W79RK7oAylPG8Xu/DWiynBMkAZKwRNF5ufIHR15jeEri5o602LUr8XXHsxZpRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716420744; c=relaxed/simple;
	bh=tosxLgQ5SdcOjgbZkL48MhTf4v8vVX+91AKf+bXS8Yg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=taafBUmcZsMLBxDgKfBKidMv+kb3YhDfFb1tVg/fW7hjeL981p0ps2SZ97VvZWupB79ZXN1+GV6tNg8lQJnkilANJHejaCLlc0jDMEdppbHFPiS9krh1pPAgss4/07rNB7G5i3B0DCrjz2JF+TSq/roX7C/SQohavLC7+Z/dRqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lmSKxxId; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B07E5C4AF0F;
	Wed, 22 May 2024 23:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716420743;
	bh=tosxLgQ5SdcOjgbZkL48MhTf4v8vVX+91AKf+bXS8Yg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=lmSKxxId/1JDIS/pIUh39SLARWDNTIraiJv2B8C2tP3dj5k4zGWEWWCRkFPznjxrq
	 D2Oljqkfc2CzhIk4vdu3VYIx13ENJk4soXXsvw0NtddUwDhXYme/eh4U3BOrlHRNYr
	 oSuoKD9vxM5n4S3tHC1HroNYzJr57Q3qrSk8G2nrnp8JK5maIfwL36vdJHaPqLxtEF
	 /cofq7X+/ZZlATsXKU5713282G7aGVSEcLYbOWy/9n9yDhE5VlYMSiY1YljfzyuUYw
	 A9wX0p0BtUAUtxvxbNIKEHG1TAZbUtmFuyb3//u7B8HeieeoGo0LZHJkOsiBAJJaQC
	 Qs7fCErwH6vew==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A403CC43619;
	Wed, 22 May 2024 23:32:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] kbuild: simplify generic vdso installation code
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <171642074366.9409.2372059946348882116.git-patchwork-notify@kernel.org>
Date: Wed, 22 May 2024 23:32:23 +0000
References: <20240429150754.3178262-1-masahiroy@kernel.org>
In-Reply-To: <20240429150754.3178262-1-masahiroy@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, nathan@kernel.org,
 nicolas@fjasle.eu, palmer@dabbelt.com, paul.walmsley@sifive.com

Hello:

This patch was applied to riscv/linux.git (fixes)
by Masahiro Yamada <masahiroy@kernel.org>:

On Tue, 30 Apr 2024 00:07:54 +0900 you wrote:
> With commit 4b0bf9a01270 ("riscv: compat_vdso: install compat_vdso.so.dbg
> to /lib/modules/*/vdso/") applied, all debug VDSO files are installed in
> $(MODLIB)/vdso/.
> 
> Simplify the installation rule.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> 
> [...]

Here is the summary with links:
  - kbuild: simplify generic vdso installation code
    https://git.kernel.org/riscv/c/1c369b6c9492

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



