Return-Path: <linux-kbuild+bounces-13861-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id M39cJHSxOmo1EAgAu9opvQ
	(envelope-from <linux-kbuild+bounces-13861-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Jun 2026 18:16:52 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FDC6B8A2A
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Jun 2026 18:16:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=debian.org header.s=smtpauto.stravinsky header.b=qkN+pW9J;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13861-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13861-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=debian.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C0584302810E
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Jun 2026 16:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23EE2306757;
	Tue, 23 Jun 2026 16:16:48 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BA1233928;
	Tue, 23 Jun 2026 16:16:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782231408; cv=none; b=lAn1vTR4eZ2LA/ceEt+MO+ZNjlL1fI3V7sidl56qg16Dwdkbk2gpHxld+PbtuWsNaGkTsdOyZJzl3+1SUK9rDZQ8PNbE4ZYHgIqq+SzSNiFhMgqmo3rzauqtq2x20dl3RFcZJS5yAXj48bmwWliLFL5oPqFdvttHJre87wD+0tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782231408; c=relaxed/simple;
	bh=T4tgISafCkgnXGGafK2/GxnOwikrUfen6KvUGLLld4o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GkUjehIN+jYg4It4yO1bN+Jwaeabp1JYaAgTN9GKdJSod0wXnsrP7JIKLOOR+3TTCFa6aYQ27eMLZtVihdwZilsyiLWTO53+qg87LeSDWJ24KXmd+SpJj7r99f9Xziph7rPxk5o2XNte42YK0aNT8jRhaJ3dSXpR2QTi+yTCGoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=qkN+pW9J; arc=none smtp.client-ip=82.195.75.108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=yilEp3Sna9L6YuGzTAKOxiWEdKXDTL13E/uTiXZb7tE=; b=qkN+pW9JB+817CdybLNZYyCnil
	L53OBAPqABn6fJRnGzl0B9AZknnJqXzSwy+3tKjWDP9XqSd817pdJ1Acdj1MEMtGvxTW1jdGxs1aC
	THJUZ7DDseD9zfyGrh8WGEWoMjamRayt/AH1Jqtf5OstNKyyvUsCN4aJqa0bLMcmZyW1bHF+h2PXK
	hDcEb+jho5ZMHSijANKmVawhS2ye0n8/Q7Ej/MrshzbltSGvcKdNP04X/Edp4xTpf10FRaAhND00d
	fK5Bla1GD8cau340Z9CvXWlVtUb3W80SBQNYuGK9v+kx+h3jc1Igw1XH+r3FQjCGE3eW7YmNhgObp
	3La27nLA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wc3nZ-001m2B-1C;
	Tue, 23 Jun 2026 16:16:30 +0000
From: Breno Leitao <leitao@debian.org>
Subject: [PATCH v6 0/8] bootconfig: embed kernel.* cmdline at build time
Date: Tue, 23 Jun 2026 09:15:27 -0700
Message-Id: <20260623-bootconfig_using_tools-v6-0-640c2f587a3c@debian.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB+xOmoC/3XQ22rDMAwG4FcJvq6GEp/iXO09xiiKD6nHsEech
 paSdx/pBssIuRT8fL+kByt+jL6wrnqw0c+xxJxYV6lTxeyF0uAhOtZVrMFGocQW+pwnm1OIw/l
 aYhrOU86fBWwgTWScIknsVLGv0Yd4e8Jv7z9zufYf3k6rtiYusUx5vD+b53rN/ZY0+qhkrgGhV
 wYVtcprJ1+d7yOllzwObG2Zmz9HoTx0GkBwHE2QQvQy6J3Dt87h0TMHBOGcQ20IlVE7R2wdc+g
 IQNDcCsUDcjL7feTGqY//IwEhONkaMtZKz/85y7J8A7coaZXvAQAA
X-Change-ID: 20260508-bootconfig_using_tools-cfa7aa9d6a5a
To: Masami Hiramatsu <mhiramat@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Nathan Chancellor <nathan@kernel.org>, paulmck@kernel.org, 
 Nicolas Schier <nsc@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev, 
 linux-doc@vger.kernel.org, Breno Leitao <leitao@debian.org>, 
 kernel-team@meta.com, Nicolas Schier <n.schier@fritz.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5783; i=leitao@debian.org;
 h=from:subject:message-id; bh=T4tgISafCkgnXGGafK2/GxnOwikrUfen6KvUGLLld4o=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqOrFWINW7Sao7G2xfmZVOJWTTR7k3WVLv7rztJ
 XxCNgIZSyyJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCajqxVgAKCRA1o5Of/Hh3
 bQVBD/kBsO4csaQ8D2a71trTPdKcZ5hIe0VQWDneI8T/aQE/apy4IshD+bCUgGWyQJEqGzIWtRg
 23YsQv++uQuKTYOlA8ekxF9xm0LZfUmLGp4ejcZAWfqKZ2rKgKuU9DqGMXoMjZqta24rkM9rAWC
 ETBe8GAjo0EQnMy2+kE/txJhwfK+q5E7slCqtZvn89csajFk23slc1YGLbdnqDUDjRrZRNSVSpQ
 HDaG4QCVNR2T1ePoGMXrrT4/cetaB4w+enkJfOzUuCX/WjW+3bBTqWWUAU87d6Cv+y5EaRzobwW
 3QrxSdpFP5NmvSiw91nognP0f4D10jiJ6KwN407zxdMFBSR9sBHXN47OrO7OO440tWPlH/iYrbX
 lRDfhix50B13VAkyM3NRzbgoLVrJ+0kmqDN6SJs9ZM6FpxppFGwUxnlthP+xFolkH7uwB4ohrwV
 dAgyr5CZqICCoYq0XQaOdggjd2GEnJhh6B/1YioEBQyFRMiyWdG12AnaHCZm3HS8tGdVtprrGyV
 AJ88wowgZ61ijM1cd/eomq3k11g7UecZKz+NbpvPrCv2rQZMDMIRXFjcSN0M55lzYT2KbZPRMTe
 Y8emcH7KI9+MYGQFWaJI8d/gb6sYEaEyeM7y5TB8/g0UF71cJmtdqhQz27FNnyRMjq0/uCFP+fU
 HsBuDSjILukw3Og==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[debian.org,none];
	R_DKIM_ALLOW(-0.20)[debian.org:s=smtpauto.stravinsky];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13861-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mhiramat@kernel.org,m:akpm@linux-foundation.org,m:nathan@kernel.org,m:paulmck@kernel.org,m:nsc@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:bpf@vger.kernel.org,m:llvm@lists.linux.dev,m:linux-doc@vger.kernel.org,m:leitao@debian.org,m:kernel-team@meta.com,m:n.schier@fritz.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux-foundation.org,gmail.com,google.com,lwn.net,linuxfoundation.org];
	FORGED_SENDER(0.00)[leitao@debian.org,linux-kbuild@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leitao@debian.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[debian.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,msgid.link:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F2FDC6B8A2A

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
Changes in v6:
- renamed CONFIG_BOOT_CONFIG_EMBED_CMDLINE to
  CONFIG_CMDLINE_FROM_BOOTCONFIG
- prepend embedded bootconfig cmdline before parse_early_param
- Link to v5: https://lore.kernel.org/r/20260617-bootconfig_using_tools-v5-0-fd589a9cc5e3@debian.org

Changes in v5:
- Patch 3 (Kconfig): drop the redundant "depends on BOOT_CONFIG_EMBED"
  from CMDLINE_FROM_BOOTCONFIG; Julian Braha.
- Patch 6 (Documentation): spell out how the embedded cmdline interacts
  with the bootloader cmdline, an initrd bootconfig, and the embedded
  bootconfig
- Link to v4: https://lore.kernel.org/r/20260609-bootconfig_using_tools-v4-0-73c463f03a97@debian.org

Changes in v4:
- Patch 3 (build pipeline): clear CROSS_COMPILE= in the kernel-side
  tools/bootconfig sub-make. Without it, an LLVM=1 cross build
  inherits CROSS_COMPILE and tools/scripts/Makefile.include injects
  --target=/--sysroot= into the host clang, producing a target
  binary that fails to exec.
- Patch 3 (build pipeline): place embedded-cmdline.S in its own
  .init.rodata.embed_cmdline subsection ("a") so ld.lld does not
  see a section-type mismatch against lib/bootconfig-data.S's
  writable .init.rodata ("aw"). The linker's *(.init.rodata
  .init.rodata.*) glob still folds it into the init image.
- Patch 6 (x86/setup): also accept the bootconfig=<anything> form
  via cmdline_find_option(), matching the runtime parse_args() loop.
  Without it, bootconfig=0/=off would skip the early prepend but
  still trigger the late runtime apply -- a split-brain state.
- New patch 7: document CONFIG_CMDLINE_FROM_BOOTCONFIG in
  Documentation/admin-guide/bootconfig.rst (semantics, opt-in,
  precedence, overflow behavior, example).
- Link to v3: https://lore.kernel.org/r/20260608-bootconfig_using_tools-v3-0-4ddd079a0696@debian.org

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
Breno Leitao (8):
      bootconfig: fix NULL-pointer arithmetic in xbc_snprint_cmdline()
      bootconfig: render descendant keys when xbc_snprint_cmdline() root has a value
      bootconfig: render embedded bootconfig as a kernel cmdline at build time
      bootconfig: clean build-time tools/bootconfig from make clean
      bootconfig: add xbc_prepend_embedded_cmdline() helper
      Documentation: bootconfig: document build-time cmdline rendering
      bootconfig: skip runtime kernel.* render once prepended early
      x86/setup: prepend embedded bootconfig cmdline before parse_early_param

 Documentation/admin-guide/bootconfig.rst |  81 ++++++++++++++++++++++
 MAINTAINERS                              |   1 +
 Makefile                                 |  27 +++++++-
 arch/x86/Kconfig                         |   1 +
 arch/x86/kernel/setup.c                  |  43 ++++++++++++
 include/linux/bootconfig.h               |   9 +++
 init/Kconfig                             |  36 ++++++++++
 init/main.c                              |  25 ++++++-
 lib/Makefile                             |  16 +++++
 lib/bootconfig.c                         | 112 +++++++++++++++++++++++++++++--
 lib/embedded-cmdline.S                   |  16 +++++
 tools/bootconfig/Makefile                |   4 +-
 12 files changed, 358 insertions(+), 13 deletions(-)
---
base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
change-id: 20260508-bootconfig_using_tools-cfa7aa9d6a5a

Best regards,
-- 
Breno Leitao <leitao@debian.org>


