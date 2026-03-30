Return-Path: <linux-kbuild+bounces-12343-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHryINgMymmL4gUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12343-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 07:40:40 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F26A0355A5C
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 07:40:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D5FE13005654
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 05:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5191381B16;
	Mon, 30 Mar 2026 05:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hSo0qZoR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF513806D7;
	Mon, 30 Mar 2026 05:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774849214; cv=none; b=qL34Pv1KhD78MBjU3nq37l4Lljq1DNS6V/WNe8ksQJ2r11Jm4lSOelbZtPmZRZbmphs6CyHajbPRsAmuykIzu4BHWE8zyC/7Bb3b73Sy03eXKXG4/Xgzu2wG/JpyIFlScTQkR3L50pGALeBt+ZDwoH2R5XU0oOBtTUjjxOyZoeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774849214; c=relaxed/simple;
	bh=YMdSyQTtYlMxYLd1UqUMmS1B/4na2ForxBOSkAwQj1M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=j2gLFrm0s/La3EA0d9kfx0+7PI22zg9mRukmoDA3VgBM32nSTuGWHqS+J4aCVV/HWWyAyfSu3CosFBEfsHCPplnCgwtQ9sm6tYEaS7xw+98MIJ16VW5uwQ1uz3LQ/xJ0C4bkhWYTh7t2NUjngVcdPgzsjwWKcUWinBaLIVCrkIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hSo0qZoR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72BF1C4CEF7;
	Mon, 30 Mar 2026 05:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774849214;
	bh=YMdSyQTtYlMxYLd1UqUMmS1B/4na2ForxBOSkAwQj1M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hSo0qZoR/2WzsZVgbslMBNyDLqqs5onpVtDiMfAeZmAGxXke1fZL+5VIXkUBCTiAB
	 uHmecXKSmDt7ZojYCTRNy3c0Vqj1MZAe+69FFVQQiWtpPh+29X7j9jo4rLsMSYLEez
	 e8+BGuaHpO5EhveV5zxVhJX86RtJ6ngJ6OSkSlYDDWQg5iAfuCxPEecZ/o2IQCB/EC
	 +3asDblsG49WO0YvHLPr1aupDQ2C7I8kATjCjojQVe2lt0W6pIK3OkqoKrEzAAirmq
	 uuIpmkKEJLXIbL6iQdUMLfn9OcvhdF7/I9hPZ/MTLE5skU8lQbDmsBKkZVMwCAnXB/
	 8B4307jJz3twg==
From: Nathan Chancellor <nathan@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Janne Grunau <j@jannau.net>
Cc: Simon Glass <sjg@chromium.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20260327-kbuild-modules-cpio-pkg-usr-merge-v3-1-ef507dfa006c@jannau.net>
References: <20260327-kbuild-modules-cpio-pkg-usr-merge-v3-1-ef507dfa006c@jannau.net>
Subject: Re: [PATCH v3] kbuild: modules-cpio-pkg: Respect INSTALL_MOD_PATH
Message-Id: <177484921220.1009805.17340922567466216649.b4-ty@b4>
Date: Mon, 30 Mar 2026 07:40:12 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12343-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: F26A0355A5C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 27 Mar 2026 09:30:29 +0100, Janne Grunau wrote:
> The modules-cpio-pkg target added in commit 2a9c8c0b59d3 ("kbuild: add
> target to build a cpio containing modules") is incompatible with
> initramfs with merged /lib and /usr/lib directories [1]. "/lib" cannot
> be a link and directory at the same time.
> Respect a non-empty INSTALL_MOD_PATH in the modules-cpio-pkg target so
> that `make INSTALL_MOD_PATH=/usr modules-cpio-pkg` results in the same
> module install location as `make INSTALL_MOD_PATH=/usr modules_install`.
> 
> [...]

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-fixes

Thanks!

[1/1] kbuild: modules-cpio-pkg: Respect INSTALL_MOD_PATH
      https://git.kernel.org/kbuild/c/742de64b62b69

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


