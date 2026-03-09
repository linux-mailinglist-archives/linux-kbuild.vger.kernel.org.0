Return-Path: <linux-kbuild+bounces-11723-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLZ0E5sGr2knLwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11723-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 18:42:51 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BF36223DC60
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 18:42:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9462F300888D
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 17:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE3903BE162;
	Mon,  9 Mar 2026 17:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rFOA7vGO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC11B2367B5
	for <linux-kbuild@vger.kernel.org>; Mon,  9 Mar 2026 17:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773078168; cv=pass; b=sdTA/DDqs0lOs8vgHqtAqn4mFPZYkW7ONa2sSfX/IYsCluG+d6xvFolJcMrCjYUXSQfZN4hKP7UsxdoNVtImqAvq7MaQNOpDdEAO0yfkfe4bhKgDFf/FXoMYJXmPPUX2bLl6tl8SKlfoqUnkwgm5y5IIlFRufjg9GUwWxPkuL4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773078168; c=relaxed/simple;
	bh=t1FsZ8AwRGJsG2F3mctGRLTHPGEfEzdJEwNT+r1oShk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oxaX27INtd4VEk14S4ouIEquuQVsRy0IZfw2WH3eAZEajpQCcxIfxE2B+lciuYRdrzgJb3qjFDumne8DaTojVl0mM86vW0zFddfstweTBsFxQK+k6GQo+LyDEYLrq5XZvvSsgh384PGgKbTXfq8fOnvOD3DP+xxn3mZs3g92KXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rFOA7vGO; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ae4b40999bso12465ad.1
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Mar 2026 10:42:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773078167; cv=none;
        d=google.com; s=arc-20240605;
        b=PinzRF4JOyNiNn4UGBHRKjS1CFPHAYiK32WkzygBlnyV8m1cMlPMhss3hGR7BEWu2Q
         ZQ9PfQFx0xwMCGUoAMJ4PNxsFR4yRIs1mQPB8sv7ZDmGQ2C6XqR1njHH/9eBrem4SCDd
         fWENA/2Cv7wtHs89DXd5wP1Nr8WsdBGCYG4IhlsGHu9VsgVMzv80Du0Kx3tTXsyn5Faa
         dmx7BdZBQCsewuwD8jG8ijm+lyvW0dTLKQ/G/EoFwco6gOvqwUq8rqEVTnH8+slq9hNb
         +fF7BiKm8h5x0nDSEsUL4x/W+haN1Yz2Eli9H1/t8eOS5J4o9nVcQ06mLL9oHL8PDB/N
         gUDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HeMbooImq7XRfteaXymWNoOOhKFZP8D3AO8LBClHnvM=;
        fh=qg3mltQmqqATjZjRLIMBKauC61q8pQihDRSLnb2nfKU=;
        b=DsAXyujdtLwXS/QKP658kwv8F8LL3CgaE8qcoAx6sVYP7k80DFu/TJXto4hrGwGDV1
         Kqnkn0RQNt3xj9+i9hhkWQ4yHYu9CFl7IRIbqcn4wOMBxfF8geQx8crpfeOtp43epHpZ
         2yR3tL2AjdxP8Ve/nuZ316yZZYvXAt3CtWjaF6TcNr1y75OZ+HDu6RizYfUKnFIPzUt9
         y4beQMyDCh9LFmxnoTa8DPwBqx87CEdJtRj9eE91BpqzpYE52JWGb/TwfuN3Z3YKPWFE
         ofvIzioP4pPHgwIkngxGVGk2v0JXQx6UubgLklV8/E3cP5KZjGdYbZI4jxhlgxAmigkn
         k8Ug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773078167; x=1773682967; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HeMbooImq7XRfteaXymWNoOOhKFZP8D3AO8LBClHnvM=;
        b=rFOA7vGOUyqH7v8a1dQQTPuQsnZzzkFdGdrfmy3eeEXP3QVH5w+sJtA8LNhtPfWZTr
         sbmfWfp8r0mqrwiXOM/60kp2Zelo4gZpTBt0Tnd1Yh2b8wJA9sJDEjeTeCaLXXr9tuuj
         TC/shVKF15t0+j8D8pv7r7tPHagpTTI1mG2gywUPPVN9WwREFmN05UDTXFc0VbtJGCvt
         vNBW7waEhX/Yu5wgHVWbsEF7iUofy5tC5KgQMwnNsq+ajZ0ijNOuvlTq4yQQIvGYr0Ov
         JrNdpZQ4j4baBXCEQW1nGFg06uhUa7KIiETCvmlm4BGmpqL4L7JBeUk7CfkEYZyOpDj5
         WJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773078167; x=1773682967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HeMbooImq7XRfteaXymWNoOOhKFZP8D3AO8LBClHnvM=;
        b=Gr1PLuQC+NhotH8N7vY0Tg1IoANzvYmyYBsVMEDMCzOb6Fv5+hOh9HsLvj9/x3hK7I
         +2GTjIwr+w/nSe6k2dJ+D4LEgcNGKdQBloVLfwnR60s/rqMUi/N/cRXL37AZGZP+uCM+
         3X2ad9AZGXuviWr3S/uM+boX0+tMrC0nQGBCVdMmy4lT2Rv2m/cxIC6ZJ0Zjhj+N+JrY
         1zp8Gdo4tfFykdXuiVnKD9zgratLCktgZWw6qXvFssamMXV8V60PODlGvjvv7IjpdTYw
         e9yhQW4lpmvqXh36P5Y4b4MwJU4cdPKHQHMu3szUJOyDDaz2Si6K9aT4IE4BkbV8jTXI
         fORw==
