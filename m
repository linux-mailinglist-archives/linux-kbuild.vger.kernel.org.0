Return-Path: <linux-kbuild+bounces-11721-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EGLGrwBr2lmLgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11721-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 18:22:04 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D832323D92C
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 18:22:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95970302F266
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 17:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 430903ECBC4;
	Mon,  9 Mar 2026 17:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DtyLz6Xk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C67C3E0C47
	for <linux-kbuild@vger.kernel.org>; Mon,  9 Mar 2026 17:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773076649; cv=pass; b=bqG8ceLjbRZ3wTo75UYJ8Hmae+raaj0u6E7QYs+K9m/q+KuQtmLAp/vON4zfPkf4Bw85MpNG007vqU+gxLkMGYNvMFrAXUrLkSeRCFoh7zBBNQ6yN6/9AX8dneBgHQ52gOyjbMYxhT3X5/SZSk7vmrB5VoRLkowNbazOhHOo0qo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773076649; c=relaxed/simple;
	bh=KlVS4uimnGg2P9OAHjWKxIKUvpjpakW2vhNGGc1Iif4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u7vlzn+nVWRFR8nZ1W2y+AtUv3AXof5jVPd6ylvqWICzVxtvdVPnphSiqgr43Xi1Uy4lQw4IQfGRcr7aBk3Eg9FzbUG4OVJggl3tqhKaQwyNgMNnyEOTVElSgThr0h7KLLRIA7IJh3o5ePRLMgYnubH99ylxS9tJ3vtoHDoVVRc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DtyLz6Xk; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ae523d54d2so8065ad.1
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Mar 2026 10:17:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773076647; cv=none;
        d=google.com; s=arc-20240605;
        b=QI9R1c2fgTiBjj2w/h8cjPZQqzwS2j/pGtlz4AfvMl5R4TxEs1CfP8UrhXkCUu52MM
         Utb+GDJm5GtVrwANLuk5BRXRQAs2912098S69pwZrUVd6wg1F8QlsfJQ9TQDeEXk5glx
         Y3TuMmAl/M9IOOiwPfetzqkTghKQ3e9iSnbo0P3MHg9vT69XE3lGrKhe/WdB7Hee1Y7v
         i9UgNLbiDALm+2JYLEME5wgcJnCYHWYMz79X1+f7U9+BN5octpak6oJ13jkI3hoMm9sx
         HxbNSUN6HGRZ2FtX+F7BBEQ7wRg6dtOP+mwH/Wocp2o0ymNTLS96hcLdyQm0NCi321nD
         /ZfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w45p66NfPrqrjiogvGBWv0oHv9O2Jx2o1hhM+o6/k7c=;
        fh=tIor71bQopysw5zZAs9k098j9tG+xLzKNKpfvhcXPh4=;
        b=akVC3VXbGMJIFfFz3VhebC64beJESlCz9oAtLD5/2dQstpEyPY4leF1CoSq990e9uW
         cC3d8bKeYzlvtlJv/LK9ui7rbjx0Ha9v2U6DzDDEO9QJhmwTyRGUTUVwxxCBAyHKOgoQ
         AduoSjWxW0EJIblPZAr5R/t6JCiI3/J57LywmmgvHciTGX1leF0tgt548KCU997F+leS
         u9bCmMQKYRZ6dWulHqMEqdJTbCFTZwd3a/neVMImmzn2o0PRnDJA69ePmS4Zx8r1EuGQ
         zruF0rv/6Bms1hVii2z0/pdspS9OVF3R8FDmz/c6Zm7Ro77C84KiGSCrxMrTAFXEFH/v
         t9ig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773076647; x=1773681447; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w45p66NfPrqrjiogvGBWv0oHv9O2Jx2o1hhM+o6/k7c=;
        b=DtyLz6XkzIZX72KCcwdnzd0cgJZN8c3WRVxl7zo8S+uvNHsUyYLY80oZHy9ZMdhMOm
         dWwieRIJKSYesLiAN8AUZmKeXJvVsUBmx1EZRRQwHr5P8d+dSfsQbOCPiSIcEHe4prAS
         9H1aWRTCUgumLGy5hhUKgzVwptje4ptmK6y+ECi8Mz9l37WHLOjZs2Us/j58tJKzl+hf
         xzwysuIEcUjtYnqlv2pvRWjA3kDlnWgZsg6RZUMdhZyZ7UNhpjLo8x3sJapuwtZNx6X6
         q2D52zpfTLE+iCcL1vXlIyyp2WAJU+eJzXNkTB+jV4t6ICYoeIBTEkEvD2Edvi5gnVdF
         avMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773076647; x=1773681447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w45p66NfPrqrjiogvGBWv0oHv9O2Jx2o1hhM+o6/k7c=;
        b=GlKgXPLHlOzluAGb3SP0I66W6YJhXFmt3DRNk/deAVTUvJg1Y1tzYL58/4ZZqvcOwU
         xq6ubpBXghlRYDlKmo7c9vXeNdKj355eb3SHNtwcrIPyXb+3HaHVYs+KmrgCqKWBFfdS
         dO0hRDTqB+uZzxqFMsP+trCHH1tCKv4ScwnEvoxAq9NKa9aJQ+xgKD/t55exoVPYDfhw
         1mLVHEVVIcA2QhJCJQD4/S5rD9QbV3/UVWz6QfuPyAt5zJqUMt9F+z6250GmUvF3uaFA
         IRiiAeMxWQT7RFXODxXWz16XKh3mJEqxp9HJ0EwT6WFHUUgHasD0eClNgPw/JMlwUxGN
         Tb7A==
