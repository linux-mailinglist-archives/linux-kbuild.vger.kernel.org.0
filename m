Return-Path: <linux-kbuild+bounces-13364-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLfrJRwfF2rw5AcAu9opvQ
	(envelope-from <linux-kbuild+bounces-13364-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 18:43:08 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 925E55E7EE4
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 18:43:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1A21C301906D
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 16:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A871F43CEF7;
	Wed, 27 May 2026 16:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="M+uY+Lnt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDB630FC33;
	Wed, 27 May 2026 16:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779900143; cv=none; b=jMv/k3ZPkSXCu9/ri/lcHCF1WIFDA4f3hEFonOMsE4gPkwSB35aMsN7cwcDxAwTLPjChuXDDBcoqOQepfa4PRkd1xm1Ax33hgNg3twC1hMkoZWk9AVnhvbdT1r2Q4nx5fgTBv6TCZkZwub8yjgoKpphojdIkQiFqklMGUXJ8uL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779900143; c=relaxed/simple;
	bh=zkxhXyottikXIASB/hUTc93O26xnKdgKpEbXjh2K15Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QGE4E06Ra1WgC35PQeT1X5zAMz2ZLFrweENPtKLaGvTFwF9xoDPmym5NOt6QztwOHDmwHF7wMtw2cvb12HfQkBFMjztdynTWO0c1rnAHfnQMNyQPUpzP7MroHphxx+j22mKezB4TVk0dsluuFfA5oTcQ3HWqOix1G43711bOHaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=M+uY+Lnt; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=r9X3i/MQsjWdphpDbkCPYHpgfOslyLkMzTbWCKDOiYM=; b=M+uY+LntFAqwzvPML/mrzPidGW
	bNK0BEzeHac54ePgYbD8KIZUrq7gNJP4JXZXV7yhd7JrS8syBes1haL0/mR9hczHRuIho7YqNvSTf
	MGopu+X1PvMzkdpyEVnue/Qiees6lICO0kgXhV+FaqbNaR3BtraTT4M5lB7UtxhVB0F8glrt/I/ZK
	+w07xSOM3CuS+6FI+1xKNf1a2RbQmMJZcvwdgaonP1kym9pgwLmYYTXUIKUZ8GjRTjnEWHhP+9fQJ
	U29PR403P8CIZtUiwkFUAr0R+93wcGHE/ZyotpMF6mE7Jhs8ppR3y2na5kMOKktcTRuPrk1LMtgHi
	iqSDs8+w==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wSHKM-003JPU-1F;
	Wed, 27 May 2026 16:41:54 +0000
From: Breno Leitao <leitao@debian.org>
Subject: [PATCH 0/4] bootconfig: embed kernel.* cmdline at build time
Date: Wed, 27 May 2026 09:41:33 -0700
Message-Id: <20260527-bootconfig_using_tools-v1-0-b6906a86e7d5@debian.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL0eF2oC/yXMUQrCMAwA0KuEfK9QB5vaq4iMrEtrRBppOhHG7
 i7q5/t5GxpXYcMAG1Z+iYkWDHDoAOONSmYnCwbA3vejH/zJzaotakmSp9Wk5KmpPszFREei8zL
 SQNgBPisnef/iy/VvW+c7x/bdcN8/cFUgYHoAAAA=
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
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=1917; i=leitao@debian.org;
 h=from:subject:message-id; bh=zkxhXyottikXIASB/hUTc93O26xnKdgKpEbXjh2K15Q=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqFx7NjbsgZiqKcKT4KdzKhZSDbQEQ56G6UGRly
 4vo4tuPGgqJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCahcezQAKCRA1o5Of/Hh3
 bWgqEACO/ivyxBbyf61F1jL9lKEiHowLiDZQo1iwq5bK3VrJihYSQwRxGWWuaDQd48JDASObAa7
 z5Daf7EugjNwER3rGQlR9WSO/9dkJ8JTz0iy3cAGvRYRqFgGJUdBJ1ToP4vwOCKZMwip/prYcUW
 5q+HPfspFQ1EOGquhfo0oSmJ7+Z2zycORf5Y2mVng18UG7IMTH9/LTyrMYBXHF0DnQM2c9il4XM
 sUMugaF0ZA9DSw6rRXOxlo3sE07Ca1PLfBtwGgoJvTxf47CDZUrYzbtz/oPiiCz5HBz5HVUi51k
 ZHwM0uZYAWSvVfcdNXGNTu/DWKVTeDGTfeHZqsDHwxR/I6/ToD7mgJ+6+33f1GZEs+z2kgt4CBK
 7PNiZJOJpz5yC7fmvOmVwfAdfi8PKhHGHoB3nVPqO6TSinRKj8coC10Nzpu6aKunrZTZVawZ3E/
 6WtCfXj0wRkD/gClHlfisDXvjN87x/dWdHDmbX976mOWpE6xmuz6LP0mqftwNg3dBRJzpkZ1/Re
 DVJNVEcqBudH0OHDUHWk9jhwqgwghfTiiGS1grN4KPwznj8tvJfpxBEpNHeD36vNR1tIQlxlbxz
 T5BGoXw99Wbx1pCgh9c0nxhHM49qPl0BDeUbthJFPMlijN9+ibqGGeFG4zlN1luzdRaGqHeIYPg
 vpw6/vAkbM2IeJA==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[debian.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[debian.org:s=smtpauto.stravinsky];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13364-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[debian.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leitao@debian.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 925E55E7EE4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
Breno Leitao (4):
      bootconfig: return 0 from xbc_snprint_cmdline() for a leaf root
      bootconfig: render embedded bootconfig as a kernel cmdline at build time
      bootconfig: add xbc_prepend_embedded_cmdline() helper
      x86/setup: prepend embedded bootconfig cmdline before parse_early_param

 Makefile                   |  5 ++++
 arch/x86/Kconfig           |  1 +
 arch/x86/kernel/setup.c    |  3 +++
 include/linux/bootconfig.h |  7 ++++++
 init/Kconfig               | 33 ++++++++++++++++++++++++++
 init/main.c                | 19 ++++++++++++---
 lib/Makefile               | 16 +++++++++++++
 lib/bootconfig.c           | 58 ++++++++++++++++++++++++++++++++++++++++++++++
 lib/embedded-cmdline.S     | 16 +++++++++++++
 tools/bootconfig/Makefile  |  2 +-
 10 files changed, 156 insertions(+), 4 deletions(-)
---
base-commit: e7e28506af98ce4e1059e5ec59334b335c00a246
change-id: 20260508-bootconfig_using_tools-cfa7aa9d6a5a

Best regards,
--  
Breno Leitao <leitao@debian.org>


