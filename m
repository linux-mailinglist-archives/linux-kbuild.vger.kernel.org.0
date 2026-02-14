Return-Path: <linux-kbuild+bounces-11309-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANaOE3fLj2nMTgEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11309-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Feb 2026 02:10:15 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DB33213A94B
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Feb 2026 02:10:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6FC1330F662D
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Feb 2026 01:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F823217704;
	Sat, 14 Feb 2026 01:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o7qNBqk4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC2B1E1E12;
	Sat, 14 Feb 2026 01:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771031174; cv=none; b=QzN0S3nvXMPEMAfUi4S8rHwax2f/UT4jcdYtGP7yt0zFlodzMCOxPchtnDVcSefjlWbWaTEs7brsDr8icXhsxQQiCnbFJzKBDB6iJxWDLFHru9QTl2MU8rF2FSomkvj+F1zXn44GpMHctjMt70zUjmsAjW2KuSnEy269+1ExsdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771031174; c=relaxed/simple;
	bh=P757cIvbybrbEigvjiYTK9LdfSBIH58ZVy2Orfdfk4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cW050KpAJBXO+PuWbEobyeSQEksQw4P5MJEDkS1nj1y2cCOeG6gn/IfLq4QxHAgtSRDWWTLkIqwF7hrk80yRUIQwO/w6YX1w6G9Wxx+Di35JctHgZDVDIKa9sJtOSMpxlbqIhbBNSRAZkTfW9gCLGpz6AYY77eEh4HCno5M5GDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o7qNBqk4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBA81C19423;
	Sat, 14 Feb 2026 01:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771031174;
	bh=P757cIvbybrbEigvjiYTK9LdfSBIH58ZVy2Orfdfk4g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o7qNBqk4gFz0xDlse3fuddnJlgjgpi18nsyFVScDgyVn2F6M2tQiSH5Jyy+vI1zLQ
	 W2nG6SL2Zk+j/vMy90AuJGpzNidU7sFtVp56druL/DaGxrHyShc2wXgYdWfoF/H1hI
	 ARuvrQcL8Dgb5exXn9QMQBfg38RaeLaBtFe/dJjmHEf6r1PaKjIg7+0+C38hf22eMm
	 eELpC515TEAaW/SsD6XcCNOv1brienfK/irrtfTR+qAPwjr0eHPVJ3SA/oUuaJkVxd
	 ZK+V8Uj3NDJJabyg9jFbwBU0GY/AC6zDknYYrybXifla5reqniUtCi2uv/MbDobUnq
	 YCZoiqWD3R1gA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Ren=C3=A9=20Rebe?= <rene@exactco.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	nsc@kernel.org,
	masahiroy@kernel.org,
	peterz@infradead.org,
	petr.pavlu@suse.com,
	neil.armstrong@linaro.org,
	u.kleine-koenig@baylibre.com,
	yelangyan@huaqin.corp-partner.google.com,
	jeff.johnson@oss.qualcomm.com,
	linux-kbuild@vger.kernel.org
Subject: [PATCH AUTOSEL 6.19-5.10] modpost: Amend ppc64 save/restfpr symnames for -Os build
Date: Fri, 13 Feb 2026 19:59:29 -0500
Message-ID: <20260214010245.3671907-89-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260214010245.3671907-1-sashal@kernel.org>
References: <20260214010245.3671907-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11309-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[exactco.de:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,msgid.link:url]
X-Rspamd-Queue-Id: DB33213A94B
X-Rspamd-Action: no action

From: René Rebe <rene@exactco.de>

[ Upstream commit 3cd9763ce4ad999d015cf0734e6b968cead95077 ]

Building a size optimized ppc64 kernel (-Os), gcc emits more FP
save/restore symbols, that the linker generates on demand into the
.sfpr section. Explicitly allow-list those in scripts/mod/modpost.c,
too. They are needed for the amdgpu in-kernel floating point support.

MODPOST Module.symvers
ERROR: modpost: "_restfpr_20" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
ERROR: modpost: "_restfpr_26" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
ERROR: modpost: "_restfpr_22" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
ERROR: modpost: "_savegpr1_27" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
ERROR: modpost: "_savegpr1_25" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
ERROR: modpost: "_restfpr_28" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
ERROR: modpost: "_savegpr1_29" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
ERROR: modpost: "_savefpr_20" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
ERROR: modpost: "_savefpr_22" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
ERROR: modpost: "_restfpr_15" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
WARNING: modpost: suppressed 56 unresolved symbol warnings because there were too many)

Signed-off-by: René Rebe <rene@exactco.de>
Link: https://patch.msgid.link/20251123.131330.407910684435629198.rene@exactco.de
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

The base code is present and the patch should apply cleanly to any
stable tree that has the PPC64 symbol allowlist in
`ignore_undef_symbol()`, which has been there for many years.

### Summary

- **What it fixes**: Build failure on ppc64 with `-Os` optimization
- **Severity**: Build breakage (prevents kernel compilation in a valid
  configuration)
- **Risk**: Minimal — adds 4 trivial string checks following existing
  patterns
- **Scope**: Tiny, contained to one function
- **Dependencies**: None — standalone fix
- **Stable criteria**: Meets all criteria — obviously correct, fixes a
  real build issue, small and contained, no new features

This is a textbook build fix suitable for stable backporting. It's
small, obviously correct, follows existing patterns, has no risk of
regression, and fixes a real build failure.

**YES**

 scripts/mod/modpost.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 755b842f1f9b7..88ad227f87cd1 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -602,6 +602,10 @@ static int ignore_undef_symbol(struct elf_info *info, const char *symname)
 		/* Special register function linked on all modules during final link of .ko */
 		if (strstarts(symname, "_restgpr0_") ||
 		    strstarts(symname, "_savegpr0_") ||
+		    strstarts(symname, "_restgpr1_") ||
+		    strstarts(symname, "_savegpr1_") ||
+		    strstarts(symname, "_restfpr_") ||
+		    strstarts(symname, "_savefpr_") ||
 		    strstarts(symname, "_restvr_") ||
 		    strstarts(symname, "_savevr_") ||
 		    strcmp(symname, ".TOC.") == 0)
-- 
2.51.0


