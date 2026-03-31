Return-Path: <linux-kbuild+bounces-12417-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOyCKYcAzGk8NQYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12417-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 19:12:39 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD1936E2DD
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 19:12:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9A1133115F85
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 17:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EFDC3009C7;
	Tue, 31 Mar 2026 17:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4MYfcI8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAAA2F6591
	for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 17:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774976530; cv=pass; b=XraxCuDSM1uyskrH5q86XIX1FZYrQIsvs/7BUUIYriDKkluSXyzftR5obTautluTSpMCcI1WwkL3sz8dEboeKuk67/inDDvuQEaSHh3knQWjp8mrjUBQQwlGiI6C6mg01CoiVY6ohN9Sz6ONQ2j5s9TS1vQ1b+ImdRgEXjKHrXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774976530; c=relaxed/simple;
	bh=g/vQPQS0w9Xxi55W5EhGbOlAIubJN7tvka1LWWLiAXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rN2tbTwWctFiikgrwRk7oxeaUqq/edqtRK+Uf2eqUvdaWzhT+x/iCXAl/EJf7yxevNkxfgErdsh1HNQnoGfvAnd8lE7fvzyJxx+BtGTJeTKWDgIySAxOBxWOv4ufjwpiSYR2Wixptqo1B1bCR2u0vVlz7lf4zAiNHxS3whIMzQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h4MYfcI8; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12a6b260693so647326c88.2
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 10:02:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774976528; cv=none;
        d=google.com; s=arc-20240605;
        b=cCUOFNp8RHLMW+1ABYuoJd13U/6x0ePjuYvFP174n1o8LicV4nRe1XuZEYLDOnl8k8
         m0G8+X2NcIiI8xz3sX7Y+NN/g4hskI+Ss5I7FHWdyIe0F6OAvoY3RDiEYspXPlGDWqXG
         s/YKiPeI1TfH8Zi/iTyd7OklIvWqZI7HALZxJiU09kzPFR/SA3Ut2D9vnqyQDRvNsXMI
         Fn1CasCWsD+MUYI8Ym4+9w466F8I61RPMkDM08BNiHZK5Lg9vfF2AfXhzGsH0IW7yxLc
         dyMX3kgi64GMUIckMdizqeKUqirm1SWvL+wHTDtihLzTzRp4rrkiXRWDqKO7JW6gUbPE
         D66w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IU4m3ma81SYxNj71QUeHGIKcLWU6SzNh0VTIbMzWeYY=;
        fh=A40CrqUJ5r7K6moWHDW6ST9D8GCALe/CJ9xc+q6q/60=;
        b=ExjsEkBbmDFcNc+AicMLQ4FGbingsqc0JvWyBVZ3mJ4PD+nECNKz7zmtASa5FkPJkJ
         2q1MTHpMnrrVgBM4P25Ay4U1Qzj0dmSmf7OW+Jh4khq2IDBj9kDQFoxLEAA/V4O8aF3O
         cNIKmn0MNCBciMxQMb4CpmXgRifsgjsmnmLpdq9YeyQGUhBYvaHGFAB6qILQetTV/xpS
         7uhD1oaRvwu2Q/lYJ76BJIXVcM3QQiRlJVGWu1M5RZACuIJVfYG2+rvtT9WljwBv82Ha
         u/svek5D0CFoqiBSEI9g86003gJOXaU5zQfn5lDz6BBeXlbFdXH8+u4W2ITh/Aoq2XRh
         r8Vg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774976528; x=1775581328; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IU4m3ma81SYxNj71QUeHGIKcLWU6SzNh0VTIbMzWeYY=;
        b=h4MYfcI8slTRlGMHt1sQIa64V5DXkkM2nRCsSYDP4oWK8+qzdbA+zJqcCdGqnXOMS5
         mgSuxxfmZhRiCIoKC0/6HTMbXMt7u2IAtQRwvb5O77jWrHxW2XYOE9y5hrNuU1n4+zR0
         e1XnmQiNA+sSvBSVH4vROfkT4PLFPzDHkJqSmbcWB7YHp9fGU2uH5/0H/l+xqlpwsbgR
         UCSf5Sm0s3783Xsc5fVL37YeD1MMnILpPWekNfUXVzA92b7/0h+ehNgcSOOUXFBVZctj
         VAGCLbIP43kiaKdaLoR7D38heKXa0NoSeRPKT9iG0Aw3sZOac7kV19IyrIRKqFYo65Lo
         52bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774976528; x=1775581328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IU4m3ma81SYxNj71QUeHGIKcLWU6SzNh0VTIbMzWeYY=;
        b=O162hlvZl3i4zuKLBAIoGvcaE1oA7c4q5oIBuYuDD5WoaBcG6fWP7bzooXPwZF2VVQ
         gX0BbIxz6hIKXgD5ECj4oFrebupqyxT5nMrD9D9fjEJzpOARWkwjvsG/XPj4rwYxBeHC
         CZ0OWjT8dbpWeAEHKT0AUytAPOWzK8DTFeTjGEu1UhmPHF7hwLWA+u6/1j9usWHLEnKL
         qmDk8CcsPccXKTZQ38J/clYb6Rq0x27RLbs0Z+8E6MWe90WkcCIWJ0WZycRRP0beCUPj
         sUakGtRh6AP4vceUn9+fatWg9xyI3FTLcD4WyzEmQxPcQsdn+1DmU6Gud77evIw90M+A
         +RWQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/81r5EDWHd/trqdBQV7TgSmF00L6z2Io5KeIhU78sIzsuwWv4dvSkq26K6ei+KTuBkv8gXKBFe1gcEko=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdSvk0QJHfWycfnBJpdUbEwsJDyrO0QOt/nTUy//cnQPYfIHJs
	qdD4wb0HUrbDt2qrT8avopFfaGOkBzgoZkgpARSA+EKkh++bz7gYA3xnRXZRpaMgB5nseGQ0OqJ
	8xpowzL5040t3sbzN3QhvDWIbOeYbLvg=
