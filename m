Return-Path: <linux-kbuild+bounces-11732-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ITFMPoLr2lzMQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11732-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 19:05:46 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F89C23E2DA
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 19:05:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2A176306ED24
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 18:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FAAD3EFD3C;
	Mon,  9 Mar 2026 17:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JXcDKtR1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAC53016F7
	for <linux-kbuild@vger.kernel.org>; Mon,  9 Mar 2026 17:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773079171; cv=pass; b=SutvVjQ4JAMMuvKnDiECKqw8Z8QKpcxhDTIXuTGQQpEFYOfMdUSVCP3c7iW9yTa2cHYMtqGbv8SWfVBJGmkUIwq/pra+HXisc0i4s2Hn9EacW7fiYeqSYhyHkZZanWdP1SdyeEdLsRsr4wFHK7e/sNxYcy7sFVag+Pq0NRYC6XY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773079171; c=relaxed/simple;
	bh=jtXROgFXN+cxX3Q4sedN4Vfye4bLDvRQNMbs+Ut+9NU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hh1HNJzMo627axWa00TIa6gwgh8SpSpb0Lfc13klai7yvPBNef2PoRbvq87ugj4phNOZaxxyb311RE4FO0MjdrcC7rkaYyOyrH1KpmddxWs1eAt7MNe3ywzk86asMnLKXz+ctWWsTRoZrW7/6oBVFGenZRuzDYAQNYE6KeYr6tQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JXcDKtR1; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ae4b40999bso15515ad.1
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Mar 2026 10:59:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773079169; cv=none;
        d=google.com; s=arc-20240605;
        b=GfubMABgO5lZGrX8EIqHV0a+ff6bwyKlak7xxH3CoU0cXTlPJt53rQyuKCCvVAWdvu
         K9GJaze7IfFBNrdnOJljOrHTWAXhFEuHL4hhN0f7yzJpNGRKfT11x/hGcvkxFBlyDA0P
         62DVgMpPQMyhNtjgzqeVHNCbeF70LTQaFxjIw0VWyp0LvGEIflYNtNxDJiv5CcPxJPrh
         zqoAJCZkV0is2IMjv0Luc0qUPqrlgyBR6mMhMWho8ifDq5IuD4LUWMjrEuAENl52h5ag
         QBuT1Jfwq6eDTO44WlsZIfvqGnuL73bNA9ThjR3Duk8cAxxBN4diAtsy7yqZEfe6SluP
         +Efw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ctFWtlUv7s1JIakxz/VQBeCjue+g3dZBcOJ9UZNZBPo=;
        fh=oP2GitTWTUgTNZt5yG0EmCVxHjjQyWvStfS7JYkqsgs=;
        b=GiiCXZ2WEeUZ+DxPaf/g3Mho2ZajTXe4UQuk7JZ00Qpzh+cXW1+pBGHI1rQ/vZY/sX
         dZqMRQh/mTO9s7B0r+lEV19j++y5Pptx1GLrjoz4XNc+RJmb143m6Z7RQNdAc5d2ANhB
         Wz/ETe0L5bfrYrMpOZgydgqu9OgTDNdM4AtDzIm3+0UxIAAairNMAnuZts0VE3pzm/xO
         x+Yo32ZlgFqZ3k6i3t3bFdnut4hM5AMBrkX7Eo5c6uP5PIGu+xGd6zd9sQxvSCb0MkZX
         AqjA+nI9pCQrtwwtEPSFFZTeNvxEY/QjBgdb/Ei3gAPmUMS8otqogSRZPxHa31tHKDzi
         DL5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773079169; x=1773683969; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ctFWtlUv7s1JIakxz/VQBeCjue+g3dZBcOJ9UZNZBPo=;
        b=JXcDKtR185zHStqooQ2HoiG4ls1woxBQjotTexjxKS87O4Ko/VqFobYehcUvKsoLSv
         nVzaz/+0KvZZKGxmxbDBA4jBlXKbBkTfcEqLvErggtOcP0d+KBNSXLQ3rkWcZ+E3RR6p
         lq/UFl8TkWXjRmMfHPugjs88KXFUZ/ESoI3D7G4v1wwWOLZBeUF0wnXWtsQsl4Z0NiK4
         328lTGmxL7/tsT59PMTl1aPqFW/vpDXlSgglRmcKhvuuvdEsZy4DEz98rt3JuGuplxJB
         WqIBGvWUMmSzUpB/pMt2ftU50wBHK1cQh/rJUeDI0p3ClktpJK/vFC6tcpOqhlkqC34k
         D8pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773079169; x=1773683969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ctFWtlUv7s1JIakxz/VQBeCjue+g3dZBcOJ9UZNZBPo=;
        b=kxVTJvmuLnQkNrOAXVoRUwKqGjStQOENET6jIpr0ub7gtxFiUKv+0WaLMXwbh9jXHZ
         uTmXa53rov5eS1FWU4j7r1DR0RyBDLs9FWf3dcW8twtMyQP8JN6pVfV+jtJ6sRcrnfIt
         F2mc2FD6OTOpKiRmGtdRvIXZ7oWe9Fo/VZR+7yhSVS3veIquvnQ7gquO8NbuFbxK9AQ5
         u68oDoogxT/ECvXrGeBNUmWEPVgjH5Tr6WKPT2mBZ3fOk9GWQVbYDFqz6o8wEnc146WC
         oMrxh9gMFGGpD1bS301IAuToHibPNv4CBELtZ/0puQnIlVxTIY8xtxv1veXddjUjCn/h
         VUsg==
