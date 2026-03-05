Return-Path: <linux-kbuild+bounces-11585-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOooGux6qWkg8gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11585-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 05 Mar 2026 13:45:32 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06491211F86
	for <lists+linux-kbuild@lfdr.de>; Thu, 05 Mar 2026 13:45:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 33658304D93F
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Mar 2026 12:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4966C37BE97;
	Thu,  5 Mar 2026 12:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HsAPi4dI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10B8334C1C
	for <linux-kbuild@vger.kernel.org>; Thu,  5 Mar 2026 12:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772714703; cv=none; b=UPKgRndDz9NbC+8SFFZIk1EU8QOa9vwSolcFF8GsT5PQBpXHVBuNy+a/tnnYRfgYlFjbssmGv81yhcHJQL9PCES82zKHKLkKgiyJoUd5X5r8SbxSFm25eMNVJzh0HY3tuf9QcFgwPx9OQDlHoGahxHGIeIBGPQwr1XndYpSS0mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772714703; c=relaxed/simple;
	bh=AEsLE3FbYmT8/DFevCckFk6DGQAjaJpQ4yTnvlNJev8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WuttAUoEpBGKvYFNhaiD1WeSPYU/f6AUNCE8VyAisVqVEolSNoieetdLUX0rGmwthg2f6ztRSXnzTUjSYE5InytSoG1ZdbFPd3hxC/Ry9BvzFm3DnRK1i1G+mY6nie5BetE55Ssjs+HnV8k1+tipg7cGgH1lEfRNbDV8KAmmNpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HsAPi4dI; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-483786a09b1so79442025e9.3
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Mar 2026 04:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772714699; x=1773319499; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AEsLE3FbYmT8/DFevCckFk6DGQAjaJpQ4yTnvlNJev8=;
        b=HsAPi4dItiRbXiDw9ZCcuYCUMm5JJP1LEWImC+ek9Z7oOlsBHPV9HfO/HKVFOkcbJG
         UU0ceGeQRpkY/WKpnIZyL9LoBs+pYd2xBNFTDYwpeB/3+BQpURvh26d+/0Pk9C6vkfMB
         H3M1d++J+mQtGZU+dWwNqSLZDdXlsqt0Bo/VXBMkpQBthBb4zzKcXhucMaWqkfRJsjhr
         P8ofMxcdLzy1viGAMT5FQJa9mEbShwzEFHKYpWoMJ8vzjfZGE5V8KP/M5a+N2H4EsZAX
         bymnmU7mhw/BCXwpZMA/iegQJADTiwpob2M5XlT/hBPyQjUFh9O4oej055GiNq4srmnm
         vW7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772714699; x=1773319499;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AEsLE3FbYmT8/DFevCckFk6DGQAjaJpQ4yTnvlNJev8=;
        b=k3K7k3DMWB9FMf6S1MgXOwvt/LaqRAZxfoNvVVbToSZ82EsJBDKZAGIfXqFyMXEIbn
         iWMZa6GwiDKZ4yvvBXL4BlY9idXDo4SuPYQDXoNyX5jiyRkR1j0na6WLJ8P8KsMMcF7/
         VKYvJi3/IrEPJjjP5AwgFXDKI1ZStwBjRs/Mh8/HGGNICVikELnI7Xj841H1V3f2hkQ4
         2d8svWhlpERvzbMT/tj/QxkJQqeX4AOF6o/vxwEmk7g1Dmev+aKad/s6TOftAKxt6R9O
         ALEjPoROKFLgAzYYxEPeb5IKv49mj4SHTsyBklRZeCUbhbIvxmu8JlA+DgM3c/uKkO+u
         yEMg==
X-Forwarded-Encrypted: i=1; AJvYcCVtvFqVHPFas4T3WArZ57tFgIUnR/8w2ZIVhkGiZGER9t9nJJbS4bSwwU19Buk5+Ccw95SuAJE/ROmY2wA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgqY6CR/11SwHStswQflIQNU5NmK3SFhVRZWT4IeBHCGVSW6uE
	HU9vIpBoeE6i7Fcgvy4xCISXl7T70Yz4n+0Odtm53r6yX6EO4dNsmcgU2QGefaxsJMojBdIA1UQ
	XyE3PBN0fM0qQOr7XqA==
X-Received: from wmbjj12.prod.google.com ([2002:a05:600c:6a0c:b0:480:6b05:6b98])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1986:b0:45d:d8d6:7fcc with SMTP id 5b1f17b1804b1-48519897a4cmr90895685e9.27.1772714698962;
 Thu, 05 Mar 2026 04:44:58 -0800 (PST)
