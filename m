Return-Path: <linux-kbuild+bounces-1212-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6100C8783C4
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Mar 2024 16:34:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16E561F219A3
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Mar 2024 15:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4026A47F7F;
	Mon, 11 Mar 2024 15:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LjsU6RgL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1761A44368;
	Mon, 11 Mar 2024 15:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710170831; cv=none; b=uydpC9rFrv9Dl7M3/JDvxgZLQ8N7pLPxg8+EMBONb8zqZlCFk07beeg2vpcKJIuTar78ne2dNF36niUeUfRfh2mMrC68VvU9hLrzSo/whDNre6cR8zXadAmsrtkFm6rBvGLSEV8MXoi2UfTSNv5hvoLdYPztu414LBRD9ixAkvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710170831; c=relaxed/simple;
	bh=z4m2mdAW+4t979hNRetfiN0r2sRlcX+HmjBvZVh9Ceg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Tjyu7pgEjTQf+JNIBgf0JIfcWvxKqL1XSmlhWK8xLtOm2ma5k+pWXSHyjmhveymX+TNl59vaT4UcmjBqTDeRytsSR9zGm+fwWQAJn34W+Ek1mKDtn22pnVlQ9efPVndEDmR8w2/Af88iuCUrq7xmFFggKMR3ula5KwqeKvjeBvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LjsU6RgL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 536C8C433F1;
	Mon, 11 Mar 2024 15:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710170830;
	bh=z4m2mdAW+4t979hNRetfiN0r2sRlcX+HmjBvZVh9Ceg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LjsU6RgLyq/y/0t0yeVDVtpFwa67Wl0+iahIdEi0XO6cIY9dHmpqWmiaYay6E60dy
	 UOb9CU3tRlf2qYWbwi4PdzRvb0Eb2etX0/KU1MTnU+W8N2xwBUfkK7jObdWluCh21m
	 03WAZQC7A6Xdtn5sOgPJrTlHhaM/e/Se8dqbrsA7aQSaLapaJ8VLdzUQKyuNIOz3OC
	 HJlNMgHcO4IZJ1h8+61r/BwnSRqyBifkzSMtmjfkGYpaiAAb1EtY9LX+gJTGKLpVCA
	 MckYE8cYx8+gKdRosCFN6VG8DUVZpQlYyeUiL7BD0SmFFwi/Dl306wU7eznYsacTNL
	 ZX3vhHrSW8E0g==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, 
 kernel@pengutronix.de
In-Reply-To: <20240310143852.397212-2-u.kleine-koenig@pengutronix.de>
References: <20240310143852.397212-2-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] ASoC: tlv320adc3xxx: Don't strip remove function when
 driver is builtin
Message-Id: <171017082806.34160.5012089436149425102.b4-ty@kernel.org>
Date: Mon, 11 Mar 2024 15:27:08 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-a684c

On Sun, 10 Mar 2024 15:38:51 +0100, Uwe Kleine-König wrote:
> Using __exit for the remove function results in the remove callback
> being discarded with SND_SOC_TLV320ADC3XXX=y. When such a device gets
> unbound (e.g. using sysfs or hotplug), the driver is just removed
> without the cleanup being performed. This results in resource leaks. Fix
> it by compiling in the remove callback unconditionally.
> 
> This also fixes a W=1 modpost warning:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tlv320adc3xxx: Don't strip remove function when driver is builtin
      commit: f31e0d0c2cad23e0cc48731634f85bb2d8707790

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


