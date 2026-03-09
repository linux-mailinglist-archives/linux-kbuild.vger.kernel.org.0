Return-Path: <linux-kbuild+bounces-11736-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJatEeUMr2nHMwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11736-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 19:09:41 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E625023E4B8
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 19:09:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A850330EF620
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 18:06:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2BA83EF0A7;
	Mon,  9 Mar 2026 18:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RUjjNeD2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672A92BEC45
	for <linux-kbuild@vger.kernel.org>; Mon,  9 Mar 2026 18:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773079412; cv=pass; b=CvBWdoSz7UFXuomhxPNtbbEVSpmlc1VbpKrJ3s1NjK/MgHVIeSObd9WVOjk4FjoQkBj1v0t/LnM0GbnatRyibagrx5T2k4LR6jB30O73kWlWKdYMllxfeXikRwZ6RF11dRqfrcrjqXwAEvQx7clcYJHNQk9DuuWw9QVK1ScW1wk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773079412; c=relaxed/simple;
	bh=Jmh6F1HA1/DHwO4+8wWz0TgE1rMuRLMuCBybYeE2lhg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CpEu9VDEngzHWpJJ44K+8kWAw5CZv3MvjttHbbEtBc8KeR3jjoa8mTYaLxgOhike3Tl7imODV4PQDzO9NkKzSznaQ1uh9ydA/ZT6JdEGEUJ5aXvbMtQRfRR3bEG3TW6UUTRKMBQEnIzScr30hiQO6Qgb2GklKnY2YEWqjW9rZew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RUjjNeD2; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ae523d54d2so15475ad.1
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Mar 2026 11:03:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773079411; cv=none;
        d=google.com; s=arc-20240605;
        b=gI+DGqLdZEOG9/AvYW9Mjjv73BtyPtRFuq8O/LSaGscYfxJ+/XbLafO7TB9z0BdRH8
         XpSkB7gRafm9Z+AqkXvLcNOFc2hSsFY5e1XxIqglWL/fywR7do+g1MXnc4C6h6WjShKG
         5o4GOC3T614JdmlmdCUVY4dO9mc0gSf115ZwnjMNVwGEMjPYTTssNj9JjcV9vgj2oU8Z
         o38N3SmN6EgNxWnPTresyR9c50CWWUF/IVXqKkKJ2/ugw6iOgKBWE6IdwdO9x5ZAFA7F
         3neZE9qMTAq/dawfGXfoHKr+arIVlxLhcLiY2/tAcK4GBb6hJzubdeltl+q47QXpLCrz
         jupw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/2Fq8jDmUYvdwrz/G2ys/Pt5cbewWsQscS8yZEetyac=;
        fh=KEI6+CUzXlK+Wxkcoenf3WkwX3nq7DbZcwIqEvk1JSA=;
        b=O7zWLB7J2d9K3o/wEPg+ao1PuPiNKcKKqzwGSKda2o9EuesmC9KUyvjBy3D4Is6I70
         WcO3/Ftv0MNEb1LnoyPvJB2Fo44E7Lp4kZUKsQCj4S/UpfDKyRtyz+g/vWn0HvHl8aku
         87mGx+dV82oVnx/YNa3DTzGC+udnNM0ALlixsXv3+4GZZrqxFcvMLTLtU52qXBSmT8KD
         8vAe6bPK3kkzX+rr2y0usvigV/u7nW8hrGbUxc7eC+rxCmyY89PwJzuD0cy5bYNVSjbZ
         98lB78yAE/yL2QqokZGAQKtc1kYC+yYQhoo6fomj3G7ud1LgDgQG6HP9FrCQg7FjaEfh
         iOkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773079411; x=1773684211; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/2Fq8jDmUYvdwrz/G2ys/Pt5cbewWsQscS8yZEetyac=;
        b=RUjjNeD2SpN/Wi/gR3CMXFebTmihJt693tZdqo3VxVkdHF/Rb4xG1sEICozrGFwQJR
         5nQE3VTVUX4i7K+i9qBeEgtO03I+LUEYQyhmHXn65F9RSC3luYlr4TI4c9NSdID+a5Cm
         YZUIPrKHvrJ4rkzWdNbDT5++N4CQYwBOpIbbvNHlQ8JRyrdn7eLv7a73BD44xlr2LPYl
         +WNFKaCs243gGIPM2ZweNXs2McugQ06ufUdrFsMnQpYwsypJ/GLW5aKW21l5BFzM1uZR
         WAaetNV0Fa55fEvnMSQ3CE6tf07+fZN8CM7TYlu1Ki8VNjLW7EC3CC7pL4V/gcKpftw2
         dp8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773079411; x=1773684211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/2Fq8jDmUYvdwrz/G2ys/Pt5cbewWsQscS8yZEetyac=;
        b=aNCEY3Ukd7H9TIy8uS4pcmd/TJyCU/VV0aQt0Nmch00FzEDNSPH5l0219LJs3B1VHk
         ByWjJCMdk6/dImGYsiqltmeNj52YoHZl+sIs25qwJIDarYXaUB0DYQpydUI2gOgxgcNm
         4ahZBT7t7wAQOPKq6uWmSeUWdZp1wEMOVA2O7lnNtp+Gr0pkV6Egg2adDSL8QEUf7+EY
         ulVgZcX0TWK6tPvgkOhhDRBNoXaWFmyfQp0PXhiv/aydnD8g0YU8Ad5sKDn5FlQEnbqa
         zuJKAUvEMz8V9tBnhqTp15yBaY8jqCMo4NIS5jXRJ8xE8GsScuG7NkPu5p4ef+LYMstz
         JsWA==
