Return-Path: <linux-kbuild+bounces-11774-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJRGHr0HsGlregIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11774-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 12:59:57 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3909224BFC0
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 12:59:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9794B30E32F8
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 11:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8598F384236;
	Tue, 10 Mar 2026 11:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nxEPcMbA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6222D36C580;
	Tue, 10 Mar 2026 11:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773143342; cv=none; b=vEgy1xkj09euyWn45xI2desRKsKoGEA0tVJT6Yku956hIvtdV6R1zD5R29+STQ/3D+KJJOvk9jyMXictzEmS2TqdrRQuuZSWRV3uMfVZb7dvBaOlEEoQyCvHPklYfXlqxY3y+EjYpp4RIJeBLNsY2FjTkfoaAVDYRkp725P+uaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773143342; c=relaxed/simple;
	bh=szOPfSKNmYb03Xy3ZDdouDlpBOIPO8kX5fe7d2upwUg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=H3t++Gmni58SAJ/MFJEw5Bt337AIxfmT2YPpuoz8jOMkYBkhywo3XpohG/7yGvVlf0rrHI1+3grfH5bWSuP0Qqc52S5B1ogSQG33+4tpK+6fIOvmYRq/2dcoT9XVcCLDZrFkvojGIUimrwY75bMgf7uyasIFoa95h1yEzn7qhCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nxEPcMbA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED213C2BC86;
	Tue, 10 Mar 2026 11:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773143342;
	bh=szOPfSKNmYb03Xy3ZDdouDlpBOIPO8kX5fe7d2upwUg=;
	h=From:Date:Subject:To:Cc:From;
	b=nxEPcMbAfvIlEMcH9uvddRQIKTDnRIg6K2oNzDP+OSv7sS5mEEg2QuB6JY1ophvU/
	 Mjr7GFgeUAMOUmsYfRKsH1pLyI6tjfDf7cCcHmpWUTH9XN+4XsdUyTz+6Wzo2Qebqd
	 x4QHCXmoMjWUdwt+K0RxD0KoaG0QrwSQje1dbpk7y/makYZSp3YrR7AjQLpzVf1NJr
	 /e/8V6Jk0V/116nL79VaVVqS7ifVSpgElRBe82iSn0pKRwjH7OI7mdNtCaJM1CKAra
	 UAykBRFdrVEwapgLm7KWARSq9uwA4kQi5wml4GoKtR5Vlgc2HwuiC+5BEr9k4efB9l
	 1e9JYRvNmofzA==
From: Daniel Gomez <da.gomez@kernel.org>
Date: Tue, 10 Mar 2026 12:48:43 +0100
Subject: [PATCH] Documentation/kbuild: fix empty string
 KBUILD_BUILD_TIMESTAMP
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260310-fix-llvm-docs-v1-1-234878874762@samsung.com>
X-B4-Tracking: v=1; b=H4sIABoFsGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0MD3bTMCt2cnLJc3ZT85GJdwzRLw2TD1GRzMwMLJaCegqJUoAKwedG
 xtbUAtYiwOF8AAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3311; i=da.gomez@samsung.com;
 h=from:subject:message-id; bh=4d6UKFUmuCrPcqriyy404JMUfDZrH81H3xhK0ev9HII=;
 b=owEBbQKS/ZANAwAIAUCeo8QfGVH7AcsmYgBpsAUpMI7b7AB75BHtPehCbkCcc8WkRD+91AIaA
 TxMZSH1t7yJAjMEAAEIAB0WIQTvdRrhHw9z4bnGPFNAnqPEHxlR+wUCabAFKQAKCRBAnqPEHxlR
 +ytOD/0UTfNzVV6zPafCiNBW7m+m7WoM4YsCuVOZEQlW6watfbPegDGjXoH9uPlr3FarRnhgXyY
 4bLKfk7Vx0+ecMjBWjf7IDQhjx6br9EJ92/Dd255EgXVwswu6MeOj9x1+eTgeF32qjmcBGG/4zY
 AkbhBL5en7MUv8bCIN0tDKgz8f639cHgtDCpq8qCQR9y10GuPK+lLIvtT//VZv8PyP0MmEuFeFv
 4l7PG8+tNjFXhNQjF855277A8XMBIYiXV8OklisqpH7zZ2AXjp+4yetoacewL5lOwTKcinUkRwr
 sfkG2x9C/PH6b6rAtgEztB+w+UiWnMIHQUm5u6XjA9Q6rIrbsXUrGlU0j/+TvDi4S2dk3m1l5HA
 ydtCqXAmXfWB3ILlMxBbiYCuducKocfSId/kMiweFQuNXgpC/CnIC5g3QWkdW4o/53VF0o6rf4n
 i9Rdrh+lYCpgJRB26EpH7dGXdz+axSqD5Gg3f6k3ca0dJgszBELT+otT3o5JxKm7JtCO299sxVp
 1yAe9QFwIjt8f1/6yRuBzMGtMuQzk6KABIy1+d+Y7ayQ/1nOGddYD1mCLuEqENS84VgbBqn2jBr
 7MP78PevPDR7gfZhVN2WFDfl5huqJtL2oaeJSFGMKPF/RYSfTE2kjCScIeLpHIszJEELv0nPVvL
 zM68UofjmxXGxug==
X-Developer-Key: i=da.gomez@samsung.com; a=openpgp;
 fpr=B2A7A9CFDD03B540FF58B27185F56EA4E9E8138F
X-Rspamd-Queue-Id: 3909224BFC0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11774-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:mid,samsung.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
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


