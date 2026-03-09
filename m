Return-Path: <linux-kbuild+bounces-11739-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLk7CY0Nr2nHMwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11739-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 19:12:29 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D100F23E5BD
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 19:12:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3CFCF303A3D9
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 18:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8BD0331A4B;
	Mon,  9 Mar 2026 18:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mNmsrxK3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1B52EC08C
	for <linux-kbuild@vger.kernel.org>; Mon,  9 Mar 2026 18:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773079601; cv=pass; b=b/EXHoMNEOLoEkVWLz90lZh1T2PxfwC12eoRIDavWd06pwAT+h11z9alDJcgy3JfN8SWj2MQqE8/j8Hp1miZnrwD9YigNKRRPf6hj6NSDnzYNZ9iFIfyzhyg6NJ4pOEeQdifYnhJAW98TLlmmPi/rFI2sHckFBlp+QQ4PNQgUIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773079601; c=relaxed/simple;
	bh=5BCddBznHBMpCnfR4x7BgUbDIxp1InoJ/1cNZt92Udo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ET6XsK3BU2TAu7ENaEiWcLB8Xg1PQcvTv9xk4hZSK4Rqxq06DqDZOpcKmtUt/O7gvKC4+uJyTX9d0tg+EGdCE8GUJTGTJuKrqPoEyLoaXv1zzKeYkpKIsNuSZKbs9Cf4a0cdYqpm8Na4vhqj1EMEJErs5fmauz7sahQO7PXqpS4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mNmsrxK3; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ae4b40999bso17865ad.1
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Mar 2026 11:06:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773079600; cv=none;
        d=google.com; s=arc-20240605;
        b=i5w/0Je31I6TpuMcYJTJAUJfYmNlxbP2XPFJsPePw+TPhaxCFedxcPmSH2cu1tZXd+
         XoU8D/OAfgU+S3VJja4WghLflGaNce1m9z5cdIj+TDuZ+GO90D03su+uUnHM6F+F6s01
         cnHWqtBqVbHWaqwIWkJRMmD25cIxMJ9zWwnpJ03fnb0+nDTfBE+8AuiqoI/+w4JZ4fKV
         F0HPygdZ7VgDo2CVAKyJl+gJYPjkWDvVEpAzTWkZEIz6GfciJ7NYPfWHJxyFlAnyzyPt
         ewTgqHC99ftlik8kPYvMAz/YMV9Y90Etr+loxRl3NRZweO1+ZRD8ZhYN3hQiDR17eJzf
         MPZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AmKGpbY3mrkMMiWs2SN3h57jVWc6a6COL/PKyMDU0SA=;
        fh=FwQKh+HurW1vWUIBgbckntWV8CE5prNj+0KMlNGX8c4=;
        b=Et0iiFUozV+Y6vW68BQJ+VE7vRT4cVsngQNYBy533VZhikt17uKSBUDib/e9KFLpX7
         lisGfKKc+zsVVom2XpraTGec72gt38Tp9z52elfj9TuPlMXgGWGtfRvbRcxF4E8lPrsI
         mnHLKW03ytVyip7xR+Or06+3/lDP3y+X+Q216KuBg6P5FRhrHsXIQOBt8bEkWGUlRASQ
         F9fTNssF0Hb+yhqk+fR8wrlp+uyr0VZDDZgr2QkHp0SSq1Q2SLAF73OuK428/8TEYgip
         zaRq6KLS8Y/C1bZ1A73ONmcsqVCj0HswQpIovaO/eHfD6bSvPJiQbWgmzRILECAsS3V0
         Oz1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773079600; x=1773684400; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AmKGpbY3mrkMMiWs2SN3h57jVWc6a6COL/PKyMDU0SA=;
        b=mNmsrxK3yTC2djju/gid5Fyhgsxm3nY4UFdIqA5vnoGMHel2t4CGNVRHrdSeEydgGH
         uSx04u9NV7tyby4lVdWGOegUL2uCq0Stk8/kvyRULe+HdUFa0AHAkD5ShNPotXY2qJoh
         PKEPCjztm5FRUS4eMCyA+0cVtp70Rm6QFRsq6RxIBW3bUn5pZG4vfRpu8xffmAtmJDMP
         s7WIXi5eqiSlW4MEY4Neya06647nstYxpp/dpGVy37Dz0HdZgo7ba00Fje08ThLiLMTi
         o3Tz6ekaBFVdpz82URUqzhGF7AITvg5uPb6dFm1hHJCF4KOmU33IVHkvY76xZBzjMM8a
         3h+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773079600; x=1773684400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AmKGpbY3mrkMMiWs2SN3h57jVWc6a6COL/PKyMDU0SA=;
        b=IW6/haF0KvwQQHoRdoFf7PZ8qSbAu6pZ5zfxrwaHvCfWPuCchGKEKXDMKZuO/ItLNf
         hrkFwz+IoWpKyPEHVIQKuvZ/d6iSilwda4Qerfq40HFZ6wF3yy3oDiY4QP/P1/Oi60KC
         LHWM57rkkOxsnWU+hPrB3USKvGy+osRbdipHxKhd9jW6EtRnLKSFCNQlkGZ6etqBdd5t
         koo3yx9NIMBbuyD2iHtIije9lRXGC8s/WqZqmIVB2KGBIUJQTKl3dfI67s2xF8n8YKxP
         2Ng+7y+XmPYqRXf5Ig3jUhABoD0G7ZaI1OnQ7ulheQLu6EIH17yAyRnnV/xuEknRJrgu
         mPfg==
