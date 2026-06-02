Return-Path: <linux-kbuild+bounces-13483-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id toEUIWDuHmpEZQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13483-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 16:53:20 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C4C62F7BA
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 16:53:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=b8viuyep;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13483-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13483-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F416233F83B4
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jun 2026 14:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6CE83B6348;
	Tue,  2 Jun 2026 14:41:40 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56A3F3E8C6F;
	Tue,  2 Jun 2026 14:41:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780411300; cv=none; b=EB5jV6KyCXo2PgCtoyOSOmkHmJXN5zFWWY2mSKcIpf68OP9hBFUF4hnmu5afjGokij4J2WAjlJkusxdmdvrHymeTCP2cMVrhCt3KJrY1eKvw1tyo6FU6zXEA+XLeL6hW4MsiHiEwqYItqPS3PnYBxRPaz2/huJbDYWBBP/q7sls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780411300; c=relaxed/simple;
	bh=m4kJKzvaPDAO9fJFcqnRUG2SiPoHRPidnsJMAsbS3kg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l4dBaLYEsGkcMlGZ37owFqrMVC1WdTnHpAojjLctTZ8qFC+ur60Anv99h+vSvvipd8zgX7xRzhKotqq4uVizw/hFYIpGKBFgy18jYlSt9fYfOZ0qgd6TUdq4fxX9GQahFBZYHJ+mQKHaMjeDYlObhIv70aqrpW6OM/qwxElzAh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=b8viuyep; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E95F8357C;
	Tue,  2 Jun 2026 07:41:33 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 024F63F632;
	Tue,  2 Jun 2026 07:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780411298; bh=m4kJKzvaPDAO9fJFcqnRUG2SiPoHRPidnsJMAsbS3kg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=b8viuyep91HbSLzl2aYLgzeWooZouO2Az0IT9yAJEZWDx1+y+xxPZ7ejjfYnISnp/
	 M5V9cTKkfB3yVP1CARs2WHJbWB4/PGH07vpzX/fAifc5H97b8nwqTPLE6EhvSAOFF0
	 H/mJs02700noUWirlb/76i/BTN7V+k1ir9/YMCYk=
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 02 Jun 2026 15:40:39 +0100
Subject: [PATCH v7 05/23] selftests/nolibc: Use a dedicated cross cc-option
 helper
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-tools_build_fix_zero_init-v7-5-631baf679fe7@arm.com>
References: <20260602-tools_build_fix_zero_init-v7-0-631baf679fe7@arm.com>
In-Reply-To: <20260602-tools_build_fix_zero_init-v7-0-631baf679fe7@arm.com>
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
 linux-perf-users@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780411243; l=2684;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=m4kJKzvaPDAO9fJFcqnRUG2SiPoHRPidnsJMAsbS3kg=;
 b=ibk/8HXq1ZUzks3LTe1UOTFfd1yOC7Itai8hvwEGAt68NGwEseUNk8Ld2QThJVZmBsbZU7h2i
 7Upy6TbRu0wBl2JdMRwJ8rcIHegvdxZwQOEtf6QZmFCvsYPZzmAlY8P
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13483-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:acme@kernel.org,m:irogers@google.com,m:namhyung@kernel.org,m:james.clark@linaro.org,m:kees@kernel.org,m:qmo@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:martin.lau@linux.dev,m:eddyz87@gmail.com,m:song@kernel.org,m:yonghong.song@linux.dev,m:john.fastabend@gmail.com,m:kpsingh@kernel.org,m:sdf@fomichev.me,m:haoluo@google.com,m:jolsa@kernel.org,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:peterz@infradead.org,m:mingo@redhat.com,m:mark.rutland@arm.com,m:alexander.shishkin@linux.intel.com,m:adrian.hunter@intel.com,m:mhiramat@kernel.org,m:wbg@kernel.org,m:baohua@kernel.org,m:xiaqinxin@huawei.com,m:brgl@kernel.org,m:warthog618@gmail.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:jic23@kernel.org,m:dlechner@b
 aylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:akpm@linux-foundation.org,m:w@1wt.eu,m:linux@weissschuh.net,m:jpoimboe@kernel.org,m:robert.moore@intel.com,m:lenb@kernel.org,m:srinivas.pandruvada@linux.intel.com,m:tj@kernel.org,m:void@manifault.com,m:arighi@nvidia.com,m:changwoo@igalia.com,m:broonie@kernel.org,m:rostedt@goodmis.org,m:gmonaco@redhat.com,m:shuah@kernel.org,m:jikos@kernel.org,m:bentiss@kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-perf-users@vger.kernel.org,m:leo.yan@arm.com,m:nickdesaulniers@gmail.com,m:johnfastabend@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,google.com,linaro.org,gmail.com,iogearbox.net,linux.dev,fomichev.me,intel.com,arm.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[arm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[leo.yan@arm.com,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leo.yan@arm.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[68];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:mid,arm.com:dkim,arm.com:from_mime,arm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C5C4C62F7BA

Makefile.nolibc uses cc-option for architecture-specific flag probes
such as -m32, -mmultiple and -mabi=elfv2. These probes need to include
CLANG_CROSS_FLAGS so that Clang tests the option for the selected target
instead of the host.

The file also includes tools/scripts/Makefile.include. In a sequential
change, Makefile.include will define its own cc-option helper.

Rename the nolibc helper to cross-cc-option and use it for the
architecture-specific probes that require CLANG_CROSS_FLAGS. This keeps
the cross-build checks explicit and avoids clashing with the common
tools cc-option helper.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/testing/selftests/nolibc/Makefile.nolibc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/nolibc/Makefile.nolibc b/tools/testing/selftests/nolibc/Makefile.nolibc
index f30bc68470cceec2b61805af0a4a9f2fb2de7c57..e88b1c15445f3c64dd78cc7edef5c9670a389b50 100644
--- a/tools/testing/selftests/nolibc/Makefile.nolibc
+++ b/tools/testing/selftests/nolibc/Makefile.nolibc
@@ -23,7 +23,7 @@ include $(srctree)/scripts/subarch.include
 ARCH = $(SUBARCH)
 endif
 
-cc-option = $(call __cc-option, $(CC),$(CLANG_CROSS_FLAGS),$(1),$(2))
+cross-cc-option = $(call __cc-option, $(CC),$(CLANG_CROSS_FLAGS),$(1),$(2))
 
 # XARCH extends the kernel's ARCH with a few variants of the same
 # architecture that only differ by the configuration, the toolchain
@@ -211,13 +211,13 @@ else
 Q=@
 endif
 
-CFLAGS_i386 = $(call cc-option,-m32)
+CFLAGS_i386 = $(call cross-cc-option,-m32)
 CFLAGS_x32 = -mx32
 CFLAGS_arm = -marm
 CFLAGS_armthumb = -mthumb -march=armv6t2
-CFLAGS_ppc = -m32 -mbig-endian -mno-vsx $(call cc-option,-mmultiple)
-CFLAGS_ppc64 = -m64 -mbig-endian -mno-vsx $(call cc-option,-mmultiple)
-CFLAGS_ppc64le = -m64 -mlittle-endian -mno-vsx $(call cc-option,-mabi=elfv2)
+CFLAGS_ppc = -m32 -mbig-endian -mno-vsx $(call cross-cc-option,-mmultiple)
+CFLAGS_ppc64 = -m64 -mbig-endian -mno-vsx $(call cross-cc-option,-mmultiple)
+CFLAGS_ppc64le = -m64 -mlittle-endian -mno-vsx $(call cross-cc-option,-mabi=elfv2)
 CFLAGS_s390x = -m64
 CFLAGS_mips32le = -EL -mabi=32 -fPIC
 CFLAGS_mips32be = -EB -mabi=32
@@ -226,7 +226,7 @@ CFLAGS_mipsn32be = -EB -mabi=n32 -march=mips64r6
 CFLAGS_mips64le = -EL -mabi=64 -march=mips64r6
 CFLAGS_mips64be = -EB -mabi=64 -march=mips64r2
 CFLAGS_loongarch = $(if $(LLVM),-fuse-ld=lld)
-CFLAGS_sparc32 = $(call cc-option,-m32) -mcpu=v8
+CFLAGS_sparc32 = $(call cross-cc-option,-m32) -mcpu=v8
 CFLAGS_sh4 = -ml -m4
 ifeq ($(origin XARCH),command line)
 CFLAGS_XARCH = $(CFLAGS_$(XARCH))

-- 
2.34.1


