Return-Path: <linux-kbuild+bounces-10919-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8N1MNeDyeWnT1AEAu9opvQ
	(envelope-from <linux-kbuild+bounces-10919-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Jan 2026 12:28:32 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 518C8A0621
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Jan 2026 12:28:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DAF3B304D924
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Jan 2026 11:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5F722FB0BA;
	Wed, 28 Jan 2026 11:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YPoCem+3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935B72135D7;
	Wed, 28 Jan 2026 11:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769599662; cv=none; b=MC0RXr6d8lWA74Qnpvk18uh10Jfh8CvRnka3A+SN5zlDTQbOVqoERX4c/TIR2Bust0mcCbdKmm2fyYKqrPV5kmPkT8Gh6h5J7SgBDpi/Ydq5ghWDCNy4O8UpWill5JhW3mSsYn3ViEugSIATbO3s6+ooZH7adMjKUBROHS9r/C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769599662; c=relaxed/simple;
	bh=TbvoE+0E9p/GUrAMIKnojbZbCEPTP1dl/M+LQf+yWzQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mh/1WYEgY1xySC2fYkOUqgqJ0p8jRTxwoo6n9cyOfvGNle8qFsRbRN2gwX5v5+x586e296F+J2MRMoi4fUEXm08xTgA5F7vboH4DzrhC5CRsTrthPuR/9dpGAfpouF899lfQUVEtjmdAnpW/aWYiklv4dOTrwjkIGfB8BM2pEXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YPoCem+3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD9C6C19421;
	Wed, 28 Jan 2026 11:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769599662;
	bh=TbvoE+0E9p/GUrAMIKnojbZbCEPTP1dl/M+LQf+yWzQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YPoCem+3+LkLEmLlHwcFfLo5m1sdvx6oEB3v/cWJvIpNFLyI8MIsm7Ngt8Ib7QacH
	 nkygb1YevWuj0S1hOa2FfrAVx+bvqYdELBRvCLDv46wdrJOtKf4eFQJgNDa40l1SHe
	 joyXHKr5H1UJ2rm32VAHVX6zDsTb6kcXPzSO+/HZ3FKU4argoQ1bFOO3rzq5x7cvc2
	 KovF+VyOQebzz7wb83p07979KVlay4dF7irU/AV8/YvCQCDKIu8q/ezpRxhjcSVo2T
	 y3SlZ5wGjFAqGKDMaDXHysAg+sDL51RxxSLOpDUX0Niz6Zb2cRDsH6PUTXoUEuwRbF
	 GbOSI7gZ2lIrQ==
From: Nicolas Schier <nsc@kernel.org>
To: nathan@kernel.org, Ethan Zuo <yuxuan.zuo@outlook.com>
Cc: masahiroy@kernel.org, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <SY0P300MB0609F6916B24ADF65502940B9C91A@SY0P300MB0609.AUSP300.PROD.OUTLOOK.COM>
References: <20260127205915.GA3856796@ax162>
 <SY0P300MB0609F6916B24ADF65502940B9C91A@SY0P300MB0609.AUSP300.PROD.OUTLOOK.COM>
Subject: Re: [PATCH v2] kbuild: Fix permissions of modules.builtin.modinfo
Message-Id: <176959965192.1301244.16587395744422463112.b4-ty@kernel.org>
Date: Wed, 28 Jan 2026 12:27:31 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,outlook.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10919-lists,linux-kbuild=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 518C8A0621
X-Rspamd-Action: no action

On Wed, 28 Jan 2026 14:37:51 +0800, Ethan Zuo wrote:
> Currently, modules.builtin.modinfo is created with executable permissions
> (0755). This is because after commit 39cfd5b12160 ("kbuild: extract
> modules.builtin.modinfo from vmlinux.unstripped"), modules.builtin.modinfo
> is extracted from vmlinux.unstripped using objcopy. When extracting
> sections, objcopy inherits attributes from the source ELF file.
> 
> Since modules.builtin.modinfo is a data file and not an executable,
> it should have regular file permissions (0644). The executable bit
> can trigger warnings in Debian's Lintian tool.
> 
> [...]

Applied to kbuild/linux.git (kbuild-fixes-unstable), thanks!

[1/1] kbuild: Fix permissions of modules.builtin.modinfo
      https://git.kernel.org/kbuild/c/6d60354e

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped,
reverted or modified (e.g. trailers). Patches applied to the
kbuild-fixes-unstable branch are accepted pending wider testing in
linux-next and any post-commit review; they will generally be moved
to the kbuild-fixes branch in a week if no issues are found.

Best regards,
-- 
Nicolas



