Return-Path: <linux-kbuild+bounces-12042-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJBZHQVvumnRWQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12042-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Mar 2026 10:23:17 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 424752B8EC2
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Mar 2026 10:23:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 70DAD304EEF2
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Mar 2026 09:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 296AA3A6EFA;
	Wed, 18 Mar 2026 09:19:04 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63DB73A4F36;
	Wed, 18 Mar 2026 09:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773825544; cv=none; b=aHs3ThAA2sgzzVSICdnbF6zD6Jj18JCTmqui5JuVi1MaqZWzwunAVV2UGwU9M7KJA5xxI1gu5EH/C2pinu3E1oEDm4WNh3oCmJT1qasyZptHBapNQo7sQ22Ybmq0N9xzs3EbW1OAE6e5OdEI63T7ZStiDgqsyhAZawZ/E/hbsYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773825544; c=relaxed/simple;
	bh=u0baSWrAsWfZfQ+02tVwtELldH7JfFDkqdw4XEPinVI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aSuc3cdyoE2+a38AMzJyNFbljbTWgN2M597y2O8zO05np8cBbXiK8bwm1hUrkWye2l0bX9mKua/8aKfTJFmqckvC/y4O4Lw8EW2syftUQ5/v9f0yhJ0xUp2cVkYoo+s8VWui+/nglQahbwHkcZGm7a3JTMBSsti5URazW0/5mNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B01881E7D;
	Wed, 18 Mar 2026 02:18:55 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D0AEF3F73B;
	Wed, 18 Mar 2026 02:18:52 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 18 Mar 2026 09:16:56 +0000
Subject: [PATCH v5 12/26] tools: dma: Append extra cflags
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-tools_build_fix_zero_init-v5-12-bbeffd8da199@arm.com>
References: <20260318-tools_build_fix_zero_init-v5-0-bbeffd8da199@arm.com>
In-Reply-To: <20260318-tools_build_fix_zero_init-v5-0-bbeffd8da199@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773825421; l=709;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=u0baSWrAsWfZfQ+02tVwtELldH7JfFDkqdw4XEPinVI=;
 b=xsZ5QV5oh8mB0NBzXrp2Dr2eT8uqv4jfsPX9u8sdRK51VNBWsjg1lRTIeZuZw2+osqWghvlV8
 OIFSuKcVW/iDVD5z0PQj6FK0NpmRZu1LI4qVghfCWTVEgIWhri47kT0
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-12042-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	NEURAL_HAM(-0.00)[-0.973];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,arm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,huawei.com:email]
X-Rspamd-Queue-Id: 424752B8EC2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Append EXTRA_CFLAGS to CFLAGS so that additional flags can be applied to
the compiler.

Acked-by: Qinxin Xia <xiaqinxin@huawei.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/dma/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/dma/Makefile b/tools/dma/Makefile
index e4abf37bf020ca613b6dca340299198cb887126a..86d3d2e361110b664b885c0e9423660a2d5e8221 100644
--- a/tools/dma/Makefile
+++ b/tools/dma/Makefile
@@ -17,6 +17,7 @@ endif
 MAKEFLAGS += -r
 
 override CFLAGS += -O2 -Wall -g -D_GNU_SOURCE -I$(OUTPUT)include
+override CFLAGS += $(EXTRA_CFLAGS)
 
 ALL_TARGETS := dma_map_benchmark
 ALL_PROGRAMS := $(patsubst %,$(OUTPUT)%,$(ALL_TARGETS))

-- 
2.34.1


