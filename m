Return-Path: <linux-kbuild+bounces-11775-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJcpGEAGsGlregIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11775-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 12:53:36 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0044024BBA0
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 12:53:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 80D81303AA95
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 11:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6BB33644B3;
	Tue, 10 Mar 2026 11:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YhmI2pYI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCCB389DF0;
	Tue, 10 Mar 2026 11:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773143448; cv=none; b=rOieYG+6FWSf8F9/6Hy2+u39cLuiT/pcFZU+fpVCX5U0AXnP22DcTHBqix37sNUNcgZfNye25k4gYKtqwdcls7P4R4i3yFT+17/wr+asiyaRhyL4hPQiaLHdt63wgsyyA5F8zhpUiyczPsFbDM4KpqPISkVPgSn5DJXQRkcN6Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773143448; c=relaxed/simple;
	bh=rkBx+y3DCrBvqT+9OS2bCaB+okZjtbl0U6cBxknMQg8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TKelXEdDuSJcksTSSZU14hIvjg8cWCQk/hMo6i93DDfcBcogBAV+HfqTdFhYgfWtTVEYBa9LfzJxF6KNYGnqCnCI5LP6FYDxPJGzNuQDLeyNu93i7m4ajkDdHYTTrOZ7OI4LAZCCJ9bt6sIgh+PktFd8vU55+BZhZs9jM+TGQ1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YhmI2pYI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEC59C2BC9E;
	Tue, 10 Mar 2026 11:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773143447;
	bh=rkBx+y3DCrBvqT+9OS2bCaB+okZjtbl0U6cBxknMQg8=;
	h=From:Date:Subject:To:Cc:From;
	b=YhmI2pYIOQdGl5Il9FVR+Sli0AECmdZMdYyCTmqcfGEc5c6cOyDOQjR5LVqjzNQDa
	 Jg+J9RKTp2fGDnxtNeYnRjTTpsfJRIlZQlL74nisnx/RyOJ1BATsj/6LujzLJC1j71
	 DL5gdOI98iIre6yNbyGkrTfTk9a6FdPXD0TKW1ckbfppkOWJa319SUK4nnQpB51QsH
	 C0T4O4eJFJXJEKzKmePpDq6ox8bEP/dMf/1GaoBlVoLPrlfgX0TjAHHzFdKgECGlDP
	 c6w3SQtKXgQS8B/hFBa5WS0wYRdgs4eAVWyUClG4opsLI2fJP+ZO9WCjrWOb1lxzR9
	 mE9rztf1OrcXA==
From: Daniel Gomez <da.gomez@kernel.org>
Date: Tue, 10 Mar 2026 12:50:40 +0100
Subject: [PATCH v2] Documentation/kbuild: fix empty string
 KBUILD_BUILD_TIMESTAMP
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260310-fix-llvm-docs-v2-1-5e52173aabc7@samsung.com>
X-B4-Tracking: v=1; b=H4sIAI8FsGkC/3WMQQ7CIBBFr9LM2jEMbQq68h6mi4bSlqSAYZRoG
 u4udu/y/fz3dmCbnGW4Njskmx27GCrIUwNmHcNi0U2VQQrZi5YEzu6N25Y9TtEw0nwhQ9aoXmi
 oziPZejh696Hy6vgZ0+fIZ/qt/0qZkFC2nVZaq0718saj51dYziZ6GEopX/ai24SsAAAA
X-Change-ID: 20260310-fix-llvm-docs-1f91c1ec7608
To: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Alex Shi <alexs@kernel.org>, 
 Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Daniel Gomez <da.gomez@samsung.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3535; i=da.gomez@samsung.com;
 h=from:subject:message-id; bh=Now83fr/MP7zB3NxSTXc4S7AUV8dbchz0FScPQXarn0=;
 b=owEBbQKS/ZANAwAIAUCeo8QfGVH7AcsmYgBpsAWT735KRs6Ynl7QBvP+l2vLFq3J5JuTxcXUy
 A5xoqSH41WJAjMEAAEIAB0WIQTvdRrhHw9z4bnGPFNAnqPEHxlR+wUCabAFkwAKCRBAnqPEHxlR
 +9+ED/4i4lJ6+bbDZGtO4O7U1SGpSWb7KZ3yxnGtDIGVlb9G+vGzAyBqV85h5fuZnqGbw+Snpjj
 UR8xrvEP+oAFeSjfvNr9F/cjzgQAgxPiH+yPCrTHX70yaETTmiwB8BEochZK8rI0Xagt+v2qBop
 Q3uy4YvHTLgbib9F32xJ9U4Y6/EI9IVhF6MVyHGI8uj8sRXEHtYKI7k/GOIwqfK3nWnu3VYeMEJ
 +o40KvvD0ynm7SDeqeM7UCigjda8/xKsFO+MnPnWVlHIyZSk2k7zgtpb8RQxQucuXReoSi0ep3F
 zTGwbMhNaXeLeUZZwDicnsMpVeTijLRKHf8wT/lehtEfzwhJbazAKmPE6YHKMGXk/GIT2OH7BI6
 2Dxmqmg00Kt4aTSdBO3drU6+1aQYVrWJcdgNeJVpHfWn7vhEdkpuoTUZ8oNgDyh4L6zwv3GVD8r
 PfYenoD3Lf6YW3S+L7jW/nPQjlq3CS0vYY8LKGgRbk496BzwU7GVWIStb31Q9eVnSonpGcBjXVT
 IgY8EK03Lawycw1fUzN7PEgnRrhYaV/gRMRlh1nXnei8PP00RGfyC1BrfHtvw/s5Fb1BkPmJC04
 cr7io4N7nGqGDMN4JcLvpWCQxI3drMVoHVhqsiMiVOQi9nEEyq1HCRIdNV/NMLUgAnK8IFm9gFX
 2HJwx7pu7zbOrkg==
