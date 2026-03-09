Return-Path: <linux-kbuild+bounces-11719-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gG3tLi3/rmkLLgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11719-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 18:11:09 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8A723D6BD
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 18:11:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E80D2305DA3A
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 17:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 866CD2BEC57;
	Mon,  9 Mar 2026 17:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NWFGVtEP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908262BE621
	for <linux-kbuild@vger.kernel.org>; Mon,  9 Mar 2026 17:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773075844; cv=pass; b=NvwxxHvtrwKJuYfAgid8iwUZ6V71w4bMtdGTeq6pNFuLdE0MvqqMqVuFedZMn+n0AKF6kVrY/4jnBZpvonRTA8CdxsQdjzq33dTjy0t9Grl5XCfbDXl1/yJuepdNmFqOEZhLDoYNOIGkN++S0m5dkxW9TEpm+rfAmSFnthciizM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773075844; c=relaxed/simple;
	bh=ASdF+Mq32+mdYKDjWTsjOQ8jTq7m3B4M/EbHwWyjk4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oAy0TUdzoftauOPI4/4ZGC1AeHhpK8SsdG6DvB+Nbf9lq77RofvQJOI2IY78FIvFf/01Sv52miQzcjQ3V3TEEFFaBLxkdYd8xSrBUi49NvU+b7GTcf3qZoxpTErvh0FkYmdXtxTyih+yhJ0ZUXvcSZLHsNJ4xIWGyzyPXjBd+aA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NWFGVtEP; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ae49120e97so8395ad.0
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Mar 2026 10:04:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773075839; cv=none;
        d=google.com; s=arc-20240605;
        b=jFsNImaoNKs9uRhQb2JS02M0+/XYYbpPFewJoNVCIyibUVlOxg59APD4MzlNFcWPhB
         qt/SM5LT8YHPIbWdOLIAEnGVp5r6WaFuiD+NFzaw8Pcfgfj0zsjpJKEjp2MjZWz8T0wu
         4r483HKEK2mwsZ4TeLmfaxrzjBI6qpXT/brv9F+fLW5rIlL8qUJtndOcEaIZ6SE7qb3E
         K2oTRgBXhtgp5OBzdMwALCZLsYlvk4PjSrk/B4V49mZOg3163wMrFIu6o7f/56bToPNi
         qAP8h2fZfGq9qtBdRhVA/5EyqVa/Zv804X0ywGPuUJFpaBKrXD9kWmGUE+lM2urSkqBf
         F6nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=waNBZBIho4Q6qhndz2br3MqS0TFnbVcCKcfXaRGOh+0=;
        fh=32s45QOWUCViB/OHX3oKkp0YnR7dqOskmNzM6Hl4hsI=;
        b=b6tShCHgjGD6U4QaaBRSaNgRDYgTBsXb6CBGCzoB0eyEGphOs398wuYgDgcRX1E7Lz
         MrMrnzxfX/IFVtuBJcEhtcWfF1DRk+c8iirS167lwdlQLpzuO6nnmEi4jh/qorH2V6oY
         JuMvpvBQKNmTzB6S7ZrQrqk6z4qmV0fGHIRNXkyjLePgSIB9a0pTj41C8MOeI7LxcCRX
         Z27CS/aWUDKRfwlufyLx47YKyLg+b3SiZkL/VDrUZ98saPd3BEqNN61jbwA+9uLgXfeN
         s3KsqbEw89mDLdaJYi17M6X34kphXKgqwTnzYFrQs/0Zylj+nSGMCEKGcmcZ5yJsKxLw
         9NgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773075839; x=1773680639; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=waNBZBIho4Q6qhndz2br3MqS0TFnbVcCKcfXaRGOh+0=;
        b=NWFGVtEPjGwnm3AV97g0SDvhJ/Z3zzMc6n0/jk7mGvJkQlhelIdLrTIkxH1hNMnN7h
         00SwW9XOPz/BOevtUkq7gjPt4TgREwDPd5gn+hiRQ58E4kRke0zIMsmMUXhWH13f8xg8
         aHjQuDIwEwxuQIrxIPNyi7w1mzJ1rsPJJBsxnhNP2TSmVwlLS2YBCVwGzhzYRDgDvLrD
         vgtAs/VP8LdyWRUFzY1zS2f5BBtgMa4Qc3S3QW93Jq8aqTFeX4zwChZkv0gJzgYikdrf
         cP8AqqOfSdkxmfNgFWUZ10S1n5y1ETen0p2GL6UmYfDQQcIUOkhS6Cb3AEPOVIw6hZvz
         58UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773075839; x=1773680639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=waNBZBIho4Q6qhndz2br3MqS0TFnbVcCKcfXaRGOh+0=;
        b=GOLUbbtor1McErflvkiVvnZOU8V06gOoV8V6gciqqfY4tOg7LVlAShtgYEJvaczl1B
         +JW5v07wNiB9pBUEoAC8qBOWLuV0dMhcCsSwBsXjN4CPHOmfgG3E2aCkdLS19A5OV9Dc
         0v4OC1TmJkOYyldn/2w2IxQReULlbW2fCJppve/Zl2o7FFHF0zUyjYQELHWbWYe2sglo
         sgLv9DN9kh982cYmHglPQTZhvzHkYMuC+yZBqrtV4i1TfDv8T+0fW10USwh6P9g60PJK
         6i1GbFdPimCTFnvkDICXiO6GYHKVyrCKIkaWiejx2QgF0TKRFXlCd9E3s9uA0/o7mTCq
         hi9g==
