Return-Path: <linux-kbuild+bounces-11731-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOo3GuULr2lzMQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11731-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 19:05:25 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1255F23E2BC
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 19:05:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1C05F302B4D2
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 18:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D9303ED5D6;
	Mon,  9 Mar 2026 17:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FXjxLhzh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325932D979F
	for <linux-kbuild@vger.kernel.org>; Mon,  9 Mar 2026 17:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773079147; cv=pass; b=EDLy3pkaPmLA3tYP99hJo0Cj1TYydwTjDy49+fvqWORuymjArbVgP4dvX6uo4wGn8H5J6QTEwGk7/Mw5ppwLkRuXsPRAIXSzvtdiYRq6Ocf4c0DZ8Usew5O1UkUoyoxM9vqyPSWsr9phdSwmE7AViEMbUUOopk43A6g/jWxX9fQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773079147; c=relaxed/simple;
	bh=K9KvPWrinhMHT35zdp7wWeOdqTqba23yLvkTaWHsvhw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QrrchTOoPUccoEaXIG4gy2Fxp6d/Deo9+sRaPOaxoYTjhUHlpwH6bz0/dLfasiI9YVtlrl0zk55eVlc8WhqOCn8ige0NieNZU4FnAKfr1uUgPVzjCgETvLmnbIypbK1fu3LrYOUtzrHXImb2n1xdxSYu/iSEOgUMaN52vLWOiI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FXjxLhzh; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ae4b40999bso15035ad.1
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Mar 2026 10:59:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773079145; cv=none;
        d=google.com; s=arc-20240605;
        b=IKIV8JvTMQPTDktw4at5iSqqiHT0DgKWhsMyLBKR002TGlzjBnnHAmDKBKq4so2IMa
         rnvwpOG6f6hUevZk7YxwRwiNfvp+q1Lfn5MSqGOF3IBlHoATBDC4xvMEZ9arqZfGCCGp
         /Jxktd/TxOZrV8B8d6xXyKWj/Ev0gR6rXoaO8tF2TtgnBAw+Lo8x7vFQeWdVgJ8CG8Te
         cBgyqrV2F2fgo6GyW7u9tCnYHiw3LYY/xMeIirIb7solmJDGPePQjo/P3L8IqzbhRc31
         xUvaN+mp9lQGBIub23EBbogM4OpknXeKeYwIJG5+2GlZN451+sJpZhBqhg6hdKhR8e70
         Aq2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aDreSjYEwoLVTucpTragxMff4MtZhsK4TyZGpsfQmdA=;
        fh=v23LIbyHeOMEkyUJByIkliMgTbjyS9UvJ41LS52T5ZQ=;
        b=fnnLEOTa+hgsIZZ/LOdvZ+1WGQrxWeeb9p8i/Zosw6WIMNwK9tPjvon0L6v/fDBMG6
         5MLqA/QqvmvrV472fcAVrB7CKMx3zEHWq3yeAsjWbYL3SbIO8/8FIxPmfOcngbaJ/MkC
         Rdjt0hvSkDs2vHG89mOnkorM3bRmtToGEQ4cMqYNL8ck9FZVsrDgXuz7I3mGjR5WPtQU
         /ROdQQ/IERvtoD6qbfxW35AcIxZrnJYp4/5dfThh9nylxlyJchoqWXWO2dmB1NjMVNHL
         IGcv3rlPnIeRbCd6d6arN9L3aI7A25QqOl4Gtv9W9tIslKWh2uk0aXE2LiPqMuSS6IEq
         w39A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773079145; x=1773683945; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aDreSjYEwoLVTucpTragxMff4MtZhsK4TyZGpsfQmdA=;
        b=FXjxLhzhK5I+7rJHMQD7PQ9l7YRiR+stKFJqLX/0Hm2m5CKzhA8Jet0oqOUqAjGxtB
         9K0mhWZDZ0d7RS8PlzS4F2P698fyhLIpGV9pPtbjvfxm8PHmeR3ad72TBsFCTLbhZBXC
         F+TVuSCDnwESM5tKcnJoDf8PBkjR1Cp4z6/vmqvur/VmqcnW/9VqwFx8+wtV/CwRbEQF
         1y+sG8gl+6cOqNu/Bz25vG8rYqkIehC5YYjvBSCh4H++GimMMCXiev6cxPukjfoMTl/H
         dBZw3s7UCAELpHisaYa1ITE3jWmCKlUnNrYxYuEmc5HWfgSpUaOOEhYufHGGKvxTNwnV
         hpSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773079145; x=1773683945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aDreSjYEwoLVTucpTragxMff4MtZhsK4TyZGpsfQmdA=;
        b=JqxW7afbjHSNzja0krdDUJnCu9UNiXhM4ahPv7XDZ11i9/OFyAwTld2zzu0izbLTEW
         U7aXGNVJDG2qUe1T+8tRYuprDf8pgNWtgoQp20cWMwRS++UWhqp1+vMFqBAmqYfdcog3
         a+XM+iR6YnDq0j6QCGda9hAmN/qwNJ5G3o4SLfQh4lK1YFkHoWNwAillN9Aivhw3gmJj
         zPPVLTabokKQpBx7BdzZi1ysNrBl12fmhTwDL5m5NawwyAt7zit0826wQBcTYO3eilfD
         9UqPEIG47JIbVx2X6pAEbXlEien1lGxFjjT7gWvbA6w56pZMg/j96/kkGWTWEMhnPA5b
         eYgA==
