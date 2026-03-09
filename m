Return-Path: <linux-kbuild+bounces-11697-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDoHFFicrmk7GwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11697-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 11:09:28 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DB28E236CE2
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 11:09:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 646E6305092A
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 10:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC71F38BF64;
	Mon,  9 Mar 2026 10:07:15 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4E3B38B7CD;
	Mon,  9 Mar 2026 10:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773050835; cv=none; b=h/HtTi6EP+QLJPMiX2Rrvqj14TPNgnfGWN0suYU30vRvw2qUhGsLLmxWeUo4N+wXtGtTDdiBlIatrakIr6eUjXEyVGCiL83wYJ0uDD0GRFsVVXFmzkBmWpKmN7AC+kS9zE4lO0jJeV81DiSVuBRfx378yEmLp5W97UmyNVfwfsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773050835; c=relaxed/simple;
	bh=niigQqdnyEgr+xuuEMIVsG1eGQfD+BEJm+xOSQaVtLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X8GbcA/zbkn5c3C9qGq8hGsNu0xI484w3FSP9tV3BJrDyUyJVnojfNEmyq7/H+a0ONXLaax0LmFuucTAwWtqDc+Cv2Wl86Fyk6+bUtxoHWsOV1TD4bnS8CTR+5wYDLy3iT1W934kTkHTPttU9IPmK8F2C79PR+sieyinUBGdxGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C6F0F1C01;
	Mon,  9 Mar 2026 03:07:04 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 99AF73F7BD;
	Mon,  9 Mar 2026 03:07:10 -0700 (PDT)
Date: Mon, 9 Mar 2026 10:07:08 +0000
From: Leo Yan <leo.yan@arm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
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
Subject: Re: [PATCH v3 04/30] tools/thermal: Initialize CFLAGS before
 including Makefile.include
Message-ID: <20260309100708.GN1098637@e132581.arm.com>
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com>
 <20260308-tools_build_fix_zero_init-v3-4-6477808123b7@arm.com>
 <2ae5e4e5-a860-4f94-9655-67368d558f86@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ae5e4e5-a860-4f94-9655-67368d558f86@oss.qualcomm.com>
X-Rspamd-Queue-Id: DB28E236CE2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,linaro.org,gmail.com,iogearbox.net,linux.dev,fomichev.me,intel.com,arm.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-11697-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_GT_50(0.00)[70];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.925];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,e132581.arm.com:mid]
X-Rspamd-Action: no action

Hi Daniel,

On Mon, Mar 09, 2026 at 09:41:16AM +0100, Daniel Lezcano wrote:

[...]

> On 3/8/26 17:46, Leo Yan wrote:
> > Initialize CFLAGS to the default value before including
> > tools/scripts/Makefile.include.
> > 
> > Defer appending EXTRA_CFLAGS to CFLAGS until after including
> > Makefile.include, as it may extend EXTRA_CFLAGS in the future.
> > 
> > Signed-off-by: Leo Yan <leo.yan@arm.com>
> > ---
> >   tools/thermal/lib/Makefile | 16 +++++++++-------
> >   1 file changed, 9 insertions(+), 7 deletions(-)
> > 
> > diff --git a/tools/thermal/lib/Makefile b/tools/thermal/lib/Makefile
> > index 056d212f25cf51cd8c02260fbe2ef28dda5e4acb..1890779f1574ebd9015f3001b9bb31d4bc0ae5ce 100644
> > --- a/tools/thermal/lib/Makefile
> > +++ b/tools/thermal/lib/Makefile
> > @@ -23,6 +23,14 @@ INSTALL = install
> >   DESTDIR ?=
> >   DESTDIR_SQ = '$(subst ','\'',$(DESTDIR))'
> > +# Defer assigning EXTRA_CFLAGS to CFLAGS until after including
> > +# tools/scripts/Makefile.include, as it may add flags to EXTRA_CFLAGS.
> > +ifdef EXTRA_CFLAGS
> > +  CFLAGS :=
> > +else
> > +  CFLAGS := -g -Wall
> > +endif
> > +
> 
> Sorry, I don't get the comment :/
> 
> Can you clarify the intended purpose with this change ?

Sure. Since this series sets EXTRA_CFLAGS in Makefile.include (patch 05).
Without this patch, the init behavior of the thermal Makefile may change.

For example:

  make -C tools/thermal/lib/

Before this series, the Makefile initializes:

  CFLAGS := -g -Wall

If _only_ patch 05 is applied, EXTRA_CFLAGS is implicitly set in
tools/scripts/Makefile.include to work around compiler bugs. The
Makefile would initialize:

  CFLAGS := $(EXTRA_CFLAGS)

This patch preserves the original initialization of CFLAGS, but changes
the sequence:

  CFLAGS := -g -Wall
  CFLAGS += $(EXTRA_CFLAGS)

If $(EXTRA_CFLAGS) is set by Makefile.include, it will be appended.
Otherwise, if $(EXTRA_CFLAGS) is empty, the behavior remains unchanged.

>  and the 'override' directive below ?

The override directive is used to override any CFLAGS set on the make
command line.  This patch does not introduce the directive; it simply
follows the existing style.  As you can see, the following lines
already use the directive when appending options.

Thanks,
Leo

> >   include $(srctree)/tools/scripts/Makefile.include
> >   include $(srctree)/tools/scripts/Makefile.arch
> > @@ -39,13 +47,6 @@ libdir = $(prefix)/$(libdir_relative)
> >   libdir_SQ = $(subst ','\'',$(libdir))
> >   libdir_relative_SQ = $(subst ','\'',$(libdir_relative))
> > -# Set compile option CFLAGS
> > -ifdef EXTRA_CFLAGS
> > -  CFLAGS := $(EXTRA_CFLAGS)
> > -else
> > -  CFLAGS := -g -Wall
> > -endif
> > -
> >   INCLUDES = \
> >   -I/usr/include/libnl3 \
> >   -I$(srctree)/tools/lib/thermal/include \
> > @@ -56,6 +57,7 @@ INCLUDES = \
> >   -I$(srctree)/tools/include/uapi
> >   # Append required CFLAGS
> > +override CFLAGS += $(EXTRA_CFLAGS)
> >   override CFLAGS += $(EXTRA_WARNINGS)
> >   override CFLAGS += -Werror -Wall
> >   override CFLAGS += -fPIC
> > 
> 

