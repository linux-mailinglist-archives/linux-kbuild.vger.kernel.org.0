Return-Path: <linux-kbuild+bounces-12291-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHePFmKjxWlUAQUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12291-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 22:21:38 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EAC33BC47
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 22:21:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AA3773010B82
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 21:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DECEF3A6F0C;
	Thu, 26 Mar 2026 21:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Le4ocxKa"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6A5346E43
	for <linux-kbuild@vger.kernel.org>; Thu, 26 Mar 2026 21:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774560095; cv=none; b=FXP9ju7112K4Nu0+8QCyjyufzRnYFYlPXt1cWvKjXSsss6ML//9ZH52cqMUlp70Nj7YfJQUBG2b8i2uLsQgV5HyQu1hoWdoHL/ljFafLqwy9N61LM5ct1HlLeWVVncBtL6Mtn6Gp0qACcZvYr1rAnUwe1l7GIkTBsMTkS8SWyKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774560095; c=relaxed/simple;
	bh=bNpRj84rrM86rZbfxqGsulk194sj2YCQCbqiinFXn0k=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=dX5jW6c8oCCFyYSylVAnDyrbRv8vWJ/GpPbkOTC7agcshfCVpP8XGRBlNnXH4FjGx+0D3pbTR3kfROk3l6g6zsv+4RhNmW5Hq9QGX932VAH/a1GBmvMCM+sOkMb7G9u5MfsXhDNOYp54KdGFXQcRWHlMZ5oeuPXXirFok7sxAUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Le4ocxKa; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-487018c8244so12364975e9.3
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Mar 2026 14:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774560093; x=1775164893; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1JDEAfTveFPPp/Cvp9vb5cLHHVQOeJ1kP6lbtNESx5U=;
        b=Le4ocxKai1ampYgMBGWZxspAF7HBZcon9mxYRtoO1rnFV7y63tzYecLZiyxgtj1gPi
         71+GStzMHfO2wtexvEGNK5lmNzlf2rdhGJJsQ4GAItRCLrnwvU5PmsG+CE7hak3SyYhM
         Edx8V7GoJQZztBS9uMaNyYaXHXVi3lQ1mG5kGOQBBv/nIjUgFTu3f0LI+vGwYD2pkgMt
         eF6Oc/SZLPY4SCmf7/rYW9Sw+eksBfg4NzwM9Kt+yLBKkMwyH/h4ReDzUW2yyJHdLO0A
         yFnhFdxWe/BK1MVxXqSDHWyZcIBezZSJF8rl59G51apKv4t6WdEJ5pP+ZvX1V+VVTmTx
         yERQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774560093; x=1775164893;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1JDEAfTveFPPp/Cvp9vb5cLHHVQOeJ1kP6lbtNESx5U=;
        b=P2MVdAsWASgkRjOpaqOTc/DBokE91AnUYMPftcsKUlpGHekp33stXoGGihBFSW2bNh
         MOqDf5Fv5tZyMebFqKlbzwjFMcYQU0eQPZvCQTRZfwD+bFF+lR4HdQpB/NvwU4XwU4+E
         yrvXvZEYD0PDE4/NGohceQK+IM2ICPnZsQMEWsGl/4aicOpTc9SAf2Pf+TjAw7lhNjut
         B3aS+u+p/cCiaFe8irx8a/P21N+2UwPMyAqH2FT3RfcO73/t0l1eVgm/K/XjjsfIZVIi
         CAJ4kt60Kw8XY8QQ1SLCxeWZZ2XlkHAmwfyA6Ic4Tif/9U6xG0ReatqqAJOlrN0DGcen
         qFkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUekQSbuNdNg7ES6PmCjYnHO3rxxTnyaLPE6gkREhR20ThST4OBDPyVBKRQxxKqfvIHvqotQQFWEntpRtA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyABy8aSbNFl1Gj2p11vAY9oOp0MY6d7aEv6IifjL+7P8KadAht
	f3VBBoIf9QKXt/BjIc4Te6a9I2bVSRII+x0jxkZUAGeNZX4I4m3y062RFkQM4p3V+Ik/8FDjmxs
	xIGIbUsG8WTkEXVmKpQ==