X-Gm-Gg: ATEYQzwyu1Ic51/RulHBvjZsiO5cipZcEbFqpc+VJDbHPd7WE8dc3v3kWUDInjVDPwO
	A1YIzkLYvS0dUC2/xvbY12HMvJ9bSmRXBdy2ZiaVI7Rf+hTRHm2EmBZcq1sQYFrDFQGQLpIcXYh
	LcL8+Jq71DEl5CTslR4Tpz6VCh1K4jgpvS3rm9rkeWlQYEv4tUqyCY6JyClllasLIRQKnja7o/v
	rWiQ8UgZe+PUdTL646FJ8XayC36MiGMPs6Ddaoux6W9Pnf9P6x0+zYgYJy6KupupWLwkGuCRyL6
	qoYBmTGFJa1gwNnPZRFmMoOekrFxZ6RYoadrt/az8oiUxUfaojj2uylmvBp6xwvBKDBM4SB7JYh
	/DUvdVksFDaoIWfcoilPgWVY=
X-Received: by 2002:a05:7300:8c05:b0:2c8:aef9:cf3c with SMTP id
 5a478bee46e88-2c8aef9d5bbmr578311eec.8.1774976528009; Tue, 31 Mar 2026
 10:02:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-3-kees@kernel.org>
In-Reply-To: <20260331163725.2765789-3-kees@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 31 Mar 2026 19:01:55 +0200
X-Gm-Features: AQROBzACBmAh1Gj6cURe9fgjRYkC4LMT-gxdC_n35omwVPBYsPI5mIuUgNZG76o
Message-ID: <CANiq72mK9fz6Spmgt4js3hScqhqvZb2YP2T7tDfR0fHPDFWJ7g@mail.gmail.com>
Subject: Re: [PATCH 3/5] compiler_attributes: Add overflow_behavior macros
 __ob_trap and __ob_wrap
To: Kees Cook <kees@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Justin Stitt <justinstitt@google.com>, 
	Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, kasan-dev@googlegroups.com, linux-doc@vger.kernel.org, 
	llvm@lists.linux.dev, Linus Torvalds <torvalds@linux-foundation.org>, 
	Nicolas Schier <nsc@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12417-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[infradead.org,google.com,gmail.com,lwn.net,linuxfoundation.org,kernel.org,googlegroups.com,vger.kernel.org,lists.linux.dev,linux-foundation.org,arndb.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[llvm.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 3AD1936E2DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 6:37=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> +/*
> + * Optional: only supported by Clang with -Xclang -experimental-foverflo=
w-behavior-types
> + * passed via CONFIG_OVERFLOW_BEHAVIOR_TYPES. When not available, define=
 empty macros for
> + * the trap/wrap annotations.
> + *
> + * clang: https://clang.llvm.org/docs/OverflowBehaviorTypes.html
> + */
> +#if !__has_attribute(overflow_behavior) || !defined(OVERFLOW_BEHAVIOR_TY=
PES)
> +# define __ob_trap
> +# define __ob_wrap
> +#endif

Should that have `CONFIG_*`? i.e.

     !defined(CONFIG_OVERFLOW_BEHAVIOR_TYPES)

In addition, since this depends on a `CONFIG_`, with the current setup
we would put them elsewhere instead of `compiler_attributes.h` until
they are promoted to be "unconditional" (i.e. without the compiler
flag):

     * Any other "attributes" (i.e. those that depend on a configuration op=
tion,
     * on a compiler, on an architecture, on plugins, on other attributes..=
.)
     * should be defined elsewhere (e.g. compiler_types.h or compiler-*.h).
     * The intention is to keep this file as simple as possible, as well as
     * compiler- and version-agnostic (e.g. avoiding GCC_VERSION checks).

However, thinking about it, why is the config needed?

i.e. if the compiler is not passed that flag, shouldn't the
`__has_attribute` simply return false?

Also, I am a bit confused -- does the compiler flag automatically
recognize the names like `__ob_trap`? i.e. I see the docs mention
using the attribute,

    typedef unsigned int __attribute__((overflow_behavior(trap))) safe_uint=
;
    typedef unsigned int __attribute__((overflow_behavior(wrap))) wrapping_=
uint;

But then we don't actually use it?

Or should this just be like the rest of the attributes, i.e. we
actually define them here?

Thanks!

Cheers,
Miguel