Date: Thu, 5 Mar 2026 12:44:58 +0000
In-Reply-To: <DGUUOQV5IT6D.3KTG8Y66S5XP5@garyguo.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260224-binder-crate-name-v1-0-7dfc1289abbd@google.com>
 <CANiq72keRQupX8UX7PQrLYgzzbdRquxV06SDzY9aubA_p+uGjw@mail.gmail.com>
 <aZ3A_KBWFJES0d_t@google.com> <aalf03M58WisOEZ-@google.com>
 <DGUUC74P2D10.30VWI1W6CR6Z2@garyguo.net> <aal2toHN877W0Sf3@google.com> <DGUUOQV5IT6D.3KTG8Y66S5XP5@garyguo.net>
Message-ID: <aal6yoeJQwgW_rih@google.com>
Subject: Re: [PATCH 0/2] Change Rust Binder crate name to rust_binder
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 06491211F86
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11585-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,protonmail.com,umich.edu,linuxfoundation.org,google.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[binder.rs:url,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,rust_binder_main.rs:url]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 12:34:16PM +0000, Gary Guo wrote:
> On Thu Mar 5, 2026 at 12:27 PM GMT, Alice Ryhl wrote:
> > On Thu, Mar 05, 2026 at 12:17:52PM +0000, Gary Guo wrote:
> >> On Thu Mar 5, 2026 at 10:49 AM GMT, Alice Ryhl wrote:
> >> > On Tue, Feb 24, 2026 at 03:17:16PM +0000, Alice Ryhl wrote:
> >> >> On Tue, Feb 24, 2026 at 02:24:59PM +0100, Miguel Ojeda wrote:
> >> >> > On Tue, Feb 24, 2026 at 10:38=E2=80=AFAM Alice Ryhl <aliceryhl@go=
ogle.com> wrote:
> >> >> > >
> >> >> > > Currently the crate name of the Rust Binder driver is rust_bind=
er_main,
> >> >> > > but I'd like it to be called rust_binder instead. This affects =
e.g.
> >> >> > > symbol names in stack traces.
> >> >> >=20
> >> >> > We discussed allowing to customize crate names years ago, at leas=
t for
> >> >> > dashes vs. underscores, for matching C names more closely and per=
haps
> >> >> > other needs.
> >> >> >=20
> >> >> > Back then, we decided to keep things simple to avoid confusion (i=
.e. a
> >> >> > single identifier used everywhere the same way is simpler, at lea=
st
> >> >> > for humans) and to avoid having to deal with those dual names
> >> >> > everywhere (e.g. adding workarounds for rust-analyzer here).
> >> >> >=20
> >> >> > I talked with Alice about what she needed here -- could we rename=
 that
> >> >> > source file to just something like `binder`? That would avoid the=
 need
> >> >> > to have a custom name, so everything would still match (symbols,
> >> >> > source file, object file...), and it would give you even shorter
> >> >> > names.
> >> >>=20
> >> >> Sure just renaming rust_binder_main.rs to binder.rs would work too.
> >> >
> >> > I realized that there's a much simpler way to allow crates to rename
> >> > themselves: do not pass the --crate-name argument at all.
> >> >
> >> > Because if you do not pass this argument, then rustc will use the
> >> > name of the .rs file as the crate name by default, *but* if the crat=
e
> >> > contains #![crate_name =3D "..."], then that will be used instead.
> >> >
> >> > Do you still want to enforce that the crate name always matches the
> >> > file name? It seems unfortunate that it's currently impossible to cr=
eate
> >> > a Rust module where the .ko file and crate name is the same, unless =
no
> >> > extra object files are linked into the module.
> >>=20
> >> I think previously a fixed crate name is load-bearing because we need =
rustc to
> >> emit outputs to a fixed location.
> >>=20
> >> This shouldn't be needed after commit 295d8398c67e ("kbuild: specify o=
utput
> >> names separately for each emission type from rustc"), so if nothing br=
eaks with
> >> `--crate-name` removed, then I think it makes sense to drop it to allo=
w custom
> >> rustflags to override them.
> >
> > Are you sure? I know this commit shows up in blame, but it just adds a
> > backslash to the --crate-name argument.
> >
> > I do not believe that omitting --crate-name changes anything in cases
> > where the crate name already matches the file name.
>=20
> Before this change we rely on the crate name to match the file name, othe=
rwise
> the .d file and .o file will be placed at wrong location and Kbuild canno=
t find
> the output files.
>=20
> With this change we specify everything explicitly, so even if you pass
> `--crate-name=3Dfoo`, the object file is still `rust_binder.o` so the bui=
ld can
> continue.
>=20
> My point is that you *cannot* reasonably override crate names before this
> change.

Ok I understand now what you're getting at. That commit is required to
change the crate name (but it's not required to omit --crate-name
without changing what the crate name is).

Alice

