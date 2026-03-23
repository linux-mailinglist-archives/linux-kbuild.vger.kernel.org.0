Return-Path: <linux-kbuild+bounces-12210-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKcELiW2wWlyUwQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12210-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 22:52:37 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D582FDF4F
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 22:52:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0E2B53040025
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 21:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9835A381AF6;
	Mon, 23 Mar 2026 21:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wWZ9n5NB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF55330650
	for <linux-kbuild@vger.kernel.org>; Mon, 23 Mar 2026 21:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774302754; cv=pass; b=gPv/YZwt3EYS1WuKLyg+vGLprlqOWm8C5NCQdqNv8VhBcYY8wTREyNUA/iI0i0UhZWlAm3lgKRyXAUP41HAxVLOWMRvpDrh1X3hXMk/ZX9orSV4Q4rEtuAOQSRJEoJGG5tH/vMcHWrpKlSnqWD+kN1d5kby1R+Xfyo3m6y2+PUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774302754; c=relaxed/simple;
	bh=sBpt4JBKJwVjXuMXplkOgOFupV3EsudH585P0A/BF6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kvdlbnAx0LBmve8yOIpKQiVRmaOSIqiGOf5yZkN5DH1D6bELhAOTOQjrVdvXLC4A/B3od/EGgL9A6PERgkgzJqVtYq3WAs6Rqplh3uf5D68IrLSyKTZ6stz8xgaDJdBZTZLH2FdTpBvLlGWXKnbgOjpS3R7rkiu+KynAP0LLTFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wWZ9n5NB; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2aeab6ff148so13795ad.1
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Mar 2026 14:52:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774302752; cv=none;
        d=google.com; s=arc-20240605;
        b=BQTlmQDHuuimpNhk5LiwFFeZzYzaEyQbRQ3jV/599uxfA+Eq408IelI/dEKFA8BpIV
         lzJHAZWhxxcBBY/kYwq+pUVTCmybRF/54TD+uO7pyJJBP0i1WC6jKgWdK0zbdSO/zqbN
         +jeCeExeDYPnvtzEMUZbNT2F/QJT+M9gatCj2gYqniUpbcwhyy4fX9G0SkSezWKvk5ni
         523cQ85VskKAqUSZLwe+S/vl03sTuaM+aAH/IAhfK8u1/H8gsK+dwVwIhmvcYR0XAuPE
         dvR0y0tg0/zn3BzULQp191tK7WUFrmc5/FKTUqOL9xU9X1OzffwU4Vd1Q65idbhxPiwm
         K8Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YmKAfG81GUfLojTL2WV0FfXjre1ys9QeKFFeiwGpR3k=;
        fh=U3ciDx3ODPXOraY9Y9j0kRpT2qap6f8WsQuOZu7ajcs=;
        b=QzpOc+4mz9WLdKZWUvLl7HUpbhmqSEik5vX9elt1PyrYTkglzDgaX2/N/Jfl1rKn7F
         MF+nw9B9q4b9SwHpKDKFqaTcDfTPr0tEwttIfAfRNGwaaFi2w0RoT+28mLDsROqmSp0i
         1Bf2aRfJv4aeBFfnY4k9UCPv7PAgvvx5CRY8/JIYh7Gc+jftYdDUC2tVt5tE8HLmNJSQ
         7SJYjCWUTdm12N9DIrm3oR9iPI/6SlOF/Vo0L2rdKraKiivbsR0Sng4lhhUpcq75qI4v
         a35ghicGJT5FbY41d19pX/NvE+VUg6HEVlnkrq8+Rc1lfv01ZjPBWP0uJPq610QQk2KA
         a2/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774302752; x=1774907552; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YmKAfG81GUfLojTL2WV0FfXjre1ys9QeKFFeiwGpR3k=;
        b=wWZ9n5NBS/9RCgwHRU84wAit0QohoiXmzck4EmORp5UPYtEkCanBTWrcF6oya97kAm
         CoODxVpD/jMmRZvpuu5PotLHvpunW+JpwcxFZQ3UwksEKZViQSYy4YSiddM+m/DDZSF4
         R3wKVWoegqLyuWu9wjtgEJn35p7vo6DSVw5YNtNoqNDs553jlI19Da8Nr/RaY2FtVwfS
         p0l+FbPuMJV6Xb6YAGxCMGADFd4M/0XNGju5Y02DFh7k6kq1YYATXMKZnEz97w7dfFwH
         k46r1vi454I6pOWTxwMG1SQxr9XKIOTHbDmeT+eQtLfvESGLh6ncjTlx1XM1601Ni+0K
         DJbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774302752; x=1774907552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YmKAfG81GUfLojTL2WV0FfXjre1ys9QeKFFeiwGpR3k=;
        b=GVV/IM69FM6E4g6IW777aibNFtwAvfZ/ZM73Mpno8ERAe/2OXNg3dwIQ/eAbulnRi6
         PRKEtlh4QnkigPbGiU5BwRrJl7/+I4PiwyJQnypIzmdercZC9bkJaN+52brWw9feS0NS
         imYxd0pey139e8VKZ7YO7Qh/xOzHCvquVTi41cVZFmbPUPijcsbJxn9LlEC9TmL2xXow
         gW1siBKVOamCRlhSEtmjqxk/RRJCfCHwKMWUExHpG456hrZWY8NYVBJQYBaul9uvcWfX
         yO58GvT1LwphM1VUQhc8Dl5AewSOpBFcJ9923iNRmTdfwj+NazKT0Jl1ypSQr4pmdblH
         Jdvw==
