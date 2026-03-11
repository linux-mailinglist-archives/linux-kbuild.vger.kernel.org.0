Return-Path: <linux-kbuild+bounces-11829-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBTsOckssWkVrwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11829-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 09:50:17 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AFA25FB6B
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 09:50:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C16E3329B1E
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 08:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39B303BD64E;
	Wed, 11 Mar 2026 08:31:01 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2D6A3BD25F;
	Wed, 11 Mar 2026 08:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773217861; cv=none; b=fP8yRbIBInfv1bWapAAB4sCDuXmh6T34hSgGXLSI/Y2Fd2zZxyEpxFRyuB78YZJPoA46q0Eq5DO6PKYJUnx08L1Fiwvgv5P/27YqAN1da6h9P38acgH9vxSbd3FYtqAhaBkR+4FoYTbF38Pe6BAUKp5phgroE8B1rN/528pOJSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773217861; c=relaxed/simple;
	bh=Zf23jjDdukq6aA1unK78mG7Z1am+W/Xsg0v3ZsXdH74=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HYSNHjX1rzukJGKhUcJ9w34llekTDL8gc3RBXTETizzUtxMlgCE+301yO5N1lj/zQYux9yJw/XoVdnRRpjrwxyxVcmokEGyZBzcoJWGbssCbXDnuhDlpGaQzUW0pEcVLQXrcvw4Z7D+XFubs/o23s+dlPgrBIno49OhJJlopEJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 082E7165C;
	Wed, 11 Mar 2026 01:30:53 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BECFA3F73B;
	Wed, 11 Mar 2026 01:30:51 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 11 Mar 2026 08:29:33 +0000
Subject: [PATCH v4 08/30] tools build: Append -fzero-init-padding-bits=all
 to extra cflags
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-tools_build_fix_zero_init-v4-8-9e35bdb99cb3@arm.com>
References: <20260311-tools_build_fix_zero_init-v4-0-9e35bdb99cb3@arm.com>
In-Reply-To: <20260311-tools_build_fix_zero_init-v4-0-9e35bdb99cb3@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>, 
 James Clark <james.clark@linaro.org>, Kees Cook <kees@kernel.org>, 
 Quentin Monnet <qmo@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, 
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
 Jiri Olsa <jolsa@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 William Breathitt Gray <wbg@kernel.org>, Barry Song <baohua@kernel.org>, 
 Qinxin Xia <xiaqinxin@huawei.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 Kent Gibson <warthog618@gmail.com>, "K. Y. Srinivasan" <kys@microsoft.com>, 
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
 Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Josh Poimboeuf <jpoimboe@kernel.org>, Robert Moore <robert.moore@intel.com>, 
 Len Brown <lenb@kernel.org>, 
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
 Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, 
 Andrea Righi <arighi@nvidia.com>, Changwoo Min <changwoo@igalia.com>, 
 Mark Brown <broonie@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Gabriele Monaco <gmonaco@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, bpf@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773217789; l=2759;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=Zf23jjDdukq6aA1unK78mG7Z1am+W/Xsg0v3ZsXdH74=;
 b=47Zz9toRF5QkF8s+CZ08X4lfjrR0tXvVy/KZikwKgIuQcXAqb663Gd1JQ//EGeZz5CcnHLFEq
 fZQi/hIZrCBBuHduE+qaN+JCKaQamsZngJ5wZ3DRv0A+nyak8i0MdxP
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-Rspamd-Queue-Id: 50AFA25FB6B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-11829-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,google.com,linaro.org,gmail.com,iogearbox.net,linux.dev,fomichev.me,intel.com,arm.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leo.yan@arm.com,linux-kbuild@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_GT_50(0.00)[70];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.943];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,gnu.org:url]
X-Rspamd-Action: no action

GCC-15 release claims [1]:

  {0} initializer in C or C++ for unions no longer guarantees clearing
  of the whole union (except for static storage duration initialization),
  it just initializes the first union member to zero. If initialization
  of the whole union including padding bits is desirable, use {} (valid
  in C23 or C++) or use -fzero-init-padding-bits=unions option to
  restore old GCC behavior.

As a result, this new behaviour might cause unexpected data when we
initialize a union with using the '{ 0 }' initializer.

Since commit dce4aab8441d ("kbuild: Use -fzero-init-padding-bits=all"),
the kernel has enabled -fzero-init-padding-bits=all to zero padding bits
in unions and structures.  This commit applies the same option for tools
building.

The option is not supported by any version older than GCC 15, nor is it
supported by LLVM.  This patch adds the cc-option and host-cc-option
functions to dynamically detect compiler option and append it to the
EXTRA_CFLAGS and HOST_EXTRACFLAGS respectively.

[1] https://gcc.gnu.org/gcc-15/changes.html

Acked-by: Quentin Monnet <qmo@kernel.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/scripts/Makefile.include | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.include
index b5ecf137febcae59f506e107a7f2e2ad72f4bef4..a2397ceae512c1bc54adb15cb1a111ff34e28e43 100644
--- a/tools/scripts/Makefile.include
+++ b/tools/scripts/Makefile.include
@@ -137,6 +137,36 @@ else
 EXTRA_WARNINGS += -Wshadow
 endif
 
+# output directory for tests below
+TMPOUT = .tmp_$$$$
+
+# try-run
+# Usage: option = $(call try-run, $(CC)...-o "$$TMP",option-ok,otherwise)
+# Exit code chooses option. "$$TMP" serves as a temporary file and is
+# automatically cleaned up.
+try-run = $(shell set -e;		\
+	TMP=$(TMPOUT)/tmp;		\
+	trap "rm -rf $(TMPOUT)" EXIT;	\
+	mkdir -p $(TMPOUT);		\
+	if ($(1)) >/dev/null 2>&1;	\
+	then echo "$(2)";		\
+	else echo "$(3)";		\
+	fi)
+
+# cc-option
+# Usage: CFLAGS += $(call cc-option,-march=winchip-c6,-march=i586)
+cc-option = $(call try-run, \
+	$(CC) -Werror $(1) -c -x c /dev/null -o "$$TMP",$(1),$(2))
+
+host-cc-option = $(call try-run, \
+	$(HOSTCC) -Werror $(1) -c -x c /dev/null -o "$$TMP",$(1),$(2))
+
+# Explicitly clear padding bits with the initializer '{ 0 }'
+FLAG_ZERO_INIT := $(call cc-option,-fzero-init-padding-bits=all)
+override EXTRA_CFLAGS += $(FLAG_ZERO_INIT)
+HOST_FLAG_ZERO_INIT := $(call host-cc-option,-fzero-init-padding-bits=all)
+override HOST_EXTRACFLAGS += $(HOST_FLAG_ZERO_INIT)
+
 ifneq ($(findstring $(MAKEFLAGS), w),w)
 PRINT_DIR = --no-print-directory
 else

-- 
2.34.1