X-Received: from wmfx22.prod.google.com ([2002:a05:600c:2d16:b0:486:fd53:605d])
 (user=sidnayyar job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b03:b0:483:8062:b2f with SMTP id 5b1f17b1804b1-48727ef16aemr3148245e9.6.1774560092608;
 Thu, 26 Mar 2026 14:21:32 -0700 (PDT)
Date: Thu, 26 Mar 2026 21:21:28 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFijxWkC/23MQQ7CIBRF0a00fywGKVDiyH2YDoB+KLEWAw3RN
 Oxd7NjhfXk5O2RMATNcux0SlpBDXFuIUwd21qtHEqbWwCiTtKeCPNyifd60IeKiqUKHE+Mc2v+ V0IX3Yd3H1nPIW0yfgy78t/5TCieUSD1I45RRvR1uPka/4NnGJ4y11i/v+hXqowAAAA==
X-Change-Id: 20260305-kflagstab-51a08efed244
X-Mailer: b4 0.14.3
Message-ID: <20260326-kflagstab-v5-0-455cd723dddf@google.com>
Subject: [PATCH v5 0/7] scalable symbol flags with __kflagstab
From: Siddharth Nayyar <sidnayyar@google.com>
To: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-doc@vger.kernel.org, Siddharth Nayyar <sidnayyar@google.com>, gprocida@google.com
Content-Type: text/plain; charset="utf-8"
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12291-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sidnayyar@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D4EAC33BC47
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch series implements a mechanism for scalable exported symbol
flags using a separate section called __kflagstab. The series introduces
__kflagstab support, removes *_gpl sections in favor of a GPL flag,
simplifies symbol resolution during module loading.

The __kflagstab contains an 8-bit bitset which can represent up to 8
boolean flags per symbol exported in the __ksymtab. The patch series
also uses this bitset to store GPL-only flag values for kernel symbols,
thereby eliminating the need for *_gpl sections for representing GPL
only symbols.

Petr Pavlu ran a small test to get a better understanding of the
different section sizes resulting from this patch series.  He used
v6.17-rc6 together with the openSUSE x86_64 config [1], which is fairly
large. The resulting vmlinux.bin (no debuginfo) had an on-disk size of
58 MiB, and included 5937 + 6589 (GPL-only) exported symbols.

The following table summarizes his measurements and calculations
regarding the sizes of all sections related to exported symbols:

                      |  HAVE_ARCH_PREL32_RELOCATIONS  | !HAVE_ARCH_PREL32_RELOCATIONS
 Section              | Base [B] | Ext. [B] | Sep. [B] | Base [B] | Ext. [B] | Sep. [B]
----------------------------------------------------------------------------------------
 __ksymtab            |    71244 |   200416 |   150312 |   142488 |   400832 |   300624
 __ksymtab_gpl        |    79068 |       NA |       NA |   158136 |       NA |       NA
 __kcrctab            |    23748 |    50104 |    50104 |    23748 |    50104 |    50104
 __kcrctab_gpl        |    26356 |       NA |       NA |    26356 |       NA |       NA
 __ksymtab_strings    |   253628 |   253628 |   253628 |   253628 |   253628 |   253628
 __kflagstab          |       NA |       NA |    12526 |       NA |       NA |    12526
----------------------------------------------------------------------------------------
 Total                |   454044 |   504148 |   466570 |   604356 |   704564 |   616882
 Increase to base [%] |       NA |     11.0 |      2.8 |       NA |     16.6 |      2.1

The column "HAVE_ARCH_PREL32_RELOCATIONS -> Base" contains themeasured
numbers. The rest of the values are calculated. The "Ext." column
represents an alternative approach of extending __ksymtab to include a
bitset of symbol flags, and the "Sep." column represents the approach of
having a separate __kflagstab. With HAVE_ARCH_PREL32_RELOCATIONS, each
kernel_symbol is 12 B in size and is extended to 16 B. With
!HAVE_ARCH_PREL32_RELOCATIONS, it is 24 B, extended to 32 B. Note that
this does not include the metadata needed to relocate __ksymtab*, which
is freed after the initial processing.

The base export data in this case totals 0.43 MiB. About 50% is used for
storing the names of exported symbols.

Adding __kflagstab as a separate section has a negligible impact, as
expected. When extending __ksymtab (kernel_symbol) instead, the worst
case with !HAVE_ARCH_PREL32_RELOCATIONS increases the export data size
by 16.6%. Note that the larger increase in size for the latter approach
is due to 4-byte alignment of kernel_symbol data structure, instead of
1-byte alignment for the flags bitset in __kflagstab in the former
approach.

Based on the above, it was concluded that introducing __kflagstab makes
senses, as the added complexity is minimal over extending kernel_symbol,
and there is overall simplification of symbol finding logic in the
module loader.

Thank you Petr Pavlu for doing a section size analysis as well as Sami
Tolvanen, Petr Pavlu and Jonathan Corbet for their valuable feedback.

---
Changes from v4:
- squashed patches #4 and #5 to fix a bisecting issue

v4:
https://lore.kernel.org/r/20260305-kflagstab-v4-0-6a76bf8b83c7@google.com

Changes from v3:
- made commit messages more descriptive

v3:
https://lore.kernel.org/20251103161954.1351784-1-sidnayyar@google.com/

Changes from v2:
- dropped symbol import protection to spin off into its own series

v2:
https://lore.kernel.org/20251013153918.2206045-1-sidnayyar@google.com/

Changes from v1:
- added a check to ensure __kflagstab is present
- added warnings for the obsolete *_gpl sections
- moved protected symbol check before ref_module() call
- moved protected symbol check failure warning to issue detection point

v1:
https://lore.kernel.org/20250829105418.3053274-1-sidnayyar@google.com/

[1] https://github.com/openSUSE/kernel-source/blob/307f149d9100a0e229eb94cbb997ae61187995c3/config/x86_64/default

Signed-off-by: Siddharth Nayyar <sidnayyar@google.com>
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

---
Siddharth Nayyar (7):
      module: define ksym_flags enumeration to represent kernel symbol flags
      module: add kflagstab section to vmlinux and modules
      module: populate kflagstab in modpost
      module: use kflagstab instead of *_gpl sections
      module: deprecate usage of *_gpl sections in module loader
      module: remove *_gpl sections from vmlinux and modules
      documentation: remove references to *_gpl sections

 Documentation/kbuild/modules.rst  |  11 +++--
 include/asm-generic/vmlinux.lds.h |  21 +++-----
 include/linux/export-internal.h   |  28 +++++++----
 include/linux/module.h            |   4 +-
 include/linux/module_symbol.h     |   5 ++
 kernel/module/internal.h          |   4 +-
 kernel/module/main.c              | 101 ++++++++++++++++++--------------------
 scripts/mod/modpost.c             |  16 ++++--
 scripts/module.lds.S              |   3 +-
 9 files changed, 98 insertions(+), 95 deletions(-)
---
base-commit: 0138af2472dfdef0d56fc4697416eaa0ff2589bd
change-id: 20260305-kflagstab-51a08efed244

Best regards,
-- 
Siddharth Nayyar <sidnayyar@google.com>


