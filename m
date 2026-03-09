Return-Path: <linux-kbuild+bounces-11724-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPmKIcEIr2loMAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11724-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 18:52:01 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E42323DF8B
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 18:52:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BA4703014FE1
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 17:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1089430595B;
	Mon,  9 Mar 2026 17:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yGTboS3P"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD77C3033E0
	for <linux-kbuild@vger.kernel.org>; Mon,  9 Mar 2026 17:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773078718; cv=pass; b=Xjims4Akh0tnpwMRruBNS3F2qwGZhx9+OJu+skkSBjJlet8MnmZb5hH+yXJcX4Wp+BuSc7XqnV9wtsuKDADrIO0OskYTxIpmLepOWWxfhBdgCqOUZqcizyDLYsPV8VyH00gNmcHoFddq7Tnuy+9DKxLH1c8WJJQLFpQyOBDL7uw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773078718; c=relaxed/simple;
	bh=kkqzTEyvh/URTQ9I+cvN17shvFcTkWcWq4aF5dQy6Ko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PCE1OaYFY6LJR/BtTFztgDbbfFHafCiepPshlhyVqPstjGet9XDXeUmQ/zaRvi0Q25eVStae5Ok07NalWr5dISs/AvbrDsqhRpLKPBTdwaDeb0pdJtHu2RCjpPNhNURfJpelNVcwKYhi/ZEWgXtH0MfWf1YO1U111bx+ugOccKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yGTboS3P; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ae49120e97so15245ad.0
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Mar 2026 10:51:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773078716; cv=none;
        d=google.com; s=arc-20240605;
        b=TtcQksRodwQjBLY27e5fn4kOwB2GqZsHfxoaFpXekaGDpoYd9Z7ZvXN4lIJCIbBfNX
         DokFWCjpOid9ieTuNikAu4XtOk3Y66zPjYc/wO4t6zZWMsMo7vPp26Vw3sOhu54jS8GK
         Qi39kahVTmkZuMW5U5AGw83la1/NLqe+AajJto4PQ09mF3jHs4LEnxhXoFOCu1qYqeIA
         2jLEEnPyfGwbLCJGCoGZQCGtUX3QBG8EKJEOra6cOEyL8NY0a0HNf1UTnZANNi3Ang5T
         Zh19dRNwoKXRObrQhAYACQOobw/Gb7dPUzYKeTnOCZsUVCBun5ZpfLqckaw8EtvlRwKN
         ziWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9FO2/vMdvpebNXVSiHoLYLTKLNZ/3KtLOm8TqnQ8k3Y=;
        fh=Efii/+p6kY902H0ebj2gtj0vC/asb6RSe+LyHujtqPc=;
        b=D94q9wAYOH7b0dbM/ZmaNklSGE4/MrBWhDdCXQjxJgogLhNfR4UaBx90jx59BcZ+R6
         eZvQcFvkXbUKT9WWpG3O69TOqUIdGtSqSSQj/TtaZ2sa7hIXeOiH4KAlKBOazB9f5eqb
         UoFNT8+b3vKnBn+GpqV75Q0gMsJOj4z1jhhQswceQ1Io+nFRz+RN4U1y2TiNHCMqE6zd
         AFcheXlB/LXM4oiXK4PQzRi5Ghyfijg8bIzqPqGcP7U03Z8ERbRXXaKsfGNtHqYiJ82i
         ekfPp1sHoiTG9cZ4JThiWQs4Pd6EcTErk/d9eGNjnWPoJr6MdNkY7dlh0oGGoS5ZxmBL
         B2Yw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773078716; x=1773683516; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9FO2/vMdvpebNXVSiHoLYLTKLNZ/3KtLOm8TqnQ8k3Y=;
        b=yGTboS3Py1ByT60HznWSS8zoNtHLxhO5ZEtTNy/x/hydjlBX+jr4Xd7BUgroD32Jjy
         UJD8URz/25FWMhwBo1Yq+PTDujMXZsP0IdVNgEh+Wl6SjmhA2O6jae5WpqOtvU7MK4TU
         m4mZffGol1hAVDjUaxw9ECHjoySuU40tR5Rsn7OWNGuKMsawhMsklhEySHDemdO1Nx2g
         qdF4BbVJLM97IpH9gEbV5LcQvZl28X/mtif7sbbCHEhfLuko7L9vtwRxDak6/fCnGiyi
         wn+lBpa8keILLkEqyN2EY5l6TxCwyuzvjSmsHOfKSuhjSb8gmitCW8OO+P+u6mH4ySWt
         aTIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773078716; x=1773683516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9FO2/vMdvpebNXVSiHoLYLTKLNZ/3KtLOm8TqnQ8k3Y=;
        b=A6qUCg82tnqB1u7g/2D+X6p25sShMw6BzCyqTi70LwDetFI3FWco3Ln1ynwIX1AqIh
         4TOpLJXa1TNJNhr6iJVs8KOPiKZG5U6BOrsBKfYTWCk5vrpQXVIspsw1McfBETWSKgpv
         rfbsBOSfpJLudFFhkm7oSLivfM2jLDSjgvgRpQYX5CRQUHJ7kkwab/vWvPoGbLSawE8m
         hhakmZ7zcwOUSeuMqkg8kwQGE0targuhrkpuJH+0MUTTRkFa221PqGS/nAHTY1iVlnT+
         CB83TWtMhiKpb/KCfqjYpBSLI0lWjCp0BKW+xtsbwOk4RdfxeVallONsvGEFe1lVAUYs
         Tl0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVowoGeqSuCUUpkfdQETp6k/VAyHAg1U+re08/CYmmV2BvYV6tQoIxs63TGCrW5A9wYw+f9wqjTDeNOgms=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfMjEnjrs8hWOpFy0mc0rXVQ/ggawcOS7i31TWuw695lMn1lu5
	ZbuaHuCptFfWVRERbtwfcMuB5MqLLsTSsQA8TnLx3cgi6ND9XkevMdC9srbYMpvY1vNXv/AZh31
	FCRDqMSMWHQl6UjB/Bxhm+51ZBUU4lDYhrmoMgimw
