Return-Path: <linux-kbuild+bounces-12067-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMyNIcfaummfcgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12067-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Mar 2026 18:03:03 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5483C2BFD92
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Mar 2026 18:03:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A6F25323F272
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Mar 2026 16:48:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD75D3FB078;
	Wed, 18 Mar 2026 16:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sXoQMXd5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0B2392C40
	for <linux-kbuild@vger.kernel.org>; Wed, 18 Mar 2026 16:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773851937; cv=pass; b=pdZxrEBFBXPX3Ui2MgsVeg3pffxw7rLP+fuB5AUDbPM99/OwebNv+B/QBSa/8I4Cg5NsOcb0MjAGAfblgWBSxUFEAEt6oX1h1qUftryLscdmo2jrUwQDKM/bwcZzKQ/IOmxY0BG3tyF3kDdeywaXrknM17pIZg991/5aol0KNZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773851937; c=relaxed/simple;
	bh=pQRo/AIDHbWYmQiKbzY1fu0YoqvFJr3p4qbPZJOQBWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f5tZvJPaOWxrhc76S5wh16jCaP+XPUyPHv4rH23WYWykj/JYLYJtNzZS6gU4vdaad+OOb6mWLK2La3pS3HlQ2ZkXZMgdi70d7utex9BntxHGBN/YMQfoniAFstqqvgQpC2Q4gpBrW3Vk/5gqPkfvsvB2Q4UhbiLW2EqJlLs40yw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sXoQMXd5; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2b052562254so119505ad.0
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Mar 2026 09:38:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773851936; cv=none;
        d=google.com; s=arc-20240605;
        b=ZtzZBxxXbehPcbg5a9+8E+Ujs5dNgfvkEet9+snf9Jbyd1akpzLS8XQfiRkAUr7vy4
         hUsKaOmGCRXYRMp6WqC6bisu6ze3p8DV2GApa+VrykbS/0Agy4df7PA9LRLZfeq6rKvU
         Ux6cwRlnX8GxJDI30tVXKcstQB0osHPam5Ca3Fb711fKjv/2w7dp52nHcUa+gopV/MVx
         UCXpKJNydrSLaTb5RwqTDisQrNLl4MlwTdaps8KU+g0xxVGUCN/iS8yId3e6Vw2sxM6p
         RFxQfUW2zhBygDg/tXumxLcB7mAuac+unsdELOVFVrjTAGvQp1lqYjGsMifDEOygT2zf
         mtvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hcjCxyCQZIThfXRlEgtWrMDq+8GZ2+bJDcg2rHRM0J0=;
        fh=oxdZZ3EBZr20jJfV1tWN6Re95VsE5T9xtBTcFGpLI74=;
        b=EPTHQarT/HNIktx1MoPtzOpdhJLAMwW2A6kkjSvoJsrH93Pm8zOIcbAXXIfigLyE05
         p3sSkrUKbUUwDgJIwGK0KTvwGWdYw4lG9nX90ZkVbwRZ4ZooT5VZOyTZnmfUP9KqYrMz
         ASFpaQNc81U2993+B17Qvi8VBXZKxj7i3RhSlxQr9CMMYJlsz2+a1e35qp4kQZansez8
         6AyXf3FoRDFLXUyZ/s/dxWp5COKw8asqROAKdZGP9Pl7RY5XJF0hi3nGZFor9AT5+g9f
         wQb6aunyyvImq89or+KI0irMqTSMdsTKQ3J4kHN3HpOA7UeaxNkU6YxZ9TGg283kcPGb
         Xaqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773851936; x=1774456736; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hcjCxyCQZIThfXRlEgtWrMDq+8GZ2+bJDcg2rHRM0J0=;
        b=sXoQMXd5ZK4ltkomyXip5wfycxB848TA6ndxmvZnfnfoLg0w56TKga3hCE+XmdIpZh
         FiBQln4YgfTJQv+KbxpSj5SGwcJVU9hyK6Vc5HGZeCnYkGu2bBJ9E57e/lB4Au5xXkvs
         knPpw6PcA0xCJ5lJ5wD7EhV57f6HNmz6+Dhyb6C2EieysCmF5ymXG3n/sldNGEzmXn4g
         9SyqPr7w6c3+sxEDBH4+HtJXfk/eQ7hIRNc8Y44m1TZw1Uj+JcekXy139NwDrKYvkrJi
         l9jrm45RauBkDS+4gFQwLJ6BcNOUfpHo6zY4m1llx7bwPK4Za3xxdKr76Qc8S9xntF/q
         LwdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773851936; x=1774456736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hcjCxyCQZIThfXRlEgtWrMDq+8GZ2+bJDcg2rHRM0J0=;
        b=JPW9pyNUnnL6zHmadQq6C6UbK5StDh8fXGkHGw/n+gP0R3Q1aEXnFIcc92RK6cq565
         ghmgZSsplNfVpt+gHsp5L7i1OUuB4iL35gbWXGVLQFQALJ6TjYgjzALOpX+5l2W+vTvE
         Co6+3Om56H9NX8RvQDUcnfyfU1nD4YTAcUkgnLjqVggaKU4z8OELRzS1VtwBpzHJTbm1
         wFQyHU1kVgpbS3urrZSobiDsJr2u5UrVb8lqNLFL2HVQA0jxcFXl3iDC9+Qt9m9niM+m
         WdZ97ZyQwG15XFoKU9LrcJmGZ7krCTg3+oIOb49RbC0V0aP1/ulQEDFh4L2YHcvK1Tp5
         I0lQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCLvUYdEM8KUo6utzt3LYOQ8ot0RBUahKDRUehSxvTONM0HoeD0RR//jDJvsTTnS7ufJsqJuLmcxCm/ps=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvYboCkEUfyvIkElK0chPwZ96fq942rfeKvxqizIgbiE1IzD8q
	gbNYhLiA3DsT06sM8CtqGf6LcyyV4lITZOgKv2jWZMFrdevnaTJWM4uwpf+TQtPvxIjtP7G1Mzi
	37HiY1I3FIEt0pLuLdWaDNdJoe+jyuf6TQF9B3Ddn
