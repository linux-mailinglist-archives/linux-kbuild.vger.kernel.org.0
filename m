Return-Path: <linux-kbuild+bounces-11730-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKvWHuQNr2njNAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11730-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 19:13:56 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C0E23E64A
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 19:13:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D7DD6306F0CB
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 18:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36C323E51FD;
	Mon,  9 Mar 2026 17:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3Xmc5G3e"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B202C2C15A9
	for <linux-kbuild@vger.kernel.org>; Mon,  9 Mar 2026 17:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773079115; cv=pass; b=MYNFt8FdDP9GHNfVzmLfBGHLmTwiP1y5cVz/+CMZ8m8UWY/9cPrHaeDuA9KO4zMtnAOhjWt3vkD9tJrKVinvW41rUvzetqLu0YziGyV19/bajViwUMd8MUrOUmVL+XVkNSakQTnGbx3U67IdxbWM2NCVmgtv4daDK/omYOnNiOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773079115; c=relaxed/simple;
	bh=1xHBM1npckFnBQ/QU7s8rXIaGuuzzkPI1ggicrM5qec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n7IcLUAE8d4aXqxfjI3mrsjGZfqjHdXILKYCCeWMUrVryE96QfbQBU7v3q76syG/891vE/FgE8/Rs2CiPwUTtYXySrvWrlPGdy4bE0/WQPghuhJBh3jKad1whAz1fuftbY3gY7GFnEijFvMDzNCD5I/+GKOkVdB23iqwsdR9AI8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3Xmc5G3e; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ae49120e97so16805ad.0
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Mar 2026 10:58:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773079113; cv=none;
        d=google.com; s=arc-20240605;
        b=RpXo/e5Bw+Tcva5bydfXpV1KPPGJhGEI9p8KkMzwfiv5CqR73b2Y19/MErrZil2j/M
         YOyfNsMZ5AdxPKcXUofld2WcK1S3GhZpYPrwBA4nlrMhFMa4QxKw2SzJiU/yq5Pa5R57
         aTTGsdEKpKhslVp4gQ9mmoc+c4E3IKtmL6Qd8A83FQ62p7V4DkEPc1rJV9wOqT+T28oj
         ThzuKUhPdUCGE2uHP6MAnddmxs0pwvleLsWBIfscP9dg548gwTYhajvBGi7IZDLEZsOB
         gB+VeEeJLNn7NhB7+aykxdBJC7Ewdf5E0KCLQs1O13A/rnDpioC0rBwJTNupeGtjRxce
         NM8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=slXFRZSUuUHYd9aE4MbVYMvGfHoCqJ3GVsU6T8shJBI=;
        fh=SyfxUWv7JpMkDTEX/SXNxko3hjkPoQqks4D0JlNxGCg=;
        b=N0a+PDhlFbtnr6/giOeUUTiSsyLwnksJWl7BPA8avat1WxHY7qok2o13RSGJfKMq7t
         9YuZJv/BOFgMM76XOueyuf1Px6QCI748LRoAea87cvHMe9SX9nMotLHwHlGY/PWcVK1T
         xgdFdx/3nwofThhmSr313ebjre/5HBrFgSHojBx2JAxlwR4JiigeXWzGWLWYOBuB/9f6
         +7PTV4QEe9zCSDbazMSsayRzAqrX9Bd4bXuQvdhbUQVxPaelnkZqJdM10slkRHDSptfv
         HVJ6MBqpfcoebpGC/tMMrQ9hR9NuEdHaIavZz4Zn7jDPgezUVUB5QpAILDlCXaFEtBGV
         XvnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773079113; x=1773683913; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=slXFRZSUuUHYd9aE4MbVYMvGfHoCqJ3GVsU6T8shJBI=;
        b=3Xmc5G3e7zPvXB4gofrkRvflwDClDpHO4wEIDB8a8vEZdSirLahrd4h2BZza9zr2rr
         nRO+5+qwiSx6iKEX3762ZAnEJNQHaOUfJcVZ0oEiqgGaPI5OfoX4ovmvFQQ/DT/CSXGS
         8oYoXxNMur1TvkQ1ne/dHAhusXqaDqE6scSdGUA+C3Z6IESRFy2I0HZQF0cwjl6UV19G
         Go911vA2T+CtNqBkAVp+rhyKYLB5aWLcg+y9SsbB+dccvAeLcTLFEw78ov8hdrEkD+yl
         pdR+MA9c2XxBi9JjnaJK5tmQr8aASMar+uRkMenFkLqwnZl7XUAwO4o2x6HLzPYBFOEI
         RQrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773079113; x=1773683913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=slXFRZSUuUHYd9aE4MbVYMvGfHoCqJ3GVsU6T8shJBI=;
        b=s1RFS5bBzmvIRT7xVNiOPwS3fpnfNFXuM00Dd3X3ip0p6/s9n5ITip4RY1IBiuFtvp
         iT1IQ+BFt36ZzOowLyhH31nynGZwMkFXTTXlX3DFtbEMs0u/FQ6PqQADnhws1a0D2FQe
         B4hEcMkpR8A0yj9Oqaum8ZzijTVjjLbZbVrLWVJyCJ12bnqXZvDalfW0qCNaYBDk7OSw
         JuRwbGAWNImSZDISkf0G5xjmZUxblChTIASqJWp1Zf2CD2/H1aAU6PLmS7ChW7s/CCdZ
         zjY3U07q9CkQEn4oLv/nRj3oom6HLNs/qv5WHCZXBs97H1B6Va6092CTYIV1XaMXOzJl
         O/NQ==
