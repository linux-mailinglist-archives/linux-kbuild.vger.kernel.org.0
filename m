Return-Path: <linux-kbuild+bounces-11738-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDxGOA0Nr2lVNAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11738-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 19:10:21 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC9A23E4F5
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 19:10:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D3F07301C5B8
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 18:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 689792D8384;
	Mon,  9 Mar 2026 18:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3lqW/qjJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE3527467F
	for <linux-kbuild@vger.kernel.org>; Mon,  9 Mar 2026 18:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773079573; cv=pass; b=b56R2h1in6O6BZBbhdBaqenfCMD/KzX6I4YfDFGRqteHBButdRJWKZaKfbUVdnAi0hMQczz8Ad5hxmWSpbUe4XCKsD1PKbbW2L8wxbaT6w+vd5iBLgW/hTGdOZPb4lW8v/io6Ta5UJYvI7ZuDaNFbPNFDP+olsiO+M64sAbnmb8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773079573; c=relaxed/simple;
	bh=42c9ZH1wrf48IJ9g6TUsDx3jUDNj6OlA/w9q9LS4OsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f1VYqnBYNL7DURIRtLzAp7bffh0dO71do+zsNgBcbiKp/2FqIYQug0lWW7ReX7U4iZIFrF3aMdT8bjPRzKrIp3Sri+CVumPFpDkuWxdp8ujlSCB9b8TTvUaokohBVPpUXtD9I3nDOP0VApQ9CRvWMcDFsT0zLVGugs5YOFUgWqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3lqW/qjJ; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ae4b40999bso17435ad.1
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Mar 2026 11:06:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773079570; cv=none;
        d=google.com; s=arc-20240605;
        b=QIO1qD+qWNolnWafpZL97oGHSkFLfXzRHxmVozbR5y/UzflcvCKaQl1WKbXGInOpJS
         AazbgLG24+qtwUXQP9hcgDtECfQD00NJO0Xg1i+7S2du2TLbmxRgU+4r0jel3pqWAfMs
         3w6t70tDUAhAydyF1o7YCtbrlr2AopaV3cGgV04AlWmKmsyHQWFBr682qFCXuVmm/Zm2
         gFvxX/ZdPAyzc88PdbQniClJyg6nBTtHGT4+rSxZ0tMwSI3JWkV2lzvG6v7Du1Ds2nmD
         fbRpqzqODIA+qQCPzrzQSNx/mE8qc750Gq7UJWbDtcajTNusl3hg7FUWQc7sflj/4oel
         Tz1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a8XdeGKgfNmQ0ihM13m4/+pDXEjwuXh/6MDXE3f2Ssk=;
        fh=W/KZ1iTsdqDqiKnzOEK8mU3MhRvcwADoLiCM9/SFfYw=;
        b=JOChal3bojKNAwO2iXhH6wbMaA1YAA84O7KTGJX5CNKDqUwvMV86PYBqiV3ASP6tBO
         NY2wkqP7oTriOZSrJVTu8lEUT0ayRPj1sEIPKBpt0l+4w/Fbl/ccxqI7IBA97Bs3hMvg
         QTS90TuoBd+Ym07az4q93FfnWQep4832BCTjo6DHfT7Z3RnxoiiCv0isAgHh88RAqI0v
         U5nclSNQwA+BLphkWFzJ/ym1+GYkRgSl0o9yGPJiPqvbYXhk0lvSp+j5nsozSK2eSEwm
         CWlyQVpNg0pe8CQZVKHZqyJnN8pXazlgzkPWUIt/I5tFanNuB8TLyJE2TaHM4QYXFmfF
         B02g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773079570; x=1773684370; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a8XdeGKgfNmQ0ihM13m4/+pDXEjwuXh/6MDXE3f2Ssk=;
        b=3lqW/qjJ/A40fgCTjx+nk1JEN4FD2Iejutu4MU5MSH7QIu9fUP5EzC6c22S5eiLWoA
         fIPC/+TAB4YVfQl4Ag+xsG9JgbEf4aGTh7cPhdLuL7A+9DRwZuHvTYmYqLcQiujE4VNL
         B0RusBXunN0H6DY5ingObMA09KqUhKP7RwJ65c8SRtBu0xcS9qLIaMew4N0tg5JJQzv6
         MUmRdiIiE1Vng3/5S5vZDO+SEfqoDPqzC0b44j1P1XBWXSlNAbpx/G+U6oS6M28eGFCO
         xYs8cUYQeNcpM4ngkyzKJdIfCIdhU4ZJcuXOkob39fc3P25eREVwoYrVHMKuU9WEwU64
         LXGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773079570; x=1773684370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a8XdeGKgfNmQ0ihM13m4/+pDXEjwuXh/6MDXE3f2Ssk=;
        b=RVVuhXSQhU7wUg/2P8MSHKgIKFKXjmyGgk+/FYJAv7JU73ss9lDlL1pl6ZM/TMzX/H
         LHXo2Nb82wBKi7TybH8sP+rtQIMAtN84MXRzmFpkIODWnVk9cTpa0Qput+nGjlCSn0AF
         sLX8VNWmr4TL706K65gTN+pJ6iNwLD/nFfEi4FUr5J9o/Ygkeayw9IyJpW30zCLTibEG
         VrdgS0f7op1ddaMR8OV7LX6YYXVj0tKst6ogd8rEpwRFrhd5TzL5T87EXrLdn/ft+IcZ
         fnQlSq70pheiTEV8ue6Q2bNlwxL94V58J84jEEHXeJJPF7HKvVdx3Yl44gmHC4lLbjGz
         3yaA==
