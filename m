Return-Path: <linux-kbuild+bounces-12423-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNV/HQEJzGn+NQYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12423-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 19:48:49 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCF736F57E
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 19:48:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 76AC830ABFF0
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 17:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DB6634404A;
	Tue, 31 Mar 2026 17:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MK0ji7lx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6A2365A19
	for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 17:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774977404; cv=pass; b=OhIzgC1w72WrNjNMOqZnLB8uNCMqJdLjLuuwGdMSLZr4N7pM9O8Nt0yVvwMffFQZJgJT+q+Txe4AdEhxAvN8A6/rkMm+yQWrODlCTishms5kdjOn0nCae+AVf3d4huoCg3Xn28U6DDRLfbyefQcEoD4vVfGyj/aJW2+CUvCOaQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774977404; c=relaxed/simple;
	bh=AlaAv/oY4ZLWVnm12PAYx9dKZ0BFTL5ugcVHQKGpG3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ru1ObEh6dO1iQoJdVAfRrKwFTaKTbBQRBYQrFyVS0mo067TR/tDlnfK6IJi+rqqCqEEL3Y2LfRILSKPRps8oLdjEt86yC5D6eZ7ef6EtR0HzQmow4r/gxhia2RmPP9ty/Eyrr9XScUsLE77M/Y3zk1qbpVnRiuYG/IOUQdScWkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MK0ji7lx; arc=pass smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-604dfcc9892so3910883137.1
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 10:16:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774977401; cv=none;
        d=google.com; s=arc-20240605;
        b=RPmA/UsGBnF7rBTmtHks08qYqXny+v8MfZbbSWtzTLnc4sF/5u9WeClZ2lSunzXSVu
         2j7S8gHEp8NsTo2HvKmbqhw6NvCzNIHoTpk1xUUOqs2AuZVfrY5A74fBIEISucI0Wxp7
         KVMt7xixDgppiWuxCj8LD9RYtCupd0keu1J177cKJO/KfBplqNPFr7FnH23jaCrnByp6
         SeYbLdSHvp8vOdzK9JIvR6MU7xeyhPUb4tUr6b/CPqsyr2kuRHEcU5NNSUEc4URJVdLI
         OU8+xriz8+IMU/rgaKr9JH4VK9dCSNmjZT6gxu9ep7fpsdGXgessRr8cXj0vC29xR0K8
         N9qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8hJONhGlSkQz5oARDr2KezeMGnAwxGjBhhSBkIE6ImE=;
        fh=/k6J3GaoMdDsu3ekX9noK5vAjqMD2x4KzYRSwOyS3eU=;
        b=bDOMbY81/8rVgXu+RsE66VTemky/ANIxfiXYGYdIn1NUdKV6JhFR4S0zo91bbvU/uR
         2d3Z+TaVvCUcyKFWuPbKDdnszLAfybDUPcaXMLa9whqyaIfI0026sokSg+AScG6psI8d
         DUk18jtDFYkFLL7r4fsCQWZdsldTcwdN4XDJjWVuMv8y5SeA6voeENC32MKxwO2pq9d+
         VAq7QKUbJ7ncke4mourBZGM8DtwCWI/mH7WrSjwYXTo08VnJ0KbYx+w4ckwbAOBJ4sJd
         jEARB/q8cm9i6jTSScjDWXK4BxPKvWpuyajBK+GpCKsivF4XreZcGUHeJdKrhI0M8S6g
         lB5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774977401; x=1775582201; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8hJONhGlSkQz5oARDr2KezeMGnAwxGjBhhSBkIE6ImE=;
        b=MK0ji7lx5K+4J8My7zWUMRzX2cDA1hoBCASSEgK8e5DPbLIag/wFTlulTZrauW9Nbn
         0+B6u5lOwAku3SMMMXFnIGNy8HxowIu+HV2bkvgwE45DvELmrOu7DV0j7jO035bXxaNf
         LOV/p7SznWRuTDaRHUS7EZmYOyROphaWZ8GnYO+x8Sw09jk8lhWg+LBHZS1wB12+dKYn
         cqiQm1xlVQ4V4/OMUw6+tPrJvAJkY7poDW9VSxWLv1lT1HplEV/s8XPUfGCFbf5EEyNe
         tr/GeAoV1kwLZHsLC3PMkhU1slo8LxiM/A8dKbmk4R0xZE7TxUo15q6Tr4aLugaY99KN
         86Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774977401; x=1775582201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8hJONhGlSkQz5oARDr2KezeMGnAwxGjBhhSBkIE6ImE=;
        b=LrD9EKuFimjTUyCcR5CBhk30GoY/zE0NMDk1a3Ti+dbqFa2SsWE1hVwojza7Of910b
         1+BPxYRv1p8sw9eDWBnahGtCZEs3ybvYVjzIDgBiSgV885Cav0YxSHTvtEBulwDOwcqJ
         c4bxL3Qt0NTHHj5nXvOz3Yc7KQdgwV+tc3Cj2TC6IU5a4lSTfPhs7wlZdMx32ESF41sI
         1h9XCBmHTjNfx9mY7ZaiK0l+EFpl9prcl3/UB6vizzHYpA3sQtZDwa2xYuxZlSmIWxlG
         VYxa6ePNHeBHmAAA7AHJFDaBoAO7SRxCsik7nE7lV8ROxXqxhPb0+CnTgn/NlS4nDj/W
         jBuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNtVGtj6kddV1qxbX/17ZgYDRS29iIUCpcmIhJbE0pbZDmNOeS79vMHoVGSGaCQ9s4zZLIprSh5MH3FIg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6aKfxdOIE6Eceyc4bGs0VHQ2f4YdMctshcbLGnixgWYSzanFT
	WHYxhBlBnAC0cB5Y3a6u0AlA2kSK/T2KLSlsuYmU5CiZZlbb9P8I23WdD8DG2NpkcbaHXwJiNnT
	2jwETL2nM/pDpd7YrIdgDF8vydSOZ3tGl2a7aFYFX
