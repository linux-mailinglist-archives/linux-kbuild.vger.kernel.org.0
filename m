Return-Path: <linux-kbuild+bounces-11689-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJykACBormmEDwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11689-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 07:26:40 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E8B2342A1
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 07:26:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 63403300443B
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 06:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5A653563EA;
	Mon,  9 Mar 2026 06:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="emBqtnkL";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="jtMcDjMG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCA4356A3E
	for <linux-kbuild@vger.kernel.org>; Mon,  9 Mar 2026 06:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773037588; cv=none; b=TvRDup23/RVvACTA8rxGI17kg2Y297vEhwgsbjbtkjCbV2hlTtYSn2lldEd8p1gos31h+kltrWVcxJylHaSW0GSXfkuZ3H6oTXvEhq7+B9au1xLvd/nJNN9BeaZ85XC+szPuMyJh1MbFxUxE+So7ekIAH2o4ZcDfgS5fx65729Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773037588; c=relaxed/simple;
	bh=wAPHd1pDdaeVfK8pv9xwpBJnF+tChiKS7/rwSbvJ5d0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oIUZnBG4tJf+SbYMldksiMaTJNsdy4so7Eq2IevN3QrMyMDb0iSdhg/m+ARrbM4CzfKo6LyUvNdNThgEPzLVoqifyQX1hdPifn7VUengiy8o7Xq3dJvqiIuksd0MtEFGOrJ7mELjsYtVYGMO8J7oSVATyHFSxHmXe3dCjkVvegM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=emBqtnkL; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jtMcDjMG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773037585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=C4wvI2K+mUpk9VdyVw79oHtN2sfcbsUCHhbZBCFsNac=;
	b=emBqtnkLuhqqkZYxKpaCxyIS+wQcUOUbHsuZ+dN0c06KfCPxuRhRBAnrLPjmFn2vQD+Sn2
	Ji/lUI1McVkc4CCAWwe5x5UBCmrsS9WMEA7u7jxhokeiZEbzRrDrVwCzir/r+8fUadz1QG
	FUeiCTF6Ds4Nb4XdVOXdiSi0jgHWWO0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-191-_ywszmLLPKSmYMB-8CD2rQ-1; Mon, 09 Mar 2026 02:26:24 -0400
X-MC-Unique: _ywszmLLPKSmYMB-8CD2rQ-1
X-Mimecast-MFC-AGG-ID: _ywszmLLPKSmYMB-8CD2rQ_1773037583
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-485390246c8so8291555e9.0
        for <linux-kbuild@vger.kernel.org>; Sun, 08 Mar 2026 23:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773037583; x=1773642383; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C4wvI2K+mUpk9VdyVw79oHtN2sfcbsUCHhbZBCFsNac=;
        b=jtMcDjMG626PJyQP+TUhs6zzLIyD5sNYE1NX5llW7/o9cNIyfBBnyOaKkGNu5zcePY
         R0GneTIzf9tNCasO9r/mQsafRbTjTVC0JVH1cZ5yiujx0odhdIf6M6rs0L8i7sKnqiv8
         IjHhLg8ZlPHuLDFiI6k3Cbmte5kHlLTzAaWec0J8HL06HjgJQoV0LZ2kb7qecpQPlY/x
         a8gJ0sWYWspJv7p642FbfPNkE3PmYKcpAjKW8Er5D55013PimK/FU10Bs3Q91l0QmikY
         nqgll8rnWpgMoKj1nQ2eHh9Ff5XSi40RM6KyT+9ZPIbaRkmhUwLCvg/sdyrLLUZIAfgD
         ZH4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773037583; x=1773642383;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C4wvI2K+mUpk9VdyVw79oHtN2sfcbsUCHhbZBCFsNac=;
        b=sS+cnGJG7EfnEkeSj5Mpv7cZ6mDtKgoxKpDoCDkK+gybBlEwo0D+Y6fSv2gB5bTSCR
         6YofxlIR6WojrmyaWkXwxjqTLD7KHEd/jLhT63y3hKzRlA0AqNyA8MijZt4f/vpuRZ/y
         SiiFygULFRUmxE7wchUmaDBoH6oYi1KB0dMSEoxMt1QyavUprMZJ0BK9CDDO6v2EH0Te
         7jUBi5MoOtkGjXQeZd7Lq4C28iLTvFBa33cL4Hk3xsumcZHcNr8Fj3G5eYaf3paNuW9U
         vMkERQAjZXekvhPvyy/X26pj5Ws1r2E7Sr7Yw9JCbCesCGpsB1i8dJUg63EBKq6foXkF
         76tQ==
X-Gm-Message-State: AOJu0Yx3nt2Q1skgfGj4pS4XUL5mugGcnbm1lmIIRMfc2fOv9iQ5DWE3
	MoqSPv3EeEoThvPhZCdCpnsYPHAzNTo3wwFwLInjqFSTZOWB7eiV01hk1GdonL3XdpLuSeNoW3d
	dBMVgEIEg9lTY42C0dskoxm1K+eVyr71hV5+m5Le9Jb8CI3w6cS/xmc4zChtqbaMuEA==
