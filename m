Return-Path: <linux-kbuild+bounces-12108-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPRAL5OzvWlBAgMAu9opvQ
	(envelope-from <linux-kbuild+bounces-12108-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 21:52:35 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 287DD2E1079
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 21:52:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3CF9302E910
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 20:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 670A4318EFA;
	Fri, 20 Mar 2026 20:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tXD3XN/e"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B6E2FDC27
	for <linux-kbuild@vger.kernel.org>; Fri, 20 Mar 2026 20:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774039935; cv=none; b=YAh6x4RZGRh5ImgAXwsKlPy8/D+KGF0tOteSKlmDUMBsJvTcm7ZhF0cvoCoypNvadCqy+E349slbxaxH83qTI3Hzma+QTYILAjfzSBUSmlur2Db2Oy0d1aGHHPSP7+iCAcFuNfXPuDa/1EDAyNwtVnAJDJ1nPXSuSlcMaHqxYHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774039935; c=relaxed/simple;
	bh=OZHe55AmyL8ptcKDjAek619Us0XLOCvXap/JYHbicis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VSfbC3eVAX8/DtsHLy1VwLFv5ey5qF53t579ApXV5P8l87w1FyNDWu8zfUwggBP7hQFpkWc9Kx2Jzk66yeXFZD47Q7l9GC35js+eEeLT91Z+gTwrq/8FHjN+nT7yUEwWioMWFTgWAVsALJNoCC3NswXI5LmnEPEK/z9okpu+dAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tXD3XN/e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CFADC4CEF7;
	Fri, 20 Mar 2026 20:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774039934;
	bh=OZHe55AmyL8ptcKDjAek619Us0XLOCvXap/JYHbicis=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tXD3XN/eSqdB2T/tEKAnScAK2zuKnK4ad24q04R65pRUXMkxK7pXk2J3eFLiwIXb+
	 l60cgGRmdYtr7AzlalTkoURwmMSFI/C0cLTyC2IdvRYqHyv7qkJTYoHzjOHDdkHiN8
	 DgdxfbypiM+P2+wnUX2Kau/TaIdKhBjW6oLBLYH3ON4Jb6gTlfingp6p6f2a1DR0N6
	 8jtePkMgEeZPRgaGBEwpdZwMZgrS5X18+jv800R42KgO9HznowaijDERgbvx9ZHG4E
	 3g/QcNOxPmdDlcWUojIuMyypbB/aI/kDlatSa2YKsI3RC76sZS6Cwo6RtvJM/+Hs2W
	 6Mv11Ds6F+I7A==
From: Nicolas Schier <nsc@kernel.org>
To: linux-kbuild@vger.kernel.org,
	Arnd Bergmann <arnd@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Dodji Seketeli <dodji@seketeli.org>,
	John Moon <john@jmoon.dev>,
	Nathan Chancellor <nathan@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	libabigail@sourceware.org
Subject: Re: [PATCH 0/3] check-uapi: improve portability for testing headers
Date: Fri, 20 Mar 2026 21:51:47 +0100
Message-ID: <177403977331.3231081.5258137128681521532.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260306163309.2015837-1-arnd@kernel.org>
References: <20260306163309.2015837-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12108-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 287DD2E1079
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 06 Mar 2026 17:33:06 +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> While working on a series to clean up some uapi headers, I needed
> to check the that the actual ABI remains unchanged. I found that
> scripts/check-uapi.sh works well enough for architectures that have a
> full toolchain installed, but not with the nolibc compilers I provide
> on kernel.org.
> 
> [...]

Applied to kbuild/linux.git (kbuild-next-unstable), thanks!

[1/3] check-uapi: link into shared objects
      https://git.kernel.org/kbuild/c/a261f6df
[2/3] check-uapi: honor ${CROSS_COMPILE} setting
      https://git.kernel.org/kbuild/c/9940ec38
[3/3] check-uapi: use dummy libc includes
      https://git.kernel.org/kbuild/c/bb25b563

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped,
reverted or modified (e.g. trailers). Patches applied to the
kbuild-next-unstable branch are accepted pending wider testing in
linux-next and any post-commit review; they will generally be moved
to the kbuild-next branch in about a week if no issues are found.

Best regards,
-- 
Nicolas


