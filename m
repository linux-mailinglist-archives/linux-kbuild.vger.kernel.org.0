Return-Path: <linux-kbuild+bounces-11762-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8H+dOFjer2kzdAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11762-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 10:03:20 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F58247D74
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 10:03:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EC5A13064170
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 09:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98B3F43D4F8;
	Tue, 10 Mar 2026 09:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="da5CtbWG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7528F43CEC8;
	Tue, 10 Mar 2026 09:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773133317; cv=none; b=lHyEaMyoQoQ5QTl/R7m5Mdd6RFTlJWQ0wwvLP6qf/oyOMVIZpPQvz3o3miXSeT0OuKdivd6cDr37O0SZor+aHrUYJI3watBEd435SSLftq5wdL8Ig8sCskQNyDg/jB4DEm45ahuTmh/84VSAz6wbT/J7PpKWEn1b57Wb91y86Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773133317; c=relaxed/simple;
	bh=TagrK2ymQW/ToppFCJJ+zxaJARFRAg3xO34jxzDmcUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j+RWWD5PuQaCZI2SUCX2oVLBudYoDimDdTuOgP6oda0r6jOkJMmS9LqDT5CV98eYZsZtj54aa/OcE2Bol4ulzLifbHq4P8NgK9rMMPRGWePukp4JpUbQx3g/SQnXNKmV9ROKo53YLhVNsIuVoag4aaHSt9OQL7oWxwK33Z91H2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=da5CtbWG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29278C2BC86;
	Tue, 10 Mar 2026 09:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773133317;
	bh=TagrK2ymQW/ToppFCJJ+zxaJARFRAg3xO34jxzDmcUk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=da5CtbWGFaZtaNonmxiDOFbb3NkC5/Epga+R4GXv5uPwwI+ZGPOIIBcZQfR7VkliN
	 35KNFbhqgWeFJ1mxkTqrAWiewtTHQ5Ti2UeUVpCCg7Hj77xcDx07yJVbflwk9Vs3OY
	 QreDMPY/JUpz4jfwLCXBGcsIvdKgzXu7YO7xU9t0l+mAijtQ8ZNcE+fNxvQr0eaJXK
	 jmTwTvL8QsirCohumNYIouxI3Yueg/QdJe2D3Ltu0HvcgJatgEKvLmIcuXtAoAa4IX
	 2bWk0+MjbvNTVYLDzCAoCaGNfLBnnRMBZdrIOSrEJYsBI4YM66p1Reno2P2YA2A1Er
	 8nVlNtcSKJAuw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Nicolas Schier <nsc@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.19-6.12] kbuild: install-extmod-build: Package resolve_btfids if necessary
Date: Tue, 10 Mar 2026 05:01:07 -0400
Message-ID: <20260310090145.2709021-7-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260310090145.2709021-1-sashal@kernel.org>
References: <20260310090145.2709021-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19.6
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B2F58247D74
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11762-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,gen-btf.sh:url,msgid.link:url,linutronix.de:email]
X-Rspamd-Action: no action

From: Thomas Weißschuh <thomas.weissschuh@linutronix.de>

[ Upstream commit 459cb3c054c2352bb321648744b620259a716b60 ]

When CONFIG_DEBUG_INFO_BTF_MODULES is enabled and vmlinux is available,
Makefile.modfinal and gen-btf.sh will try to use resolve_btfids on the
module .ko. install-extmod-build currently does not package
resolve_btfids, so that step fails.

Package resolve_btfids if it may be used.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Reviewed-by: Nicolas Schier <nsc@kernel.org>
Link: https://patch.msgid.link/20260226-kbuild-resolve_btfids-v1-1-2bf38b93dfe7@linutronix.de
[nathan: Small commit message tweaks]
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I have a clear picture. Let me verify the `RESOLVE_BTFIDS` variable
definition and confirm it would fail when building external modules
without this tool packaged.

