Return-Path: <linux-kbuild+bounces-7412-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E2FAD1F12
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Jun 2025 15:41:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4200C7A68A2
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Jun 2025 13:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 321B725C6E2;
	Mon,  9 Jun 2025 13:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pp6+Q2Iz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092CE259CA4;
	Mon,  9 Jun 2025 13:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749476423; cv=none; b=XpEE8/cjAu31RNTTXfyZZJg3DvUQYVONR7LwtzS8QkGKY13ELnc+lKq3gpmScgEN7UoZ7kojTC/Kzd5EbydWazWaUDSSmDjV2UsI6Y5/lOmrWOx6RualLkrOilq1SWjfBNg5+UmbrLfujCqMAn7As/cn96b9pbRWpU2t7kDyAHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749476423; c=relaxed/simple;
	bh=vom0D/WvWlkg1JF/ExNR9+I+0VGrFhg2XqPiT+4ITcs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JciQePpGY249okK+A6T4o1exPLOw8PA+sJTWElOeKlc0SJxZ3BWKAc40EhI6dPbCDN1G1q8CQIo/OK8zxqlYVhnRgKWqFdPo36TfE9Aj2Sq5DY4dLiCCxvB760r1IrbZ/QyyR/wB1VrsQVZqKDyuzTWXUeSKYQdls/ZlHnVrtLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pp6+Q2Iz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4F95C4CEF0;
	Mon,  9 Jun 2025 13:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749476422;
	bh=vom0D/WvWlkg1JF/ExNR9+I+0VGrFhg2XqPiT+4ITcs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pp6+Q2IzM2pCPVl7xnUjRkrZzBs0v/D33Z6VhLJceULESnkviiJnm8bk4G0x6uw/7
	 JlnBcNeF6e4tAGTzd9xPYfJma4odXoBzH0GcrRVdj5CjFAuQ7pBloDXmL5e+MdDjNq
	 adCoOnG2iC1fz6+kTCCZZZnjM87sKAoZjAjUwKcbQef7FbI6L5kAhR5Pbnw8kyoxgb
	 pn7PpHYXXZgd0cxuos8OzRfqsAFYte6Skowf4trYrQVOs+6Zybd50ueSkXG/8sCh+t
	 y0nzAUvdF0xx7BmO14nncdWbBAAZNMa3npN2aZArfOlrzRQ0Rhl5KE6vbyjj4wZLSM
	 z/6ihjXQWbA0w==
From: Mark Brown <broonie@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Huacai Chen <chenhuacai@kernel.org>, Huacai Chen <chenhuacai@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20250608142737.168829-1-chenhuacai@loongson.cn>
References: <20250608142737.168829-1-chenhuacai@loongson.cn>
Subject: Re: [PATCH] ASoC: loongson: Fix build warnings about export.h
Message-Id: <174947642066.126747.2342329587404506443.b4-ty@kernel.org>
Date: Mon, 09 Jun 2025 14:40:20 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Sun, 08 Jun 2025 22:27:37 +0800, Huacai Chen wrote:
> After commit a934a57a42f64a4 ("scripts/misc-check: check missing #include
> <linux/export.h> when W=1") and 7d95680d64ac8e836c ("scripts/misc-check:
> check unnecessary #include <linux/export.h> when W=1"), we get some build
> warnings with W=1:
> 
> sound/soc/loongson/loongson_i2s.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: loongson: Fix build warnings about export.h
      commit: a4e469c1e2e0ec7f08fff9ed29f5500f187ba9f2

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