X-Forwarded-Encrypted: i=1; AJvYcCXIg6hN4E6oIoLj8sGh5qcX/P5Z0eY3hmq7c/lo85qe+DeGiSk0RhaCYmsHeWCZdUsES7MsIIYOmu0hYNI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgO5e/NDlMGvK5xyx/SR/bzsJv6taETaXsBf9kPDx1/QVPZSsI
	hhXbwe9vt8wxbim9suBhQDYCmQMLCGOKfvC/gCpj04GMG9pTCA/XK22p2KVgNCHklMNciKw9xbF
	liMJzkiVSrBf1QwC9TCmpscPSHvm/cCr3ViK9AwKR
X-Gm-Gg: ATEYQzw4gfevXppiYOU76Nep8Uw/STqCvYkFr7IKsToL/HoyTUeL2VRzBmzdaDx2aCa
	b8EmU/onYX1281On24Rqkn7fYq7rnSWST6sacg0b34CmO7DrDwzanVJ/vTiD7dM7rx7qZTn3uNT
	CZgTqGYcFuu/Zve2MKS7/BqpbZd24cWbkCZD0PbQviUbZvofwYx7179CMHHnJsAyNu8wrlcuNuM
	OhWMiP5KbsF8aY/VDcDpnyZPFtaNdqojV2BhFzKSnlSXwSnLBVkcTsupjurhOEEG0mBTEYJlm8j
	vo6dh4k32oMQJlsm5xjjznbgU9Ml4ZoUVd0=
X-Received: by 2002:a17:902:d4d0:b0:2ae:80a3:cd11 with SMTP id
 d9443c01a7336-2aea311f196mr241605ad.7.1773079145133; Mon, 09 Mar 2026
 10:59:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com> <20260308-tools_build_fix_zero_init-v3-16-6477808123b7@arm.com>
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-16-6477808123b7@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Mar 2026 10:58:53 -0700
X-Gm-Features: AaiRm52uvKkGWQKOUhlbyvaGeNyxJc-w_yEiNj_NYeHVrpEtOTjr68aBFV5Bu78
Message-ID: <CAP-5=fXSK7fFp-=W7MavSMKbqpxffFSXKEmd=jt=7xhzvYt+vQ@mail.gmail.com>
Subject: Re: [PATCH v3 16/30] tools: iio: Append extra cflags
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
X-Rspamd-Queue-Id: 1255F23E2BC
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
	TAGGED_FROM(0.00)[bounces-11731-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,arm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Sun, Mar 8, 2026 at 9:48=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Append EXTRA_CFLAGS to CFLAGS so that additional flags can be applied to
> the compiler.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/iio/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/iio/Makefile b/tools/iio/Makefile
> index 3bcce0b7d10f42208765be83dac047faa2e0ceb1..c189af6286751d141348957e4=
d63d33b87410381 100644
> --- a/tools/iio/Makefile
> +++ b/tools/iio/Makefile
> @@ -12,6 +12,7 @@ endif
>  # (this improves performance and avoids hard-to-debug behaviour);
>  MAKEFLAGS +=3D -r
>
> +override CFLAGS +=3D $(EXTRA_CFLAGS)
>  override CFLAGS +=3D -O2 -Wall -g -D_GNU_SOURCE -I$(OUTPUT)include

The append should probably happen last to allow the default values to
be overridden.

Thanks,
Ian

>  ALL_TARGETS :=3D iio_event_monitor lsiio iio_generic_buffer
>
> --
> 2.34.1
>

