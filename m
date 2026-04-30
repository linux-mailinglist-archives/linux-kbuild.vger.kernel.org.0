Return-Path: <linux-kbuild+bounces-12964-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id JiBMJrrJ82mL7AEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12964-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 23:29:30 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 072EC4A8310
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 23:29:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A13DE302E7DC
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 21:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56B663B27DE;
	Thu, 30 Apr 2026 21:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E54yCNp0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED2E27A904
	for <linux-kbuild@vger.kernel.org>; Thu, 30 Apr 2026 21:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777584190; cv=pass; b=TqbDkO1YbCzaUjjz37a1e4T8/U9OLfnKcR50o8y1X0ei0G7e3EQNf7tS+MqLCgQfZf9k+ID4EzMRNIiccMM2+TUCECH3MC4ozeVwF6QZ8277jjsC4jPSppwnKHC10vU/mgBiyC1SrrjwVuFOy/K+sNEhc2MTnPGzwNO8Eic3YCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777584190; c=relaxed/simple;
	bh=2uxDae9ONJwe0Y0DiJfQRd5vGS73WGpldKj8Ll5+1w0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jgcfwiZs4uS5K+Vq3qSQ82e6XxtsHMdVU95xhXjMJiWZLo73AGT7nrDsTrN2ZPSWEwhD42XZjlpeZbfkD+TsMcEnBod4y9srrGt3qMmjjFEO2lSZ5ogXvQZ8NQrvunP2QNPNrqRC21zo3oFsx8Elx43SACUuVGSKmHyq9YJWj7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E54yCNp0; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12db2e9b3bcso139167c88.3
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Apr 2026 14:23:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777584188; cv=none;
        d=google.com; s=arc-20240605;
        b=CAYG35Ttrw3+Jf3aICErxSMLO/MR+hdrcZWL9vNNDrmYGmnFm2USb5kjbTlLica3ij
         Oa60K8dp4TIGnSV7pDI5FNWID4C0O2I7p8EWvLCPo658fo8yW9BC41QyVGGq0VEEuMQ4
         wTaouCO4LE/qUC4VPHsm3b47FB3LvyWuvOAEEPxwauXu9i1pec9ci/gdKlb53U9LKLk9
         9depGPpmQtSWnxLm9glvMQ7te63XBCKLhjti0bf3BZaru5cjlaVIWAGWMKsHkyzAsZiq
         jing6gPzMZfimD0fe6TPqgb7CAwX89Yb8sp6S97ARf8R7DOYjCOmn0/aEOAisI2J8pWh
         G5eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4bf+/AuCnDsNNa3KHyHBcLKzX/unSh3vRTfxAh38ofQ=;
        fh=vDvnON3dZOv7AIJvFVu1Jo5LWuP1+HtZgY85YqB4arE=;
        b=abFqjPaPg2q6brFbzgWWCS+B5LnWNjoR3+sxGmlA2CSrwlKNedSmHOl8zL4CsDrZ7u
         4zmjZ7dyP+gNFSf7FFa35PKjpM1+oGsCDc1/M4fTVleUP8a7LiRyKj5Vm42Euu6yrlqa
         P3O5WVHZ+l4kESXZaV/sbs4VXdaXFQeM/d6B4oNIGpbBCVDuWJTYVqMlFrDXU9BrgeVO
         5wsRgfYtkG+NmNCwbLqDaMFehaWDcCZrWBMq16SKIOcWv2URNsPqiML9cPlCVNmd4MAd
         I+SyhqhGOEaO9wx/VrEwEy7vVOEDNGveoZgaEtc9Kc/BLRO2EIvAyrajuzZIEdzcSxUC
         j65w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777584188; x=1778188988; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4bf+/AuCnDsNNa3KHyHBcLKzX/unSh3vRTfxAh38ofQ=;
        b=E54yCNp0FG43nSKEpwde3bQTmZl/TTAtQZji6dbtMHoP19ZG6tOCoGU6An01Nb/X0b
         /uj1WufJRkFeawqWBtNPw8FwSY7jNFtte87EaN/byvdDgGuA7GU5AzQ+rqpwN//XM36I
         dJnXLcl+RqjnfO6q+++cJI1S9HdYGLUolLRw/gTNSWFkaKSg7KX72HNaK+o1/OyYdZ6v
         Y4tw7d/DzivwdfumkbTLLxdNtsBe/pI4Ff/lH6uobn9S81UZujUAj9K5TuLPwKund+ND
         2cKY8Z7vZblsho2GNeoY5vMaPGYoVhG8jPw8huTBa/BYe2KJkri14wlXjQoKX3OP38SE
         fUQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777584188; x=1778188988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4bf+/AuCnDsNNa3KHyHBcLKzX/unSh3vRTfxAh38ofQ=;
        b=r5RmiG5w5OWIY2+JdteDwYXasfdpk2UbNgi4HXCvzoEexeK7YHN4S32JPpSiGTYEV5
         Y28M61/wEXUX57Tbsz8jQcK0gCrzzEeGafXuNG7RyszNthLLmfjQgRCX1nVqC5k9bFsF
         jJ089uNf7VHfw98extiBXfYaR3JvG1XdiKk1VCkLezVbFzZN+MT13UNtY68MeHsSiDUE
         26cYBqf6CFm0E20qygTAAPsjQfnJDHfL82era3xuqYB4AwIVE7aV3nJ4hE4oiJtbZ410
         w3mbsZO5SDQ0/WHH3rcp67hSirGo776kqRGJutdo43lmGiozhD14bL7k0s792BP4p90h
         aFlw==
