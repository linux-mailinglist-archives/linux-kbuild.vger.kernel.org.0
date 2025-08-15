Return-Path: <linux-kbuild+bounces-8487-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19305B28793
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Aug 2025 23:16:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC2E2AE41C0
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Aug 2025 21:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDAE539FF3;
	Fri, 15 Aug 2025 21:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IwmVXJqW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64A24A00;
	Fri, 15 Aug 2025 21:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755292576; cv=none; b=lQkVpMOgYavcbfwvpwHIdUw7bOeqc43WRTerqzrZ+Mc2yHUi+qjdMipBoOaUsLHDzt1FI2nJ/SCE3vTBmu/jcM1OsmtmeSQOpgV3A9XWn0mBBfoKhGZx6TYcoW8bZYUmvfoMttvqt/3SOspY/5QI3BJfxCosN1ps2TLKZidVa5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755292576; c=relaxed/simple;
	bh=noc6S2jH5KMwAXQAGBgXw4htFU+04vvObhFpEMTkBo8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=raFslaoXMz2N7OlsFSnUCMk0QNGpdUIaZ62Fxn0wfLeIP5evc94PDQ2j8+EFUemj01rlCynKxLZAP0P0Jh4u0JoAzFB2+lsbtcI43hXN0pXOoi1aIcHPwR0pCFglL4OKV00dRJ7Vz4qJPh4B2F0vZ/WK2oXyuvNz4EUFDb4+OvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IwmVXJqW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34524C4CEEB;
	Fri, 15 Aug 2025 21:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755292576;
	bh=noc6S2jH5KMwAXQAGBgXw4htFU+04vvObhFpEMTkBo8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IwmVXJqWa3B45EZ0LDKyKEcd27agrxQXPQdCoI376OjQ96VabM8/4eKeQXAGDETWz
	 5abKb7JJ0divOMK+81ty6K+/1JBfJmbVdXtODUf7H5EKhUrWwvn8Z5fDJ06ClmYCtp
	 HsdTdrARGYcanzdPm3jUMInyGX7guB4NIjHQQau72RanY0iRcWRuMAhzcT+CcNG9c+
	 uRY7SioKusYvKdTRNSGnTKRLQuH5KfuyihH97qzOZYwkxPHcfVyAFN7nEd/NhuuSL7
	 9N9J1UOU3z1XTcDphE0JmbDDwSLjolYCVu+sjh6eDCNBPlcjKxukHTsBYkW9pnk60+
	 GT0XoySFCr9QA==
From: Nathan Chancellor <nathan@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
In-Reply-To: <20250813-kbuild-userprogs-bits-v1-0-2d9f7f411083@linutronix.de>
References: <20250813-kbuild-userprogs-bits-v1-0-2d9f7f411083@linutronix.de>
Subject: Re: [PATCH 0/2] kbuild: userprogs: also inherit byte order and ABI
 from kernel
Message-Id: <175529257494.1745051.12925907473487620695.b4-ty@kernel.org>
Date: Fri, 15 Aug 2025 14:16:14 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev


On Wed, 13 Aug 2025 07:43:39 +0200, Thomas Weißschuh wrote:
> Make sure the byte order and ABI of the userprogs matches the one of the
> kernel, similar to how the bit size is handled.
> Otherwise the userprogs may not be executable.
> This happens for example on powerpc little endian, or riscv32.
> 
> These patches where originally part of my series "kunit: Introduce UAPI
> testing framework" [0], but that isn't going anywhere right now and the
> patches are useful on their own.
> 
> [...]

Applied, thanks!

[1/2] kbuild: userprogs: avoid duplication of flags inherited from kernel
      https://git.kernel.org/kbuild/c/c5afee88548e4
[2/2] kbuild: userprogs: also inherit byte order and ABI from kernel
      https://git.kernel.org/kbuild/c/478494044bb42

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


