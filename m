Return-Path: <linux-kbuild+bounces-12013-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DT3Km00uWnpugEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12013-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2026 12:01:01 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7232A8659
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2026 12:00:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4113A30067B9
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2026 11:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42F5D38F624;
	Tue, 17 Mar 2026 11:00:54 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBA593264F3;
	Tue, 17 Mar 2026 11:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773745254; cv=none; b=WLQxecTCBiXhJCPu8j2TBP+RqWd6WXxKOQmtpuWVlf4SQl2gtZ55g8QxYDmcuehBSy9gbpGC3ueqSzJ4RfPJbW09wY2wbnUuM0NBlDv4GwNVF+FufgQ/jSplvietoy0IYQ9FGGuq/CZUwx6tqIVYITqTmlsfphT05ne55ciKLqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773745254; c=relaxed/simple;
	bh=BR9kW5ZjiDDsV4GsKjKcwmYxCRLsI3jocIzjmmAqAm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OU2xUoGlvqIADhogkkDeA91eV4aawYTmUJ7FR30dQFjzwZnHW/8ieOikrlHEO8J5tb+GhAm5NJW+DSsdVbjDhY4xSark9cBTi+Wj0d/tYm3XyCziQ0UjIMIoIfeveQYj86MeRbQ2mUwcp7CzOpi9PM8txtHkxF3XmdVN1vC7zj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4ABDF16F2;
	Tue, 17 Mar 2026 04:00:45 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 180843F7BD;
	Tue, 17 Mar 2026 04:00:51 -0700 (PDT)
Date: Tue, 17 Mar 2026 11:00:49 +0000
From: Leo Yan <leo.yan@arm.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>,
	James Clark <james.clark@linaro.org>, Kees Cook <kees@kernel.org>,
	Quentin Monnet <qmo@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	William Breathitt Gray <wbg@kernel.org>,
	Barry Song <baohua@kernel.org>, Qinxin Xia <xiaqinxin@huawei.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Kent Gibson <warthog618@gmail.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>, Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Robert Moore <robert.moore@intel.com>, Len Brown <lenb@kernel.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>, Mark Brown <broonie@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Gabriele Monaco <gmonaco@redhat.com>, Shuah Khan <shuah@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, bpf@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH v4 29/30] selftests/nolibc: Append extra cflags
Message-ID: <20260317110049.GJ8048@e132581.arm.com>
References: <20260311-tools_build_fix_zero_init-v4-0-9e35bdb99cb3@arm.com>
 <20260311-tools_build_fix_zero_init-v4-29-9e35bdb99cb3@arm.com>
 <aacd52ed-4ef6-49f1-90a4-0affeea908e6@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aacd52ed-4ef6-49f1-90a4-0affeea908e6@t-8ch.de>
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,linaro.org,gmail.com,iogearbox.net,linux.dev,fomichev.me,intel.com,arm.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,manifault.com,nvidia.com,igalia.com,goodmis.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-12013-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leo.yan@arm.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[69];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.729];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,arm.com:email,e132581.arm.com:mid]
X-Rspamd-Queue-Id: EC7232A8659
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 11:27:41PM +0100, Thomas Weißschuh wrote:
> On 2026-03-11 08:29:54+0000, Leo Yan wrote:
> > Include tools/scripts/Makefile.include, which may provide additional
> > flags in EXTRA_CFLAGS, and append to CFLAGS.
> > 
> > Since Makefile.include already defines cc-option, remove the redundant
> > definition and include.
> > 
> > Signed-off-by: Leo Yan <leo.yan@arm.com>
> > ---
> >  tools/testing/selftests/nolibc/Makefile | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> > 
> > diff --git a/tools/testing/selftests/nolibc/Makefile b/tools/testing/selftests/nolibc/Makefile
> > index 0370489d938b540721a4fb814ebb68c463760e73..d1a9c1d5988bdc6a8778ef418aaa4c5ac1d26a10 100644
> > --- a/tools/testing/selftests/nolibc/Makefile
> > +++ b/tools/testing/selftests/nolibc/Makefile
> > @@ -3,15 +3,13 @@
> >  TEST_GEN_PROGS := nolibc-test libc-test
> >  
> >  include ../lib.mk
> > -include $(top_srcdir)/scripts/Makefile.compiler
> > -
> > -cc-option = $(call __cc-option, $(CC),,$(1),$(2))
> > +include $(top_srcdir)/tools/scripts/Makefile.include
> >  
> >  include Makefile.include
> >  
> >  $(OUTPUT)/nolibc-test: CFLAGS = -nostdlib -nostdinc -static \
> >  	 -isystem $(top_srcdir)/tools/include/nolibc -isystem $(top_srcdir)/usr/include \
> > -	 $(CFLAGS_NOLIBC_TEST)
> > +	 $(CFLAGS_NOLIBC_TEST) $(EXTRA_CFLAGS)
> >  $(OUTPUT)/nolibc-test: LDLIBS = $(if $(LLVM),,-lgcc)
> >  $(OUTPUT)/nolibc-test: nolibc-test.c nolibc-test-linkage.c | headers
> 
> The rule for "libc-test", which uses the standard $(LINK.c) to invoke
> the compiler, does not respect $(EXTRA_CFLAGS) automatically.
> Is this intentional?

Thanks for the review. Is the change below OK with you? I can update it
before sending a new series.

diff --git a/tools/testing/selftests/nolibc/Makefile b/tools/testing/selftests/nolibc/Makefile
index 0370489d938b..7b65e6f9840b 100644
--- a/tools/testing/selftests/nolibc/Makefile
+++ b/tools/testing/selftests/nolibc/Makefile
@@ -3,18 +3,17 @@
 TEST_GEN_PROGS := nolibc-test libc-test

 include ../lib.mk
-include $(top_srcdir)/scripts/Makefile.compiler
-
-cc-option = $(call __cc-option, $(CC),,$(1),$(2))
+include $(top_srcdir)/tools/scripts/Makefile.include

 include Makefile.include

 $(OUTPUT)/nolibc-test: CFLAGS = -nostdlib -nostdinc -static \
         -isystem $(top_srcdir)/tools/include/nolibc -isystem $(top_srcdir)/usr/include \
-        $(CFLAGS_NOLIBC_TEST)
+        $(CFLAGS_NOLIBC_TEST) $(EXTRA_CFLAGS)
 $(OUTPUT)/nolibc-test: LDLIBS = $(if $(LLVM),,-lgcc)
 $(OUTPUT)/nolibc-test: nolibc-test.c nolibc-test-linkage.c | headers

+$(OUTPUT)/libc-test: CFLAGS += $(EXTRA_CFLAGS)
 $(OUTPUT)/libc-test: nolibc-test.c nolibc-test-linkage.c
        $(call msg,CC,,$@)
        $(Q)$(LINK.c) $^ -o $@

> It also affects all other users of lib.mk which
> don't have any custom cflags handling.

Many projects include lib.mk, but most do not include
tools/scripts/Makefile.include.  Without it, the appended EXTRA_CFLAGS
cannot be inherited.  This is why I did not touch those projects.

Appending EXTRA_CFLAGS in lib.mk may not be a good idea ? as such a
global change could break some builds.

Thanks,
Leo

