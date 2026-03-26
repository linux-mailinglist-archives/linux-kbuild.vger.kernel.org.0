Return-Path: <linux-kbuild+bounces-12287-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPQ4NfduxWkB+QQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12287-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 18:37:59 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA425339412
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 18:37:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7310330308A7
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 17:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1122033BBCB;
	Thu, 26 Mar 2026 17:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ovcmo0sw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F91F4218B3
	for <linux-kbuild@vger.kernel.org>; Thu, 26 Mar 2026 17:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774546228; cv=pass; b=lqYecod29RPep5C/CFA0fzFQF0oiVHIxFNyC2OHwmiyR8XYfaaw0Q38MYC2bokzQeJgrnCB8T8UFQUfKKdD+MX1wbup9ydVNVp5VYws0o61OWYnXZG8eR+cy3PLgnOSQA0DYvCKcyeTofnlMi82uBANQyUk8kd+0crcIsC2q7FM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774546228; c=relaxed/simple;
	bh=OpxH2sJ/fBqNWjY82rtfpbqgi+6tguV8c1lJED4a7JM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DhR2crtZmu+Kf8yOHbHB7giR92yGDvJhQZkDxnQ2dOsRsxXkI4KMfOlthXfljy9wrTLUq8hMK2QkxrTebJASwY1IxqxraFL44nQWffclY2prdXW1kS8hCbQhIDxjbaGePXY20hV8uXwYEFF5wewpu7mnyDNHxOsjH8bjQgfl434=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ovcmo0sw; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12736a0147cso94941c88.1
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Mar 2026 10:30:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774546225; cv=none;
        d=google.com; s=arc-20240605;
        b=X6WU0qD4WQDZwnn1MigFksTgAO9W7vAdXq82alZJUYAEupLxWciMcpGRt9H7JmcJ69
         +hDx/9xf6ns/56iuiKACZwlJWLmO/3NhAeGII72IHNCWri5NKWgmkqXASAPXvXAj0gVg
         ssRHC7S6Ymupg5TzFkyOm7T2vscB4+/3dcX1bd/+VIFliMg5p+7pDy8Fz/LDOgJyXMVR
         lhfoeb1aOYBQ+0nYcA+6wT1g1vSLEnFRBtn3yuqiw9LFpNN2BNT2DJwDy9H8DtR4hQz8
         9xUWDDs5l/qN+Fp0PC9ruN2tmUS09HGWYrdPJhRwurlg4Yo3PiD0DXEzy2kn1i1W1vZe
         nHsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wEHEk0yDT5R/njghDq/hVwJN3s1AoJzI3r+2gD7Cnqg=;
        fh=dZyBDwxFB8mfkPtkyNzBAqeinC+/SbymhteR6XUiWvI=;
        b=V63Q/S6q973185tretmKXGwQaKPJNvs4FT1A2lQzNCN0/i/OnXPpuaioQrFE4A2Z7y
         7jwtEmGD/rooetpLGJzkzkpEBLQPoH5qA8Wuv1UycvfcQ5AKBS9RJyzSnPbsCsO3GEOu
         7T94cBL/dspWkmG2/lGGz93+FoOiITpEemitNJXpzjX3ZfYDildhvH2ImDwLIEm+BMw8
         MmmLgafuMGuQ+cKeaAXS3SNv4x29nbWfjyDDyD53/3VWhCU0ntYfK/UcX8WyqcYjUN8+
         y2E0/7k8K95PJ8QcGIFPSavo1IaoAbe7C7dK85WcD+/NrJqrgBiMHvdsE/eKPV4/KQAs
         pTnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774546225; x=1775151025; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wEHEk0yDT5R/njghDq/hVwJN3s1AoJzI3r+2gD7Cnqg=;
        b=ovcmo0swYn2ww/v3EbGztb/HEA/UUck+jbS/EhUiG466KgsHi3Km1RdxMTkhlBaTZS
         /BuPekdnW/23Qx44eCEMnvTg/Rvhao3MvVyWlAtMx4TphlsN1XJv6yp6s4UlTzJypJO6
         bPPVgbWLMUziPOV+DheBhgOmTks/JuUtC//apKgmIF2uHPW2Z9nvVvPiNcZTsfvG9pAe
         FITJfz2/YnhwdySHCGOhFCyhdG/jUTh9LO3V7CRpQLHUOTk1BjR0uGFr664fUqbQs/el
         /CuqjROJwcLjVk6IjsZVYOxSJSbvTk3NIi6bkOVhwrOBP/2PMi7mhO/L1CO0WsGRckDA
         eU3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774546225; x=1775151025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wEHEk0yDT5R/njghDq/hVwJN3s1AoJzI3r+2gD7Cnqg=;
        b=jBaQM6mcwTbMC8p4X+mDsLaNrgGHCLWyWzMrNk+0LEixl69+JbPikaFOdLbaz8owSM
         RsN2sJIPqanjndSL/l1dUnjbNMHM5O9CNyw5wW5YJTohz4EteWc6V2q67KzRyOm953NR
         IS4XKrF90SrqJ/mZdk+Whb1URLgviUEXGAZECDtj2waJ8GDxfM2XqAYSBKPxQmnGgCC9
         lFGVxIzqGwdMeCtgTb6DmrnQrzQKBe7ciPyn2EdYSKEhqht9Ex6E3xGLjF3TCBbkY8Vz
         AYckgbIuZcJZerpXzmiA+bOYkUEAxyeYDjFpBMUURdHtiG45fMN/jZNmKAdjuzYp05H+
         URng==
