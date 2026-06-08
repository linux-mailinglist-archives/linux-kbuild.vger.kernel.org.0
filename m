Return-Path: <linux-kbuild+bounces-13652-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id r7nOK2z9JmovpQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13652-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 19:35:40 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3A96594D0
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 19:35:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=debian.org header.s=smtpauto.stravinsky header.b="RG/kvuDr";
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13652-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13652-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=debian.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65BFF3163CEE
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jun 2026 16:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43BD43B27DD;
	Mon,  8 Jun 2026 16:25:00 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E716C347520;
	Mon,  8 Jun 2026 16:24:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780935900; cv=none; b=tU0qlQcVEtN1GKsIE8zhO3MburHJ3RFu5Q/oQCVjAN9ybYYAUCCsRDZzKL4HkyR+0JpUo7ArYL64qc6nkQ5NX4zRv2euSv8qdmi148V9+/i+uyyIbA28wcJtRBCx1eVbuOjToVYhUgOVshSk90bKjHKU4CuN4/9uhuqoUlYFuYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780935900; c=relaxed/simple;
	bh=GAJmxP4sd7IDNVj8KB6wx+kZDzyyYTgMCJYbJ1ejZfo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IGGPRXb3eQ3wDoGVJvT8Az7g3SUz9zzHo793xdYtBzo8xTo3AB871AcFtpnnQxI2QUYwOi34eNp2rA9NiGQ8jwwJU1Vt714QcTCVj9QcDW8JAK0METw62udidUv99iZ4OCZiZ4wZaKyguargZYD6icjhICGen2PQa0m1mvFRu+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=RG/kvuDr; arc=none smtp.client-ip=82.195.75.108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=zAjMFsRUnT2fP/Wt4m2llL1JGbMFnGdrcj1qDgCSIF0=; b=RG/kvuDrKNzWt26IwKgmVEEC6q
	5jY5lVqoqxKLc2SvdaK+NjTd43dkNmga0MAAyt0NfM0yHdoHJudo8JPCwnjiKPnFy48k2whmQhgSH
	s06hy/2ib+VN43ikemublyhdv8GSSd9dSBaXYiQrBmIRl5pIb2EqWIvvc3dY4sM3cak9t0BF+BdTd
	y7hyZRYn2ex9Ksemaoy5mi4ChbfCic1dGGenAC0GAdwjjhL4zTit/dcIF64sunqOTIZdIFK6DXLjX
	l5sY8WRsBpibhbjNiHvuzdtOVp81iAjz6uIrKiOq06XQwty0Wiy9NFLHmuyDXrkeFN+LJkRwQkDw0
	Voz5LNlA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wWcmN-007keV-1Q;
	Mon, 08 Jun 2026 16:24:48 +0000
From: Breno Leitao <leitao@debian.org>
Subject: [PATCH v3 0/6] bootconfig: embed kernel.* cmdline at build time
Date: Mon, 08 Jun 2026 09:23:57 -0700
Message-Id: <20260608-bootconfig_using_tools-v3-0-4ddd079a0696@debian.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ3sJmoC/3XN3QrCIBjG8VuR93iGc9N9HHUfEaFTtzdCQ90oY
 vceqyA66PCBh9//AclGtAl68oBoF0wYPPSkKggMk/KjpWigJ8AZl0ywluoQ8hC8w/E0J/TjKYd
 wSXRwqlGqM1IJBQWBa7QOby/4cHzvNOuzHfKmbY8JUw7x/iov5fb7RHjzL7KUlFEtOyZVK21jx
 N5YjcrvQhxhqyz860gm/jqcMmoq1jlR11q45sdZ1/UJQi/dLRcBAAA=
