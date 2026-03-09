Return-Path: <linux-kbuild+bounces-11740-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mM9yFtENr2njNAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11740-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 19:13:37 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3BA23E62D
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 19:13:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EB0E830A37E3
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 18:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C7592D94A2;
	Mon,  9 Mar 2026 18:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u2PCaRo7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BE62C0303
	for <linux-kbuild@vger.kernel.org>; Mon,  9 Mar 2026 18:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773079654; cv=pass; b=uptM6Hpi8k0exXW1FtUiI6pUqYHyiu1GHjzTEVc37Hp5W9UnbmiNhyGxBwoWves8gtV5L9QTJv2qZ4lQKDAgT5c+4VgjD1VqQPO1b/+K1kYk/r8zU2Nqo1O5UXpgtgkAiLSi1cyurRhllkBUHWKn9cxrd/qQ5ndMfVeHuhCM+IQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773079654; c=relaxed/simple;
	bh=QIMNB5EyqX39o2tFyg9pOLQaPD6ckffxKJvkpme5m9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RZBBlD+SoV4ENE/mYOMLSbE3+ozywIPnxLgHqLnypafsNfA9f9Cizo7Q6fQY5ZBoJOIRPLMNUvUZmkoPQ2AYlZxfpXTfwiI8bsr2x9rpwn9Z+Rv6OmQC7WVh5xxfBBD3iLudGO+5SPpjlOc9Wxk8+hILz/p7EN+ptHltmQi6PW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u2PCaRo7; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ae49120e97so18635ad.0
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Mar 2026 11:07:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773079652; cv=none;
        d=google.com; s=arc-20240605;
        b=MUIvf6v3s41uROSh/jEl4SF0tvIyDZTVidZGE7S+BdpylnqDoIcvvMICI6a3tG+EnS
         Jemle7q949hW5/MY9KNPQ2iOGmyr/WZIAxiDUlN8CF6fWTmOMIxYeShEob6EWVziAcux
         G8We69cWblcFjxoGtstylrUI/nVi73i09OBLr7xyBCL02Us8Ckx6UFQ2DBJqCjWh7JJG
         Ztmt9VK/wHhzCegR/Qa0xz8eZfYmr+IYF9nilcqiSt6eMxC9QOKRlu5XgYKH+ie6+2R/
         hPjs8YUbdRZ6PZENPNCH1YxVja0y61UcQo6iLRfeJIfNOXXFMRGymUKnwtADdVLFJKlh
         nrAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8TSrNRaJmO51nmlmw1NUXrIFdMrsiQHCiZF8RZbGZ8o=;
        fh=optzM8KxcdtbEBBJIKTPN4OMvklHV5ftkraR8Acmrhg=;
        b=ixlG1qFrWv2TucL9YBY68/UC+oUNaPhr4XdLwUHBMEpnH1Ubj6ToawMWnIINDYGanV
         wJGNx6xUG4V0LP3hXgMKfmFJZnn2EJoirr7dB/UbQLNNeFrwJpHtxYmLFCHgvB3VJVbl
         O+xKfRU7xDCvAN2RMJWGI3jlb7sWuglnkqzzW7Hm1PODu03DEPXjH0KHAqaM/KbiQReH
         SL0YqT7hXJwUhHGoGmYQcUkgPCzyroZNkNniNMvWHSfWcLBd+ZCMA5nV2Ej/C9Uymb1e
         I0Qtk2pwvPZDdfuIrr+TTvP5nELMt4ftcLUpdJa9iqAs9oO5n9tAcMammp1x3wlU8wFt
         6TYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773079652; x=1773684452; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8TSrNRaJmO51nmlmw1NUXrIFdMrsiQHCiZF8RZbGZ8o=;
        b=u2PCaRo7abEpg28pvbKpGb0njfdBwRUIl7GbiFIaJP19oNwphU79nopknAYKxzARyY
         +84ws0lIKUn3TmVdETDuYVK5e71OobezYoH3EUXHyd5fAjFfvOaVD41QjquSLVi/OAOp
         eTFWZAz0BAvsNPbr6ep2CaWy1Z7Xj8pdQfy/xmZnmBpZYOK3wSWo1Hbe6mu+rKdFdPZk
         3g8EFfK9Em/bHJpfQSklXRrVLPz09evugE5bp4cIYCRZsyucqIdqP8ricBYPMWBL9jNm
         G14c1IBxCpzI3K0OIlHTII+PAqONGSlbobPaCSdh0cYqr8/FyjEhqFnygea5TZxyTN01
         T68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773079652; x=1773684452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8TSrNRaJmO51nmlmw1NUXrIFdMrsiQHCiZF8RZbGZ8o=;
        b=sWeSaBmFh+Qil4RXegs685Zo3GakNJur4osHviYnGonV/zwgRbqoHdHc6ccXGsoPjO
         PNjp5FaNj/t6fdOrc1dXg99rV5bjAZKTgYIDaahKaM614FxfxRzCusXz9CQIySpF5u0Z
         TfraskVQVm0/CEhbl+4NbkQHiUDoo3Uakt5WTDhgURn3mtJsIEPk8X2wN6fbd50gDP0K
         w4susPGOpPQueaHJHXPFy2RQT9YYOrelLmnGdkAZ0/kCIveINqZbRFkiIx03qpghVuti
         TYSdc4q5gHFaeeDbdzEH2kJdK0Qn/wdQhBwF2Ygl/adRydiPTY/KKo/4Nb/ugTmRFLl7
         De/w==
