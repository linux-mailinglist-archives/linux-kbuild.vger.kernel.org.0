Return-Path: <linux-kbuild+bounces-11535-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MA6FdYQp2k0cwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11535-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Mar 2026 17:48:22 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 506541F4184
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Mar 2026 17:48:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 39AF5301700E
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Mar 2026 16:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C90773E3DB3;
	Tue,  3 Mar 2026 16:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E0pW8/WC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B1A370D43;
	Tue,  3 Mar 2026 16:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772556496; cv=none; b=auQqLxiurKC9xgEiqYeeN1jCmKQcc7jSr7XYIlZQLxESQYGzkLCBDWPBWnG4mgz82l7eN+WtEmcLH6DZTZ12H+ZK5im83RYUkHu1ZlnlR5F76jWswvHo+xKBs7hxW18Wv4/H/LC14GKv8Ts78vLPWpTa7z1xJIOyf3jMLVkEJGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772556496; c=relaxed/simple;
	bh=tjGUr9rWCW1zkc9v2qRe1oVXnSybUfvPIOZwZYcrwVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I+mGptTExp7T/KaZQH06fLAKyZhc/pMKrSNPR3cwu49qSz4Wt7so4bjsiumRzJ/VtjAlIjUFk6KeYYRvg+Yp8JccEP1DDd28Mcyciu6iEvTte3RAbUt4aeQqkIng+AeoyD8lKd5e3Hzg+OrDtReBtkhbxPHrJYJt7fvNuZ6XQ28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E0pW8/WC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DA8DC116C6;
	Tue,  3 Mar 2026 16:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772556496;
	bh=tjGUr9rWCW1zkc9v2qRe1oVXnSybUfvPIOZwZYcrwVo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E0pW8/WCBvKxtjmoflKd0VFc6W1JFf32Xcuo2rzmjPNhf1xWHN0Hbl/dvQ1ZQOHW+
	 Ss8Vxmcg3TYucZS2xOOoW3nQxs7vlqp9HFcKVHZq06pD4JTD/YdYNeHmwkYbvU+Bfp
	 H7ulc9FM4mCCwfJHLie4z7aYWdpu0PPJBOZbGMbRF8ULSo3I20UPXcLKJeVOQZa18l
	 CExhhLW+/G6HRXDVDrOQ8RV6YNN5Z4LrzpGZCVpAdV4lih7kRKPYeoRKiSG+RAt7Kc
	 opuXymvp4BYRR3pY7NVymQ/MBb6eMeCXEvtT8IABS4PvMguKkt2kECmJbK6Y2BR5eq
	 AtQBWhOXx9IRg==
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Nicolas Schier <nsc@kernel.org>,
	llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] kbuild: Follow-up to "Reject unexpected values for LLVM="
Date: Tue,  3 Mar 2026 17:48:00 +0100
Message-ID: <177255616155.3889155.9191147372307170498.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260226-kbuild-llvm-followup-v1-0-201cc2a492d9@weissschuh.net>
References: <20260226-kbuild-llvm-followup-v1-0-201cc2a492d9@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 506541F4184
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11535-lists,linux-kbuild=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,google.com,lwn.net,linuxfoundation.org,weissschuh.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Thu, 26 Feb 2026 22:23:56 +0100, Thomas Weißschuh wrote:
> Some cleanups.
> 
> 

Applied to kbuild/linux.git (kbuild-for-next), thanks!

[1/2] Documentation/llvm: drop note about LLVM=0
      https://git.kernel.org/kbuild/c/8830b2e5
[2/2] tools/build: Reject unexpected values for LLVM=
      https://git.kernel.org/kbuild/c/7239ae53

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped,
reverted or modified (e.g. trailers). Patches applied to a
kbuild-*-unstable branch are accepted pending wider testing in
linux-next and any post-commit review; they will generally be moved
to the main branch (kbuild-next or kbuild-fixes) in a week if no
issues are found.

Best regards,
-- 
Nicolas