X-Forwarded-Encrypted: i=1; AJvYcCViznDlSLv6MopqpcvqJKo4ZK1daI6PrST5UKUEEaGNC4QZAGOS0ZK08dqSyxFAlqVEBgG/nyoK2wYNcoQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwB+rtZX47TmyCn9VxQ4UwaIq9WD0G+rTe9EDxPBbFNqcmrNtOR
	RMqZs2NJW0VM0Y5M9wytjPZ9FoxleOG/ILf2xoM8pW2Ac3bxHdiNwLS7mdbjmh5yMcRiCj9gRNp
	IlNckS8fa+QzsNEIkDfXH/ZvHbAWKBPbQM6Y0UysO
X-Gm-Gg: ATEYQzy8SQBHuSGYxpNl8U+xGyhXaLWlum1+LugrnjufqQty2o55Md0cN1/tUpDvmlD
	UAxx0TE5WABjgktXRMnScalDdqq3P/ss20X4snJZ2bpngwuHppppi7p01gp7nWF5THT8kBe1NsB
	+bkDwFGJutteEt0tumY+Lu6HqmgTmtMC0mh/TJ7IrzW049Q7Qk44D/pDQ8AunscpbJkedEGU2KN
	ZtjbiAXgNx0ebrkK8rMZrVm2hjdCx4hCujIFJ/he8pjclYq/RXk3PP02ybpEoSnajOmK92vK+JO
	Q7d+uM41zgCVVih07Ll3w+b4se1a3BDgKu1QH0uQb7NBJQ==
X-Received: by 2002:a17:902:aa85:b0:2ae:8039:fcb0 with SMTP id
 d9443c01a7336-2aea3122a7cmr154565ad.5.1773079569456; Mon, 09 Mar 2026
 11:06:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com> <20260308-tools_build_fix_zero_init-v3-27-6477808123b7@arm.com>
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-27-6477808123b7@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Mar 2026 11:05:58 -0700
X-Gm-Features: AaiRm538eyfLQGrSYDrM92WeXq5PMuuL8X7tS3nLFN11znCK8k6pxl_hktQ-lc8
Message-ID: <CAP-5=fVR6cTg4HU_DvK8sckgAqWw=HbgSGSdY9-prjb+TiOzbA@mail.gmail.com>
Subject: Re: [PATCH v3 27/30] selftests/bpf: Append extra cflags
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
X-Rspamd-Queue-Id: 1DC9A23E4F5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,google.com,iogearbox.net,linux.dev,fomichev.me,intel.com,arm.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-11738-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,arm.com:email]
X-Rspamd-Action: no action

On Sun, Mar 8, 2026 at 9:50=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Append EXTRA_CFLAGS to CFLAGS so that additional flags can be applied to
> the compiler.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/testing/selftests/bpf/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftes=
ts/bpf/Makefile
> index 72a9ba41f95ebb825d25799c07ba3f0311243e45..29dfcdbe98c781b53f1e87dce=
becf2027bafcd5d 100644
> --- a/tools/testing/selftests/bpf/Makefile
> +++ b/tools/testing/selftests/bpf/Makefile
> @@ -49,6 +49,7 @@ srctree :=3D $(patsubst %/,%,$(dir $(srctree)))
>  srctree :=3D $(patsubst %/,%,$(dir $(srctree)))
>  endif
>
> +CFLAGS +=3D $(EXTRA_CFLAGS)
>  CFLAGS +=3D -g $(OPT_FLAGS) -rdynamic -std=3Dgnu11                      =
   \
>           -Wall -Werror -fno-omit-frame-pointer                         \
>           -Wno-unused-but-set-variable                                  \

The append should probably happen last to allow the default values to
be overridden.

Thanks,
Ian

> --
> 2.34.1
>

