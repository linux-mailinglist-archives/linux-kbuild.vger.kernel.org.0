Return-Path: <linux-kbuild+bounces-13890-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id d6q8DqZ1PmrlGQkAu9opvQ
	(envelope-from <linux-kbuild+bounces-13890-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jun 2026 14:50:46 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0B76CD272
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jun 2026 14:50:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=debian.org header.s=smtpauto.stravinsky header.b=ZObGbtHR;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13890-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13890-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=debian.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A0A1F3011795
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jun 2026 12:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38E1D3EFFB4;
	Fri, 26 Jun 2026 12:50:37 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9133B585C;
	Fri, 26 Jun 2026 12:50:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782478237; cv=none; b=cD0Tqpm/4rHSPwW+QeVN0IEM0iztcv+JGglMPZF+qIw6UWVKjkudBnFGv1i3kBaKsV6nLGbsvPbP9eplF1ee/dZY2z1zDVCnSXBlwg1TOfe7B0SpfKlJAvHXXXOOq6cSlt/uVDP3E35gzUOJZCF3qHufenbB+g8qda5XoRmZh+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782478237; c=relaxed/simple;
	bh=Y3E6Rd7fiFy7UxkzVEG4z9yZiAJLFESwNShbnpzDDIQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RgkwD/zzNZVZoIxbh+1UdCpYL3lju92zXrzvOglKzRBN6RSl3MfQHbHs4dxkMMP8mcQI6EOPX1hBZvPX8Et8KD6mg8LHKCkyi5MbC0bHBDFZP1FOpbGg/vQrRE4gzMGPnRQJXyHoPMcq0hYa7cQEgoTNrbRWfgmt6aTnBu2Fbkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=ZObGbtHR; arc=none smtp.client-ip=82.195.75.108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=YPMw7idwHYQh9hfFGkdrNz8/B+okT4m9RaLfTg0djp0=; b=ZObGbtHR9W1kYscqG1uHPh2Mvp
	KSx7QMrd50ZxATjpKjHUh+CmXgWdV59wkRExurC8TKqH/8LWWZbC/vCxQpyouGyFhnyxrLTLyVjfp
	7YZOskT0KWngEHiMFpdkqcIrpwXSbbJg76miO6OjMqVhxgZOaJ9M/Srr8Vxi21xD6Dbk+x1Vlnnos
	Q6fN9vnA7eA5GE6YKZIYX9hELetqHaHWWcDM9p3NcG4CxHDRU7fGncm51Q9nyAp1wO/BB1PWuxRxU
	wtF1N1RGNyYZv5cycvy4cSnUCyzC2GEhoDw1BBGZJ60ZphedmaHlD5JPeMQGjoNvOzWYI4B7LG37I
	yx7I1BRQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wd60n-003yko-0w;
	Fri, 26 Jun 2026 12:50:26 +0000
From: Breno Leitao <leitao@debian.org>
Subject: [PATCH v7 0/9] bootconfig: embed kernel.* cmdline at build time
Date: Fri, 26 Jun 2026 05:50:09 -0700
Message-Id: <20260626-bootconfig_using_tools-v7-0-24ab72139c29@debian.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIJ1PmoC/3XQ22rDMAwG4FcJvq6G6oMc52rvMUZxfEg9RjziN
 GyUvPtIN1hG8KXg5/sl3VkJUwqFdc2dTWFJJeWRdY0+Ncxd7TgESJ51DePICRW20Oc8uzzGNFx
 uJY3DZc75vYCLVltrPFll2alhH1OI6fMBv7z+zOXWvwU3b9qWuKYy5+nr0byct9xvCde1kuUMC
 D0ZJNtS0F49+9AnOz7laWBby8L/HEJVdTggeIEmKil7FfXBEXunevQiAEF671Ebi2To4Mi9Y6q
 OBAQtnCQRUVhz3EftnHP9PwoQoletscY5FcTBoZ3DRdUhQCCJjkfVaivcP2dd129lD1MENwIAA
 A==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6119; i=leitao@debian.org;
 h=from:subject:message-id; bh=Y3E6Rd7fiFy7UxkzVEG4z9yZiAJLFESwNShbnpzDDIQ=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqPnWLlPdf+7kVg76KT7MbdGfMa/cTrDgMt99so
 87xJRUfn3mJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaj51iwAKCRA1o5Of/Hh3
 bTAGD/9RiLQeD/dTeF8ImCIPNmwmqgVkoKku0m7l9amKYS+NsszKW35l+9fFnN5epwnQV0E1aTS
 LZq3y77az3ve3u+H4ewqvmUDT91EAihfaTrVabF6vAgMYEwzN9YOfXaQkGIslSIOHdLO+X+0pqr
 9nfRs/QeS3pIFjsvtQHbP5Vb/EhajDu24K/41MVcKjJrniWJhFxEZdUvLAs8e3HD1SQ0LASixtv
 nPEVDY5QFFyDdlU9w9Yd9LL2Gb2hGioeWhSbx8GS0cZL3RNo44tDTP2Zol1rKjJWIbw9smXyMYG
 EVW1dP0s7muGmq8R1DaYrHhp9D0jmBjYkQQZgb7NOo1BKac7RLYtJVPjnlKpOBfT/odRy4Hchrm
 NRvT20IFT3DLB4h1/5pUNMMkYOu84sVhCdOxved0Gy+VUTm58c+pR6ltxG1bn4155syLUTJu5J7
 UVNjQRBymW6PHTQu9xeBlmzFhCXEMJXuwOPkXtZCWfUF3kH1Phz3PMi7hjj8PHOa6xGBtNkZ00I
 6DYeJZCSX5/lSazazxM14yZbfrmXMKcCmy3ocQQMU/Mz9RM4MF4/8XpKsMlc5cYqy2+oAh3l0HL
 vI/4//iFRGH8w/9ggu+WdtB0IDX08eXOAgTdUfnRwqwC9vNIfDnkTWkgMU4FqV8FGkQvaXHDCOH
 U/+anXKfjZ2aAaQ==
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
	TAGGED_FROM(0.00)[bounces-13890-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: 9F0B76CD272

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
Changes in v7:
- The runtime opt-in now shares one helper instead of open-coding its
  own. (Masami)
- bootconfig_cmdline_requested() moved into generic lib code (Masami)
- Link to v6: https://lore.kernel.org/r/20260623-bootconfig_using_tools-v6-0-640c2f587a3c@debian.org

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
Breno Leitao (9):
      bootconfig: fix NULL-pointer arithmetic in xbc_snprint_cmdline()
      bootconfig: render descendant keys when xbc_snprint_cmdline() root has a value
      bootconfig: render embedded bootconfig as a kernel cmdline at build time
      bootconfig: clean build-time tools/bootconfig from make clean
      bootconfig: add xbc_prepend_embedded_cmdline() helper
      Documentation: bootconfig: document build-time cmdline rendering
      x86/setup: prepend embedded bootconfig cmdline before parse_early_param
      bootconfig: skip runtime kernel.* render once prepended early
      init/main.c: use bootconfig_cmdline_requested() for the runtime opt-in

 Documentation/admin-guide/bootconfig.rst |  81 ++++++++++++++++
 MAINTAINERS                              |   1 +
 Makefile                                 |  27 +++++-
 arch/x86/Kconfig                         |   1 +
 arch/x86/kernel/setup.c                  |  14 ++-
 include/linux/bootconfig.h               |  14 +++
 init/Kconfig                             |  36 +++++++
 init/main.c                              |  52 +++++-----
 lib/Makefile                             |  16 +++
 lib/bootconfig.c                         | 162 +++++++++++++++++++++++++++++--
 lib/embedded-cmdline.S                   |  16 +++
 tools/bootconfig/Makefile                |   4 +-
 12 files changed, 388 insertions(+), 36 deletions(-)
---
base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
change-id: 20260508-bootconfig_using_tools-cfa7aa9d6a5a

Best regards,
-- 
Breno Leitao <leitao@debian.org>