X-Forwarded-Encrypted: i=1; AJvYcCUV7IYZndCDW24e3uG3H9TFfwbXRzPSn9xfnpqiFmVsPDKD7GAmXhBjDeJnjDa99QimAsF85nxTaN68ayo=@vger.kernel.org
X-Gm-Message-State: AOJu0YylImZymmo4eKdQororQJKwWZv69ZYIYT/ZmD/5pN2iXZSGyODg
	/EvYtNQoZM2jjmfD23vTHvbtE8UA5YIxIY8atdR03FSw/cA1+6GIj2i5MaRzQ9AQvChb8bTEngE
	3+XFEq6VvY6CAZGkaRVWlckurJJ5rRSNOAOuGPy7t
X-Gm-Gg: ATEYQzyBX2yv7hDyGHW3thsF38jfdIK1XwsGIB0AEJBBHz99Aat/Ra9fK/qfHYOgs1B
	1KPuhbspRXPkMArOrXBoEpZbhePeKKcFVkHRHQ1zUSihwoEwjffa3xXfznr+kWgH2wQskc2jFAH
	fSr1SzlgmOgwTVe9WgOXYOh3Um8VYcV9oy3O4QGlMOezRk946NHsF+0/B5273B/aMe5shlREnrq
	STEGnvb5yZqwYMNXqyrzL8kcWshkeMpcu+/u1UBTWeFhb14hJuShOCQHs4HAe8BEAG+CE8bNfWe
	oxwdgk0s9lni5JZxrxNpTMHOOi4AJz2ltNYC/KHwm9yuIw==
X-Received: by 2002:a17:903:2345:b0:2ae:4e8e:954e with SMTP id
 d9443c01a7336-2aea3247986mr23025ad.5.1773076645917; Mon, 09 Mar 2026 10:17:25
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com> <20260308-tools_build_fix_zero_init-v3-5-6477808123b7@arm.com>
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-5-6477808123b7@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Mar 2026 10:17:13 -0700
X-Gm-Features: AaiRm50U-PXwLYjmiDwgX5D5-bqDn4azdaS0klGDRU3-QqWA5WlM1eBYcGFDKIM
Message-ID: <CAP-5=fV5jFCyyywddBmijiedcVLKz+LReU=NPkUOcanjJ5oAsg@mail.gmail.com>
Subject: Re: [PATCH v3 05/30] tools build: Append -fzero-init-padding-bits=all
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
X-Rspamd-Queue-Id: D832323D92C
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
	TAGGED_FROM(0.00)[bounces-11721-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,gnu.org:url,arm.com:email]
X-Rspamd-Action: no action

On Sun, Mar 8, 2026 at 9:47=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
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
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/scripts/Makefile.include | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.incl=
ude
> index b5ecf137febcae59f506e107a7f2e2ad72f4bef4..bab3174565f0d1e40ec574a36=
0a0fddcee641f7e 100644
> --- a/tools/scripts/Makefile.include
> +++ b/tools/scripts/Makefile.include
> @@ -137,6 +137,34 @@ else
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
> +override EXTRA_CFLAGS +=3D $(call cc-option,-fzero-init-padding-bits=3Da=
ll)
> +override HOST_EXTRACFLAGS +=3D $(call host-cc-option,-fzero-init-padding=
-bits=3Dall)

Could this slow down builds, as each reference to EXTRA_CFLAGS and
HOST_EXTRACFLAGS will invoke cc-option, which shells out and runs cc?
Perhaps you could evaluate the values once then reference them
something like:
```makefile
FLAG_ZERO_INIT :=3D $(call cc-option,-fzero-init-padding-bits=3Dall)
override EXTRA_CFLAGS +=3D $(FLAG_ZERO_INIT)
HOST_FLAG_ZERO_INIT :=3D $(call host-cc-option,-fzero-init-padding-bits=3Da=
ll)
override HOST_EXTRACFLAGS +=3D $(HOST_FLAG_ZERO_INIT)
```

Thanks,
Ian

> +
>  ifneq ($(findstring $(MAKEFLAGS), w),w)
>  PRINT_DIR =3D --no-print-directory
>  else
>
> --
> 2.34.1
>