X-Gm-Gg: ATEYQzxSp2zo8qbwG6fRbBpCaRDx5v3suG/wIoVQJU416nwgjnAaRSNQ5Oko0fgOm2I
	vuWtVAF6OflLXi99oHsq/IqqppmFZqmBehFzLjK98KoiQwH1BarJz4CDj7MBu3hJ/tBcwWso/+J
	/CpKhnkOmTeDbS05VKNOAsFuA6sDkddkMMwMt+XjRnUjgvA2AGu+eMSDi88HgYK0ehp2OuaA7jt
	NntvxoB6d8ROP+ueH3gz603gXfEzF24jwSsUmgyQVtqyYbrXm96p5oWtDPYSzMjQercYqrS+/AC
	qFfyM9MO
X-Received: by 2002:a17:903:22c7:b0:2ae:c566:bd99 with SMTP id
 d9443c01a7336-2b06e88a5f7mr4276635ad.22.1773851935141; Wed, 18 Mar 2026
 09:38:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318-tools_build_fix_zero_init-v5-0-bbeffd8da199@arm.com> <20260318-tools_build_fix_zero_init-v5-6-bbeffd8da199@arm.com>
In-Reply-To: <20260318-tools_build_fix_zero_init-v5-6-bbeffd8da199@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 18 Mar 2026 09:38:43 -0700
X-Gm-Features: AaiRm50hpzLMMjzX6OI5eZpFyBk6BPkQvLc7onrrMNrR4VNp8m3oc-g1ki8itfQ
Message-ID: <CAP-5=fV_ObgCokJ3bKAQBYn-DPrGadGVzqvrzbuy8aEcsfkp8w@mail.gmail.com>
Subject: Re: [PATCH v5 06/26] tools build: Append -fzero-init-padding-bits=all
 to extra cflags
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,google.com,iogearbox.net,linux.dev,fomichev.me,intel.com,arm.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-12067-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[69];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[irogers@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-0.941];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sashiko.dev:url,gnu.org:url,arm.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 5483C2BFD92
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 2:18=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> GCC-15 release claims [1]:
>
>   {0} initializer in C or C++ for unions no longer guarantees clearing
>   of the whole union (except for static storage duration initialization),
>   it just initializes the first union member to zero. If initialization
>   of the whole union including padding bits is desirable, use {} (valid
>   in C23 or C++) or use -fzero-init-padding-bits=3Dunions option to
>   restore old GCC behavior.
>
> As a result, this new behaviour might cause unexpected data when we
> initialize a union with using the '{ 0 }' initializer.
>
> Since commit dce4aab8441d ("kbuild: Use -fzero-init-padding-bits=3Dall"),
> the kernel has enabled -fzero-init-padding-bits=3Dall to zero padding bit=
s
> in unions and structures.  This commit applies the same option for tools
> building.
>
> The option is not supported by any version older than GCC 15, nor is it
> supported by LLVM.  This patch adds the cc-option and host-cc-option
> functions to dynamically detect compiler option and append it to the
> EXTRA_CFLAGS and HOST_EXTRACFLAGS respectively.
>
> [1] https://gcc.gnu.org/gcc-15/changes.html
>
> Acked-by: Quentin Monnet <qmo@kernel.org>
> Acked-by: Namhyung Kim <namhyung@kernel.org>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/scripts/Makefile.include | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.incl=
ude
> index b5ecf137febcae59f506e107a7f2e2ad72f4bef4..a2397ceae512c1bc54adb15cb=
1a111ff34e28e43 100644
> --- a/tools/scripts/Makefile.include
> +++ b/tools/scripts/Makefile.include
> @@ -137,6 +137,36 @@ else
>  EXTRA_WARNINGS +=3D -Wshadow
>  endif
>
> +# output directory for tests below
> +TMPOUT =3D .tmp_$$$$
> +
> +# try-run
> +# Usage: option =3D $(call try-run, $(CC)...-o "$$TMP",option-ok,otherwi=
se)
> +# Exit code chooses option. "$$TMP" serves as a temporary file and is
> +# automatically cleaned up.
> +try-run =3D $(shell set -e;              \
> +       TMP=3D$(TMPOUT)/tmp;              \
> +       trap "rm -rf $(TMPOUT)" EXIT;   \
> +       mkdir -p $(TMPOUT);             \
> +       if ($(1)) >/dev/null 2>&1;      \
> +       then echo "$(2)";               \
> +       else echo "$(3)";               \
> +       fi)
> +
> +# cc-option
> +# Usage: CFLAGS +=3D $(call cc-option,-march=3Dwinchip-c6,-march=3Di586)
> +cc-option =3D $(call try-run, \
> +       $(CC) -Werror $(1) -c -x c /dev/null -o "$$TMP",$(1),$(2))
> +
> +host-cc-option =3D $(call try-run, \
> +       $(HOSTCC) -Werror $(1) -c -x c /dev/null -o "$$TMP",$(1),$(2))
> +
> +# Explicitly clear padding bits with the initializer '{ 0 }'
> +FLAG_ZERO_INIT :=3D $(call cc-option,-fzero-init-padding-bits=3Dall)
> +override EXTRA_CFLAGS +=3D $(FLAG_ZERO_INIT)

