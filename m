Return-Path: <linux-kbuild+bounces-13492-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IJoZO7PuHmpjZQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13492-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 16:54:43 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B2562F7FA
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 16:54:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=HrUV6F2z;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13492-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13492-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9CF72306C108
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jun 2026 14:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADF083F4126;
	Tue,  2 Jun 2026 14:43:03 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3504A3F1AA0;
	Tue,  2 Jun 2026 14:43:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780411383; cv=none; b=mXeGUsTo9B6nOzGelC0+3mdlsC5J1B303AbnSUmoZKDomynwwqRbqsVMxu9cmzlbtv/P/Ddk6tClr/1WdLVxv8fJKfDKV63UCIYt/iQ0LLbj58Ogv7k1Wbdqg53HF0GiyWUeWbiEPR5jYNlNmGsU2j5agQjrsFD2CEXeAx3uXf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780411383; c=relaxed/simple;
	bh=6G4vN+GXgnQlcP90g7lh8vWn+j+ruBrObEc+8/RBeag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TEhKaOVBgPmuIJYXsWrSi6kZpNA3ZZyXVoLmg9UVwwHftKgHzMNwdF/SJIkp7Ea5HZvSHyPwdk//gr7Ec4Qo8/efzX7ew20Pqw8kjGOXM8NNAC5kvfmCVoV0mxf26RL69hAjjkeVDEq6E47OPQ1qFybjQltte21W5s+QHyJ0Lfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=HrUV6F2z; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C854176C;
	Tue,  2 Jun 2026 07:42:56 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BC40B3F905;
	Tue,  2 Jun 2026 07:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780411381; bh=6G4vN+GXgnQlcP90g7lh8vWn+j+ruBrObEc+8/RBeag=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HrUV6F2z5WH+h+k2tyNbgT02GyTcdaD3jY08h8E69+2eWQcQrz3FDKRnPNZuhGV2O
	 cbtPCcsrcz+0+O1d+i7bO/ehjTbK3TAJ0iH/kVL4EJCIvrTcqBhzZHur1Knj2W34yj
	 E3+enf/IrUZ+0yIDw92s4Az9aalgqHm3/JWu8NKM=
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 02 Jun 2026 15:40:48 +0100
Subject: [PATCH v7 14/23] tools: iio: Append extra cflags
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-tools_build_fix_zero_init-v7-14-631baf679fe7@arm.com>
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
 linux-perf-users@vger.kernel.org, Leo Yan <leo.yan@arm.com>, 
 Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780411243; l=747;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=6G4vN+GXgnQlcP90g7lh8vWn+j+ruBrObEc+8/RBeag=;
 b=v/YnBl3bdY6JySqyipbpHujVvGvWF3KPhxwDHA9NFUyHPS+XnQp908AdNfIMngMhxCnpEyAJM
 5lb5DgYKhBMCmnc/CjHzzChnUqrybo0BpF6Ce6/iIeH8FSmxWopZYvq
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13492-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_GT_50(0.00)[69];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,huawei.com:email,arm.com:mid,arm.com:dkim,arm.com:from_mime,arm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 85B2562F7FA

Append EXTRA_CFLAGS to CFLAGS so that additional flags can be applied to
the compiler.

Acked-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/iio/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/iio/Makefile b/tools/iio/Makefile
index 3bcce0b7d10f42208765be83dac047faa2e0ceb1..f0428421792d1cbe5ff71b01b67f23eb908fa714 100644
--- a/tools/iio/Makefile
+++ b/tools/iio/Makefile
@@ -13,6 +13,7 @@ endif
 MAKEFLAGS += -r
 
 override CFLAGS += -O2 -Wall -g -D_GNU_SOURCE -I$(OUTPUT)include
+override CFLAGS += $(EXTRA_CFLAGS)
 
 ALL_TARGETS := iio_event_monitor lsiio iio_generic_buffer
 ALL_PROGRAMS := $(patsubst %,$(OUTPUT)%,$(ALL_TARGETS))

-- 
2.34.1


