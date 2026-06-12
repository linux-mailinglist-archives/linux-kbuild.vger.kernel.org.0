Return-Path: <linux-kbuild+bounces-13725-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iMjkAMC2K2qPCgQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13725-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2026 09:35:28 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 79401677460
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2026 09:35:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=tutk9yub;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13725-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13725-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0A6D33D56EE
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2026 07:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23F7F3DDDBD;
	Fri, 12 Jun 2026 07:33:26 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC5F3803D6
	for <linux-kbuild@vger.kernel.org>; Fri, 12 Jun 2026 07:33:24 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781249606; cv=pass; b=IGo1udmVtx+LntJwcdQw8Id7HRDQYnmDSCfOE6KSVM6U2zgrOC2FLBEi1M0KFSwuucv4h1l9bYWYGhGRnFZTvIOK+zhi0QJ+V2ikRLRCP8KAABsyL8sJYbweiRPEPgL+vRVcvBh+Q+9H8KYssIIEYASW9yZ5bBLosMP/2dDt3GE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781249606; c=relaxed/simple;
	bh=+CK+tt771npQ32DrjHpsZa5xuUy11BpcBUH4eDrxn4c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uJl2noxgLv/zi0+8ywFpHTmAGU4cDwcBJTqMTASKF8NTYF+PsYZZ9HZUc2lOr2uu1P/uocdoHOiVLo6pt5nJreT+O7/s4acfkSCvZrj3kDiuGUz3MGi4PdPo7yT9XLzCAvltw24MswH9Z+CurOPMAcaZj3/jb+5JbdbQ+tnACcs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tutk9yub; arc=pass smtp.client-ip=209.85.128.175
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7e8833c99fcso7018277b3.3
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Jun 2026 00:33:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781249603; cv=none;
        d=google.com; s=arc-20240605;
        b=SUM1I/3kxgdepUuRkcAWC3cL73nPfOEd3Y8/gA1rnXMNALth5fnoJ4q0UQqHB/wWh2
         pJ4vWYiXcRiRUdeLVZlRjwi/1nGF56LI8LzJ7hk6AqExjKJ5nhNeCBAwjhhGOy1aB2VA
         wBMxqjowy/tgtO5cKENdwqeN9e15LeF1wI2khi1L6RYJy46igdBNleGQ/pD44xJkPL4Z
         WLO9s3xjvfI1GYfnUK00fKXj571HBXmno7neAgm5F6VAG0xE2GvJaxX3QSSjfQjcNm41
         2WHb6mAeFVehD76Uw5F1+dYenzZvM27/TNZsFLS3EACeiD8UMGgPDclXzur+j92VU37i
         KYzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=37yHv6yFdGH61lIGAgzgwqwgl+igTLCwlH4B//p5pEE=;
        fh=HrRYKVRC/ggQaWv3oT+aB3OugfJIC9GVDn6YRr1xk2U=;
        b=ACVqnnhM+0DqQEH0ICjTVQcw5Z2IZzRlbz77FgQRMpjabQr5t/448YMD6qWfywMCWK
         R5+kDnIT0MtUqEUpH4bzPeJUT2cNXmvyYrajWA2xCYaM5+YQ2zm320lT4hcA6M7XAnfn
         jSTX6MhcjIpHFHXyOgD/Ap7N4g3Zd6ONfSMcW3S0eELEZ8cMXeLf+s5IQ6CixHRXy/yz
         i56337Asj4z5/sAA3uJGWQTkGyp8LV9jJFXqpB3DWH/10iR347ZdIBAGQ+lS9zsstG2g
         Vvof/L2ei63gYBWhkVgS7GMqAL+tO4aRF28EWxeh/qlU45n8RfUisrJFN0Ddo4fi7dJq
         bHFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781249603; x=1781854403; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=37yHv6yFdGH61lIGAgzgwqwgl+igTLCwlH4B//p5pEE=;
        b=tutk9yubKt7rHGQInrqHwM30HuPbjoAYyeaA/DlyS9ulVx7Xam6hQFFnFX0Mntw92w
         FP29nQouQzxm7wsKMLZY9u7LhPVrwxPgreKyPQz+S+b1V9tFNgpbFHN2YWIMM0RIMHcr
         zjt2S4JuWLGXVZYA3yuWEPE/YdiePv9l1bm1gYpu0qFrN2+JVUvGRAWCLC/ID3UaDJzJ
         fJwS58v324aOEln5ZKPwjAIJ1a4KXwF0TgrBZ8fzjZo6bgxDwdDdbqNfcCRbmwpHVJO/
         g2b2lpak3J2s9Dxyk6EQrBvA9Hail/tGrtjlGeqQbgRdwbiFAyEv1Ls+u9aS+jjcRX5E
         O/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781249603; x=1781854403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=37yHv6yFdGH61lIGAgzgwqwgl+igTLCwlH4B//p5pEE=;
        b=U/asykYVUaWUlN8oYtodb/qhle2vt9hCjH2G1nYzeHmpjOxKJxz3jG+d7606X5W4Vo
         fTTAWnS8HHCZM5HOF1B0LNWk2mXJ7FFoJCZw1mfTO4VgTMHrEf3C2pGoPif+hH/126S4
         JcQlVIqufK45VA0bfcb4+5UJEIaC8LMUfGZZSiJOM3tNzucbtmHgIHFPdXr6s6QbvLRL
         pMwj4fQl3TujGd+rLh1gHzJTeuLFvqwcwu1oDOm+XENWce0azgaOJ6aDR0WRQWJDhOAq
         Tu04ve8h/qZyGpkh0kYLFwpj3sxQ224RVodeqi7lQDbykHXV0RBxR6NXCyqagZ0IlxpG
         s0qw==
