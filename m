Return-Path: <linux-kbuild+bounces-11726-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCQvJxcKr2lzMQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11726-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 18:57:43 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0010823E130
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 18:57:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1768A3038F7E
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 17:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 956CD3B895F;
	Mon,  9 Mar 2026 17:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y/fO9i+E"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D523A7853
	for <linux-kbuild@vger.kernel.org>; Mon,  9 Mar 2026 17:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773078811; cv=pass; b=D48BmKj2pjadAALTLWmnRP/GPEhNWfMFSDxNseWUAeGdR0MaVlYRXSuVmhbtxy5xPqaKgcYmzrIH0h1+c9Ey0Z8juO6Fg+61oB0hPu4Uzvm5jJ2n03RscP6wuLJWM6X8rybwNSVbQPoRTday9K9ucvEVhRNPNaDls0sdMHxvakw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773078811; c=relaxed/simple;
	bh=SeWt//XSlE7FH97wAOv/MRdhXb4yjQFM3ji/K8xaQqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tgz1xHAf9l+7XaAD9AlfyF0qKXeoq9Y0A42Tu+47V3b7FrIzrxfEiDRobmRjxmiB3Q/n+8EqJEnwWyknnalehbkHVnSOvkyzArQsrObrbwcUEfVJK1Uk+JZzOfnUY57tzn/408RMGNABx9vAe+w0b2h1dDVL9YV4tFwx2cXGUcA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y/fO9i+E; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ae49120e97so15525ad.0
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Mar 2026 10:53:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773078805; cv=none;
        d=google.com; s=arc-20240605;
        b=KpHapxUwgzw+d51yp51/J9LNy5VrMyUeted/Kvi6dE6Q97Bt9RZcB+CfiGip7dneLo
         iVI70A0TIIvCkWIaX5MkOfkansNrivVOsUmPudPQSXdzKXKDvz23NzW6mv8xU3z0iLJz
         gXLXXU3PJw45qZu/WdEg1ic88d1Ug0UNZqlurkg7R5dtcNKd7BW7S3ZKKU+23EAy4PNd
         zIFPQUMy3ubtnLev3EG9YCv7blah/jVuaveX2SFa1nK2wP3UlgT5S9P3ZWWC/x0rmR7A
         P5sCz/UWTE7NQig+442iLZLrkGAhexOxFtXPsXZ20x7KOHAFF35N4eKhkvdUDlGFw/Ht
         dCtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZPvt17sBw48Uy9b6qgDNm1YzVe8WydV5Zk9wwY2Hrr0=;
        fh=0erh+kVZmnb1bk/PJUMtv+Wc7zotKmBDAT0/GE5J4Hs=;
        b=HXjAfFIF3+fAh7jzzkgSmywykq+1Ox6ImEBLBs24vfRBd9IVOwCWSKJuqomfPLJ/fQ
         Eq2IKySLvEopbLKxrNKiRxK7S35HGCD+eZPW6eVUVSu3cvUkwkSp2CW0C0B7FPrhdrDo
         KL6zBxod0Hz7ep1emNRZvn0DvcwgaiVUrnU8NSZSCmmEFgEaK2bpuDZXaBePg8NZ0CbP
         qVejrVbXev83V4Jil81lfRBeez2/aI9HtBFpjo87ztbURjjPaxKjPURNavVK4PqE11RW
         WqH7KkWcLKyD0b6fELhUHbKYmsacv8afx7UrZfPm+uun/aAZSLy33pJ50FpfZ7w1Cfwb
         R9cQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773078805; x=1773683605; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZPvt17sBw48Uy9b6qgDNm1YzVe8WydV5Zk9wwY2Hrr0=;
        b=Y/fO9i+EVobtRUdlgy12NnwkYs07I3cNqZngk7kvG97Pl1b7nN1wezhs1qvbQqE7sT
         L0bxgyrgsfbRgROFZZzZfUTWwEA68BsPXAA5lspoOfhNiNNzBhRGh/0cUPEfqZj5TNIn
         GZWsReZH4o9W6qFuZUD4Z+t5Rd4bSR1sG++UKRqdRZ+L/VQKwpbeHnw8ih9q4SNcr76Q
         3SPDBFWELMERQMNsXSAlWsv04sLE1C9tWGdz1bcbphex84NmSaYEn68W78p1kC8SPz6/
         G/QJ/FnCdfk9ePA17+IHT78XC3iC56as2tLtNMDT/r6qSpWNpf/d+w1+a0MdIIzvP8/6
         6LLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773078805; x=1773683605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZPvt17sBw48Uy9b6qgDNm1YzVe8WydV5Zk9wwY2Hrr0=;
        b=H3SzNSwZgJqFf1gSnUfs4WcaW0IaEY+4dniSXVJzQMNPfV2OJvBVO8h9xzMu5wL4Oh
         lG/a2AI33pkTa7TGGeV3q4EHTqWCpnre1n9zbVxHRHcwxNdswQtMf+C8yxaY3YsEOOQI
         Ut5YwyRmxsFO3ovKK1foyJDYKREEQm44MPV7q65BDKrvgGvXdnJpWK+4ijOh4EcS22rZ
         3aT5DSv7+q15HFSCHqDgyNPDPh093/4bCBDsMciHIpOLriP+7mLmPglSXqJqLPJQ+Y8H
         KvVDDMz8NvPWUjceLakWnGlNiq0idR0iZmNW23ITTCSPAnLYNZPPlSOBWGvE52DECu/k
         Hztw==
