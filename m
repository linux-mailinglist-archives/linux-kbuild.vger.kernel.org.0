Return-Path: <linux-kbuild+bounces-11583-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Kv5FdR3qWl77wAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11583-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 05 Mar 2026 13:32:20 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF09A211B75
	for <lists+linux-kbuild@lfdr.de>; Thu, 05 Mar 2026 13:32:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D6061310C492
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Mar 2026 12:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16C0F39D6C0;
	Thu,  5 Mar 2026 12:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="34WjHYz9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244FE39E183
	for <linux-kbuild@vger.kernel.org>; Thu,  5 Mar 2026 12:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772713660; cv=none; b=Im6JH8SILwZ3cCwswors8CLhMziaSRd2ePgoPOFHu4mTPfFKxRPTsa94ZW054qauDigTjKGluF3LxF2Qix0Ir7XV2L7tHFJeexGsthUlMVExOcurkKvvpVc3nlslk0bYz9cMIwJ6+AF7QsQjJRz7M9QYzme1QFZHs2qadIUKzQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772713660; c=relaxed/simple;
	bh=vSFxoSamHOgqgycN5FV6H8qcnNORRtZLiI0fLgGU90s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eKGyFXPM6B1ZL6hjRHwajVCMQRIpeZG3p0W9Z4BFCEEWv0WedDQXCx4aQbv3qbi9MUrroCyQ6KTU0q5Q30nnfz8tgh2Lg7FFlK/uaqdg8lXn3icj+hfwMeAPstAE9cfI04O/RkIdCzM4138xbbwcjQN0f4M40e3b8pvEM/Lc/TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=34WjHYz9; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-65fbad80d95so9483382a12.0
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Mar 2026 04:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772713655; x=1773318455; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vSFxoSamHOgqgycN5FV6H8qcnNORRtZLiI0fLgGU90s=;
        b=34WjHYz9uJvJgc3j9YbYqMQtNu6uRFYZJiHBxdRRDtb/ii/Eg+NOHCgvTVkw2/X+LX
         D/wDTACrXeNb8VspqSD5PuiuHmsIU825KbXOGrSfLkSAMuj+8+o7JaxhhEauDUI706AW
         AhqZX/kMs6ztUJ0cLrkyJewjRgY2ElwRsDBWK1Te9WtNWq5KB5XXU26fqM0RmoiBZ0L/
         gzKU069VHLH+jHu581b53zpbWkh78UbNW9dA4IRQFu4uoSEtsfbGgtrWE761Py/gJKcH
         zQcKu7unZh8LD/aduMj2IIXnOn0e4mVIStvzASeMPAgPAJ1MkS+x7MU+tOcFpq47DIzY
         v8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772713655; x=1773318455;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vSFxoSamHOgqgycN5FV6H8qcnNORRtZLiI0fLgGU90s=;
        b=VmxLJSgP0/BrC1YuqtAWSpQ6dYMls/pjsiUTsSVUL+YyuTmg9iYsPubUoqpEBcR+Lc
         VbUIlAa1tusfHIskR+JdKCZDkzYUF3iveN/XWUGjn4PbEfTw17nbfylHUO6NXf2Da4bp
         K85GoIssmnSIUl3unbYe+QixLyQgFMANToBJyh3RqAJojhC+aRyT/Ll/D4RAb+xTVbTZ
         zDOu6/9Z09ukt71ji7HbPkKIogoppGMTlaubdfFqL6u7+xYqBCieFlJYStUdKMNmqOuM
         99My/J8tVTOEhfRMEnR2r+Ji+qWHIjxamnw1lMxMzU0jI26N8m9BLIj4zbX8HUClBj9I
         NcWw==
X-Forwarded-Encrypted: i=1; AJvYcCXsyNlthOUlAFReip6TCiHcUXKrZUoXxU6IjWL5TrQMBkZeCljZ+8p9r/MH1AiL/TAbiZKLLazzTDhmtCQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8aRKfGjbYxs8K7Y3eSHp7yFz3JrjwDNMWTR0JvKO3YDphK+7m
	4+eH6B2sqKLAWX9WbjyCMszdPScH72Sl59iixyKxerQy3fHy4TQhdrXyaMMruUhaVLw5vr/KoyR
	8SuXNOuIxw7dmYDKhEw==