X-Forwarded-Encrypted: i=1; AFNElJ+eVbZb1AJLoRniFXA7frT56VtwRQSRa2/6C0b0ecB3j6EvyLoa6LRI799aiRiX6JSbIRvuMfWZKBJPPo8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyklYoNDg4re8hU4b9O7MrOrrITq5t2Qg9uZA/koKJc+/kNhMw4
	ZeBjh9uKcINkxdvtg+ZCijvGgqK0rtZv3aUPjHqCoUzT2MmqRtMoZMtHE5umABC+fO8mTcdda4t
	pDeIvTaDPMiDjIbPT0pI9wRB0XWS3M9b/7bxbQPwe
X-Gm-Gg: Acq92OHvXpLCp0HvOH+9yFst8s9OCFuf2/bfIU42YxXrfby1rs4XaQGT/pMUDXYn2Xe
	FhA6C2DT4926vC5YS5DsFPYuSPnyEm1y6cB58lYzAQsdVhrgrM4PuOZ2Zwt53CUlybKb+EK4wTo
	oyiAuZ5RiNxhK8tul/WH3l7zj3kvVoYqA5JiTilUYY+pqMKfqD2PgzisdUMkiJGQ6LVr9gmihki
	RRqO140BLJFX9lO8ML8FIJcRCfVKnAxoLzv9OJPVb4B0AK+A4leyfVTu55+HimarVd5d/8Xgxv5
	e1eojy0b0KW5HbrRq7H2xskqkV5VmytAlFW7dg==
X-Received: by 2002:a05:690c:c502:b0:7bd:8752:cdbd with SMTP id
 00721157ae682-7f7bdb01a78mr15009497b3.41.1781249602660; Fri, 12 Jun 2026
 00:33:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611-b4-kcov-dataflow-v2-v2-0-0a261da3987c@est.tech> <20260611-b4-kcov-dataflow-v2-v2-4-0a261da3987c@est.tech>
In-Reply-To: <20260611-b4-kcov-dataflow-v2-v2-4-0a261da3987c@est.tech>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 12 Jun 2026 09:32:43 +0200
X-Gm-Features: AVVi8CfstzQNbiRE_Nzp0e98G9-7hbopDZWc7hVRExeHcpnRY99AeT5FguWPzQ8
Message-ID: <CAG_fn=UJTVm+XVjq-wq1GsfFLvQuET7N1A6ZF_BWtYwmDab_TQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 04/14] kcov: reject enable on multiple dataflow fds simultaneously
To: Yunseong Kim <yunseong.kim@est.tech>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, Yeoreum Yun <yeoreum.yun@arm.com>, 
	sashiko-bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13725-lists,linux-kbuild=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:yunseong.kim@est.tech,m:mingo@redhat.com,m:peterz@infradead.org,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:andreyknvl@gmail.com,m:dvyukov@google.com,m:akpm@linux-foundation.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:kees@kernel.org,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:shuah@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:rust-for-linux@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:ll
 vm@lists.linux.dev,m:linux-mm@kvack.org,m:linux-kselftest@vger.kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:yeoreum.yun@arm.com,m:sashiko-bot@kernel.org,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[glider@google.com,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[redhat.com,infradead.org,linaro.org,arm.com,goodmis.org,google.com,suse.de,amd.com,gmail.com,linux-foundation.org,kernel.org,garyguo.net,protonmail.com,umich.edu,suse.com,lwn.net,linuxfoundation.org,vger.kernel.org,googlegroups.com,lists.linux.dev,kvack.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[glider@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 79401677460

On Thu, Jun 11, 2026 at 6:21=E2=80=AFPM Yunseong Kim <yunseong.kim@est.tech=
> wrote:
>
> A task could enable tracing on multiple kcov_dataflow file descriptors,
> corrupting the internal tracking state when one is subsequently closed.
>
> Check current->kcov_df_enabled before allowing KCOV_DF_ENABLE and
> return -EBUSY if already active. This matches kcov's check of
> t->kcov !=3D NULL in the KCOV_ENABLE path.
>
> Reported-by: sashiko-bot <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260603-kcov-dataflow-next-202606=
03-v2-0-fee0939de2c4%40est.tech
> Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
> ---
>  kernel/kcov_dataflow.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/kcov_dataflow.c b/kernel/kcov_dataflow.c
> index 5248293280d5..27587b8ceeab 100644
> --- a/kernel/kcov_dataflow.c
> +++ b/kernel/kcov_dataflow.c

Please merge this patch into the one introducing kcov_dataflow.c

