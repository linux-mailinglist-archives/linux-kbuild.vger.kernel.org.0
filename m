Return-Path: <linux-kbuild+bounces-11871-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCrUIwoJsmkCIAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11871-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 01:30:02 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B53D26BAF5
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 01:30:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11FF930D0950
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 00:29:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EB403D76;
	Thu, 12 Mar 2026 00:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XVjbBdP7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7C52638BC
	for <linux-kbuild@vger.kernel.org>; Thu, 12 Mar 2026 00:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773275398; cv=pass; b=TaKxmNhfqaspwPbVfORvql0CyqwBPT04efGhS0nVS+XBFt/IFgObeB00uKpbc2CEqObsS15Jt6BuXaIAWmIpG4wRxkWXGxjp3n7alsiRFTH3mCHiFGnkx2QajVto6VFDejJa3AsBm8byzacjrbC/atorqvKPZmezFbvoYfC9P7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773275398; c=relaxed/simple;
	bh=YcypzZhNU7pNSG3Co3XkiZS4WRLodx1GYdn6Od+L76g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kdtse+GbpG2KWsjipITkiKQPAYH6VcK/MwXrBYJjz8g/zqw3al0Vpaj5SWFHIiNKUFP260bX7XRhLTLS4XT9lm/GnHnz3qszT7MYt2+Khf/p7dm6Pfy20ufwdR9/JsFnT22td+Nr2VR8gCmoE1RnCM8cFLEtCrs1Ri8XeNB8JqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XVjbBdP7; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ae49120e97so37665ad.0
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Mar 2026 17:29:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773275396; cv=none;
        d=google.com; s=arc-20240605;
        b=WZbaTu/NuIWoSc5Rk0xYSFWWEK65/4wPo5aCf/XFUoHPoKIhgRjXaVph3to9qR3+B2
         +4Nk4nhm0op3GvdeFiFWnr1FBOYoUd2CGiVGztXArNHklq9hcar4xnFWmdpvSk3ohJGb
         XulmfKvs/oRz1EswKVbUvZ6ElTvJaDYE3iVp81EYGtZBbtLe+YHwWaVjcyL29FUk+1sW
         UhTY/aTKXsujUQppvlL3JnfJvIOyLs1w3R8lb9P/+Fv0o7bEfcefAK862vcKRRKGaIYb
         twARZGcSHIx3vtRq5CRSqFbawyJeceW/ZoJCPiI0KVQ2MkpijqOF7d/pXJ37V/1vo6mB
         nsUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1PC+/wr2syCqvxGBoZe6+L+D9Kxcq5YGZvRoBAu0gk4=;
        fh=E6WdS11rGVRg4Vf3KQ9kzrQFwfo/GY164VJjWIxpecE=;
        b=QbW9sY0u25UH3IhbhBLa2B7+U9rCf7DF1bHbo/fRYfw2ulbgk9YXYrwfec0GMAsgEt
         VGMhgo6aPXp5S8pI6mXcaZzPYcMWFI09T21aMFVhOq2V83qNyoRGeYGvefJtzqrP2sgl
         hZWx7AcLPp7g9DGHn3dNX6XKCfrB/+MhX4DHUlodAJIF2+0B44d8zoIa14h79tp+2GnR
         zrr9jVCoanOS/2/kgCvuFR187wPiz2MpMfgSezElH7FT2jTZqI5kuCSqP9g1yMBnQ6ZM
         dxQMEGxl1SeT4DC3ngjCVMuXpfIJA+TJOkMNDg5Vgv+/mo8VNlkYJJjy3UxKBxtbtz8h
         c1HQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773275396; x=1773880196; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1PC+/wr2syCqvxGBoZe6+L+D9Kxcq5YGZvRoBAu0gk4=;
        b=XVjbBdP7BywbdQHnDO4m7R6dIcnBKfdSjjyxAOsnRIfeAtI8OB7DcQrXFTffvDlv9v
         aOc3Kk2i1WHPrsFzZR1wOLt2OiDAqCWMWZnFQmZxNxmRHzvz5U481DdTnFQQQlbZahF6
         eS8S4j8vM0tiaa9tIW9ko3rW6KKGUA6gjHKPfBE2oltaZgTS+BLlSqye8cH4VPR8mIQl
         xNjycZD18On3+wcyBr/hfDx/XIedPP0P4bCQ+4VKExJ+Z2LBU+Svnqkg7KNl5RZDAGAE
         8kaND5KiiKt0uLIv1dM8/2rAvj0Cn77WaY5SnliPXDfXUJ/e/Qe6bmwQnWIOykz4J2TH
         02iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773275396; x=1773880196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1PC+/wr2syCqvxGBoZe6+L+D9Kxcq5YGZvRoBAu0gk4=;
        b=ck+gYbkhpypbo2PHxrOeW/60+snMp3JEaNoK+nN4hFg3D7361Mbp8YDYme6tTjgTAB
         OZKeSe9hGrjRt9c8DOuXkX4IDblKs5bNJLVvutgiboCsyj83bHgVdEAgjeptUHiydWIU
         SizXg5+1Rcnx4HNV9J7Z1Cvxodsq/k4Cld99nf0V/vg54lOxflfC8nGWEMijqxN0WzDR
         u91q2m6L6QgDEZpz+lu26ASF6C3pj4SE8Y/fRM5jOAOenqezwjgACT7GnzM4yjQEXabf
         xCD9RtetdKlcF1v+gLU4oIgwsb0g3LRoGL22WOgnGY2Ne1yZNaVgSPCGWdHQc8K1GgqE
         BE2A==