X-Forwarded-Encrypted: i=1; AJvYcCX4AiR3p4CwQcqtVqKWsGhdBRNq1K34U4O/kYb0qB6X7tXKvY4VMrwslAgs0fAFue6ENrF6XkioF7ZX34o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5KOmLM/cM/If/yIHn4wKFzg9cqgfET5aH6Q9hgn8OS4YD/Re/
	fGoy3mHZ+v/2h2m3RoiPyYLjcKxwyvpwaVqZrwDbRALA4a/QV1bESKctUrMCR9LHC7kgszJavu9
	/XMdTwJ/X7xbqZqTIM8dPm4x6jvzk5QrSYZxwKpvP
X-Gm-Gg: ATEYQzzdHOoXdnDx0I9j9bTn9yzTqWtp2raR2TGL4BPtyRMSeGI6ShMjE7iBAqAtSlZ
	GxeVKdmJSG9RRD7tPqNRb/uaneWjZO5XiKgxS9VGlp7WzaSmzzCzGRG03bvx2bP2Z+EsYGw/i65
	QyW05EFM92qJI6T7Grea0IQAJMeAYKZWcwPNde3l/5DWO5lwDJhWmDDOKQpRC1+KFw69t5ylnBn
	tQ4pWeSqa/01sAspKFsXC/NGSNcG5GJ33A6bbm+qK+BNxO0smUYP4azdi5dZtFFccVB2aYulx3e
	LvvzDGcvuGR1W4VqH0zsqORfqUBFLcIs4Vb8cw==
X-Received: by 2002:a17:903:166e:b0:2b0:5cc5:9405 with SMTP id
 d9443c01a7336-2b0a664d289mr425965ad.1.1774302751322; Mon, 23 Mar 2026
 14:52:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323-tools_build_fix_zero_init-v6-0-235858c51af9@arm.com> <20260323-tools_build_fix_zero_init-v6-15-235858c51af9@arm.com>
In-Reply-To: <20260323-tools_build_fix_zero_init-v6-15-235858c51af9@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 23 Mar 2026 14:52:19 -0700
X-Gm-Features: AaiRm50yylCAkONRByCnsK3y21H-MAkFVEhgsvCDA9ssNccOFZGUuoIYZZ9MJLg
Message-ID: <CAP-5=fW9h2qJK5owk9WNohDTvkUX=Of__nunBsRpjrq6VXT8eQ@mail.gmail.com>
Subject: Re: [PATCH v6 15/24] tools: objtool: Append extra host cflags
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
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
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
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,google.com,iogearbox.net,linux.dev,fomichev.me,intel.com,arm.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-12210-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[67];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[irogers@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,arm.com:email,sashiko.dev:url]
X-Rspamd-Queue-Id: 35D582FDF4F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 8:15=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Append HOST_EXTRACFLAGS to HOSTCFLAGS so that additional flags can be
> applied to the host compiler.
>
> Acked-by: Josh Poimboeuf <jpoimboe@kernel.org>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/objtool/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
> index b71d1886022e9b3d9fde52bf73bd502aa20d173e..a41fb2a46217bb14fcd8d0941=
c99d102945c3f2d 100644
> --- a/tools/objtool/Makefile
> +++ b/tools/objtool/Makefile
> @@ -60,6 +60,8 @@ INCLUDES :=3D -I$(srctree)/tools/include \
>             -I$(srctree)/tools/objtool/arch/$(SRCARCH)/include \
>             -I$(LIBSUBCMD_OUTPUT)/include
>
> +HOSTCFLAGS      +=3D $(HOST_EXTRACFLAGS)

Sashiko noted here (sharing just for common information, not because I
feel this is necessarily making thigs worse) that:
https://sashiko.dev/#/patchset/20260323-tools_build_fix_zero_init-v6-0-2358=
58c51af9%40arm.com

Will this late addition of HOST_EXTRACFLAGS cause a regression by missing t=
he
feature detection checks that run earlier in the Makefile?

The HAVE_XXHASH feature check uses HOSTCFLAGS inside a shell command:

ifeq ($(ARCH_HAS_KLP),y)
  HAVE_XXHASH =3D $(shell printf "$(pound)include
<xxhash.h>\nXXH3_state_t *state;int main() {}" | \
    $(HOSTCC) $(HOSTCFLAGS) -xc - -o /dev/null -lxxhash 2> /dev/null
&& echo y || echo n)
  ifeq ($(HAVE_XXHASH),y)

Because this check is evaluated immediately by the ifeq ($(HAVE_XXHASH),y)
conditional, the shell command executes during the Makefile parsing phase.

Since HOST_EXTRACFLAGS is appended here after the feature checks, the earli=
er
tests will run without these extra flags. If a user provides necessary incl=
ude
paths via HOST_EXTRACFLAGS to locate xxhash.h, the feature test will fail a=
nd
silently disable Kernel Live Patching (BUILD_KLP) support.

Could HOSTCFLAGS be updated earlier in the Makefile, before the feature che=
cks
are evaluated?

Thanks,
Ian

> +
>  OBJTOOL_CFLAGS  :=3D -std=3Dgnu11 -fomit-frame-pointer -O2 -g $(WARNINGS=
)  \
>                    $(INCLUDES) $(LIBELF_FLAGS) $(LIBXXHASH_CFLAGS) $(HOST=
CFLAGS)
>
>
> --
> 2.34.1
>

