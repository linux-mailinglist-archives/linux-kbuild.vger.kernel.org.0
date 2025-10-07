Return-Path: <linux-kbuild+bounces-9039-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AE6BC232A
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Oct 2025 18:56:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B31173501C6
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Oct 2025 16:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D12572E8B9B;
	Tue,  7 Oct 2025 16:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zzj356//"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A706B2E8B98;
	Tue,  7 Oct 2025 16:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759856156; cv=none; b=sHPMjuMAfJSiiiBTYn7AgOCQgIt8AE4QRy+7JCYYJnuWASJ1Kcm3OVgnDWwtVbnVASwuzTsbmI6NzVnMe/feTEHzXBBJcnvmYSpyqEQHpUTVIRoFvdVGli++Uxx6xXHhE2oDa4oQBfuVBOMI+Df64wzxK8OJmOKlsibFKceMBJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759856156; c=relaxed/simple;
	bh=/Rt5Ag4kCua6N+E5+LgOW3H1h4FtPLDPMzXSQTf0wes=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ulptx9i9tV6ziTXRr/kkdEqVTRBXe4X1bqD3dzJHQZAf7aRtbRWMGySIqVxlVyanoNpjCW1PvkMMboWEKTgas3QtdOqQoUS2W/N9Y4ZM7ZyCoDb+VaY8C/BgmaLC2caqlZAcHPO1ChJo8smt7sixQdJCDKw+EeRtZ+GAe6DlGOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zzj356//; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9656EC4CEF7;
	Tue,  7 Oct 2025 16:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759856156;
	bh=/Rt5Ag4kCua6N+E5+LgOW3H1h4FtPLDPMzXSQTf0wes=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Zzj356//kPPM5lI/Ij2w5WbaxPFKRW4M7fNjt2uElesMXjMCSBymPfJGvSjkceS66
	 7izDqbcekgKV60uH6Pl/3CEYh0TGe05/7Dd5GZo1x39zpb8r2T2y8s+Cjzt9XplszE
	 j0JiIoiukJjs8DIhhB4JvalFdqXCi/PTOPq9pQYz71UbaoNs6sjhzKrY4CVYYG9PIy
	 cID3tZasYs4ckp7tagRM4DiLtY7HCzcTKL/diJ29nKshn7PjUROrd1m74EKAwwWsvs
	 BAW0Cu712bWMP0F7ioB/xVqUFd7wXnNlCZw5JwRLwxFhGXgTSo51Aovplc7+/yiIfh
	 H5QVh0VvEirBQ==
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nicolas.schier@linux.dev>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Nathan Chancellor <nathan@kernel.org>
Cc: Askar Safin <safinaskar@gmail.com>, Sam James <sam@gentoo.org>, 
 Miguel Ojeda <ojeda@kernel.org>, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251006-kbuild-hostprogs-werror-fix-v1-1-23cf1ffced5c@kernel.org>
References: <20251006-kbuild-hostprogs-werror-fix-v1-1-23cf1ffced5c@kernel.org>
Subject: Re: [PATCH] scripts/Makefile.extrawarn: Respect CONFIG_WERROR /
 W=e for hostprogs
Message-Id: <175985615433.1365513.11706910126102744653.b4-ty@kernel.org>
Date: Tue, 07 Oct 2025 09:55:54 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev


On Mon, 06 Oct 2025 14:39:56 -0700, Nathan Chancellor wrote:
> Commit 27758d8c2583 ("kbuild: enable -Werror for hostprogs")
> unconditionally enabled -Werror for the compiler, assembler, and linker
> when building the host programs, as the build footprint of the host
> programs is small (thus risk of build failures from warnings are low)
> and that stage of the build may not have Kconfig values (thus
> CONFIG_WERROR could not be used as a precondition).
> 
> [...]

Applied, thanks!

[1/1] scripts/Makefile.extrawarn: Respect CONFIG_WERROR / W=e for hostprogs
      https://git.kernel.org/kbuild/c/7ded7d37e5f5b

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