X-Gm-Gg: ATEYQzwoSPPXLI2CXN+qzRR/rVT+SL6jFhRviUbz2Ar7dJc/loqZvQ7BO+T/sPQkR/1
	XH7aZZszmg9xx6jE2tRQEi78XD9GmtgWtzHNuKhDzrJ7fNafxvgiSkgkhB+iBp5Sz6jW/G+HQwX
	2gmccR21+wunDptFA51eU6/reWmzrA/NNHMI5obz3KhkFHUm9xYCjyOGIcpVBtwsr/KkEbyxH2r
	lwlwikv07sO0EUJDZIBqUCSgMql6PV86bcO8WZ3hVgk7QsJVr0R05K9MZo/YfCplh0VnrP/hBc9
	KQE06wyPhpvowRfMmNVs+W3tCYjppiDW8q8=
X-Received: by 2002:a17:902:da83:b0:2ae:6432:8f77 with SMTP id
 d9443c01a7336-2aea3292d58mr119575ad.17.1773078715506; Mon, 09 Mar 2026
 10:51:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com> <20260308-tools_build_fix_zero_init-v3-10-6477808123b7@arm.com>
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-10-6477808123b7@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Mar 2026 10:51:43 -0700
X-Gm-Features: AaiRm50nzx4ov1KA5iy_Znwdr5CiIhbGHwfapJ-T0G5dtQyH0BIhXI3ZAH4nLI8
Message-ID: <CAP-5=fW83wsZfWpa9777ze-RNSFhAB9PnBa3xkVMu0LN64CThg@mail.gmail.com>
Subject: Re: [PATCH v3 10/30] tools build: Append extra cflags for feature
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	James Clark <james.clark@linaro.org>, Kees Cook <kees@kernel.org>, 
	Quentin Monnet <qmo@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	William Breathitt Gray <wbg@kernel.org>, Barry Song <baohua@kernel.org>, Qinxin Xia <xiaqinxin@huawei.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Kent Gibson <warthog618@gmail.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Robert Moore <robert.moore@intel.com>, 
	Len Brown <lenb@kernel.org>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
	Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>, Mark Brown <broonie@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Gabriele Monaco <gmonaco@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, bpf@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 2E42323DF8B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,google.com,iogearbox.net,linux.dev,fomichev.me,intel.com,arm.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-11724-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[69];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[irogers@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Sun, Mar 8, 2026 at 9:47=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Append EXTRA_CFLAGS to CFLAGS so that additional flags can be applied to
> the feature build.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/build/feature/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/tools/build/feature/Makefile b/tools/build/feature/Makefile
> index 1fbcb3ce74d2173072748a417fc63bd9a5b13888..103d8b71e7a4e8d0979242cfc=
95c1c0b946222b5 100644
> --- a/tools/build/feature/Makefile
> +++ b/tools/build/feature/Makefile
> @@ -1,6 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0
>  include ../../scripts/Makefile.include
>
> +CFLAGS +=3D $(EXTRA_CFLAGS)
> +

Is this necessary? In Makefile.feature:
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/tools/build/Makefile.feature#n11
The build invocation does "CFLAGS=3D"$(EXTRA_CFLAGS)" and so the locally
set CFLAGS appear to be ignored.

Thanks,
Ian

>  FILES=3D                                          \
>           test-all.bin                           \
>           test-backtrace.bin                     \
>
> --
> 2.34.1
>