X-Forwarded-Encrypted: i=1; AJvYcCXPpFfcNXieAlsF7XScDw5BOuodq4Z9s6hIrCbioblnX7vzDKlMVy6LoYXPNKE6zBr8vPYFuRFf/U93Gzg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz7x4KngH4jREE9g+rfkIEDQQXCGRXSywp1dJZqtk5cBWR+CBh
	EdQI+FlMJ49c2/QPIfMbxicVtZ1DDhFFSP9OoTTuMkT8oU3+kqN86UC33s2spsqC7wIRbd8iADQ
	iMNtxgwJzEoYXFyUNqfn9iZQ9plmEzBBuQzhMAa9c
X-Gm-Gg: ATEYQzwYv6y6ZtIV064I+bIQ5501w3FKvI/iZ8xnRXOeLnvEJTSPO3H9vbnKAyn3Vi7
	gh9PfQNGhGYMLK3Bz3ScUyJ7zUiXFxxWVxyZMWBY6UOGRVBpc6CqidfIqrHpGC1nnLnQhr802Jl
	7kGM+bP+1owy09Lzum3/Jzsww9IojbSMwzP/xib17nXYVUNxX8rU/P9SqVR8lw84aUGC5D1ruf3
	62NZNBO6oYB95WH25wnoANgf2LSquEBm98KITr4Et6YT05rYmEBLMF7bmIxusOt3THTVIwO/odo
	Vvb4enY1fnavduOhPO427jh69f98ds7RzCo=
X-Received: by 2002:a17:903:40d1:b0:2ae:44db:570c with SMTP id
 d9443c01a7336-2aea3053fbcmr53805ad.12.1773075839042; Mon, 09 Mar 2026
 10:03:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com> <20260308-tools_build_fix_zero_init-v3-2-6477808123b7@arm.com>
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-2-6477808123b7@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Mar 2026 10:03:47 -0700
X-Gm-Features: AaiRm53Xzo9WAGNyLfx5oOgp1hEVoxj0zvCDJaSL-xxCQXMap_Y2Qeu5UcpeDVU
Message-ID: <CAP-5=fX7f69cyuvKwXbJWz_njdHNdcoJxY=wWPCcz86XMXBX_A@mail.gmail.com>
Subject: Re: [PATCH v3 02/30] libbpf: Initialize CFLAGS before including Makefile.include
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
X-Rspamd-Queue-Id: 4C8A723D6BD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,google.com,iogearbox.net,linux.dev,fomichev.me,intel.com,arm.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-11719-lists,linux-kbuild=lfdr.de];
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

On Sun, Mar 8, 2026 at 9:46=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Initialize CFLAGS to the default value before including
> tools/scripts/Makefile.include.
>
> Defer appending EXTRA_CFLAGS to CFLAGS until after including
> Makefile.include, as it may extend EXTRA_CFLAGS in the future.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/lib/bpf/Makefile | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/tools/lib/bpf/Makefile b/tools/lib/bpf/Makefile
> index 168140f8e6461bd06db40e23d21a3fb8847ccbf4..76cc802375f67b9d8f589904b=
d9764040947e5dd 100644
> --- a/tools/lib/bpf/Makefile
> +++ b/tools/lib/bpf/Makefile
> @@ -49,6 +49,14 @@ man_dir_SQ =3D '$(subst ','\'',$(man_dir))'
>  export man_dir man_dir_SQ INSTALL
>  export DESTDIR DESTDIR_SQ
>
> +# Defer assigning EXTRA_CFLAGS to CFLAGS until after including
> +# tools/scripts/Makefile.include, as it may add flags to EXTRA_CFLAGS.
> +ifdef EXTRA_CFLAGS
> +  CFLAGS :=3D
> +else
> +  CFLAGS :=3D -g -O2
> +endif
> +
>  include $(srctree)/tools/scripts/Makefile.include
>
>  # copy a bit from Linux kbuild
> @@ -70,14 +78,8 @@ LIB_TARGET   =3D libbpf.a libbpf.so.$(LIBBPF_VERSION)
>  LIB_FILE       =3D libbpf.a libbpf.so*
>  PC_FILE                =3D libbpf.pc
>
> -# Set compile option CFLAGS
> -ifdef EXTRA_CFLAGS
> -  CFLAGS :=3D $(EXTRA_CFLAGS)
> -else
> -  CFLAGS :=3D -g -O2
> -endif
> -
>  # Append required CFLAGS
> +override CFLAGS +=3D $(EXTRA_CFLAGS)
>  override CFLAGS +=3D -std=3Dgnu89
>  override CFLAGS +=3D $(EXTRA_WARNINGS) -Wno-switch-enum
>  override CFLAGS +=3D -Werror -Wall

Not a problem with the change but AI assisted code review noticed
something unusual. Below here is:
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/tools/lib/bpf/Makefile#n87
```
override CFLAGS +=3D $(CLANG_CROSS_FLAGS)
```
and $(srctree)/tools/scripts/Makefile.include has when CROSS_COMPILE is set=
:
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/tools/scripts/Makefile.include#n116
```
CFLAGS +=3D $(CLANG_CROSS_FLAGS)
```
so it looks like the CFLAGS is duplicating $(CLANG_CROSS_FLAGS).

Thanks,
Ian

> --
> 2.34.1
>

