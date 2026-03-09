Return-Path: <linux-kbuild+bounces-11734-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0J/NJngMr2nHMwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11734-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 19:07:52 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1D723E3DE
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 19:07:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A752307E264
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 18:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A194B3ED5A2;
	Mon,  9 Mar 2026 18:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1pYvwzqb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681313EBF05
	for <linux-kbuild@vger.kernel.org>; Mon,  9 Mar 2026 18:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773079336; cv=pass; b=JWabrzVXZaxGrv2a3+pYYF8gXu6IOBdMyNYcGGRzJVOX5S6PPH/yI3G+qrwCgyogRHUsDHocMWQm7y2Ci4dP84c5p15bdw7CJL8xVQ8IXBxWs+MmEQMsgdw8OZ48jJzMzjxzJDhSGOCPKWh83B5jatRLKY0wasoKEtxoXF391Xg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773079336; c=relaxed/simple;
	bh=sXd2n3r58atsTHalU8kH+eYu9sbWGdifgWknmudkZ24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bADU5YssQMYVOYq7972CQh78mlydBJwzrhnfvvBhxQDCLpjIDVK76+ide5EbqUe2hhsVpMhexJMY4buS/jwqeDxOwMekMJXF51OlSaK0wWwcKIz6odmXYwcoJ8hLx3LdFT9tsSMILVYbzYtQ7bAFDv1dSdmP0xMXfET+43MklQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1pYvwzqb; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ae49120e97so17765ad.0
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Mar 2026 11:02:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773079335; cv=none;
        d=google.com; s=arc-20240605;
        b=dZoSVIKtJE8A+XjVDKgknuCzjJcT0r1pU454rkRLDMwkMXQT+5z0TsJ5AzuMiU9b5p
         yAwE86e9AZkx6Hi+LyP/j3Qv4rNMh+5Bvql5smnn3tmKQKHBVL6O5STBhBjmXGNhu+Xa
         22IUJkw9LGlmx+M0hMt2fqtT7rT5klNXtknBcPMC0g3BFJtZLDHZW+yaFkWeFeSkSuqI
         gk0kptyc0Ghgjo4Tjr4xia4DMxBoRR/jDlOBl92dFFizdugrOo5GW2+d+a4Te06zhYFR
         ge3nqzU3+S4MwKCEYZhBSr6RlDMDrDdleLaxjRg5SZSntibooP2coRDJlvIrD848WSfZ
         Wlxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3LJscPu/LCmEc0GMnCIHYIEIVJSUttXk0NscrVDqh4U=;
        fh=qJDrXJQqmC2DhXqe1M6PugXN7n8xH4xrmEbmUxETgqA=;
        b=K1eG1+rVjjv+KWRWxNU0WBd8zGc2JJAZllIFmkF/NG9N4naqdYwN9jgrCDfd3Ta2Bi
         axoD5OjKdVW2UXD/dq1dNskK+W3VoQYy3YakQ3U0VMxcqvbOdJokqo6BVvaJTZH3JKFX
         qtqzrGBcZt+K52XAAOf7BN+TNKi/ToOYEfHvy7EL417/PBzlF+OZ5mwu5TCKHP+rTrCm
         80S8EY2pc/nYd0qyU1TxpQy4Nu7qPZTmVlIHyD3mS3HhSg5HPteI9uLZvJz1097pXXMX
         WQUyjbUXghZYjFqNqGZQ+Mnni1FpugaJoJbMTSqk0DRvLpNecmbvvLnUdXFJV8vwE+eC
         FKCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773079335; x=1773684135; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3LJscPu/LCmEc0GMnCIHYIEIVJSUttXk0NscrVDqh4U=;
        b=1pYvwzqbxIsi4b1//rsj9ww80cW6ue8Q37z//Oqr4FMhbVJGhrBTf99Q+wQobzmcAK
         r7M1xwYl69ABFuN28riLdTtC4zjCZegKehewPua7S0TY1b7pwrqR8FyrVfmc5tv22ngJ
         VyFQV40sjhwUAe96xBXBv+W2OszKkCFSY0NJg7DXpyZo7KqeFBJr89i3/XZNfNHDB7l9
         9TXJu0og9fUzELT89y4lBH2KCBu05HdKFB5QvrwuXBcRqNK2UTwqlPRudj7+IHQhrQwm
         EE+/8b4tTzOKSSyzz45Kll1dzxYtmu5wpvQAzkRhNbkylQ0lvuyO2gV5MZxKi481jm1j
         vx5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773079335; x=1773684135;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3LJscPu/LCmEc0GMnCIHYIEIVJSUttXk0NscrVDqh4U=;
        b=v4o+qRMnvibEBM98rDfDjQbgCZdbOxtnZ6ZKC7eQu7mjbaS+F+Uzpe0TV7ud2EElwj
         Hk+wM8PPZ0ZK0pTHEZyndJHf5c1DjjVbMyK5j8LceK/2v4pwIlIGrlvSI0vjQOdXBgG/
         O9uGIGqG5OXNrQlZi/a81bjdbALcQ+zMeN0+xdqRbpitLuFDutJLlS9O4Hr4AqlZca47
         Yv3eOH4ZRGTJCQVfrs8+AexBKBX2KetZksZ/kgQtq4oVmWJ/XBv4VUi3eJ6woSPxbDeo
         pVTULkxDCWJPA0zGyn5LMhKoQgLYS5A37cfkCXuQy1T+jatgYPggG+T5aQzXPj0cO9VV
         0FpA==
