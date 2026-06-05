Return-Path: <linux-kbuild+bounces-13597-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uxeTFMruImqNfQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13597-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Jun 2026 17:44:10 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B18F8649699
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Jun 2026 17:44:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=vfjKaH31;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13597-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13597-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4A93302C162
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Jun 2026 15:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E5C33E4C65;
	Fri,  5 Jun 2026 15:29:55 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEEE78F39
	for <linux-kbuild@vger.kernel.org>; Fri,  5 Jun 2026 15:29:53 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780673395; cv=pass; b=tG+RVKmrsbwyb7+5uQu5oW/GvEGUKkUPlfyUoUfGzqwTDhZnWdsCzhu4cpsZ4uiAoDFOtjUfpMiA4Opsoxdp6QV5lv9F0y4KSrJj8P6FXVKFRrlyRzSwupYcBPKi9Zv25yZU7vCE0nNRhdBxzQxGtjeotd9HzYGSkT9xTPPiGcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780673395; c=relaxed/simple;
	bh=HON0Vmc+Uv2m+9L/ARZIecJdRDIMB40cGZIqinKUDVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q3joPW7TA8mFxPaUsaxpOubYy88ZJat9Ob1e4E8GF7vgjVzXRFLG1qJL6nPAz18iC5Jl005GbkYutwNbY/vayYXopdTkO/EG19y+7mTYkKQxHLmGA/EX579Q34sK5bEB+Q6imP2er7ClSjcH3ChMTNiZWYGdaHCzrDrR1nqfRUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vfjKaH31; arc=pass smtp.client-ip=74.125.224.48
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-66077c46c5cso2026009d50.1
        for <linux-kbuild@vger.kernel.org>; Fri, 05 Jun 2026 08:29:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780673393; cv=none;
        d=google.com; s=arc-20240605;
        b=ICXpP/rF2tZwDYZFcmKqHa4OVC135p0vItWUGDgXJpuZ6qNkLOm6p1MjM4EMtTIWgj
         7auZcf9KdWGUQMg2E60+rvDUFnuWTsPFAZYR4/yOkTgruc1hYWL3OJ4wkVxXCsyTi2c4
         XYB872dI1XIn7VFvCUtBcwkMRz11jQJ652wG+tkuK+jNd2RvMcQMa3R+Bg5LTenB5gGf
         CO2cIjJBEWrW2/bIKkEIs3py9Q+reoTzYYQAcefVENbx3EKJqbsve3eNxVrb5WUiseYo
         QQG3CFd44FZAcabPYp+j+oEgwbOAjsHSZ79UgM0j5FTLUppFhIravv0Z6q1ItjqRFv++
         wNgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pGE5at90J4zPleIdiXtGRgIUFnfxghG8AWeqoh9Pscw=;
        fh=FHLty6zcO/p9FRLozEW5DQMMA3IlcMfZ9NKMSSmIiek=;
        b=DskctIwMhuQ2qyFZbiZa+WRfxfsS+ZBWMQ46iVAVzB9XkkReBsDPEx1pAumOiCaP5z
         n3nVyNaLtmD01CjiuMJRHjvi1kLUn1SUt/kkOHyuMB9f9LqAvSN5lhRBrm+4s7WeGzDH
         d9M+f+dPy5LlZ8d1HKw45qRr+Beu4VQXX++z6prvOZihkAoTeB2N3EoQVLn2QAQmWpTG
         w45Hsb+JOnOBAwNDNcGY4zF+01S8zjnbNzcMPd0Vu78Mx5W2T8AIIGSmOjjo0bbuJyjQ
         Ui3zv8IF7eRT1pOA/FcWxeKvtS3Xv/T2TwW5AukAe7WxAzTpUYfwIV/uv4tDir9bQwWf
         /3ng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780673393; x=1781278193; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pGE5at90J4zPleIdiXtGRgIUFnfxghG8AWeqoh9Pscw=;
        b=vfjKaH31f+6lQ3upr3PyLRn7MmHU83cfe6ChRbWCt6goUMmPn2jl0rIxPRuESMehyx
         JlwTecA2zsdBdZC4wNajqJ5tDdRhJQGdek1KUAkuSSHnGu5wWNW2zv1FfOB0xlenlvV/
         VHn7ZyBcjHa6J95xUq4/ZAtc8sWgBoZ77jSXpA7Pz0m0mi/AmFceYT5SX8KeR4OKbF8i
         ca4ZQHinJp2Df2RyuEkyXaob7WN7ZZYduCGItkdoLSb9PG3FCvNHZhWe0xqF+DjyL434
         KWUAuftviQm5BlqZ+VUauwjVyT3tZBBP5xYBIFkV3yzuE+6AZODAPGchOCzvtd8BH/4r
         jiiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780673393; x=1781278193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pGE5at90J4zPleIdiXtGRgIUFnfxghG8AWeqoh9Pscw=;
        b=Xsszs4i3NUt7aBvhOo/+3L20KjijTAxkqH9T5V6G9T2fbQLvdRw7010KNPuYm52q2T
         OifRHKShWAGT+B5WCo0/Ry59A9HGEcaiUhvlitj4smhERaNmDmu8C+/AwXbAgZ5gpKfw
         73aNtHLK85TgzEtqlC0UTi4spbIWQjo4OqGj6KBkfUOVhCfq4w0dT/TLn9hbJ5GW0MpL
         JxQip7sf7xhJaoUt821khbvRpYYYNVOKAIJgUbyUreeAOdCTUQp+aXp8Q3qcX+/J0s7R
         ssdlm2tX/xyAFxMVBgt4x7I44OPxU4rrek32bJ73X+qBb+obSgE2Liyi2/kpQeJgfcNo
         w/nA==
