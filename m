Return-Path: <linux-kbuild+bounces-13328-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOb8EiVXFWqmUQcAu9opvQ
	(envelope-from <linux-kbuild+bounces-13328-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 May 2026 10:17:41 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5D75D2556
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 May 2026 10:17:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E91C3014C33
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 May 2026 08:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECF4E3B774A;
	Tue, 26 May 2026 08:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JpBsoIYV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D44C38B7D4
	for <linux-kbuild@vger.kernel.org>; Tue, 26 May 2026 08:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779783458; cv=pass; b=hmmi+ATLmGQ86s1nUD/UDa7YKaRXr39JfrFsSHV8afuGZijIajUloRdDbFjnFGDxYBa97WXM322TqPaQi09144t4bDHsCXAbIyDJ4AHtoT+WRjgyIUov7XFnZuVCGXcEimkm5TL/TfQ3bW26xJ+/Mp2BnsgYiMs2wPpDonzaV00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779783458; c=relaxed/simple;
	bh=Sp5ZKqrzcRrafJjgXXSBE8mJRX044NCbQJ+kvz66LME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RBx8C7IZEEzZmvjffPjHU+JSBR9dyTHuPUv96iT7dEGkhJbgho3ClWDTsrsRd0Eyi7/7VZnnnOJdNtWU4zTenaH+4fX9utNKBMaLNaP6kq4sZdvbkMpQIB+kBkTPL5hCj1J39N8ek38VteDFa31CzTmDQRRjpGWl+F/kICF00Zs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JpBsoIYV; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2bda3b4318dso1017641eec.1
        for <linux-kbuild@vger.kernel.org>; Tue, 26 May 2026 01:17:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779783457; cv=none;
        d=google.com; s=arc-20240605;
        b=FTb9hoXpFsNABd9VNixeGL2tRguTi1+oZq07jp4Z4rGyRCIadrxT4ygyoI1UQqvga7
         H9vLDDtbQjD+CRVveVZ20JKN/u4yc9nvSJPFTj5wPx5GTVvvOL/UBJvHk/TkMflHA6Jk
         kWk90siH939C1Tc9SiHfwdfwbeZWvh662ZlVVntPbC+KvMYXWq2ZO6UVkNwsRGM3/4Dy
         KsxfEGcHwmcSnxkezVeSKz0oRppV6UzN1dUxhjMwopaJHvoxgADXdtB0U6amOasXG4NR
         z3rgQYgFonxqhBNzMhY2dGnvEmr0dH0Vz47CPlZ0aLsVLmkBkq8DL05bt6/n5zNAhWDm
         QAVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FuPU8upLRbELTBqt0oNJ1IC9teTLP5/yLZLMTN/L9oA=;
        fh=IQDMcmh3z5FDghE4EUC1MqrOXN7NkOFnmASH5ZRoCNs=;
        b=bmn1eqEK0zUQOy9GSCbDYnuutGTWaWS7m/2UyEkdRXmt7giqq0+X4TZx87vkUCiOXX
         j8Z1krVUVCMVhyrdJHLddbWr1vCy1PVaROSPP7ShYDxMMnw8GXR29/hV9Mj7Wlhml+kH
         6efFOOEyk10HPlKqbeWP9vrRW5Qocu8HQLQd7IbqzQl+OXW0qx5Cw7QXMaSl6bIa6tdG
         mIwZ5TSGqwnPODUxfMrrQcZKa5PA65UWTVwEWOmYJKNaWFQE03l1m15IVw8LCyf+FBjG
         aqNcWgyUD4wJ6f5JlJeLWuM1YT9RbJbcyqSkMNZOoAYsiuzaJW7l/Xch6GSuUXFBHQ+i
         PS6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779783457; x=1780388257; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FuPU8upLRbELTBqt0oNJ1IC9teTLP5/yLZLMTN/L9oA=;
        b=JpBsoIYV+rmSJBF05BOs5dLpAYIs9vVBA6D8B6qrSWbFI84QDvTRes00yGFRUcWvgz
         8t61C7bnl2VNr3k2JUeXIl30cGYt/igU9yn/gBAfc24ACvxtN+JNm9zWiF237ywfIBvE
         UEvEx+aJl7iSKEzG3B6zHG1CYv04mXD3HSLR7P7SW565Lf77kl4wTcTcBlQJWNptSkZs
         Rt1WElG8mmYLtXfd/bhf1iWfunwUkA2xI9e4bKDki5wby9pM1vCFn+Kg0XZZrGwlKF2Y
         JO7/PAlEjza5bPGaJYC8PcoE3AeSWFK88fCiMe2M9HyQrE1uJ+UhMfWiQEz/EJdUzwi9
         a7/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779783457; x=1780388257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FuPU8upLRbELTBqt0oNJ1IC9teTLP5/yLZLMTN/L9oA=;
        b=qeVgdS2A0k08trWq/+4ddWbWTJfiwSgMwSXtEjiN07xFOi6oJAzONW20N9Ur/5RABA
         k1+yvowKf1JC4SbgXWiJRJbNtsQzVuoxQwwymVcwILbraT9bBNIUhOOijBc56U3uSjvb
         6h65oEdxjp0truYJm9WCCDmwYr1CEyOJGUNJclsd9jg97izYXYFHHS4yLkRmIlgm54a5
         minr0kjd8f/5DN0b8xZSUQm+X4xCoBdoRKrN6adifKuNybgyOBQ5itJyelNCaxLISXo0
         rKGqVzmmUtb8i0AmR6m7RBCjLOikRNxq5xLEudLhdv3dejM8QOL0Y+DQMBp4y1U2TsNR
         23CA==
X-Forwarded-Encrypted: i=1; AFNElJ/HsbgHmzBn6RCxqonIHv5og51pMrhkkANrdlIwlrsAv7qNO3/VVtw8gaZrBXmeN/x9Y7iUvbjVPMaVDps=@vger.kernel.org
X-Gm-Message-State: AOJu0YwX9LTvw/w3PlbFjUmP9HzM6CjjfkF2AWn2J1EPusrNkjtHaACb
	lsbJ5XzF83Cq+yNPv7Qydl8sbLsmIF4/9Oeysc77s6dPa4s/wu2OsisxUbit+T4jacnIhqANFLX
	gGknU82m5sc5nWt2V3PKgmHYWrFgcXD8=
X-Gm-Gg: Acq92OGpoPCJNTMuynDY5jrXYxurSYSAs1u2E6v0JNViDlmEgqzXI7IZLbMdM2NO8/+
	iWfMj5P48wb15gZJyc730LX8OTnP3wgvA00pdN/ubMUz5/b4jnN520kbeDgV12wVulVlf2wkfWj
	WI+rpPqozjfrEU4dTX+pPicddtlgup+nDjxXERkz5o+mRS2QXHUwabo2n2G2nWdNDVoE4DgyiTq
	17Eq2uxHZ1ndJzHOzXTfrVii/LyBJt4HBG8va0aaD94TgwQD1DeFsVaT6RfbU0HOpC8kB0IukWw
	J0vcNshuShWiUoZF/z7QBxBZHMwC6l5EmIjx1GCGJ7NvMUBcWlSMfGfaqMgmR5g3VyrOKrXnMS2
	T6njbkjYg+g4AQAvOFMAbaeFTkf3jBvQSQRKYcWqGDljM
X-Received: by 2002:a05:7301:2092:b0:304:4f23:4823 with SMTP id
 5a478bee46e88-3044f23c523mr2417160eec.7.1779783456513; Tue, 26 May 2026
 01:17:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507-rustc-option-cross-v2-1-2f650a49c2b5@google.com>
In-Reply-To: <20260507-rustc-option-cross-v2-1-2f650a49c2b5@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 26 May 2026 10:17:24 +0200
X-Gm-Features: AVHnY4IuYyKvBZXvx8VWYwO2htqI4qYv-jYYqkX5aPD8vSpj7I2To7c2OoxiNes
Message-ID: <CANiq72kQKRoM4ATAYhP+-UHiqPr0tg67dr4EDYT+ptPUshH2ew@mail.gmail.com>
Subject: Re: [PATCH v2] rust: kasan/kbuild: fix rustc-option when cross-compiling
To: Alice Ryhl <aliceryhl@google.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13328-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,garyguo.net,protonmail.com,umich.edu,gmail.com,google.com,arm.com,googlegroups.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: BF5D75D2556
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 7, 2026 at 1:14=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> The Makefile version of rustc-option currently checks whether the option
> exists for the host target instead of the target actually being compiled
> for. It was done this way in commit 46e24a545cdb ("rust: kasan/kbuild:
> fix missing flags on first build") to avoid a circular dependency on
> target.json. However, because of this, rustc-option currently does not
> function when cross-compiling from x86_64 to aarch64 if
> CONFIG_SHADOW_CALL_STACK is enabled. This is because KBUILD_RUSTFLAGS
> contains -Zfixed-x18 under this configuration. Since that flag does not
> exist on the host target, rustc-option runs into a compilation failure
> every time, leading to all flags being rejected as unsupported.
>
> To fix this, update rustc-option to pass a --target parameter so that
> the host target is not used. For targets using target.json, use a
> built-in target that is as close as possible to the target created with
> target.json to avoid the circular dependency on target.json.
>
> One scenario where this causes a boot failure:
> * Cross-compiled from x86_64 to aarch64.
> * With CONFIG_SHADOW_CALL_STACK=3Dy
> * With CONFIG_KASAN_SW_TAGS=3Dy
> * With CONFIG_KASAN_INLINE=3Dn
> Then the resulting kernel image will fail to boot when it first calls
> into Rust code with a crash along the lines of "Unable to handle kernel
> paging request at virtual address 0ffffffc08541796". This is because the
> call threshold is not specified, so rustc will inline kasan operations,
> but the kasan shadow offset is not specified, which leads to the inlined
> kasan instructions being incorrect.
>
> Note that the -Zsanitizer=3Dkernel-hwaddress parameter itself does not
> lead to a rustc-option failure despite being aarch64-specific because
> RUSTFLAGS_KASAN has not yet been added to KBUILD_RUSTFLAGS when
> rustc-option is evaluated by the kasan Makefile.
>
> Cc: stable@vger.kernel.org
> Fixes: 46e24a545cdb ("rust: kasan/kbuild: fix missing flags on first buil=
d")
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Applied to `rust-fixes` -- thanks!

    [ Edited slightly:
        - Reset variable to avoid using the environment.
        - Use a simply expanded variable flavor for simplicity.
        - Export variable so that behavior in sub-`make`s is consistent.

      This matches other variables. - Miguel ]

Sashiko points out the Kconfig case, but there we only have LLVM flags
that were the expected, original use case of these, so it is OK, at
least for now.

Any further tests and Acked-by's are appreciated of course.

Cheers,
Miguel