X-Forwarded-Encrypted: i=1; AJvYcCWgYcJb84TGbhPcqQY5H6ONs6tWGd0NIIVgZs6UXZLNKYe4oOUlI5CAkbl0wkFaicJdrJAk87NWzyAb/fI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKOZMEsH6yeI3uczAEaHj7gxyXvlWc6+7IBocHz73ljWC1LC1C
	wK2ojUtDDvBjK4EXzqqpYH7yuZG/fz9T05/7kRot2Wcn0RAXWvhdizhZID0IU/Qz7QTRpkXo4Ty
	vcjpWX1klotCYzEQWC4+UWca4JMRDJy6JvZO6pWAx
X-Gm-Gg: ATEYQzzxEp8NTJcudjmnLgsLtSm4f/mERIftiu3R7PwVyUhPYi52P9+loAmtVNXKX1P
	kRnqmBfdzibARKZV9f9dvQd3heag1pTZU3L9QlfOM799YrCzT0bPiPEN5j9wMzLhkz7yFRvnuin
	7PTWtz1yKvDIBa4OsBYXTboQbdDA2OW7I3CAJHLOEPuzlFK9CqYJSGywSvMX2RmlFDxKdyw5Bb+
	C3sY3XuoF5JBmLypHRCoBE4/m6so8+AYRe+c9d5Stn8JJLgkkFIt7pfEloPFssMB0mIUenXZhZn
	gEDs0Z08m/YwN9hfOl37CfzuVMlpsMb3EOo=
X-Received: by 2002:a17:903:37cc:b0:2ae:46c6:e4e1 with SMTP id
 d9443c01a7336-2aea30cfc85mr220315ad.18.1773078804518; Mon, 09 Mar 2026
 10:53:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260308-tools_build_fix_zero_init-v3-0-6477808123b7@arm.com> <20260308-tools_build_fix_zero_init-v3-11-6477808123b7@arm.com>
In-Reply-To: <20260308-tools_build_fix_zero_init-v3-11-6477808123b7@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Mar 2026 10:53:12 -0700
X-Gm-Features: AaiRm51jJv0K2rf94QzPgrcYebl4loRMt-0YaQXZssGW2-L2HjxaFLVTS-jTCdg
Message-ID: <CAP-5=fWHe0JaJ0FPm7jKfL4YMb8y+o0YcnOfSs=DCgHyNsyYyw@mail.gmail.com>
Subject: Re: [PATCH v3 11/30] tools: bootconfig: Append extra cflags
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
X-Rspamd-Queue-Id: 0010823E130
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gmail.com,google.com,iogearbox.net,linux.dev,fomichev.me,intel.com,arm.com,infradead.org,redhat.com,linux.intel.com,huawei.com,microsoft.com,baylibre.com,analog.com,linux-foundation.org,1wt.eu,weissschuh.net,manifault.com,nvidia.com,igalia.com,goodmis.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-11726-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,arm.com:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Sun, Mar 8, 2026 at 9:48=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Append EXTRA_CFLAGS to CFLAGS so that additional flags can be applied to
> the compiler.
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  tools/bootconfig/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tools/bootconfig/Makefile b/tools/bootconfig/Makefile
> index 90eb47c9d8de67b0ccc74a8de0af3a7e0b97feeb..6bbf4dfdb5b56fcb2a43ccda1=
8b59a270778267b 100644
> --- a/tools/bootconfig/Makefile
> +++ b/tools/bootconfig/Makefile
> @@ -10,6 +10,7 @@ srctree :=3D $(patsubst %/,%,$(dir $(srctree)))
>  endif
>
>  LIBSRC =3D $(srctree)/lib/bootconfig.c $(srctree)/include/linux/bootconf=
ig.h
> +override CFLAGS +=3D $(EXTRA_CFLAGS)
>  override CFLAGS +=3D -Wall -g -I$(CURDIR)/include

Should the EXTRA_CFLAGS be appended last so that the user can override
the default CFLAGS (e.g. switching off warnings) ?

Thanks,
Ian

>  ALL_TARGETS :=3D bootconfig
>
> --
> 2.34.1
>