X-Forwarded-Encrypted: i=1; AJvYcCXo3/GW4+/E9en/LQwlcSzArOVPo3zVuSWGBF7oVDJ7CU9o2AIYFRehY3zcdn4lDP8R1JKgJ11mn63tROU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMUgrMzGFLw7fdeaziUC9YN56WvgcEuf1Fw6ixtJWstyMb/NGd
	4zhgq0qdyPZUAkXBFd/W6L6jHfhoZnAxrbX0JD1ShfLe2iD0n1lr3Sa8Epf0RTXVwG11bqf9sR6
	i3dQ9dNdyy/vBuGK+CcPcOBr/tueCGmxpOwOcuqzh
X-Gm-Gg: ATEYQzxKMyikYVh2tELB2dHHT/PVrtmm5zUH2x0RbqFTLu1EdowoOM1O9hPO6CzwBsQ
	ZU7W5j7WY+qAhmCEADA2+S9P8vWGAYmuwQEnTL1uaeYCvDHZrVeFxgsijiPe5Wpv2wtAZ5BHVIk
	R7XYxFieyfz4FEJ7bWn2OWrRe69n3KKMtuE9URVKnwlVn6lkkKVRMp/5J1wQ5+HbF1JzG8MOeA7
	kD5/3QNbmLQXQxNQr6o5s/eM7ozsHiANMEYpobeUZ4MHToVeAxjwMILqameZfmIgWdMEReIuF2F
	U9Cht44jGg3ENMTXUo52CQlGmD7fcKMkRfQsoLozkZsaBQ==
X-Received: by 2002:a17:902:d508:b0:2ae:4453:3674 with SMTP id
 d9443c01a7336-2aea301e6d4mr356985ad.4.1773079599358; Mon, 09 Mar 2026
 11:06:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com> <20260308-tools_build_fix_zero_init-v3-28-6477808123b7@arm.com>
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-28-6477808123b7@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Mar 2026 11:06:28 -0700
X-Gm-Features: AaiRm50VcNaU0-sQ6heYDrcoPU8N1ix0gE-QK1YHwS_OqKqojBYetu5zksjNqTE
Message-ID: <CAP-5=fWqju3_+d=w73DkvdS4cnrfhnd48H2ZLqsSRkKxjh=dRA@mail.gmail.com>
Subject: Re: [PATCH v3 28/30] selftests/hid: Append extra cflags
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
X-Rspamd-Queue-Id: D100F23E5BD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,google.com,iogearbox.net,linux.dev,fomichev.me,intel.com,arm.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-11739-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,arm.com:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Sun, Mar 8, 2026 at 9:50=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Append EXTRA_CFLAGS to CFLAGS so that additional flags can be applied to
> the compiler.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/testing/selftests/hid/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/testing/selftests/hid/Makefile b/tools/testing/selftes=
ts/hid/Makefile
> index 50ec9e0406abaf316fba232c5da1967e27d0fa9b..d0dfa411af9b56ea3458184b8=
a81ef61bd44b1fe 100644
> --- a/tools/testing/selftests/hid/Makefile
> +++ b/tools/testing/selftests/hid/Makefile
> @@ -24,6 +24,7 @@ CXX ?=3D $(CROSS_COMPILE)g++
>
>  HOSTPKG_CONFIG :=3D pkg-config
>
> +CFLAGS +=3D $(EXTRA_CFLAGS)
>  CFLAGS +=3D -g -O0 -rdynamic -Wall -Werror -I$(OUTPUT)
>  CFLAGS +=3D -I$(OUTPUT)/tools/include

The append should probably happen last to allow the default values to
be overridden.

Thanks,
Ian

>
> --
> 2.34.1
>