X-Developer-Key: i=da.gomez@samsung.com; a=openpgp;
 fpr=B2A7A9CFDD03B540FF58B27185F56EA4E9E8138F
X-Rspamd-Queue-Id: 0044024BBA0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11775-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,google.com,lwn.net,linuxfoundation.org,linux.dev,hust.edu.cn];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[da.gomez@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: Daniel Gomez <da.gomez@samsung.com>

The ccache example in llvm.rst uses KBUILD_BUILD_TIMESTAMP='' but the
text says "should be set to a deterministic value". An empty string is
not deterministic because init/Makefile uses $(or) which treats empty
as false and falls through to $(shell LC_ALL=C date), embedding the
current time:

	cat /tmp/test-or.mk
	build-timestamp-auto = fallback
	build-timestamp = $(or $(KBUILD_BUILD_TIMESTAMP),$(build-timestamp-auto))
	all:
	        @echo "[$(build-timestamp)]"

	make --file=/tmp/test-or.mk
	[fallback]

	KBUILD_BUILD_TIMESTAMP='' make --file=/tmp/test-or.mk
	[fallback]

	KBUILD_BUILD_TIMESTAMP="Sun Aug 25 20:57:08 UTC 1991" \
		make --file=/tmp/test-or.mk
	[Sun Aug 25 20:57:08 UTC 1991]

The same applies to a real kernel build:

	make O=../build LLVM=1 CC="ccache clang" tinyconfig
	make O=../build LLVM=1 CC="ccache clang" \
		KBUILD_BUILD_TIMESTAMP='' --jobs=$(nproc)
	cat ../build/include/generated/utsversion.h
	#define UTS_VERSION "#2 Wed Mar  4 12:13:43 CET 2026"

Replace the empty string with an actual date, matching the pattern
in kbuild.rst and reproducible-builds.rst. Use the first public Linux
announcement as example date.

	make O=../build LLVM=1 CC="ccache clang" tinyconfig
	make O=../build LLVM=1 CC="ccache clang" \
		KBUILD_BUILD_TIMESTAMP="Sun Aug 25 20:57:08 UTC 1991" \
		--jobs=$(nproc)
	cat ../build/include/generated/utsversion.h
	#define UTS_VERSION "#4 Sun Aug 25 20:57:08 UTC 1991"

Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
---
Do not use an empty KBUILD_BUILD_TIMESTAMP Makefile variable.
---
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://lore.kernel.org/r/20260310-fix-llvm-docs-v1-1-234878874762@samsung.com
---
 Documentation/kbuild/llvm.rst                    | 2 +-
 Documentation/translations/zh_CN/kbuild/llvm.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
index bc8a283bc44b..ef46533d785f 100644
--- a/Documentation/kbuild/llvm.rst
+++ b/Documentation/kbuild/llvm.rst
@@ -128,7 +128,7 @@ Ccache
 KBUILD_BUILD_TIMESTAMP_ should be set to a deterministic value between builds
 in order to avoid 100% cache misses, see Reproducible_builds_ for more info)::
 
-	KBUILD_BUILD_TIMESTAMP='' make LLVM=1 CC="ccache clang"
+	KBUILD_BUILD_TIMESTAMP="Sun Aug 25 20:57:08 UTC 1991" make LLVM=1 CC="ccache clang"
 
 .. _KBUILD_BUILD_TIMESTAMP: kbuild.html#kbuild-build-timestamp
 .. _Reproducible_builds: reproducible-builds.html#timestamps
diff --git a/Documentation/translations/zh_CN/kbuild/llvm.rst b/Documentation/translations/zh_CN/kbuild/llvm.rst
index f87e0181d8e7..c68fd395f64c 100644
--- a/Documentation/translations/zh_CN/kbuild/llvm.rst
+++ b/Documentation/translations/zh_CN/kbuild/llvm.rst
@@ -116,7 +116,7 @@ Ccache
 KBUILD_BUILD_TIMESTAMP_ 应设置为同一确定值，以避免 100% 的缓存未命中，
 详见 Reproducible_builds_ 获取更多信息）::
 
-	KBUILD_BUILD_TIMESTAMP='' make LLVM=1 CC="ccache clang"
+	KBUILD_BUILD_TIMESTAMP="Sun Aug 25 20:57:08 UTC 1991" make LLVM=1 CC="ccache clang"
 
 .. _KBUILD_BUILD_TIMESTAMP: kbuild.html#kbuild-build-timestamp
 .. _Reproducible_builds: reproducible-builds.html#timestamps

---
base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
change-id: 20260310-fix-llvm-docs-1f91c1ec7608

Best regards,
--  
Daniel Gomez <da.gomez@samsung.com>


