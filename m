Return-Path: <linux-kbuild+bounces-12182-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEdWGnpwwWkQTQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12182-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 17:55:22 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DCD2F91A1
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 17:55:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 866BB34A19CB
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 15:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F9583BD62F;
	Mon, 23 Mar 2026 15:14:51 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98A6D3B47E6;
	Mon, 23 Mar 2026 15:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774278891; cv=none; b=peQFuSykKr+7GJgmuK4hi+A/1wMkQIB8Lfjv0j4Jwyqzvj4PIqDNkzTjmlm5uCP3UQ3IcY/bNgXp+sfBnIoCuNNHduJxKlPKEbepMMx1u6oyO8VrOBTW7BLtZeGr6wzIbrwc6SmyxywVljIsumfsJHupxUfYAqbNyrA7y6/n7W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774278891; c=relaxed/simple;
	bh=k31Kk/i0K4ZvTRnARLSwM6pAc2QmOSVp+PsTzUqEpMA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VNNvEDmOF1SH9gXUmFGA1mLXBKuFa8Q4jrx2vr/YXOSYL6BPkYgZStZCUWLbX/TMP4s5Q7sKkRsD62Y9eScyBaHWvBmD2HEOpcYRD8715KSXQQ+fIk6XiICzzlhE6jV8hZuH23X0rC1bVZ/FeFUIYhoatsbsGBskrz7yZhmIoEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5A20169E;
	Mon, 23 Mar 2026 08:14:41 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 89E163F694;
	Mon, 23 Mar 2026 08:14:40 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 23 Mar 2026 15:13:29 +0000
Subject: [PATCH v6 08/24] tools: bootconfig: Append extra cflags
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-tools_build_fix_zero_init-v6-8-235858c51af9@arm.com>
References: <20260323-tools_build_fix_zero_init-v6-0-235858c51af9@arm.com>
In-Reply-To: <20260323-tools_build_fix_zero_init-v6-0-235858c51af9@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774278819; l=793;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=k31Kk/i0K4ZvTRnARLSwM6pAc2QmOSVp+PsTzUqEpMA=;
 b=Qxb4b3llxk7sNKxlk/t16DkoxFOqQI3hmIGKJxRiyaB6Nnn+vNZnmeXLXu1rvK+gRy/hUhEiE
 1mOZH/W4Ei0BSMCg7EG2P/pMrIcJ2Eg2XuQdCvq8uOBxG0Qftser+uT
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,google.com,linaro.org,gmail.com,iogearbox.net,linux.dev,fomichev.me,intel.com,arm.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org];
	TAGGED_FROM(0.00)[bounces-12182-lists,linux-kbuild=lfdr.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leo.yan@arm.com,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_GT_50(0.00)[68];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: E9DCD2F91A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Append EXTRA_CFLAGS to CFLAGS so that additional flags can be applied to
the compiler.

Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/bootconfig/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/bootconfig/Makefile b/tools/bootconfig/Makefile
index 90eb47c9d8de67b0ccc74a8de0af3a7e0b97feeb..4490df707585acf356153b78cb87760f622a6190 100644
--- a/tools/bootconfig/Makefile
+++ b/tools/bootconfig/Makefile
@@ -11,6 +11,7 @@ endif
 
 LIBSRC = $(srctree)/lib/bootconfig.c $(srctree)/include/linux/bootconfig.h
 override CFLAGS += -Wall -g -I$(CURDIR)/include
+override CFLAGS += $(EXTRA_CFLAGS)
 
 ALL_TARGETS := bootconfig
 ALL_PROGRAMS := $(patsubst %,$(OUTPUT)%,$(ALL_TARGETS))

-- 
2.34.1