X-Forwarded-Encrypted: i=1; AJvYcCU7bm1Zj43ychSMDhbyQf4lvuWywCrNRHHakAPNIS8G5/+EItZrC24f3wjq4DFndIecd0psoQHsMrqN9M4=@vger.kernel.org
X-Gm-Message-State: AOJu0YydD1jklkBHWGYH2eYphwI1+GNMtC/z+IcI4h1CAoX+PmIDbkHj
	c9QopglVeMfUxYDntCakVeyUgN83i9GmU0KW/DqWI84pPu3CbfJD0zVDFPUOSkxIWdaWxBZ247X
	k1K3e0mQ94nh5BMUd9n9plGPk+3zsFmRNzXa4mhTT
X-Gm-Gg: ATEYQzxq3duD/P4ofJoDY8WfgBnUf/NkEzvlMdFsHEHpb845fkG08r72ooNFBi6JdEt
	nzri2CBOCT9AnqO7r7fXjTsyu+2HMiXo9Ht4yyxKavckmsFB1Az3jLPUxE+Cx99+95e2gpRmASb
	5k0L0FhqMDm9tPb9eR3RQx/sBZP1Anf6Re5gNqgJXODz82JBt7xupd3/AF8xQsveZYXCelopFQM
	08Ch/RiA2OfclPI+V976X+CHAxLs7hZbKCGcxbTzTk+zOYzyJhDQAmgeRBZn+zeeOKWx7SKKW92
	7Dr4vHCyeoVuvXbCkvpBq2y8tpbBF+q1CMM=
X-Received: by 2002:a17:902:f546:b0:2ae:575f:3755 with SMTP id
 d9443c01a7336-2aea30d24bamr264685ad.20.1773079410195; Mon, 09 Mar 2026
 11:03:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com> <20260308-tools_build_fix_zero_init-v3-23-6477808123b7@arm.com>
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-23-6477808123b7@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Mar 2026 11:03:18 -0700
X-Gm-Features: AaiRm51m4nYl0m8tFtQlOB_PU4q1W2JI6UKS4mgMHQi7Hrouc_6G7mzkDrAVHLM
Message-ID: <CAP-5=fWzFtZbXK4DrUOCFBtD9e2_e3BG3Em8O84C=Zhfjyf5nA@mail.gmail.com>
Subject: Re: [PATCH v3 23/30] tools: spi: Append extra cflags
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
X-Rspamd-Queue-Id: E625023E4B8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,google.com,iogearbox.net,linux.dev,fomichev.me,intel.com,arm.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-11736-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,arm.com:email]
X-Rspamd-Action: no action

On Sun, Mar 8, 2026 at 9:49=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Append EXTRA_CFLAGS to CFLAGS so that additional flags can be applied to
> the compiler.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/spi/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/spi/Makefile b/tools/spi/Makefile
> index 7fccd245a53515ab019529c8e5e91a044eaaa68b..1e3b3f91634cc2561c434c02f=
812942fa881685f 100644
> --- a/tools/spi/Makefile
> +++ b/tools/spi/Makefile
> @@ -12,6 +12,7 @@ endif
>  # (this improves performance and avoids hard-to-debug behaviour);
>  MAKEFLAGS +=3D -r
>
> +CFLAGS +=3D $(EXTRA_CFLAGS)
>  CFLAGS +=3D -O2 -Wall -g -D_GNU_SOURCE -I$(OUTPUT)include

The append should probably happen last to allow the default values to
be overridden.

Thanks,
Ian

>  ALL_TARGETS :=3D spidev_test spidev_fdx
>
> --
> 2.34.1
>