X-Forwarded-Encrypted: i=1; AJvYcCXYoYmeayMx98C1Q3E2mlsTnOIwM83riIK+EboY9wapdqbBjYRFuOvZ8fhHnPgm9+sueKcEimgSbIXvM5g=@vger.kernel.org
X-Gm-Message-State: AOJu0YySXv7viwcwJnOyX4QEdI9Uezg3X9UOXwf9b/XJ26nH4geo4WT1
	Dd2peR1UT6pAV4aOekROgpB9wKLni4FFJMTdobfO6mnO0ZqwH8vRb3xl+n+Rcr3TYgTP9FXWl3A
	k07I7qMUfZLoIw0ABw3HZCNA9y1o9EwGzXUmG+b0A
X-Gm-Gg: ATEYQzzvo5AYTQgsdiKRRf37T7cSchZaGJKT/Yp7fCMgmushJAXwa0U+K+f1TnNRDc2
	xjkxecRTxSej0vFqBi/LFblVgZvdmzmPaPLNLoGVT8QynqmNQHHqZMi2WqwJ24dVAysGvQ+T41o
	TnrrQqTaqzUR//KebBbW6CUInpKkGIv0TAPE/2r1TW2RPUPlGgdL+hCh81AuZE5qSN94FaW6Ity
	RvVaFBgmh2R2u6WOCJKyibGflplSLiSIL3auTo9FWFHenwLbaeKfGVJ3fKkYBzf9lw0QjIGUi6l
	KddEeKeqftAFH1uhzyu8aBfGFIX4TUNfizc=
X-Received: by 2002:a17:903:228e:b0:2ae:6755:a24f with SMTP id
 d9443c01a7336-2aea2f240e0mr278945ad.0.1773078166229; Mon, 09 Mar 2026
 10:42:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com> <20260308-tools_build_fix_zero_init-v3-8-6477808123b7@arm.com>
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-8-6477808123b7@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Mar 2026 10:42:33 -0700
X-Gm-Features: AaiRm51Zpc7AIVlXdWIwZwXjPhYHvP-DlYD-PFQxAE3VNul7LnsUe2Ks9NfP7FA
Message-ID: <CAP-5=fUUvztUFJUwBYcaeEuc03-S=JpasCmws6aoz2i8LZTRFQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/30] tools/bpf: build: Append extra cflags
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
X-Rspamd-Queue-Id: BF36223DC60
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,google.com,iogearbox.net,linux.dev,fomichev.me,intel.com,arm.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-11723-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid,arm.com:email]
X-Rspamd-Action: no action

On Sun, Mar 8, 2026 at 9:47=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Append EXTRA_CFLAGS to CFLAGS so that additional flags can be applied to
> the compiler.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/bpf/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/bpf/Makefile b/tools/bpf/Makefile
> index fd2585af1252669c59228af3a77320e449e1a1ab..f7d7978b4e2c1e592f980c2b8=
153608b9d821d89 100644
> --- a/tools/bpf/Makefile
> +++ b/tools/bpf/Makefile
> @@ -8,6 +8,7 @@ YACC =3D bison
>  MAKE =3D make
>  INSTALL ?=3D install
>
> +CFLAGS +=3D $(EXTRA_CFLAGS)
>  CFLAGS +=3D -Wall -O2
>  CFLAGS +=3D -D__EXPORTED_HEADERS__ -I$(srctree)/tools/include/uapi \
>           -I$(srctree)/tools/include

Should appending to CFLAGS happen last so that the user can override
the default CFLAGS values?

Thanks,
Ian

> --
> 2.34.1
>