X-Forwarded-Encrypted: i=1; AJvYcCVkA9jXMDrxyOqjM6R+mTuDDUj2vT+/pATmAuklaJtjaqr360kTr5EPe34lNueMLjRsmUyXbVSEr+KT0RA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yys6AhfGPF17GoUkOxsvmtUOSRaxy7CF8h1XbUb61BRp/EiKymM
	X4xEPqxzrq+kLk+SieVXFNh8WTptJ9mxGpger1yGx1AXHfMzjlvKNswB5fwXZrrcEDZ2LKqFcvP
	2KfD2R2RKj4fJQVjkYhBDBG6rtZCmo5q+wkXd6xjb
X-Gm-Gg: ATEYQzz6SOanwOQa8clkMyRK+kRyi9NUz12wUDaLKr2CWlFs+ewafC1X4f3DYtaj/IT
	dXIiMExLato4jsRVUQF2fZsPtBWoBX5gLGXGzjJEFNoao63zICVaTAMPkZ9SSTNQqatPDvYfjz3
	2GN8O6BLz/eZj+bLKSL20GBjLFJeodg+ViGAhElJRze9A5HjfZjN3DcifgisBL7t8uAoLGOPrrM
	GMOUP5bGKtWF6tB5kyxpd/gzJoYShNEEW/UJuXqRgBT5kBHezVPro4u0L3L1+gGdLL3m6F1+Jb5
	qE/dBV5uOZCY6utfo/dKgxWUwdguBuICBXU=
X-Received: by 2002:a17:902:da91:b0:2ad:ab68:f2c3 with SMTP id
 d9443c01a7336-2aea32679e7mr214325ad.13.1773079652084; Mon, 09 Mar 2026
 11:07:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com> <20260308-tools_build_fix_zero_init-v3-22-6477808123b7@arm.com>
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-22-6477808123b7@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Mar 2026 11:07:20 -0700
X-Gm-Features: AaiRm51tQNQ2inpIlTxQfShRsJQdMzHGmNgW_x5TCtZwRMueLBJEPIayhaU2J5E
Message-ID: <CAP-5=fVp5LEezSpRaTZTH17KjkFBvnDLqonMDa5Lm7O7wHD_Bg@mail.gmail.com>
Subject: Re: [PATCH v3 22/30] tools: sched_ext: Append extra cflags
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
X-Rspamd-Queue-Id: 3A3BA23E62D
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
	TAGGED_FROM(0.00)[bounces-11740-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,arm.com:email]
X-Rspamd-Action: no action

On Sun, Mar 8, 2026 at 9:49=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Append EXTRA_CFLAGS to CFLAGS so that additional flags can be applied to
> the compiler.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/sched_ext/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/sched_ext/Makefile b/tools/sched_ext/Makefile
> index 21554f0896923fa9c2e5b98c85d65d964152e592..7b97af037ae55981bc84d4a91=
40766fdf4c62a6c 100644
> --- a/tools/sched_ext/Makefile
> +++ b/tools/sched_ext/Makefile
> @@ -89,6 +89,7 @@ ifneq ($(wildcard $(GENHDR)),)
>    GENFLAGS :=3D -DHAVE_GENHDR
>  endif
>
> +CFLAGS +=3D $(EXTRA_CFLAGS)
>  CFLAGS +=3D -g -O2 -rdynamic -pthread -Wall -Werror $(GENFLAGS)         =
         \
>           -I$(INCLUDE_DIR) -I$(GENDIR) -I$(LIBDIR)                       =
       \
>           -I$(TOOLSINCDIR) -I$(APIDIR) -I$(CURDIR)/include

The append should probably happen last to allow the default values to
be overridden.

Thanks,
Ian

> --
> 2.34.1
>