X-Forwarded-Encrypted: i=1; AJvYcCX9V3/De67fcTeXMLFW4YBhD+7EdLpSLR5EvYAMYpCdVIxSNM/USCSl2Z4GG2Ud0A67l4x89mUeuJm7+LA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGr+ssMTCTbYjtD9q8Ijrsg/RJgtZXAZmDzvDrP6s7oKNsrw1L
	j7msPVLuLl+65/SjcZV+IYe/jYOtJuL1YxJ82jfpQrG4YBNg+6y8fpqtZDkkOVdhWwHQkbI8UqG
	LIVGiNIrc+nKbXR+7RtyrPlLKiGLWqyOIlQKH3Qqt
X-Gm-Gg: ATEYQzxWjAGLrZo+Bdqi0G6FQaSCCvPA0vlIt9pytkL+7v1rijPYmEqRwPWpn1grwGD
	iK+JhGa4/79cciVDvobeYnf757UOPzDnjLALhfmSF/niCE5iFK6zobblxL10nCZ0i07yw3VLbjp
	n5o4I3hBWYKa5EXHcMuYi8QJT9QN0jRBlnfCn00noC3L+4A9miCkOaGpQV3us3BWN43mj3TQkOJ
	CAKRXh+Dq4ycekb1aSPVxLKoG/GhvRpEcAcV0i1699/E8YBtKkUgWQEAAgPwxtn9wWnNvJEMaVh
	n1ovDbAYPgCWYAmJgVxJV+ovDADOQCJ9LIAg8AzHKeeGJgQ=
X-Received: by 2002:a17:903:3c67:b0:2ae:80a3:98a9 with SMTP id
 d9443c01a7336-2aebd197d2bmr962485ad.11.1773275395866; Wed, 11 Mar 2026
 17:29:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311-tools_build_fix_zero_init-v4-0-9e35bdb99cb3@arm.com> <20260311-tools_build_fix_zero_init-v4-12-9e35bdb99cb3@arm.com>
In-Reply-To: <20260311-tools_build_fix_zero_init-v4-12-9e35bdb99cb3@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 11 Mar 2026 17:29:44 -0700
X-Gm-Features: AaiRm51j9bOAiNXwV4INuHof8fl1AJbNKlxnNgZFr0pcoAP2BOsfzP0vifju5JA
Message-ID: <CAP-5=fUsOzjCAOEyJF1cwDbfjSHi=TKjWd1kL6tWWvLu19CFkA@mail.gmail.com>
Subject: Re: [PATCH v4 12/30] tools build: Append extra host cflags
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,google.com,iogearbox.net,linux.dev,fomichev.me,intel.com,arm.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-11871-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,arm.com:email]
X-Rspamd-Queue-Id: 0B53D26BAF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 1:31=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Append HOST_EXTRACFLAGS to HOSTCFLAGS so that additional flags can be
> applied to the host compiler.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/build/Makefile | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/tools/build/Makefile b/tools/build/Makefile
> index 3a5a3808ab2a1dedd40f35ea322913e8a0788130..a86ce3d99e2bb1c005942d9c3=
2191e6eaa55cf50 100644
> --- a/tools/build/Makefile
> +++ b/tools/build/Makefile
> @@ -40,14 +40,16 @@ endif
>  FIXDEP         :=3D $(OUTPUT)fixdep
>  FIXDEP_IN      :=3D $(OUTPUT)fixdep-in.o
>
> +HOSTCFLAGS     :=3D $(HOST_EXTRACFLAGS) $(KBUILD_HOSTCFLAGS)


Hi Leo, should HOST_EXTRACFLAGS appear after KBUILD_HOSTCFLAGS here?
This allows the extra flags to override the build system's flags.

Thanks,
Ian

>
> +
>  # To track fixdep's dependencies properly, fixdep needs to run on itself=
.
>  # Build it twice the first time.
>  $(FIXDEP_IN): FORCE
>         $(Q)if [ ! -f $(FIXDEP) ]; then                                  =
       \
> -               $(MAKE) $(build)=3Dfixdep HOSTCFLAGS=3D"$(KBUILD_HOSTCFLA=
GS)";      \
> +               $(MAKE) $(build)=3Dfixdep HOSTCFLAGS=3D"$(HOSTCFLAGS)";  =
           \
>                 rm -f $(FIXDEP).o;                                       =
       \
>         fi
> -       $(Q)$(MAKE) $(build)=3Dfixdep HOSTCFLAGS=3D"$(KBUILD_HOSTCFLAGS)"
> +       $(Q)$(MAKE) $(build)=3Dfixdep HOSTCFLAGS=3D"$(HOSTCFLAGS)"
>
>
>  $(FIXDEP): $(FIXDEP_IN)
>
> --
> 2.34.1
>

