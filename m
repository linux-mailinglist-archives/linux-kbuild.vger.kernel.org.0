Return-Path: <linux-kbuild+bounces-10591-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6710BD2151A
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Jan 2026 22:24:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8D5030321DA
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Jan 2026 21:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 678D335E55E;
	Wed, 14 Jan 2026 21:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zn47IUSM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426243570B5;
	Wed, 14 Jan 2026 21:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768425848; cv=none; b=IUxktaodDEtG5Bi+6QrUpF1Efx2XgyQLfbtKS99uQh0HQh1APkrbbNtAodozmc9JPsC7NUz7NLW7YZShY7azPA5XeU9eg57NPoWDYHcifCwBer0AC3LvitV4ZwrI2vSI9PUmlL6yHXycgiqmqUewpeLwYq31kmf4NbDFlHcfUr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768425848; c=relaxed/simple;
	bh=2trI+8s8PDptory9mBVHGdX0mT6PJozEr0pjQ289tE8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=E2Ye6OVmEsgV81p6jS7eezRnyubjd1qRiFza7W7xMCgoSZPNmA759jWWRvY/yTsMheMHZ7b50AlQ8JTteZd3+AW3O1JU3bnM3jm2xdrr2B6a2W9NeijDxegILU9qUUotjcRomyBiViiPEbqQQwjHORWOdJ1Ofb13euje3Vito54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zn47IUSM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C760FC4CEF7;
	Wed, 14 Jan 2026 21:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768425847;
	bh=2trI+8s8PDptory9mBVHGdX0mT6PJozEr0pjQ289tE8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Zn47IUSMETwpMr6e7yJAojFvTasVGe7lyIJ21JVLqL3s4EvKX6N/3zrJi1atXBJJv
	 eu8ZIwrCRWM/FnMPdmHmL179TsgCQlgeSlPjEPP03jmgHlaWmoEVrH4q10uEDPK1Ie
	 7rI6ulPxTgP9yFFqv4S5M7qGRCAxG2qFYUryQdjEsFedPin70b7Gz2rMYqwcVPkm88
	 pl2lAL5qqk20L5QRkl7FdkFoDymTo7t+MCl5SmV89v0n9gmMJlHUhU5ii/trxbzcdY
	 ZQYPyPnoGynvlpivzvepSOzuNkF+GOFCPxKRipjiLmnwfsYY21yi8diCrDOu3Y5Zx7
	 kixhj0361fmfA==
From: Nathan Chancellor <nathan@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev
In-Reply-To: <20260113-kbuild-cc-option-v1-1-011314a0f7f1@weissschuh.net>
References: <20260113-kbuild-cc-option-v1-1-011314a0f7f1@weissschuh.net>
Subject: Re: [PATCH] kbuild: Drop superfluous compiler option checks
Message-Id: <176842584555.2841457.8759143570481663014.b4-ty@kernel.org>
Date: Wed, 14 Jan 2026 14:24:05 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev

On Tue, 13 Jan 2026 08:29:58 +0100, Thomas Weißschuh wrote:
> Many of the compiler option checks are not necessary anymore with the
> current supported versions of compilers.
> 
> Remove them.
> 
> 

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next

Thanks!

[1/1] kbuild: Drop superfluous compiler option checks
      https://git.kernel.org/kbuild/c/379b749add7ef

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