The issue is clear: When `CONFIG_DEBUG_INFO_BTF_MODULES` is enabled,
`Makefile.modfinal` at line 47 calls `$(RESOLVE_BTFIDS)` (defined as
`$(objtree)/tools/bpf/resolve_btfids/resolve_btfids` in the main
Makefile). If someone builds an external module using the installed
headers/build files (packaged by `install-extmod-build`), and the
`resolve_btfids` binary wasn't packaged, the build will fail at that
step.

## Analysis

### What the commit does
This commit adds packaging of the `resolve_btfids` binary when
`CONFIG_DEBUG_INFO_BTF_MODULES` is enabled in the `install-extmod-build`
script. This script creates the minimal build environment needed for
building external (out-of-tree) kernel modules.

### The bug
When `CONFIG_DEBUG_INFO_BTF_MODULES` is enabled and `vmlinux` is
available, `Makefile.modfinal` (line 47) invokes `$(RESOLVE_BTFIDS)` on
module `.ko` files. The `install-extmod-build` script packages
everything needed to build external modules, but it was missing
`resolve_btfids`. This causes external module builds to **fail** with a
missing binary error.

### Is this a real bug fix?
**Yes** — this is a build fix. Without this change, users who install
kernel headers packages (deb-pkg, rpm-pkg) with
`CONFIG_DEBUG_INFO_BTF_MODULES=y` cannot build external modules.
External module building is a core use case for distributions (DKMS,
NVIDIA drivers, VirtualBox, ZFS, etc.).

### Scope and risk
- **3 lines added** — extremely small and contained
- Follows the exact same pattern as the existing `CONFIG_OBJTOOL`
  conditional packaging (lines 31-33)
- No behavioral change to anything else
- Only affects the packaging script, not runtime kernel behavior
- Risk of regression is essentially zero

### Stable tree applicability
- The `install-extmod-build` script exists since v6.6
- The `CONFIG_DEBUG_INFO_BTF_MODULES` and `resolve_btfids` usage in
  `Makefile.modfinal` also exists in older stable trees
- The fix would apply cleanly or with minor adaptation to 6.6.y and
  newer stable trees
- This matches the "build fix" exception category — it prevents
  compilation/build failures

### Concern
The exact form of the script has evolved over time (e.g., v6.6 has
slightly different structure), so backporting to older stable trees may
need minor adjustments, but the logic is the same.

### Verification
- Read `scripts/package/install-extmod-build` — confirmed the fix adds
  `resolve_btfids` packaging with same pattern as `objtool`
- Read `scripts/Makefile.modfinal` lines 41-63 — confirmed that
  `$(RESOLVE_BTFIDS)` is called when `CONFIG_DEBUG_INFO_BTF_MODULES` is
  enabled and `vmlinux` exists
- Checked `Makefile` line 536 — confirmed `RESOLVE_BTFIDS` points to
  `$(objtree)/tools/bpf/resolve_btfids/resolve_btfids`
- `git tag --contains` on the earliest form of `install-extmod-build` —
  confirmed file exists since v6.6
- Checked `v6.6:scripts/package/install-extmod-build` — confirmed the
  script existed with similar structure but without `resolve_btfids`
  packaging
- The commit message clearly states the problem: "install-extmod-build
  currently does not package resolve_btfids, so that step fails"
- Reviewed-by: Nicolas Schier (kbuild expert) confirms the fix is
  correct

This is a clear build fix: small, obvious, low-risk, fixes a real
failure that affects users building external modules with BTF-enabled
kernels. It fits squarely within the stable kernel "build fix" category.

**YES**

 scripts/package/install-extmod-build | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/package/install-extmod-build b/scripts/package/install-extmod-build
index 2576cf7902dbb..f12e1ffe409eb 100755
--- a/scripts/package/install-extmod-build
+++ b/scripts/package/install-extmod-build
@@ -32,6 +32,10 @@ mkdir -p "${destdir}"
 		echo tools/objtool/objtool
 	fi
 
+	if is_enabled CONFIG_DEBUG_INFO_BTF_MODULES; then
+		echo tools/bpf/resolve_btfids/resolve_btfids
+	fi
+
 	echo Module.symvers
 	echo "arch/${SRCARCH}/include/generated"
 	echo include/config/auto.conf
-- 
2.51.0