X-Gm-Gg: ATEYQzy1zl2SezR6NThHib1jIcxOTfNlUop2CEIUxKFDZ+U5tj8GRvYNmTpJQrsoDOK
	d/dIzaLmDY8CS7Y+TcD8c7HBgfziZdPTyNkSIpRdQKYD29qod7iZJ5ZK3MJNpyMEZUw+ETXLc90
	LVRuIQrgJPE8v6s61xQJScCuaa55SiK4zG4irEHN4uisNkk+et2/0g7LSgfm5wWo1L4LcMneesE
	CvZD03YuGa43BOFTj/zS6DOfMhyun+Ivl2tlIiwHkqarY1LNo+7R4yuFoafRJYcrEs0P/Rm5ul9
	352ig64=
X-Received: by 2002:a05:6102:c94:b0:602:ace8:f20e with SMTP id
 ada2fe7eead31-60567e8d127mr38526137.14.1774977400614; Tue, 31 Mar 2026
 10:16:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-4-kees@kernel.org>
In-Reply-To: <20260331163725.2765789-4-kees@kernel.org>
From: Justin Stitt <justinstitt@google.com>
Date: Tue, 31 Mar 2026 10:16:27 -0700
X-Gm-Features: AQROBzCGiv9foA1bZmO6VZEpCJ9MD_wSGSd-WaAakLK22vknVxHA_3Jppbf1n18
Message-ID: <CAFhGd8pqeckxVVmNrGkb51gdaeTa7MY3BvsRfWVBGd_i=oZxEg@mail.gmail.com>
Subject: Re: [PATCH 4/5] lkdtm/bugs: Add basic Overflow Behavior Types test
To: Kees Cook <kees@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Marco Elver <elver@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12423-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[justinstitt@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ACCF736F57E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Tue, Mar 31, 2026 at 9:37=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> Exercise the end-to-end build and trap infrastructure in the kernel for
> __ob_trap, __ob_wrap, and associated sanitizer ignore patterns (i.e. idio=
m
> exclusions). Add a test for each of the basic overflow conditions under
> CONFIG_OVERFLOW_BEHAVIOR_TYPES=3Dy, as well as the corner cases associate=
d
> with promotion, casting, etc.
>
> For example, executing this test with CONFIG_OVERFLOW_BEHAVIOR_TYPES_WARN=
=3Dy
> (instead of CONFIG_OVERFLOW_BEHAVIOR_TYPES_TRAP=3Dy), will show:
>
>     $ echo OBT_ASSIGN_TRUNCATE_TO | cat >/sys/kernel/debug/provoke-crash/=
DIRECT
>     $ dmesg
>     ...
>     lkdtm: Performing direct entry OBT_ASSIGN_TRUNCATE_TO
>     UBSAN: implicit-conversion in ../drivers/misc/lkdtm/bugs.c:825:10
>     cannot represent 'int' value 2147483647 during reference binding to '=
u8t' (aka '__ob_trap u8'), truncated to 255
>
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: <linux-kselftest@vger.kernel.org>
> ---
>  drivers/misc/lkdtm/bugs.c               | 253 ++++++++++++++++++++++++
>  tools/testing/selftests/lkdtm/tests.txt |  10 +
>  2 files changed, 263 insertions(+)
>
> diff --git a/drivers/misc/lkdtm/bugs.c b/drivers/misc/lkdtm/bugs.c
> index e0098f314570..f00c9099957e 100644
> --- a/drivers/misc/lkdtm/bugs.c
> +++ b/drivers/misc/lkdtm/bugs.c
> @@ -817,6 +817,249 @@ static noinline void lkdtm_CORRUPT_PAC(void)
>  #endif
>  }
>
> +static void lkdtm_OBT_ASSIGN_TRUNCATE_TO(void)
> +{
> +       volatile int big =3D INT_MAX;
> +       volatile int wide_low_value =3D 5;
> +       u8 __ob_trap narrow_low_value =3D 0;
> +       s32 __ob_trap same =3D 0;
> +       u8 __ob_trap small =3D 0;
> +
> +       pr_info("Performing same-width assignment to OBT\n");
> +       same =3D big;
> +
> +       pr_info("Performing small-value assignment to OBT\n");
> +       narrow_low_value =3D wide_low_value;
> +
> +       pr_info("Expecting trap on truncated assignment to OBT\n");
> +       small =3D big;
> +
> +       pr_err("FAIL: survived overflowing truncated assignment to OBT: %=
d -> %u (ok: %d -> %u)\n",
> +               same, small, wide_low_value, narrow_low_value);
> +       pr_expected_config(CONFIG_OVERFLOW_BEHAVIOR_TYPES_TRAP);
> +}
> +
> +static void lkdtm_OBT_ASSIGN_TRUNCATE_FROM(void)
> +{
> +       volatile s32 __ob_trap big =3D INT_MAX;
> +       volatile s32 __ob_trap wide_low_value =3D 5;
> +       u8 narrow_low_value =3D 0;
> +       s32 same =3D 0;
> +       u8 small =3D 0;
> +
> +       pr_info("Performing same-width assignment from OBT\n");
> +       same =3D big;
> +
> +       pr_info("Performing small-value assignment from OBT\n");
> +       narrow_low_value =3D wide_low_value;
> +
> +       pr_info("Expecting trap on truncated assignment from OBT\n");
> +       small =3D big;
> +
> +       pr_err("FAIL: survived overflowing truncated assignment from OBT:=
 %d -> %u (ok: %d -> %u)\n",
> +               same, small, wide_low_value, narrow_low_value);
> +       pr_expected_config(CONFIG_OVERFLOW_BEHAVIOR_TYPES_TRAP);
> +}
> +
> +static void lkdtm_OBT_CAST_TRUNCATE(void)
> +{
> +       volatile u32 __ob_trap big =3D INT_MAX;
> +       u32 trunc =3D 0;
> +       u32 small =3D 0;
> +
> +       pr_info("Performing wrapping too-small cast\n");
> +       trunc =3D (u16 __ob_wrap)big;
> +
> +       pr_info("Expecting trap on too-small cast\n");
> +       small =3D (s16)big;
> +
> +       pr_err("FAIL: survived truncated casting: %u -> %u (ok: %u -> %u)=
\n",
> +               big, small, big, trunc);
> +       pr_expected_config(CONFIG_OVERFLOW_BEHAVIOR_TYPES_TRAP);
> +}
> +
> +static void lkdtm_OBT_CAST_SIGNED(void)
> +{
> +       volatile u32 __ob_trap big =3D UINT_MAX;
> +       s32 neg =3D 0;
> +       s32 small =3D 0;
> +
> +       pr_info("Performing explicit sign-changing cast\n");
> +       neg =3D (s32 __ob_wrap)big;
> +
> +       pr_info("Expecting trap on unexpected sign-changing cast\n");
> +       small =3D (s32)big;
> +
> +       pr_err("FAIL: survived lossy sign conversion: %u -> %d (forced: %=
u -> %d)\n",
> +               big, small, big, neg);
> +       pr_expected_config(CONFIG_OVERFLOW_BEHAVIOR_TYPES_TRAP);
> +}

Note to travelers and testers, we still have a compiler patch in
flight [1] that fixes a bug with sign-change instrumentation
concerning OBTs.

> +
> +static void lkdtm_OBT_MUL(void)
> +{
> +       /* Promotion means no overflow checking can happen. */
> +       volatile u8 __ob_trap a8 =3D 100;

<snip>

[1]: https://github.com/llvm/llvm-project/pull/188340

Justin

