Return-Path: <linux-kbuild+bounces-8651-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B3BB3AD92
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Aug 2025 00:35:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 320197B048F
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Aug 2025 22:34:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CEAA262D0C;
	Thu, 28 Aug 2025 22:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q7n46gx3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E85DF72;
	Thu, 28 Aug 2025 22:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756420542; cv=none; b=Q3L7uYZg/kVreiHA9MkWck1YdRJDj7ubK1laLiX19oNToTUJ+KSRccrWA5b0EED9zrUKRlfZlATAifm3fpnEVttozTm0TPvj/Rle6iUWR3NB/dUX8VhCdNJDTmr9SlX8ZQ2o9FSkd48op8wTNq9bPPMQW3dFnZLRiLcOi2JkHbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756420542; c=relaxed/simple;
	bh=DCx2y8PbqQp+P0i2k0iuWJQ4k9F25wgU9kXwRE0g0M8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XEzP0/iYYsOqJI6ts+1rWuvnEjUpsEuwUiL4owmMVqU+dx9nnf4naIBJsEmFVNdK3sivBjjY9dEGIN0M2+CPyOhoIfqd5sXWCuuL4FlO3JJqpzVTe3jiiUjbWC1RKoEcls/JIeTlHzaOcNGlDhpJb2LCIaFHaKG1yW/qjIbcngY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q7n46gx3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A20FC4CEEB;
	Thu, 28 Aug 2025 22:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756420541;
	bh=DCx2y8PbqQp+P0i2k0iuWJQ4k9F25wgU9kXwRE0g0M8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=q7n46gx3XS8E4JqRkN6zOiybCOK4e9ZWjFzUmfcRcHK5MYysRiuj74KoaU1yIoy77
	 9M4elu5bjfzm5ppuLbbjtXZPBH8weatdbNQYvCmUOcC5qGrXfTbIMrpaSi3kqaad+5
	 FCr77QOJXyGWE+z6aId7AfWpSOLAqz7p2Ry5T2BIOQd623E0YReryR05arwzVxyXc/
	 cvkUGxt4isQFVZo8domy6E7N2RDZ+7xp86N3N3eP8qbDJswZrKRTlHTDNcIGwged5H
	 rEJ2BITZFsqcM1yWR3jA49Q6P2k2wem0OOwUfhdWfqELaAT3DFjvnfn+OFS8lzOsqf
	 jUAvhyM9DObqQ==
From: Nathan Chancellor <nathan@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 Maxime Thiebaut <maxime@thiebaut.dev>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <X6OQ4pHdpreJtlTnf0tFEb4Uxz8T8gFv_7Yw6tpBK4ZBgHYjJr_URwUwCVynpkb-H8Yjk7DdBF01zY-sfqu_7N5trZQfcd6s_4PtdGlHtlA=@thiebaut.dev>
References: <X6OQ4pHdpreJtlTnf0tFEb4Uxz8T8gFv_7Yw6tpBK4ZBgHYjJr_URwUwCVynpkb-H8Yjk7DdBF01zY-sfqu_7N5trZQfcd6s_4PtdGlHtlA=@thiebaut.dev>
Subject: Re: [PATCH] extract-vmlinux: Output used decompression method
Message-Id: <175642054004.464288.16840468164440733967.b4-ty@kernel.org>
Date: Thu, 28 Aug 2025 15:35:40 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev


On Tue, 26 Aug 2025 19:23:49 +0000, Maxime Thiebaut wrote:
> When extract-vmlinux succeeds, it doesn't output which decompression method
> was found at which offset. Adding this additional output in check_vmlinux()
> helps troubleshooting and reverse-engineering images.
> 
> The last check_vmlinux() call was also quoted to accept spaces.
> 
> 
> [...]

Applied, thanks!

[1/1] extract-vmlinux: Output used decompression method
      https://git.kernel.org/kbuild/c/1e150869caf2f

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