X-Forwarded-Encrypted: i=1; AJvYcCWwfKU3wkpKT4/dvfyhV912zKhIoFZjqoogXhVZ8c33rnAE/2gOb2u6jg9jzB1Izzt6Id6ESASB4WGTyrM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoEshzTsXfBIm6mDQZKFeGb/YvaOJnmmZGnV5AKAq7JylGN3sf
	26nufD4j9PUK0vhNzQSJFdO7V+/NTmuvnx282C4NcFqnnFn3HS35jXqy6E3L4LOj9lTxuqIO45i
	EN8GLz3bdnPiQ2qaMrbtorqcI76Ke2YM=
X-Gm-Gg: ATEYQzzByivCVs1DIeJjwHcOZbRl0SMMVzURvTcPXvENW1X48JpmXBoa6SWtOP4Ffrv
	DJGNaph0QrcUvD/7OseKdmDqNUZ/bxI6TDes/lZwxRaz/5xNQMust5qRY+GHKD7+J1qidAma+d0
	PselY1KzHniGErXHFJLgjNQQX7BW+Qz/EDTjJzzdGi4hIkpv2/ZECXDr4b8KOJGLiG1F7K9E4fs
	E2fLXJqfQB370EmUXrgaCYC4wBVtjk4NqyoQLiJhAAwNe9RcpKwpcaoR6ztyIIurx9bUgQYPKrT
	LILsQzDnDTliZU71MEmvK8bmkNIq/sxFpyq38nIlomlLVxbkwIzpWwjqbPhRikk+8MkURvSBSWq
	o6s479JNe4buwpv2XRN6dU10=
X-Received: by 2002:a05:7300:d50c:b0:2c1:6416:2a07 with SMTP id
 5a478bee46e88-2c164162eaemr1927580eec.4.1774546224910; Thu, 26 Mar 2026
 10:30:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <20260323000327.111235-1-ojeda@kernel.org>
 <acEP7tl8pqFA3tK8@shell.armlinux.org.uk> <acUGAsjYvNvTEO92@google.com>
 <CANiq72mzPpkELXis1CiSbKUmBXNQYMiMmjj-7-sYiLh4T_JSOQ@mail.gmail.com>
 <9cf5a94c-0f37-446c-b63d-ddac5674d220@gmail.com> <acVOL5Psz6kHlhq2@shell.armlinux.org.uk>
In-Reply-To: <acVOL5Psz6kHlhq2@shell.armlinux.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 26 Mar 2026 18:30:12 +0100
X-Gm-Features: AQROBzD8mk75r53XPOqmRDfmWXx9t0jf0bYbL_Ww497XzqV4mLKwGQ6QIr12vEg
Message-ID: <CANiq72=b+cr7Stxph_hXQTmD5crCvwWTqdaGKOJ7W1-66v4i_w@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Christian Schrefl <chrisi.schrefl@gmail.com>, Alice Ryhl <aliceryhl@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org, 
	acourbot@nvidia.com, akpm@linux-foundation.org, 
	anton.ivanov@cambridgegreys.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, david@davidgow.net, gary@garyguo.net, 
	johannes@sipsolutions.net, justinstitt@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-um@lists.infradead.org, llvm@lists.linux.dev, lossin@kernel.org, 
	mark.rutland@arm.com, mmaurer@google.com, morbo@google.com, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, nicolas.schier@linux.dev, nsc@kernel.org, 
	peterz@infradead.org, richard@nod.at, rust-for-linux@vger.kernel.org, 
	tmgross@umich.edu, urezki@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12287-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[38];
	FREEMAIL_CC(0.00)[gmail.com,google.com,kernel.org,arm.com,nvidia.com,linux-foundation.org,cambridgegreys.com,protonmail.com,davidgow.net,garyguo.net,sipsolutions.net,lists.infradead.org,vger.kernel.org,kvack.org,lists.linux.dev,linux.dev,infradead.org,nod.at,umich.edu];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,armlinux.org.uk:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: DA425339412
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 4:18=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> I'm not sure if this is still true, but I believe it used to be the case
> that the -linux-gnueabi target has one behaviour for enums (fixed size)
> whereas -none-eabi, the size of the type depends on the range of values
> included in the enum.
>
> Certianly, when Arm Ltd were proposing EABI, EABI had the latter
> behaviour, and I think there were cases where Linux used "enum" in
> its UAPI.

Short enums? I see `c-enum-min-bits` in the armv7a-none-eabi built-in
`rustc` target, and indeed:

    #![no_std]

    #[repr(C)]
    enum T {
        A,
        B,
    }

    pub static S: usize =3D core::mem::size_of::<T>();

is 1 for that one, and 4 for the other.

Thanks!

Cheers,
Miguel

