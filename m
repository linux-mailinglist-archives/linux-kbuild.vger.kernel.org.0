Return-Path: <linux-kbuild+bounces-13599-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4uIxG1f5ImrffwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13599-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Jun 2026 18:29:11 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C364649C59
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Jun 2026 18:29:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=Ui8wUur8;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13599-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13599-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C6691308D538
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Jun 2026 16:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50CA53CEBB8;
	Fri,  5 Jun 2026 16:21:28 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EF93B19D4
	for <linux-kbuild@vger.kernel.org>; Fri,  5 Jun 2026 16:21:26 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780676488; cv=pass; b=IHJR/MOk18UEppGTy8xbEdvNuxDJCw4oRSbT/0ulIMkSwHTTjIfyPVysaPBbFqZu6UB/D3Geh4FiPGmdkwopWax4DN6F549R4Q5mMXNeeYx/DEzaAmYXoIz4wIjvPK19bIPXrs8lxQajp3yQPvkdAlTB6Wv78u/fLfjMX8d3Llk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780676488; c=relaxed/simple;
	bh=mWB1QjoCqaUp7xOYtL0VXwUOlRHPZS3Zm5pVWOTzZow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XgTr9Ht8oJOraASsWeAXeaqWoeQbUGB1xqq8eRc7JRxxPNCmT8TTBSQGcK2h5A6+wTF11j/EWWungcfy+NA44ZPL2MCzjdOTRkphrnqjoTFgpno4WIQ5HeS3P7jt+CrBgzPxBGnQ7k3VV6xCa8+OndBvLmMBJb4AVprRciAjbVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ui8wUur8; arc=pass smtp.client-ip=74.125.224.51
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-660456349d9so2588664d50.3
        for <linux-kbuild@vger.kernel.org>; Fri, 05 Jun 2026 09:21:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780676486; cv=none;
        d=google.com; s=arc-20240605;
        b=Fi7LLWeeyuY6eNGYLN0rkNm2yaFL7ii872W73ECvXoRM0KSRbeqIiXS38i/JNp8tT3
         W/G70+RtlUnc+Cryvap15VRl2yOEbvhsGh9EsvptnQBxEsjuUvOBixq13BwEPs1bJH4o
         wFrBVN47fZMO1zwnhxSIIYCxdhLaXNMf+vP2fhHUUNqYSLhxYTnBv1OSMOcurGG78Qzm
         ifBcUFupK8Y5Zp7L23tp+hCxtfURBuxPFZEb3KwahUQVdShL9gYSWvwCaC8qr9N+16aR
         ce2alMES4kKGbWYLMggubQcD1J9qqS7Y7S2wWYjLi5d/KzKU24OK8GQJzVMbjujSgRUO
         WA2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mWB1QjoCqaUp7xOYtL0VXwUOlRHPZS3Zm5pVWOTzZow=;
        fh=MBguZh1OlrvD1XfvgN/4CGdIlFOby61IFFYiGmyRhK0=;
        b=MX+eLuvKVQgta/NG74zkn2dfuiqjCeQT5hSNtFRoead2SZfDSZwZnpsVMDiIL0nOp8
         bjTwp+jHmlxuXyfoAXM/10lW3JRCC+AGv+MXlm2vrXlRM5DoykGlAQZ49Rjs/c5hWuc6
         v8sdUoz4a3TE9WOs3pocsgHcWcobOPNROFfoLRMF4KfI5Tt4RTpRF2B6bbPI06/JmwDW
         ESe/1F/56S4VXwFClFwBD5lNX5QGwPmXGIDDbNwHejoAcQPk7aWenGPnckUCwM5Uk7Qc
         YhFmcYSU3JS0mJ0PiTkQt1SUTbY9syZZ+C/MUlSqc/9fFnyr9ASCEPX1VMIWJNXPesAZ
         d1jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780676486; x=1781281286; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mWB1QjoCqaUp7xOYtL0VXwUOlRHPZS3Zm5pVWOTzZow=;
        b=Ui8wUur8KSyN0pvynRn3skezHBd3sfh1W5TIjT4eVt8Ktiz8vrwisyKkScL5uRWs83
         GBDkw6QrKOQy7eVUQZoCJWF5kgJ9MUu2mbMLhq6GgQOCJWyTwgqUwp3kwBc1JF6hg0cY
         AVaO6PI9zVJGkoVY23ra2X+Pshx9zPmheAZP3Vgy5eNnT59Is8pWFvrufHHr7ADCbIan
         N1LnZ2808X83NOKNBnd2eL5qBX97ba92cAY2Qh3rEEM5SzBPlKMWOzrojBQau6ULIAiL
         fq+cXcJbuJiw+OekQSmQwaeYvzjLb5tD7/ywY9GJ8ni0M44MdhHBiNzPnzL2umckP+rC
         RWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780676486; x=1781281286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mWB1QjoCqaUp7xOYtL0VXwUOlRHPZS3Zm5pVWOTzZow=;
        b=IaoOQLoy9mzSB80KiC0Dcv6H8yQOCXwFGAbAiy+MujZihLW3MSNugBJRLCbOTwdQdL
         ZeBn0WxTNkh1HP+IHKqAqF6PsNdC/xR2cI5sI3zQoiZ+GMm0x6PVP5QATmgy5DDME8ek
         Cc39kP8G6pz2ep0ybuuqtp+k1xhCHlKzO/GBpdw/2sKr7bNP3NdyhDr0zQQ7IrMyWkdj
         1tLtFHB2d+S9jmhV0usVeYo2ntqjWNXL10NM3hZAetMYPhTnklo6kBXwdBs6VPXqAsZ9
         aDNiyksF3d/nGdof31BLAJcpntz9kHGzun6j/7qzP/TcijHZCnRfUDAMYsBTEHB7h61/
         +C1Q==