X-Forwarded-Encrypted: i=1; AJvYcCVyRSHIeltJ5giiSIsJ6u58SMxArKucyWNQs7oeLbhpj3SWs/iGpBrBAu4Z7IqLmizzUVjTmTyhyKAWizk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLFBUnw6NSkkDKPjvn4tCi9b9Deh553m0LMvgvIaTWbmagJZz8
	0kP+WJUFkZdk/btXUKry+vTmYwv6zrn/FuBBV1ldG7JkZI9OEvlhJvaeXo4v+Y3G6to105RltVC
	MJU3ovUNJxwduHq9mqWhN8RljxgR1sF7KN3aSRwAf
X-Gm-Gg: ATEYQzybXV5629sCVUD6V7pP1CLrhKdNdiGJfikOY0uWnGaycjkpKXHZrwKg3SJFbZW
	VJ0r6EPoqKWNeqvVK/S+NEWi7k1pzOHacJfv5z4fVg7MGDK6drer/LkusiOhM5yoVBanVfWnZ1E
	7FCAlp82dKcUAHe0ofJ0kIckGXe0Nh0pgGBHPSDGjv8delWMH61BHEZkc08O6GPc0PElp9L+KDl
	UVZch1d04UKdhphZvUtlcKbRMpKNAbhTwIQ2vP0UxOwymSZHtwUitS9bEJn4xKxaW1DM5IceAnG
	QMWouBxKIbFdBvPPPEk+ZPrXHiib4nDZTdmW0pyel+m3mg==
X-Received: by 2002:a17:903:18d:b0:2a8:fe50:2933 with SMTP id
 d9443c01a7336-2aea2f2bc3amr316945ad.0.1773079334115; Mon, 09 Mar 2026
 11:02:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com> <20260308-tools_build_fix_zero_init-v3-21-6477808123b7@arm.com>
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-21-6477808123b7@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Mar 2026 11:02:03 -0700
X-Gm-Features: AaiRm53eNfFq2R6M6Fsx3M04tNIq8R1bV70kYSKB5eTnuoUy08rbJqrR2yINWgQ
Message-ID: <CAP-5=fUkk6vDQQYJoRbGaA2zc9pZds9xHtoFOvQvO8q_D8ahAg@mail.gmail.com>
Subject: Re: [PATCH v3 21/30] tools: power: x86/intel-speed-select: Append
 extra cflags
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
X-Rspamd-Queue-Id: 2B1D723E3DE
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
	TAGGED_FROM(0.00)[bounces-11734-lists,linux-kbuild=lfdr.de];
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
>  tools/power/x86/intel-speed-select/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/power/x86/intel-speed-select/Makefile b/tools/power/x8=
6/intel-speed-select/Makefile
> index 6b299aae2ded89c3a70a3649996e258b98001ee7..61d6e81f3cf1d6427addb4f31=
c1369ac663ba3d6 100644
> --- a/tools/power/x86/intel-speed-select/Makefile
> +++ b/tools/power/x86/intel-speed-select/Makefile
> @@ -19,6 +19,7 @@ ifeq ($(NL3_CFLAGS),)
>  NL3_CFLAGS =3D -I/usr/include/libnl3
>  endif
>
> +override CFLAGS +=3D $(EXTRA_CFLAGS)
>  override CFLAGS +=3D -O2 -Wall -g -D_GNU_SOURCE -I$(OUTPUT)include $(NL3=
_CFLAGS)

The append should probably happen last to allow the default values to
be overridden.

Thanks,
Ian

>  override LDFLAGS +=3D -lnl-genl-3 -lnl-3
>
>
> --
> 2.34.1
>

