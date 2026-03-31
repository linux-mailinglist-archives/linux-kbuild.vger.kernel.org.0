Return-Path: <linux-kbuild+bounces-12419-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BfHDw4DzGljNQYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12419-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 19:23:26 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C80CA36E9A5
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 19:23:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6F1F7316CDE4
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 17:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5D9333067C;
	Tue, 31 Mar 2026 17:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L8BYpuSr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B0C326D55
	for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 17:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774976990; cv=pass; b=lap+Pc4Kym0Qrv3BAo4RVwvMS+g0YW4L6ZzHOhNEUuqFOTCIHIOMRQKXkh9bFHgrE4oFfZI8/9Ixg7d2cXCIQuctqY0OY33pEMKVWEkd5QhJ2iE2R4izEFjjhVB1IcJ2gNgfnOzEseIeLJfOl+4Dc1mIb59invTKpKK5a+mf/g8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774976990; c=relaxed/simple;
	bh=8EmbocqF6Vdb3h0BM5UKxGb7Zum+nJE7yig8zb0/EBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ia8HnY94CaXXppbFEXClxmuzRaeyZuHkkXRyx7QiNeLYexrzOrpGaQqpsb4suu9WVvgtDqtgnpAavCY6bQZWaS770e1mXCNYC6JzdAb+n3xJHbx8lpcu52uNDiPaFgQRSWPlvkpEyn3eSsxeKGbvKlMRTKCjcPHOV5O2uH16TtI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L8BYpuSr; arc=pass smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-953a0431639so624873241.2
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 10:09:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774976986; cv=none;
        d=google.com; s=arc-20240605;
        b=bsTaB6Os/rX+A9TdE+VVzesVr2TDODfnnQk4HPoVxxFcTxwFuCKT26z2cDZeKSESHv
         Aw7ksLbjf2ADh95xiCvmcQdf5CkEdd0GNlEXXVBrs8+XezFi4c/YtKNQ5/rR/2/pjUV1
         slEW6FUR8TBuoF0AYjk9KSSjUSmouN4WY+grPsxYzng+1GJ55Hnu5gIf19ADOTIPR9nR
         tx5cnAcb/68UfllqjFP/dpREq+M3PAzmVDQYUy97nfFcRLUtUd1y36YSm/TUqpKb6TGF
         9qySVTJgSGaMlreXmblMMn1qDR6H84DmkQGt/FuVxy9RLy+mlwy/oSUDc61gJuaDjlXJ
         aItQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N69dcykYCh53+bqwu3dyzBFgXRPQQLJXWFG4whULut8=;
        fh=2vujxqUDR+/5pgh+CAZSD/4oCkaHtXYrMGt6IbCHPVE=;
        b=OphDs15kNlCi22Wjhq3VTauOA4ThHE7jaQVTAuvetfT1dC4LYItIxaV9wKr7bCA6LF
         pxyXiKsReEfGYcUEr12GGxOkes2WY2gtzvWuy5Fdl8EIISjCORkOEUOuFXT+BOTekVlF
         iQ8o/3pPGghhkqBvpn88ieYe2hvsuWyJLDtjQokR8wZtOKMotJ4QmXoobqYKV1NEcF0X
         6v8GQtUwh/9zuh0vQNXgXVCVOVQd4EF9HUxPyrlFrnchEC9Q0QX5+RsXKRRIuUkTRhd2
         BBjy6nyPEtB7Tpnsp9Mczl6KiNhA9fA/QRLiFcQYtNxbl+ucUwNGXO9Nt1IEu36LpET/
         8rdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774976986; x=1775581786; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N69dcykYCh53+bqwu3dyzBFgXRPQQLJXWFG4whULut8=;
        b=L8BYpuSrxCKO7vl2RHJQ2nJkDtNraPRvvjHo6hnF4Cwfzxg+6qE0iDNVFvt0bci5gD
         r5IdPopZ9KfFTnPTfjOJ5Ai1yOUmxYiwwqWX15jmx6vVrw6qMzEKSSpMZC4EcaVT73Gp
         i/wk9eiokYlTIG4oliekGAjaPmbtMeXcmXi3pDnmSN8tH2HXO8A8pbR/SXPuI0m+Q9zi
         oG5L9bOb0HAqu8LXRfOQGFouq+jId7otLl17GjB/Mk+aOnm4GRiLxZTOxj9a3ZCkjT+H
         AMscSiItcjRR4eKQKt6sNzHCjkQr5lLO+iXE+j/9nSWVEfqaWyjBfc41HrAp/gXZfv90
         TR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774976986; x=1775581786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N69dcykYCh53+bqwu3dyzBFgXRPQQLJXWFG4whULut8=;
        b=G5/6ZtV/Ip91VYy4tW+JeboOhMX6ZoDxbdNglTmAK5aMXub/Dk0CMca3u/e6/gqoRo
         ugB6JL1JzVNAxguVsmbqBoasIGESKCQxYL1uwIXnGlk24aiiCM8ffTG03mE5XTvjZ1EW
         xxd93iQ0VxyiGXyecZlSpQ2KQ0ElU6NMc+BlVGNa8fA4SEf5S2GvwQlFPmjNhbkJs2ZG
         KWSwAJHLJGrhrZLc6jpdwHvspmY54ziPExroFuk2yLsvOq9uYZc/mI26D9DQcnIC3kAV
         nkA4ak7Vhw8SG0Al5hMw+VCaQQ+hsWNKS9w9T17Lqw8qBseLadMsjjD/9XMZBB1lCHfr
         hr8w==