X-Forwarded-Encrypted: i=1; AJvYcCV2CXuo7IIICa2Xf/sXW1mYxH1Hzzb5g458/EeyqvUUWQlPnubk0FIIz9f3MKPHNpvfWcSRBLiOG19jctQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMt9hgo/KQ/ch1JU2zRwwyIpLikBLhwCA07JsJZ9l1NsNbpugr
	8vMbubagI1W//3VzFdlcEhDutZO3PdKXWuQRqqe0Un59DPc+oJ/h72g+ZPc+qd/BTYNF1tfiB9M
	OoZ3cXIj3TtLlLi2NxuwX9MaM7+u8eQJK8ZDu17gZ
X-Gm-Gg: ATEYQzyAsNsfjYGs0a+9BlKnRFxsd7icTZC7MgJ8JZO84WqRgnk2R3VdM+8y9APQQQ3
	12mapb8qD9uqBJsM5VHr+e/rox3o/1BevgFElaV0sKTaVLDlhDNy9eGTbTzDaQBZ1Q94AZW3dsC
	nHiGFGEJ6VC5NWe3VfSDezhYv5CfgSFGnPNJnYzTk2FFpYj0K/rZfebiTyWStfCljlTbNhi42q+
	ZbD5bg3rNg2BNzq0ZcmWmPpliRFKpW2C203kz5svFy12s4xskHxIr105H6GOCcDQadyWXNGPv7J
	60M14kRVzAwq2fG9+DbL8F7wd3pCD04/LQKTbqmwIK6Q6Q==
X-Received: by 2002:a17:903:98b:b0:2ae:4572:50e8 with SMTP id
 d9443c01a7336-2aea3021bd4mr262895ad.8.1773079168841; Mon, 09 Mar 2026
 10:59:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com> <20260308-tools_build_fix_zero_init-v3-17-6477808123b7@arm.com>
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-17-6477808123b7@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Mar 2026 10:59:17 -0700
X-Gm-Features: AaiRm51Mi3jyhZ6d5D7Dts58gg-d_J7aFNrAN6Haonrc-goj4a5d3pqt2PgJB3o
Message-ID: <CAP-5=fWd3wr_jvagN7P9tBtbtva4m1RGRmx8rREVLZVXFeWZaQ@mail.gmail.com>
Subject: Re: [PATCH v3 17/30] tools: mm: Append extra cflags
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
X-Rspamd-Queue-Id: 6F89C23E2DA
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
	TAGGED_FROM(0.00)[bounces-11732-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Sun, Mar 8, 2026 at 9:48=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Append EXTRA_CFLAGS to CFLAGS so that additional flags can be applied to
> the compiler.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/mm/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/mm/Makefile b/tools/mm/Makefile
> index f5725b5c23aa261994b5b42f37c443bee2edebf2..742c1639db0a6f7aee59cf8f4=
634cb40eacd49b2 100644
> --- a/tools/mm/Makefile
> +++ b/tools/mm/Makefile
> @@ -9,6 +9,7 @@ INSTALL_TARGETS =3D $(BUILD_TARGETS) thpmaps
>  LIB_DIR =3D ../lib/api
>  LIBS =3D $(LIB_DIR)/libapi.a
>
> +CFLAGS +=3D $(EXTRA_CFLAGS)
>  CFLAGS +=3D -Wall -Wextra -I../lib/ -pthread

The append should probably happen last to allow the default values to
be overridden.

Thanks,
Ian

>  LDFLAGS +=3D $(LIBS) -pthread
>
>
> --
> 2.34.1
>