X-Forwarded-Encrypted: i=1; AFNElJ8QgyBGiLV55zzE3p5/5XbEkkms5xl3bv1ilLoL9VH+RVrRLdBSzXJlDndj2gAc4U++qkETdeDoC4zaR/8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWxafh97dKU53OkAnyZXGOfPtJjmtTfslEVDsmPPeHLQtGvgqv
	kuFHpy/wuk7kpANedAnf4odmp8UexD0Gygf/wslS5a7ZDUnYAaghZ+OJGWEfWRRPcHFRHlykBfn
	yuER9tLRShZewCovaJ2mNKq4AjrOzlSkaWXFaPSuR
X-Gm-Gg: Acq92OFxSPEHpWTpNQKNMQ55ZSs9iZV2NxHOs/p9VCsunsVyqBvp2/LMDTPtxKhJKRH
	ckOGU7cdxgCWfvXyTbwdwHRYao8I8ervyD8As9GWYivYcwhcKexmFlbv/LMJ5cdMmm1fYTbGzH7
	FEzlqFt0hfWkh3wllJp8WNYvtpeelZNsB9vkHFluppEIslirVF6mOT8qW+iEfAownu+ohty97bA
	Fku1llAjlYkYAKtPSBivlcqZzDNs5/PQYWsaO3sDjCsuiiUTmYWKphjeyziDfWqQ+AVHXZGPDqD
	Mqq8o1ZIXEX8Gey5voT7OazjCWgyVSuSQu8E1xVlNmE3KIVwLFs=
X-Received: by 2002:a05:690e:1388:b0:660:877f:a5f5 with SMTP id
 956f58d0204a3-6610704f8f0mr3897550d50.43.1780676485426; Fri, 05 Jun 2026
 09:21:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech>
In-Reply-To: <20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 5 Jun 2026 18:20:43 +0200
X-Gm-Features: AVVi8Cev4P7AiBmPodWfwaPtX8_k3m47tFa_rHl6t21z7L5L4Qmm-6Ly0xXbR54
Message-ID: <CAG_fn=W1++qPJWQk1+4MtRfe6n1iUKF2O5pddnqKGwSq85CuqA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/6] kcov: per-task dataflow extraction at kernel
 function boundaries
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:yunseong.kim@est.tech,m:mingo@redhat.com,m:peterz@infradead.org,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:dvyukov@google.com,m:andreyknvl@gmail.com,m:akpm@linux-foundation.org,m:nathan@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:nsc@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:llvm@lists.linux.dev,m:linux-kbuild@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:ysk@kzalloc.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-13599-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,est.tech:email,sashiko.dev:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C364649C59

On Wed, Jun 3, 2026 at 7:43=E2=80=AFPM Yunseong Kim <yunseong.kim@est.tech>=
 wrote:
>
> Introduces a new KCOV exetened feature that captures function arguments a=
nd
> return values at kernel function boundaries, enabling per-process visibil=
ity
> into runtime dataflow.

Some high-level comments:
- Make sure your code can run on every platform supported by kcov (namely A=
RM64)
- Check out Sashiko findings:
https://sashiko.dev/#/patchset/20260603-kcov-dataflow-next-20260603-v2-0-fe=
e0939de2c4%40est.tech,
at least some of them seem to make sense
- Please consolidate changes to the same file into a single patch
- There seem to be two tools (one in C and one in Python) with
overlapping functionality, can you keep only one?
- The test modules seem to be used only in manual testing. Can you
convert them to kselftests or remove them?
- At this point, long dashes in the kernel codebase are quite rare,
and I don't see a reason to add more.