X-Forwarded-Encrypted: i=1; AJvYcCV0u13EERVlTbkXymQOxUQtu5VIeZ10fYXrcUrxfIQ5Nd+EV3K3ySooAT22qiZzn2HKW/cMgCH7Y+rGcOA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaHTDjlNc9lkZRzVlHA/wP0deP6OKjyENn20gGlN7zkxsVAO1w
	6sYxabRqr508+80T8gz6DyxcVn2Nej88t7S03z/Tcu3SMQ2vxjd3IDRymESCFur1AEqzhwVLuFM
	drZsIfn+hKNwESlP+17PDBmr14eGFvoEZ6dHsKjZv
X-Gm-Gg: ATEYQzyV+Utr+1SEaLPfj6rFRmFOIVYxfGSv/ANDJmCztwS+YHLkv6+U2yg1QGRdFqy
	RoERgbuP6/ZDL2qrFpPaX1IYiympiveEUp3OfPKsLShfNTs21EyniA6OzwlYjkFPl6fPyPWXpZT
	3dLoyUX5XKNfhqdYm+Iad97xJ985H+uRJt5IKcFznFL6gCUtpTm0k9pAq7i0dWbR6cuF6q8vkfk
	291plQ7AhQrf77V0zgmhpzdMZC2eJPDF6r33sjUyHb6r/AEPInHgoKJBZjdknA6GfWO6UUnb5L6
	Po5OtAA=
X-Received: by 2002:a05:6102:c92:b0:5db:dd12:3d16 with SMTP id
 ada2fe7eead31-60567cf5e34mr47219137.6.1774976985230; Tue, 31 Mar 2026
 10:09:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-3-kees@kernel.org>
 <CANiq72mK9fz6Spmgt4js3hScqhqvZb2YP2T7tDfR0fHPDFWJ7g@mail.gmail.com>
In-Reply-To: <CANiq72mK9fz6Spmgt4js3hScqhqvZb2YP2T7tDfR0fHPDFWJ7g@mail.gmail.com>
From: Justin Stitt <justinstitt@google.com>
Date: Tue, 31 Mar 2026 10:09:33 -0700
X-Gm-Features: AQROBzCWRSbSGajmdyoAKTTcnG8_jXsUZoBJguhEnhg_UEbHXmjODVo4uOcztkk
Message-ID: <CAFhGd8paijFboDVr8rJDjScob047q+zgYAs038WuVozOG0aYaQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] compiler_attributes: Add overflow_behavior macros
 __ob_trap and __ob_wrap
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
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
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12419-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.947];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[justinstitt@google.com,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,infradead.org,google.com,gmail.com,lwn.net,linuxfoundation.org,googlegroups.com,vger.kernel.org,lists.linux.dev,linux-foundation.org,arndb.de];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,llvm.org:url]
X-Rspamd-Queue-Id: C80CA36E9A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Tue, Mar 31, 2026 at 10:02=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Mar 31, 2026 at 6:37=E2=80=AFPM Kees Cook <kees@kernel.org> wrote=
:
> >
> > +/*
> > + * Optional: only supported by Clang with -Xclang -experimental-foverf=
low-behavior-types
> > + * passed via CONFIG_OVERFLOW_BEHAVIOR_TYPES. When not available, defi=
ne empty macros for
> > + * the trap/wrap annotations.
> > + *
> > + * clang: https://clang.llvm.org/docs/OverflowBehaviorTypes.html
> > + */
> > +#if !__has_attribute(overflow_behavior) || !defined(OVERFLOW_BEHAVIOR_=
TYPES)
> > +# define __ob_trap
> > +# define __ob_wrap
> > +#endif
>
> Should that have `CONFIG_*`? i.e.
>
>      !defined(CONFIG_OVERFLOW_BEHAVIOR_TYPES)
>
> In addition, since this depends on a `CONFIG_`, with the current setup
> we would put them elsewhere instead of `compiler_attributes.h` until
> they are promoted to be "unconditional" (i.e. without the compiler
> flag):
>
>      * Any other "attributes" (i.e. those that depend on a configuration =
option,
>      * on a compiler, on an architecture, on plugins, on other attributes=
...)
>      * should be defined elsewhere (e.g. compiler_types.h or compiler-*.h=
).
>      * The intention is to keep this file as simple as possible, as well =
as
>      * compiler- and version-agnostic (e.g. avoiding GCC_VERSION checks).
>
> However, thinking about it, why is the config needed?
>
> i.e. if the compiler is not passed that flag, shouldn't the
> `__has_attribute` simply return false?
>
> Also, I am a bit confused -- does the compiler flag automatically
> recognize the names like `__ob_trap`? i.e. I see the docs mention
> using the attribute,
>
>     typedef unsigned int __attribute__((overflow_behavior(trap))) safe_ui=
nt;
>     typedef unsigned int __attribute__((overflow_behavior(wrap))) wrappin=
g_uint;
>
> But then we don't actually use it?

__ob_trap and __ob_wrap are defined by the compiler.

There are some examples within the documentation additions of this patch.

Kees, is it possible to make it more clear about what we expect of
kernel developers in terms of style? Should they use keyword
spellings? attribute spellings? only use custom types?

>
> Or should this just be like the rest of the attributes, i.e. we
> actually define them here?
>
> Thanks!
>
> Cheers,
> Miguel

Justin