X-Forwarded-Encrypted: i=1; AFNElJ9h7/u1/KLJLKUDgrePeLM1qNf+BPoBE4eER5/iu/1bBMUbAgYz+wZLzCvcEvjicDOik5midpyHT3vKi00=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTReZUu2UWGMpTWfNWFEgho28qiLkxzrlKOTzSXBXuPqszocs9
	D4Xxb69dCCyCL2psoumfyZpvs/SoQKHzj+IoJeworSMHPytikroBIOkfoEd5jSnlj1fEnms0B2z
	Jy1URChDSr7egTHno1a7phnn5bNgGVqm3175vX0b+
X-Gm-Gg: Acq92OH2XTvvxjjsz/tUqpi/5b1N0fWhV19QCYxmcbeIUVr4tTlw9qPdv4wDFtZk/1f
	WGW9X8mS0Nh3DfawxZNa69w5TOnYoErhC1r7d7ULXmt1J+l1Tx3lD5YIY57E/V74fbnoqLcNaNg
	/gzXwZRCgr86O4CYtxdMVoh3vARXzKjl3gstI9g2lq2isX6t26NOAbUvLMkNcUqdBDlNT/X/aV3
	AJFMt6/VHKnbL8sdvkOGTu1LKltb+LdBTaJkiI/I8lzQnE34ZMPUxV9PhGwa2o59Pxo9MeFsPLf
	7UCeZqFiynW3Hmi7/JPjhMJNAd2/XLGoRLDIeeJ2bDIN1qdy2Y8=
X-Received: by 2002:a05:690e:4848:b0:660:8e61:1a3a with SMTP id
 956f58d0204a3-66106e3f6aamr2683179d50.19.1780673392488; Fri, 05 Jun 2026
 08:29:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech> <20260603-kcov-dataflow-next-20260603-v2-2-fee0939de2c4@est.tech>
In-Reply-To: <20260603-kcov-dataflow-next-20260603-v2-2-fee0939de2c4@est.tech>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 5 Jun 2026 17:29:12 +0200
X-Gm-Features: AVVi8CexkL34vp_i1CuA85Czs2clQeB-m5POHKFPZIkxmr9X1YgpCn5QeGEQ9Pc
Message-ID: <CAG_fn=WavwJakpE35nc+SC2pdhu7zAtS-NTGuzsnDo=84pX8zQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/6] kcov: add build system support for dataflow instrumentation
To: Yunseong Kim <yunseong.kim@est.tech>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, Yunseong Kim <ysk@kzalloc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:yunseong.kim@est.tech,m:mingo@redhat.com,m:peterz@infradead.org,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:dvyukov@google.com,m:andreyknvl@gmail.com,m:akpm@linux-foundation.org,m:nathan@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:nsc@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:llvm@lists.linux.dev,m:linux-kbuild@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:ysk@kzalloc.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-13597-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[glider@google.com,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[glider@google.com,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[redhat.com,infradead.org,linaro.org,arm.com,goodmis.org,google.com,suse.de,amd.com,gmail.com,linux-foundation.org,kernel.org,garyguo.net,protonmail.com,umich.edu,lwn.net,linuxfoundation.org,vger.kernel.org,googlegroups.com,lists.linux.dev,kzalloc.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,est.tech:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B18F8649699

On Wed, Jun 3, 2026 at 7:43=E2=80=AFPM Yunseong Kim <yunseong.kim@est.tech>=
 wrote:
>
> Add CFLAGS_KCOV_DATAFLOW and RUSTFLAGS_KCOV_DATAFLOW exports to
> scripts/Makefile.kcov, containing:
>   -fsanitize-coverage=3Ddataflow-args,dataflow-ret -g
>   (with optional -fno-inline via CONFIG_KCOV_DATAFLOW_NO_INLINE)
>
> scripts/Makefile.lib applies these flags when a module's Makefile sets:
>   KCOV_DATAFLOW_file.o :=3D y   (per-file)
>   KCOV_DATAFLOW :=3D y          (per-directory)
>
> Also supports CONFIG_KCOV_DATAFLOW_INSTRUMENT_ALL for global enablement.
> The flags are only applied to kernel objects (same guard as basic KCOV).
>
> Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
> ---
>  scripts/Makefile.kcov | 6 ++++++
>  scripts/Makefile.lib  | 7 +++++++
>  2 files changed, 13 insertions(+)
>
> diff --git a/scripts/Makefile.kcov b/scripts/Makefile.kcov
> index 78305a84ba9d..101173fe194b 100644
> --- a/scripts/Makefile.kcov
> +++ b/scripts/Makefile.kcov
> @@ -2,10 +2,16 @@
>  kcov-flags-y                                   +=3D -fsanitize-coverage=
=3Dtrace-pc
>  kcov-flags-$(CONFIG_KCOV_ENABLE_COMPARISONS)   +=3D -fsanitize-coverage=
=3Dtrace-cmp
>
> +# KCOV dataflow: trace function args and return values
> +kcov-dataflow-flags-y :=3D -fsanitize-coverage=3Ddataflow-args,dataflow-=
ret -g

Instead of adding debug info here, consider adding a dependency on
CONFIG_DEBUG_INFO.


>  export CFLAGS_KCOV :=3D $(kcov-flags-y)
> +export CFLAGS_KCOV_DATAFLOW :=3D $(kcov-dataflow-flags-y)
> +export RUSTFLAGS_KCOV_DATAFLOW :=3D -Cpasses=3Dsancov-module -Cllvm-args=
=3D-sanitizer-coverage-level=3D3 -Cllvm-args=3D-sanitizer-coverage-dataflow=
-args -Cllvm-args=3D-sanitizer-coverage-dataflow-ret -Cdebuginfo=3D2

Ditto.