X-Forwarded-Encrypted: i=1; AJvYcCWz8+YJfKhnEr+7bAynKsm+YmND0XkMn8FQIDa2lC4GWj39QiIqcHg//JQCLYfMrwaXrWUyye/qUMTxbgs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwe5aAODlzRU9ES3P4IgPQ+9v5kuuriQkmjHDMarUd/jDy1vSG
	cE3ZCbrIozxpAPxa3EZLuxucyLRbCAmvqfQlfZlGZxgnS0PICgtw+mfZgRu7tRbzf9EUkGgtqQy
	u+F8i+WLqADSFPPZtTiREtUOLR8iZj7SmqwoiRRMQ
X-Gm-Gg: ATEYQzykS4ts8kdmFgAQgdfAsNvHIQ3jSrU482cdBZQOeTIvjiNtL5h09aogOBFlW2A
	EPri/03aTDZRLKLWUZenrwAbR2qle/IVzRkVTGZmHFPk83G77xL1qdgIqLPRHWHIxZi6Q1J88LN
	BRWiklsYUtj0jhBaHWUKvAhg5aiRjr1FXsi3xFfKJ3eLbW7yg5LUgN4whZEKCfaiqDJjENTgd5s
	b3BkG3FCDq+Q621Bb6trmdy/qCVsJm96zlfmabQyR/o+LnkXfMzmPeyOkkKtAOc2owDunlYqpkn
	0KJGSal9JdNFX9B9YgoQrNQCcZvx1uu53vq8nVJwMdwd8Q==
X-Received: by 2002:a17:902:f70f:b0:2a7:5652:50b2 with SMTP id
 d9443c01a7336-2aea324799emr181285ad.9.1773079112595; Mon, 09 Mar 2026
 10:58:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com> <20260308-tools_build_fix_zero_init-v3-15-6477808123b7@arm.com>
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-15-6477808123b7@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Mar 2026 10:58:20 -0700
X-Gm-Features: AaiRm51s4uFr6B2kmJ1teMsm_yMIkBYdnRBaZ4VTor_pU0VbgMb5xyzkSrea21g
Message-ID: <CAP-5=fW1CXWUg=LS4V_+988LsukYuBuKX15qY0-vTqar_Lz5qQ@mail.gmail.com>
Subject: Re: [PATCH v3 15/30] tools: hv: Append extra cflags
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
X-Rspamd-Queue-Id: E9C0E23E64A
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
	TAGGED_FROM(0.00)[bounces-11730-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,arm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Sun, Mar 8, 2026 at 9:48=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Append EXTRA_CFLAGS to CFLAGS so that additional flags can be applied to
> the compiler.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/hv/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/hv/Makefile b/tools/hv/Makefile
> index 34ffcec264ab0fdf7075d25456ef012cb866796b..e39c16325b451ee7c2ddc581c=
c4d168915472ed6 100644
> --- a/tools/hv/Makefile
> +++ b/tools/hv/Makefile
> @@ -16,6 +16,7 @@ endif
>  # (this improves performance and avoids hard-to-debug behaviour);
>  MAKEFLAGS +=3D -r
>
> +override CFLAGS +=3D $(EXTRA_CFLAGS)
>  override CFLAGS +=3D -O2 -Wall -g -D_GNU_SOURCE -I$(OUTPUT)include
>  override CFLAGS +=3D -Wno-address-of-packed-member

The append should probably happen last to allow the default values to
be overridden.

Thanks,
Ian

>
> --
> 2.34.1
>

