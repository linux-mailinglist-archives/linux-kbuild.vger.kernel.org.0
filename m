Return-Path: <linux-kbuild+bounces-13588-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iImPMH+8ImrEcwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13588-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Jun 2026 14:09:35 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16936647F6D
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Jun 2026 14:09:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=debian.org header.s=smtpauto.stravinsky header.b=LuHULSTV;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13588-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13588-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=debian.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 176AC3013D45
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Jun 2026 12:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D33C4DA540;
	Fri,  5 Jun 2026 12:04:06 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FF73EEAC5;
	Fri,  5 Jun 2026 12:04:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780661046; cv=none; b=cXuabFTIo3LImt93vVpzLE88w1ef5QNtOEsZEytA7EJrSiMuJRQWfoL5V2bE2sG4RJCs5wtIcm44xCpUMxbEXxzovjm2NPjSpr9qFfgGVq13tihU2GORTj4Kt7Eiw6YiIuvQEMa3RM5Z7ijUGQZanbmXf9Kj6wmlhMhpEAR8c+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780661046; c=relaxed/simple;
	bh=zNBq5qfnFYAvbCg027GE3WpX4eKaKHJQwS6vmyvf7Nw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Kui4cgTuq0IekW72SvQagVcnDXDaQZTW6EptuKncGthUpW6VN54pYE1ZLjJfOkakKclIRr99rIxSA2Os01QpEvlvJIWRuUPKc8GUruD/WYtfp4hSp2LQAdmT2uQp+a6zSMXLKK65paljn2rPCE+89s82VYgMDY/f2wWm/caB8BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=LuHULSTV; arc=none smtp.client-ip=82.195.75.108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=N6wjYUK6tX5wsE4ZIcu4knhKEFFvpwrcmqFzLutFH2k=; b=LuHULSTVqocTtH/+8f4meCaitv
	IxJCxb8MpFPdtBoQT4yqrEhMX/+DqVyTUOrN9C9PuiZdjKEEogw+n7q4DU9W/LJICA3ARvRmaTgy7
	9uvxi5pTEcw+Baq3CiXbG2L31CO4hhOz+CTwA2KnpPRkGN4lcL/HKdBPHHsqQTmWmY5ya/s3a+uZq
	1tHPjlmUiVEUPFYRQrVMwadSFvtfdZtRJGZ+XoteP4n5AhNC4rgFP9gm5nDnFbA+jBRiMEFss68nl
	XPhT3ieqNhfz7eVyKBElTfxNTldeRXa9GLl+J5ljzXuh4zWANz/UinrVp9ETRhdNMq8wL5MRq5k0/
	KLApzEwA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wVTHB-005HBZ-1L;
	Fri, 05 Jun 2026 12:03:50 +0000
From: Breno Leitao <leitao@debian.org>
Subject: [PATCH v2 0/6] bootconfig: embed kernel.* cmdline at build time
Date: Fri, 05 Jun 2026 05:03:31 -0700
Message-Id: <20260605-bootconfig_using_tools-v2-0-d309f544b5f7@debian.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABO7ImoC/3WNSwqDMBQArxLe2pQYMH5WvUcRSWKMr5S8kkRpE
 e9etN12OTDMbJBcRJegYxtEt2JCCtAxWTCwsw7ecRyhYyCFVKISDTdE2VKY0A9LwuCHTPRI3E6
 61rodla40FAye0U34OsO3/stpMXdn81E7jBlTpvg+z2t5eL+JrP9N1pILblQrlG6Uq8fqOjqDO
 lwoeuj3ff8AwmEz5M8AAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3276; i=leitao@debian.org;
 h=from:subject:message-id; bh=zNBq5qfnFYAvbCg027GE3WpX4eKaKHJQwS6vmyvf7Nw=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqIrsfYVVvC7He9znDRL8GgAMj2QJ4Nv84Lhl2o
 iGR+/rS8H2JAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaiK7HwAKCRA1o5Of/Hh3
 bSdZD/9z76yve+cFujXPVqw5DEhWvYdJOI7CnqEgpGi+ntYxkv4oWA/GHQgK/mR8fZXEtk/PbUt
 OTxDHnLwc9ugJPCMn2fQ5Vz95DHlbH2QhJjDPDet4oVnvzih3/5zoJvmDGnSlnZOzstK2yo/Gow
 6bfzhLrmcWgtkqeigqV46wGvHfZ3EnQ+lK7UMhjg5AQqR/ZeAHnDVTOVIv8qLGq2qmXLOB3iijr
 9Y8jxOadOtC0Rp1387nwaLTTN+UnYGzYYoAGVe82XeufyUYq0sgfIXHXuTLcrCRu8y+nEQiPIlR
 6vM53+xS1Q+kkspW2xb/EHyLZWHELAXUuUW0Zsv0J/aQ92pAPLaiqVzGG9j0uLPmGbrl3Qllxya
 JqhVQ/O7T10RHtszFMi6402SgRUcDYNKnhZs9Cjcw6oiLa9TbGvKsWqgsLpEjL+Flfxj7SkzHvi
 xYLBLpwaDn0G9wB3V2o/LY1ctyXCbko/HaOl7xVthBbWQbL1UaexTXwCvxEKBjbIJkmeR/2QRnR
 EURaWeqnBXtZW1SICkTuy4mNwkUSQ7j6Um2v97BD0MyVzhtgoJL8XxW++0usul7EmLl/GublC9E
 4udjEa3wDQmB0HhKQEiOMO35jFUS6U37caLF8ye30dg+kvvxa4LACOfpr/932+fa3N02EJKp9aJ
 Z7A+cAaIkkwQY9Q==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[debian.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[debian.org:s=smtpauto.stravinsky];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13588-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[leitao@debian.org,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mhiramat@kernel.org,m:akpm@linux-foundation.org,m:nathan@kernel.org,m:paulmck@kernel.org,m:nsc@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:bpf@vger.kernel.org,m:leitao@debian.org,m:kernel-team@meta.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[debian.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leitao@debian.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 16936647F6D

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
 Makefile                   |  18 +++++++-
 arch/x86/Kconfig           |   1 +
 arch/x86/kernel/setup.c    |  16 +++++++
 include/linux/bootconfig.h |   9 ++++
 init/Kconfig               |  33 +++++++++++++
 init/main.c                |  18 ++++++--
 lib/Makefile               |  16 +++++++
 lib/bootconfig.c           | 112 ++++++++++++++++++++++++++++++++++++++++++---
 lib/embedded-cmdline.S     |  16 +++++++
 tools/bootconfig/Makefile  |  10 ++--
 11 files changed, 236 insertions(+), 14 deletions(-)
---
base-commit: e7e28506af98ce4e1059e5ec59334b335c00a246
change-id: 20260508-bootconfig_using_tools-cfa7aa9d6a5a

Best regards,
-- 
Breno Leitao <leitao@debian.org>