Sashiko [1] noted a possibly unintended consequence of this change for libb=
pf:

Does this override unintentionally drop the default compiler flags for libb=
pf?

Looking at tools/lib/bpf/Makefile, the default compiler flags like -g and -=
O2
are only applied if EXTRA_CFLAGS is undefined:

tools/lib/bpf/Makefile:
ifndef EXTRA_CFLAGS
EXTRA_CFLAGS :=3D -g -O2
endif

Since tools/scripts/Makefile.include unconditionally appends to EXTRA_CFLAG=
S
here, the variable will be defined before tools/lib/bpf/Makefile evaluates =
it.

This causes libbpf to silently drop the default -g and -O2 flags.

While later commits in this series fix this exact issue for
tools/lib/thermal/Makefile, it appears tools/lib/bpf/Makefile was missed.

Thanks,
Ian

[1] https://sashiko.dev/#/patchset/20260318-tools_build_fix_zero_init-v5-0-=
bbeffd8da199%40arm.com

> +HOST_FLAG_ZERO_INIT :=3D $(call host-cc-option,-fzero-init-padding-bits=
=3Dall)
> +override HOST_EXTRACFLAGS +=3D $(HOST_FLAG_ZERO_INIT)
> +
>  ifneq ($(findstring $(MAKEFLAGS), w),w)
>  PRINT_DIR =3D --no-print-directory
>  else
>
> --
> 2.34.1
>

