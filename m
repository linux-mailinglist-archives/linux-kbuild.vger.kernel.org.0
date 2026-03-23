Return-Path: <linux-kbuild+bounces-12169-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIZYIq5PwWnLSAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12169-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 15:35:26 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F992F4CB4
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 15:35:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFB343122522
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 14:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 506493AE18C;
	Mon, 23 Mar 2026 14:23:12 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B7153ACA68;
	Mon, 23 Mar 2026 14:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774275792; cv=none; b=SAfxcZvuiR8dktMg+aM8ycN9+DJKZmEqNUMOqjNhU79WxhdJG8t8IbC4asCchfiUVSS7VB2kB2+CM0UJiMl4jTEtYVzUe4OK4IGRN6HNxzsxBqPZ7tsrdF/LYcDSyp5/CgCr3t8xBnRjMk5gquDZYRxddK4h5nFAX2AM27IDtjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774275792; c=relaxed/simple;
	bh=eIUqCEwf0NMqApOqTbm1o3f4OJLHnVa0ZP8Hn1XmINg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MKPT9F3WkADsWXAO1hyjlgonGzB8RzLCEBtK+ldon1ua8RIJyQ5iEmoxhXr5CRzzHYVnRpk4xwezw83IszQ0xDHLSLUjAlVoMrURKfm8NgLwXe/BmcL+cTzR981dNuX9baJrr/Qf/20WripGWxsyyItMPzcggULK6w4DSEjZYrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16078169C;
	Mon, 23 Mar 2026 07:23:03 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 934CA3F73B;
	Mon, 23 Mar 2026 07:23:08 -0700 (PDT)
Date: Mon, 23 Mar 2026 14:23:06 +0000
From: Leo Yan <leo.yan@arm.com>
To: Ian Rogers <irogers@google.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
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
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
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
Subject: Re: [PATCH v5 06/26] tools build: Append
 -fzero-init-padding-bits=all to extra cflags
Message-ID: <20260323142306.GA43072@e132581.arm.com>
References: <20260318-tools_build_fix_zero_init-v5-0-bbeffd8da199@arm.com>
 <20260318-tools_build_fix_zero_init-v5-6-bbeffd8da199@arm.com>
 <CAP-5=fV_ObgCokJ3bKAQBYn-DPrGadGVzqvrzbuy8aEcsfkp8w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP-5=fV_ObgCokJ3bKAQBYn-DPrGadGVzqvrzbuy8aEcsfkp8w@mail.gmail.com>
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,google.com,iogearbox.net,linux.dev,fomichev.me,intel.com,arm.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org,vger.kernel.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12169-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leo.yan@arm.com,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_GT_50(0.00)[69];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D6F992F4CB4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Ian,

On Wed, Mar 18, 2026 at 09:38:43AM -0700, Ian Rogers wrote:

[...]

> >  tools/scripts/Makefile.include | 30 ++++++++++++++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> >
> > diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.include
> > index b5ecf137febcae59f506e107a7f2e2ad72f4bef4..a2397ceae512c1bc54adb15cb1a111ff34e28e43 100644
> > --- a/tools/scripts/Makefile.include
> > +++ b/tools/scripts/Makefile.include
> > @@ -137,6 +137,36 @@ else
> >  EXTRA_WARNINGS += -Wshadow
> >  endif
> >
> > +# output directory for tests below
> > +TMPOUT = .tmp_$$$$
> > +
> > +# try-run
> > +# Usage: option = $(call try-run, $(CC)...-o "$$TMP",option-ok,otherwise)
> > +# Exit code chooses option. "$$TMP" serves as a temporary file and is
> > +# automatically cleaned up.
> > +try-run = $(shell set -e;              \
> > +       TMP=$(TMPOUT)/tmp;              \
> > +       trap "rm -rf $(TMPOUT)" EXIT;   \
> > +       mkdir -p $(TMPOUT);             \
> > +       if ($(1)) >/dev/null 2>&1;      \
> > +       then echo "$(2)";               \
> > +       else echo "$(3)";               \
> > +       fi)
> > +
> > +# cc-option
> > +# Usage: CFLAGS += $(call cc-option,-march=winchip-c6,-march=i586)
> > +cc-option = $(call try-run, \
> > +       $(CC) -Werror $(1) -c -x c /dev/null -o "$$TMP",$(1),$(2))
> > +
> > +host-cc-option = $(call try-run, \
> > +       $(HOSTCC) -Werror $(1) -c -x c /dev/null -o "$$TMP",$(1),$(2))
> > +
> > +# Explicitly clear padding bits with the initializer '{ 0 }'
> > +FLAG_ZERO_INIT := $(call cc-option,-fzero-init-padding-bits=all)
> > +override EXTRA_CFLAGS += $(FLAG_ZERO_INIT)
> 
> Sashiko [1] noted a possibly unintended consequence of this change for libbpf:
> 
> Does this override unintentionally drop the default compiler flags for libbpf?
> 
> Looking at tools/lib/bpf/Makefile, the default compiler flags like -g and -O2
> are only applied if EXTRA_CFLAGS is undefined:
> 
> tools/lib/bpf/Makefile:
> ifndef EXTRA_CFLAGS
> EXTRA_CFLAGS := -g -O2
> endif
> 
> Since tools/scripts/Makefile.include unconditionally appends to EXTRA_CFLAGS
> here, the variable will be defined before tools/lib/bpf/Makefile evaluates it.
> 
> This causes libbpf to silently drop the default -g and -O2 flags.
> 
> While later commits in this series fix this exact issue for
> tools/lib/thermal/Makefile, it appears tools/lib/bpf/Makefile was missed.

This is expected.  As Alexei suggested, BPF patches should go via the bpf
tree and be sent separately [2].  As a result, the AI review has no full
context and misses the BPF pieces.

I will send a new series and a BPF/bpftool series separately.  If AI still
complains this, I'd suggest we simply ignore this false positive.

Thanks,
Leo

[2] https://lore.kernel.org/linux-perf-users/CAADnVQLN6bYHnusnC5QnDoGGUO-A=qnM6fP9bhEVXEHD6_y9EQ@mail.gmail.com/#t