X-Received: from eddp24.prod.google.com ([2002:a05:6402:46d8:b0:660:bf79:1ded])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:278e:b0:660:b590:f4c7 with SMTP id 4fb4d7f45d1cf-660efb9495fmr3204846a12.4.1772713655280;
 Thu, 05 Mar 2026 04:27:35 -0800 (PST)
Date: Thu, 5 Mar 2026 12:27:34 +0000
In-Reply-To: <DGUUC74P2D10.30VWI1W6CR6Z2@garyguo.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260224-binder-crate-name-v1-0-7dfc1289abbd@google.com>
 <CANiq72keRQupX8UX7PQrLYgzzbdRquxV06SDzY9aubA_p+uGjw@mail.gmail.com>
 <aZ3A_KBWFJES0d_t@google.com> <aalf03M58WisOEZ-@google.com> <DGUUC74P2D10.30VWI1W6CR6Z2@garyguo.net>
Message-ID: <aal2toHN877W0Sf3@google.com>
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
X-Rspamd-Queue-Id: AF09A211B75
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11583-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,binder.rs:url,rust_binder_main.rs:url]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 12:17:52PM +0000, Gary Guo wrote:
> On Thu Mar 5, 2026 at 10:49 AM GMT, Alice Ryhl wrote:
> > On Tue, Feb 24, 2026 at 03:17:16PM +0000, Alice Ryhl wrote:
> >> On Tue, Feb 24, 2026 at 02:24:59PM +0100, Miguel Ojeda wrote:
> >> > On Tue, Feb 24, 2026 at 10:38=E2=80=AFAM Alice Ryhl <aliceryhl@googl=
e.com> wrote:
> >> > >
> >> > > Currently the crate name of the Rust Binder driver is rust_binder_=
main,
> >> > > but I'd like it to be called rust_binder instead. This affects e.g=
.
> >> > > symbol names in stack traces.
> >> >=20
> >> > We discussed allowing to customize crate names years ago, at least f=
or
> >> > dashes vs. underscores, for matching C names more closely and perhap=
s
> >> > other needs.
> >> >=20
> >> > Back then, we decided to keep things simple to avoid confusion (i.e.=
 a
> >> > single identifier used everywhere the same way is simpler, at least
> >> > for humans) and to avoid having to deal with those dual names
> >> > everywhere (e.g. adding workarounds for rust-analyzer here).
> >> >=20
> >> > I talked with Alice about what she needed here -- could we rename th=
at
> >> > source file to just something like `binder`? That would avoid the ne=
ed
> >> > to have a custom name, so everything would still match (symbols,
> >> > source file, object file...), and it would give you even shorter
> >> > names.
> >>=20
> >> Sure just renaming rust_binder_main.rs to binder.rs would work too.
> >
> > I realized that there's a much simpler way to allow crates to rename
> > themselves: do not pass the --crate-name argument at all.
> >
> > Because if you do not pass this argument, then rustc will use the
> > name of the .rs file as the crate name by default, *but* if the crate
> > contains #![crate_name =3D "..."], then that will be used instead.
> >
> > Do you still want to enforce that the crate name always matches the
> > file name? It seems unfortunate that it's currently impossible to creat=
e
> > a Rust module where the .ko file and crate name is the same, unless no
> > extra object files are linked into the module.
>=20
> I think previously a fixed crate name is load-bearing because we need rus=
tc to
> emit outputs to a fixed location.
>=20
> This shouldn't be needed after commit 295d8398c67e ("kbuild: specify outp=
ut
> names separately for each emission type from rustc"), so if nothing break=
s with
> `--crate-name` removed, then I think it makes sense to drop it to allow c=
ustom
> rustflags to override them.

Are you sure? I know this commit shows up in blame, but it just adds a
backslash to the --crate-name argument.

I do not believe that omitting --crate-name changes anything in cases
where the crate name already matches the file name.

Alice

