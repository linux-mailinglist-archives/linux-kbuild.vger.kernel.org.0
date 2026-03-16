Return-Path: <linux-kbuild+bounces-11950-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MT3JuDYt2mcWAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11950-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 11:18:08 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 42835297CB5
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 11:18:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A2DC5300827A
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 10:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90084386C21;
	Mon, 16 Mar 2026 10:18:05 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB8F383A14;
	Mon, 16 Mar 2026 10:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773656285; cv=none; b=J2Nz/a/yUeKqcibAXiiFL1N3WA30do6PLq/rz/7Omp043mbxbWOV5gXCrrROiee+1I/HmPfO1wdQDDPtB6H2tgvwdBqfL32l7N4A4QFdN+LYxr1kN6wdv2x/HrCSk68/EQXOoTqE3Zka5G0lEkxipyiXuSWb5jEFUTiM6ZycYMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773656285; c=relaxed/simple;
	bh=c30q8cP+1tW7hMgKrmZODRuHGnO1oWLiLKKYH9vT2C8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tXVqCkEs09iLDfzGD7rSTlXB9+bIGIJCHgdgUKGRNap6YpVsr4TtR+e7xHDKZxe0PgZvRn26LAv8BOihsHpri5dZZjXj7cJBYQuX0bvVDTYMAk7GLLnBETHcotVlv5Y9kKDy4lJeZ36zYdXUQKTEcS3wCf45+z1B6BMqE9UAl+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 422051477;
	Mon, 16 Mar 2026 03:17:57 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CAD483F73B;
	Mon, 16 Mar 2026 03:18:02 -0700 (PDT)
Date: Mon, 16 Mar 2026 10:18:00 +0000
From: Leo Yan <leo.yan@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
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
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, bpf@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH v4 07/30] libbpf: Initialize CFLAGS before including
 Makefile.include
Message-ID: <20260316101800.GB8048@e132581.arm.com>
References: <20260311-tools_build_fix_zero_init-v4-0-9e35bdb99cb3@arm.com>
 <20260311-tools_build_fix_zero_init-v4-7-9e35bdb99cb3@arm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311-tools_build_fix_zero_init-v4-7-9e35bdb99cb3@arm.com>
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11950-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,google.com,linaro.org,gmail.com,iogearbox.net,linux.dev,fomichev.me,intel.com,arm.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leo.yan@arm.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[69];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.981];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,e132581.arm.com:mid,meta.com:email]
X-Rspamd-Queue-Id: 42835297CB5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi BPF maintainers,

On Wed, Mar 11, 2026 at 08:29:32AM +0000, Leo Yan wrote:
> tools/scripts/Makefile.include may expand EXTRA_CFLAGS in a future
> change.  This could alter the initialization of CFLAGS, as the default
> options "-g -O2" would never be set once EXTRA_CFLAGS is expanded.
> 
> Prepare for this by moving the CFLAGS initialization before including
> tools/scripts/Makefile.include, so it is not affected by the extended
> EXTRA_CFLAGS.
> 
> Append EXTRA_CFLAGS to CFLAGS only after including Makefile.include and
> place it last so that the extra flags propagate properly and can
> override the default options.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Before sending a new version, I'd check if you have a chance to review
the libbpf patches.  The libbpf change is crucial for this series.

Another reason for pinging because I received a bpf-ci report about test
failures for this series [1].  The failures looks to be unrelated, as
the tests fail starting from the first patch, which is irrelevant to BPF
code [2].  I tried reaching kernel-ci@meta.com last week but haven't
received a response yet.

If bpf-ci testing is mandatory for libbpf patches, could you advise me
on the correct workflow (e.g., whether the patches should be based on a
specific branch)?

Thanks.

[1] https://github.com/kernel-patches/bpf/actions/runs/22944268645
[2] https://patchwork.kernel.org/project/netdevbpf/patch/20260311-tools_build_fix_zero_init-v4-1-9e35bdb99cb3@arm.com/

> ---
>  tools/lib/bpf/Makefile | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/lib/bpf/Makefile b/tools/lib/bpf/Makefile
> index b1fbd0211c5edde7be3d98630b16e53e028d9116..eca584fb061e16013e76827e4203f6be0477a73e 100644
> --- a/tools/lib/bpf/Makefile
> +++ b/tools/lib/bpf/Makefile
> @@ -49,6 +49,14 @@ man_dir_SQ = '$(subst ','\'',$(man_dir))'
>  export man_dir man_dir_SQ INSTALL
>  export DESTDIR DESTDIR_SQ
>  
> +# Defer assigning EXTRA_CFLAGS to CFLAGS until after including
> +# tools/scripts/Makefile.include, as it may add flags to EXTRA_CFLAGS.
> +ifdef EXTRA_CFLAGS
> +  CFLAGS :=
> +else
> +  CFLAGS := -g -O2
> +endif
> +
>  include $(srctree)/tools/scripts/Makefile.include
>  
>  # copy a bit from Linux kbuild
> @@ -70,13 +78,6 @@ LIB_TARGET	= libbpf.a libbpf.so.$(LIBBPF_VERSION)
>  LIB_FILE	= libbpf.a libbpf.so*
>  PC_FILE		= libbpf.pc
>  
> -# Set compile option CFLAGS
> -ifdef EXTRA_CFLAGS
> -  CFLAGS := $(EXTRA_CFLAGS)
> -else
> -  CFLAGS := -g -O2
> -endif
> -
>  # Append required CFLAGS
>  override CFLAGS += -std=gnu89
>  override CFLAGS += $(EXTRA_WARNINGS) -Wno-switch-enum
> @@ -84,6 +85,7 @@ override CFLAGS += -Werror -Wall
>  override CFLAGS += $(INCLUDES)
>  override CFLAGS += -fvisibility=hidden
>  override CFLAGS += -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
> +override CFLAGS += $(EXTRA_CFLAGS)
>  
>  # flags specific for shared library
>  SHLIB_FLAGS := -DSHARED -fPIC
> 
> -- 
> 2.34.1
> 