X-Gm-Gg: ATEYQzzNQihd9dEz28dAOeV3fO5D6U2hunpdSW4cZgwSC+hd0SYzqFoVefmwdST5ySU
	zLgRJW2wEOt5BeQUFYC/2ouh15Ar6k33Kt2kEzQSDWEAGJ6l43DVcL+QlbZsl8gTGN0HzrYLl7y
	jLsicfz3HhRUK8XEEkpVKEe3HcXjnUdQjc00hYW7mgs7c/x2h1F7b2zmKUAL8R9vG2OkGpHb3lw
	AoLbE8WadyVz0Zbz4UOyRqZ0G7qyHXOa2sOjgDn/Xo0g8PixwhBWvZ0XOV3/iC8rjfMbsVhEcxU
	J+EQByTIyWYncJ1qrECwzX6kub7AqK0nuwGOyzR62qR8RJkM7JKi1SdBS0TRctrQWkI/8vCyyAM
	D4PA20bD5FCBw2qF2e0LhTZcPxnBdEXnW89xdgQVwC6q4+VxsQ2mkijE5db/pAylK4/cMvm3HuZ
	KxCkjQi6xXD4PTZKs=
X-Received: by 2002:a05:600c:358e:b0:485:3ec6:e634 with SMTP id 5b1f17b1804b1-4853ec6e713mr10720245e9.15.1773037583179;
        Sun, 08 Mar 2026 23:26:23 -0700 (PDT)
X-Received: by 2002:a05:600c:358e:b0:485:3ec6:e634 with SMTP id 5b1f17b1804b1-4853ec6e713mr10719305e9.15.1773037582629;
        Sun, 08 Mar 2026 23:26:22 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb (212-8-243-115.hosted-by-worldstream.net. [212.8.243.115])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4853f9f82a7sm6141395e9.10.2026.03.08.23.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 23:26:22 -0700 (PDT)
Message-ID: <9cb773f5209fc21a3842abe9e60a27b6130c7fd4.camel@redhat.com>
Subject: Re: [PATCH v3 26/30] tools: verification: Append extra cflags
From: Gabriele Monaco <gmonaco@redhat.com>
To: Leo Yan <leo.yan@arm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>, James
 Clark <james.clark@linaro.org>,  Kees Cook <kees@kernel.org>, Quentin
 Monnet <qmo@kernel.org>, Nathan Chancellor <nathan@kernel.org>,  Nicolas
 Schier	 <nsc@kernel.org>, Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin
 Stitt <justinstitt@google.com>, Alexei Starovoitov	 <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko	
 <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Eduard
 Zingerman	 <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song	
 <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, KP
 Singh	 <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo	
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, "Rafael J. Wysocki"	
 <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui	
 <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Peter Zijlstra	
 <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Mark Rutland	
 <mark.rutland@arm.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>,  Adrian Hunter
 <adrian.hunter@intel.com>, Masami Hiramatsu <mhiramat@kernel.org>, William
 Breathitt Gray	 <wbg@kernel.org>, Barry Song <baohua@kernel.org>, Qinxin
 Xia	 <xiaqinxin@huawei.com>, Bartosz Golaszewski <brgl@kernel.org>, Kent
 Gibson	 <warthog618@gmail.com>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang	 <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui	 <decui@microsoft.com>, Long Li <longli@microsoft.com>, Jonathan
 Cameron	 <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?ISO-8859-1?Q?S=E1?=	 <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, Andrew Morton	 <akpm@linux-foundation.org>, Willy
 Tarreau <w@1wt.eu>, Thomas =?ISO-8859-1?Q?Wei=DFschuh?=	
 <linux@weissschuh.net>, Josh Poimboeuf <jpoimboe@kernel.org>, Robert Moore	
 <robert.moore@intel.com>, Len Brown <lenb@kernel.org>, Srinivas Pandruvada	
 <srinivas.pandruvada@linux.intel.com>, Tejun Heo <tj@kernel.org>, David
 Vernet	 <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, Changwoo
 Min	 <changwoo@igalia.com>, Mark Brown <broonie@kernel.org>, Steven Rostedt
	 <rostedt@goodmis.org>, Shuah Khan <shuah@kernel.org>, Jiri Kosina	
 <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, bpf@vger.kernel.org, linux-perf-users@vger.kernel.org
Date: Mon, 09 Mar 2026 07:26:16 +0100
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-26-6477808123b7@arm.com>
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com>
	 <20260308-tools_build_fix_zero_init-v3-26-6477808123b7@arm.com>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 32E8B2342A1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11689-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,google.com,linaro.org,gmail.com,iogearbox.net,linux.dev,fomichev.me,intel.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gmonaco@redhat.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[69];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.976];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Sun, 2026-03-08 at 16:46 +0000, Leo Yan wrote:
> Append EXTRA_CFLAGS to CFLAGS so that additional flags can be applied to
> the compiler.
>=20
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Thanks, for the patch, however I don't think this is necessary for RV as
EXTRA_CFLAGS are already appended to CFLAGS elsewhere [1].

Makefile.rv is included after the various Makefile.include, so I presume th=
at's
good to go for the new flags you're appending in this series.
I did a quick check and I see -fzero-init-padding-bits=3Dall by just adding=
 05/30
of this series.

[1] -
https://elixir.bootlin.com/linux/v6.19.3/source/tools/verification/rv/Makef=
ile.rv#L29

> ---
> =C2=A0tools/verification/rv/Makefile | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/tools/verification/rv/Makefile b/tools/verification/rv/Makef=
ile
> index
> 5b898360ba4818b12e8a16c27bd88c75d0076fb9..2882f0e93dca03b31d790b42d2ee3d8=
f73cc
> 5c8b 100644
> --- a/tools/verification/rv/Makefile
> +++ b/tools/verification/rv/Makefile
> @@ -55,6 +55,7 @@ ifeq ($(config),1)
> =C2=A0=C2=A0 include Makefile.config
> =C2=A0endif
> =C2=A0
> +CFLAGS		+=3D $(EXTRA_CFLAGS)
> =C2=A0CFLAGS		+=3D $(INCLUDES) $(LIB_INCLUDES)
> =C2=A0
> =C2=A0export CFLAGS OUTPUT srctree


