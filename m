Return-Path: <linux-kbuild+bounces-12116-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id rf91AeHZv2ni9AMAu9opvQ
	(envelope-from <linux-kbuild+bounces-12116-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 22 Mar 2026 13:00:33 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BDC2E8FD7
	for <lists+linux-kbuild@lfdr.de>; Sun, 22 Mar 2026 13:00:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F0EBD3005A8D
	for <lists+linux-kbuild@lfdr.de>; Sun, 22 Mar 2026 12:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC27231328B;
	Sun, 22 Mar 2026 12:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uEZWVknz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FF61624D5;
	Sun, 22 Mar 2026 12:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774180827; cv=none; b=TSXo3RkzACc+1g+9Q1SBeGZHnMITTeczEg43lEGD8sHSsRP3ikUO9ZRBdAsud4Z5d8fo4I6kxzTn3/l5ztk/y9qfRdqtyE14JJjGrx8ILbBPLaJZhxJVjAUm7FSup1cbu4nsfP0hl5Gwj4lEugkeeGZDGaahau1jlTxFgjjchSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774180827; c=relaxed/simple;
	bh=p9dJVRdv2llYJDIpgBwjEM3yl73MNPDLaVVF0l7e160=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VZBnkhtjFh0IvJNRlZT4cXrEYoPaPhdS/J2wbHncAErjzRFTOma8HQacFkh0LbHf2Pmv4nvliQO+xVmn/796bHcJiMFUHF3ksZLdeRt0rWjLxZ5hLQaYOW/5n+s5lyOa6BnVvsg5zhwJfmjsUYvMow3bcDQkm2ftsMzob1ldaog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uEZWVknz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1607CC2BCB1;
	Sun, 22 Mar 2026 12:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774180827;
	bh=p9dJVRdv2llYJDIpgBwjEM3yl73MNPDLaVVF0l7e160=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uEZWVknzPoit/IPSfxQIQXxu72DpSC3EZt6MIpljBOkNEvO+nFggyCM72Z3d/CI64
	 oUPgidjSRFnD1n2Tcrc4vD0XRf6daXSGfa9sQ91u/emnUPdG8d3FDh2qviZHi8/UPq
	 qcPyNs30HlkwOdvZ7u3U4EN2VtIqxqVbJla0NFaPatkb1Kmw3D1ntiWSkmxSUVm4q4
	 z4KIi7cp7yGed6f6hSmoQXPpU9yzgqkgPvpd7OvNv1meWwl2ARC0L5gPSovxIYhbTx
	 lMqvx7Tx6oBL7v6UHi9tfJtjULXAFaBzpwAceCx6oPCThfXQBFbx1yaByoIjLQcbPj
	 Jc/yv9Z/TN5pg==
Date: Sun, 22 Mar 2026 12:00:11 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Ian Rogers
 <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>, James Clark
 <james.clark@linaro.org>, Kees Cook <kees@kernel.org>, Quentin Monnet
 <qmo@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier
 <nsc@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill
 Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano
 <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba
 <lukasz.luba@arm.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar
 <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Adrian Hunter
 <adrian.hunter@intel.com>, Masami Hiramatsu <mhiramat@kernel.org>, William
 Breathitt Gray <wbg@kernel.org>, Barry Song <baohua@kernel.org>, Qinxin Xia
 <xiaqinxin@huawei.com>, Bartosz Golaszewski <brgl@kernel.org>, Kent Gibson
 <warthog618@gmail.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Haiyang
 Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, Dexuan Cui
 <decui@microsoft.com>, Long Li <longli@microsoft.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Willy Tarreau <w@1wt.eu>, Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?=
 <linux@weissschuh.net>, Josh Poimboeuf <jpoimboe@kernel.org>, Robert Moore
 <robert.moore@intel.com>, Len Brown <lenb@kernel.org>, Srinivas Pandruvada
 <srinivas.pandruvada@linux.intel.com>, Tejun Heo <tj@kernel.org>, David
 Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, Changwoo Min
 <changwoo@igalia.com>, Mark Brown <broonie@kernel.org>, Steven Rostedt
 <rostedt@goodmis.org>, Gabriele Monaco <gmonaco@redhat.com>, Shuah Khan
 <shuah@kernel.org>, Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires
 <bentiss@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, bpf@vger.kernel.org,
 linux-perf-users@vger.kernel.org
Subject: Re: [PATCH v4 18/30] tools: iio: Append extra cflags
Message-ID: <20260322120011.112b173c@jic23-huawei>
In-Reply-To: <20260311-tools_build_fix_zero_init-v4-18-9e35bdb99cb3@arm.com>
References: <20260311-tools_build_fix_zero_init-v4-0-9e35bdb99cb3@arm.com>
	<20260311-tools_build_fix_zero_init-v4-18-9e35bdb99cb3@arm.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12116-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,linaro.org,gmail.com,iogearbox.net,linux.dev,fomichev.me,intel.com,arm.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org,vger.kernel.org,lists.linux.dev];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[69];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,arm.com:email]
X-Rspamd-Queue-Id: 91BDC2E8FD7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 11 Mar 2026 08:29:43 +0000
Leo Yan <leo.yan@arm.com> wrote:

> Append EXTRA_CFLAGS to CFLAGS so that additional flags can be applied to
> the compiler.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
Given discussion leading to:
https://lore.kernel.org/all/20260311113537.70c4bacd2021c8d29c7dcf68@linux-foundation.org/
I'm assuming I don't need to do anything beyond.

Acked-by: Jonathan Cameron <jonathan.cameron@huawei.com>

Shout if otherwise.

> ---
>  tools/iio/Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/iio/Makefile b/tools/iio/Makefile
> index 3bcce0b7d10f42208765be83dac047faa2e0ceb1..f0428421792d1cbe5ff71b01b67f23eb908fa714 100644
> --- a/tools/iio/Makefile
> +++ b/tools/iio/Makefile
> @@ -13,6 +13,7 @@ endif
>  MAKEFLAGS += -r
>  
>  override CFLAGS += -O2 -Wall -g -D_GNU_SOURCE -I$(OUTPUT)include
> +override CFLAGS += $(EXTRA_CFLAGS)
>  
>  ALL_TARGETS := iio_event_monitor lsiio iio_generic_buffer
>  ALL_PROGRAMS := $(patsubst %,$(OUTPUT)%,$(ALL_TARGETS))
> 