X-Change-ID: 20260508-bootconfig_using_tools-cfa7aa9d6a5a
To: Masami Hiramatsu <mhiramat@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Nathan Chancellor <nathan@kernel.org>, paulmck@kernel.org, 
 Nicolas Schier <nsc@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, bpf@vger.kernel.org, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3613; i=leitao@debian.org;
 h=from:subject:message-id; bh=GAJmxP4sd7IDNVj8KB6wx+kZDzyyYTgMCJYbJ1ejZfo=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqJuzKcoe7DlPQhfWykfHINtCXeUKnB6sLbrhww
 8KUOoNjbJKJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaibsygAKCRA1o5Of/Hh3
 bVeUD/wKO+JDe8IrW2+ZsFfap0XhL11Mm4/H3VicJxWAKEx4w5HNvxLp6WIu01sdXkskVnkfiKl
 qyyetogInMAB2m9ymQZTSF9HSrGGhBqHlWDRubX8/T7lkTT+wK8bYZyC/dt04Dv8awq52tzPP4D
 xdpycqsFgZ3hQeOjV6DAajZMxgJs8c9rsAn1+ZP7cX94HzuvfDc25pnZp7uyqDIz2CZhszwa+MU
 SOLIE0etIuy9D8NPN945TVvFwE80LX7MqAOPM5Ap6pDJ3nhlUSWC2ijO2bqZolIM7H0S9rOps9O
 9s8sx4GITEw3vG9/HJhQzNeosxFuv1nRe7HWyjLHtULKyZHKq2OKL0+exhSvfgrui97W8O63Pl9
 wSakX1beodPQzrf2dx2UVEHmiNvccxEo4fsMyQn0n8fCimDAnE+PVDnv8L/gL8Jq5J4nuGri34D
 yEeTfcJlpLXN5SOy7NM2jjZa3ZlYUQbzr1BkvW385EJwUk58MGU1DH3vzGPFEikpBbMxysVKs3O
 6uold+bgubwxj/NWDwMIOCO6Qh12ykdtw+qxY9s739TvcjxKWpeA3pYpoaL/6Ge1olsO8OVeinv
 XtQDJKKtEg5zUqxTEhlcA17fXOJGtc8+YMCXOEGJXryrwRa0XR58V2Jn/zX0k/TYNxvxZraRnKq
 MW0jQgRtdx4UIVg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[debian.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[debian.org:s=smtpauto.stravinsky];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mhiramat@kernel.org,m:akpm@linux-foundation.org,m:nathan@kernel.org,m:paulmck@kernel.org,m:nsc@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:bpf@vger.kernel.org,m:leitao@debian.org,m:kernel-team@meta.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[leitao@debian.org,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-13652-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leitao@debian.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[debian.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,kernel.foo:url,msgid.link:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1B3A96594D0

The userspace pieces (xbc_snprint_cmdline() in lib/, tools/bootconfig -C)
already landed; this series wires the rendered cmdline into the kernel.

Motivation: today the embedded bootconfig is parsed at runtime, after
parse_early_param() has already run, so early_param() handlers can't
see embedded values. Folding the kernel.* subtree into the cmdline at
build time gives a CONFIG_CMDLINE-equivalent for embedded-bootconfig
users without forcing them to maintain two cmdline sources.

Behaviorally, the "kernel" subtree is rendered to a flat string at
build time and stashed in .init.rodata. setup_arch() prepends it to
boot_command_line before parse_early_param() runs. Overflow is a soft
error: the helper logs and leaves boot_command_line untouched rather
than panicking, so an oversized embedded bconf cannot brick a boot.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
Changes in v3:
- Patch 3: Move HOSTCC override to the kernel-side rule; tool keeps
  $(CC) for standalone/cross builds.
- Patch 6: Drop the false fail-safe wording; document the
  BOOT_CONFIG_FORCE=y default interaction.
- Link to v2:
  https://lore.kernel.org/r/20260605-bootconfig_using_tools-v2-0-d309f544b5f7@debian.org

Changes in v2 (addressing review of v1):
- Split out a standalone fix for the NULL-pointer arithmetic in
  xbc_snprint_cmdline() so the build-time render cannot trip host
  UBSan/FORTIFY_SOURCE.
- Rework the leaf-root handling: instead of returning early, skip @root
  inside the loop so a root carrying both a value and subkeys
  (kernel = x together with kernel.foo = bar) still renders its
  descendant keys.
- Build tools/bootconfig with $(HOSTCC) so cross-compiled (ARCH=...)
  builds render the cmdline on the build host instead of failing with
  "Exec format error".
- Mark the embedded cmdline section read-only (drop the "w" flag from
  .init.rodata).
- Add a make-clean hook so tools/bootconfig artifacts are removed by
  make clean.
- Gate the x86 prepend on "bootconfig" being present on the command
  line (or CONFIG_BOOT_CONFIG_FORCE), matching the init.* opt-in
  semantics documented in bootconfig.rst and preserving fail-safe
  recovery: dropping "bootconfig" from the bootloader cmdline now also
  disables the embedded kernel.* keys.
- Link to v1: https://patch.msgid.link/20260527-bootconfig_using_tools-v1-0-b6906a86e7d5@debian.org

---
Breno Leitao (6):
      bootconfig: fix NULL-pointer arithmetic in xbc_snprint_cmdline()
      bootconfig: render descendant keys when xbc_snprint_cmdline() root has a value
      bootconfig: render embedded bootconfig as a kernel cmdline at build time
      bootconfig: clean build-time tools/bootconfig from make clean
      bootconfig: add xbc_prepend_embedded_cmdline() helper
      x86/setup: prepend embedded bootconfig cmdline before parse_early_param

 MAINTAINERS                |   1 +
 Makefile                   |  24 +++++++++-
 arch/x86/Kconfig           |   1 +
 arch/x86/kernel/setup.c    |  16 +++++++
 include/linux/bootconfig.h |   9 ++++
 init/Kconfig               |  36 +++++++++++++++
 init/main.c                |  25 ++++++++--
 lib/Makefile               |  16 +++++++
 lib/bootconfig.c           | 112 ++++++++++++++++++++++++++++++++++++++++++---
 lib/embedded-cmdline.S     |  16 +++++++
 tools/bootconfig/Makefile  |   4 +-
 11 files changed, 247 insertions(+), 13 deletions(-)
---
base-commit: e7e28506af98ce4e1059e5ec59334b335c00a246
change-id: 20260508-bootconfig_using_tools-cfa7aa9d6a5a

Best regards,
-- 
Breno Leitao <leitao@debian.org>