X-Forwarded-Encrypted: i=1; AFNElJ/sZ8k8qNWLq6oNRtrxFgScY6cscqeT54FamqjPrD2hzCNpUldadLSuQh1+/CJmQVmH/2xqmA2woqegomQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8gXdG4or7rUyxXcYv9kAtPUrbbfK56DQHPyGamTo5JXdRHc/C
	OYiYXGgtPiZVnEU+7sFL6I6smnmafn8p7bi4kdG6MjHlLiwvpZNM+ff4jNGGxEXtfLzZBXqPIdh
	5RVWUS/e75zYhRrJ0INW+MG6MsFphd2U=
X-Gm-Gg: AeBDiesr5vuY+HGU8ogng/2Uvbr83IUQk+xm+kaOmaYW+a/XHliS78zbUYNf60j8ccq
	aSuHRwRrifxrm1fVoyxRIigNmqonIfPGkUvKVjD/iarVByWYKQpclHve6aB7z3JdYQA6Yx9PJMa
	jg5Uj1I2UYUmneXGD1HYkSqPgBD9bfGWMr4uzDwQBPD5ZljlUzeVBNyeFcDoLnfvRshANrt9FCh
	DNoj2aB1ffsv6PAojFvOQbsH6WE+HC9/tVjeix7mJ9P191fL2eP1l0EYZHmpG05u5XWMYd+6JXT
	CItjwTk/RJbpU1VT0afZsYrGxm4Nt7OF73qU5YF3d5IjeTLBDgjeclJhu+AejtgzNnRBEukpuDC
	VXEvsv6izBrwhfkfpFGc52IjPHmaYwy9KuQ==
X-Received: by 2002:a05:7301:5803:b0:2ea:de28:f389 with SMTP id
 5a478bee46e88-2ed3ef6ebd6mr980570eec.8.1777584188058; Thu, 30 Apr 2026
 14:23:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260426144201.227108-1-ojeda@kernel.org>
In-Reply-To: <20260426144201.227108-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 30 Apr 2026 23:22:55 +0200
X-Gm-Features: AVHnY4IfHY-QpW189HGIBjOv408u-WVPLp2De5vzk3HKKlMEGMU_6EDA8ddRWI4
Message-ID: <CANiq72mSsW2PwOb++YyHM518s=2A7TEVugqL_ufZjGuiSsg4Fg@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: allow `clippy::collapsible_match` globally
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 072EC4A8310
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [7.34 / 15.00];
	URIBL_BLACK(7.50)[rust-lang.github.io:url];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12964-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20251104];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,body];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[linuxfoundation.org,android.com,brauner.io,google.com,kernel.org,garyguo.net,protonmail.com,umich.edu,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.105.105.114];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,rust-lang.github.io:url,mail.gmail.com:mid]
X-Spam: Yes

On Sun, Apr 26, 2026 at 4:42=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> The `clippy::collapsible_match` lint [1] can make code harder to read
> in certain cases [2], e.g.
>
>       CLIPPY P rust/libmacros.so - due to command line change
>     warning: this `if` can be collapsed into the outer `match`
>       --> rust/pin-init/internal/src/helpers.rs:91:17
>        |
>     91 | /                 if nesting =3D=3D 1 {
>     92 | |                     impl_generics.push(tt.clone());
>     93 | |                     impl_generics.push(tt);
>     94 | |                     skip_until_comma =3D false;
>     95 | |                 }
>        | |_________________^
>        |
>        =3D help: for further information visit https://rust-lang.github.i=
o/rust-clippy/master/index.html#collapsible_match
>        =3D note: `-W clippy::collapsible-match` implied by `-W clippy::al=
l`
>        =3D help: to override `-W clippy::all` add `#[allow(clippy::collap=
sible_match)]`
>     help: collapse nested if block
>        |
>     90 ~             TokenTree::Punct(p) if skip_until_comma && p.as_char=
() =3D=3D ','
>     91 ~                 && nesting =3D=3D 1 =3D> {
>     92 |                     impl_generics.push(tt.clone());
>     93 |                     impl_generics.push(tt);
>     94 |                     skip_until_comma =3D false;
>     95 ~                 }
>        |
>
> The lint does not have much upside -- when the suggestion may be a good
> one, it would still read fine when nested anyway. And it is the kind of
> lint that may easily bias people to just apply the suggestion instead
> of allowing it.
>
> Thus just let developers decide on their own.
>
> Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned i=
n older LTSs).
> Link: https://rust-lang.github.io/rust-clippy/master/index.html#collapsib=
le_match [1]
> Link: https://lore.kernel.org/rust-for-linux/CANiq72nWYJna_hdFxjQCQZK6yJB=
rr1Mb86iKavivV0U0BgufeA@mail.gmail.com/ [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied (both patches) to `rust-fixes` -- thanks!

    [ In addition, as Gary points out [3], the suggestion is also wrong [4]=
 and
      in the process of being fixed [5], possibly for Rust 1.97.0:

      Link: https://lore.kernel.org/rust-for-linux/DI3YV94TH9I3.1SOHW515524=
97@garyguo.net/
[3]
      Link: https://github.com/rust-lang/rust-clippy/issues/16875 [4]
      Link: https://github.com/rust-lang/rust-clippy/pull/16878 [5]

        - Miguel ]

Ideally, we would have an `Acked-by` on the second one from Binder
maintainers, but it is trivial.

Cheers,
Miguel

