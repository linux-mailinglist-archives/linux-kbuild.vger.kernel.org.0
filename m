Return-Path: <linux-kbuild+bounces-10813-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAjwL7M/cmnpfAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10813-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 16:18:11 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2804D68928
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 16:18:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C88F3066873
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 15:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42C4434889A;
	Thu, 22 Jan 2026 15:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rokAZK/a"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABE934252B
	for <linux-kbuild@vger.kernel.org>; Thu, 22 Jan 2026 15:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769094606; cv=none; b=emq84B94hKeTlWl9bWKGQgXhrw+7bevHaNf8921zB+iJJw1hw+Uaazs/gLxBFzHTqD+a/rcVBP/K4+L8mRzvxp1vkJh9Rm8YeNpbA78odqJGsXXUvz9ZkoE2/1mUMRqSxCCs+/o8DuBLzc7KZLTQU4qJ1De4ScJrKcpeihVFyag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769094606; c=relaxed/simple;
	bh=twJMScGYZOpW49RBuNxsacv6T0DUgi1EWkG+katjKsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rdAMy7c6GW6vl9irwZWBZUheShK21J7ZfHa031J95t4W70AqmQ1dXJEaElwjLSS+gRLu9Tn2w2CHuJ5rKVgKAiqL5WfZURbkVsJfdHRSdeeDuLnHdMuHCiIRFumUjCTac9Eo0CTmPLP3yYnWDpiD3cYMnUOR+Dw/lQ/tn0uSQxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rokAZK/a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A598C116C6
	for <linux-kbuild@vger.kernel.org>; Thu, 22 Jan 2026 15:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769094605;
	bh=twJMScGYZOpW49RBuNxsacv6T0DUgi1EWkG+katjKsA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rokAZK/avke1WIEZWcfpJ2MqwRab9Q7N+dFNL3cqUYzEsKwMJpsBWHigYlb3jz8im
	 gSPt0fr0ISvIlZryGCHCZs2I0vySpSEwstWstkhL+WWSdBLngRm4qCVwxAr530M9kE
	 ZHhOzX31IwWH4NMDrZg5P0wnFAJX8ZeZ+xDYE3b25PmN4sQx3aglsEyvEt3THqn6dG
	 qgif0nhRTA+/eyLBYdu8FUAEpeyGYyrSlREXjOfCdCIGt5hwrZWXNUPAXt/lDO8zgu
	 pTMK3qqy3crqdH4OZmnNoHFnuwIHQX03P6nmhSJG3+E9+H4FLmUWjM1NWrODJoLM2A
	 L1+mOXr9EHYIA==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-385b6a15affso16564451fa.0
        for <linux-kbuild@vger.kernel.org>; Thu, 22 Jan 2026 07:10:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUbjnHkAe8tyiMlSHlD49pb2wgGmJxBlgP1SsSWJ0+/qwR1aOfIWTcPZ2OjPUgOLwIu7r0at9yFaQlA5KU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiGOENccLX3SbS4lps3anOiSoblfYDKUMCbq50d5w9r6jcaF8C
	SIh0eEJLaaU2B3FSSMhoEAmJS8Mxp+5k1NVV8N3pcgpbzcHTFcqOSjRYJrNwJcMYSXX7+FinMfe
	L8l3aaUrP64rQdJLd3bEXaZC38zGG1bA=
X-Received: by 2002:a05:651c:1992:b0:37a:832f:519 with SMTP id
 38308e7fff4ca-385c2a83b04mr11691181fa.3.1769094604293; Thu, 22 Jan 2026
 07:10:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120-rust-analyzer-pin-init-duplication-v2-0-a1c76f0d3bef@kernel.org>
 <20260120-rust-analyzer-pin-init-duplication-v2-2-a1c76f0d3bef@kernel.org>
 <DFTVC1IH8KM0.VR14LX627BWD@gmail.com> <CAJ-ks9nVxs5aGWPO5m=7GBjEE+Rn_qS_Yg0HD6qc5=Na6-K9OQ@mail.gmail.com>
 <DFUNBMAPQS6Z.4RPBKCCKCMIA@gmail.com>
In-Reply-To: <DFUNBMAPQS6Z.4RPBKCCKCMIA@gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Thu, 22 Jan 2026 10:09:28 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9=Fqnb+daWoGStbeHZFY0nqe9jkufF=drGac8xsXY9Yyg@mail.gmail.com>
X-Gm-Features: AZwV_QhCjMiDAmtr-IWMwM1R3VLKyfxDeHn_GNtDOK5w2tDd_j01pGM2v7I0OxM
Message-ID: <CAJ-ks9=Fqnb+daWoGStbeHZFY0nqe9jkufF=drGac8xsXY9Yyg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] scripts: generate_rust_analyzer.py: reduce cfg plumbing
To: Jesung Yang <y.j3ms.n@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10813-lists,linux-kbuild=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tamird@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 2804D68928
X-Rspamd-Action: no action

On Wed, Jan 21, 2026 at 6:12=E2=80=AFPM Jesung Yang <y.j3ms.n@gmail.com> wr=
ote:
>
> On Wed Jan 21, 2026 at 11:13 PM KST, Tamir Duberstein wrote:
> > On Tue, Jan 20, 2026 at 8:16=E2=80=AFPM Jesung Yang <y.j3ms.n@gmail.com=
> wrote:
> >> On Wed Jan 21, 2026 at 1:10 AM KST, Tamir Duberstein wrote:
> >> > Centralize `cfg` lookup in `append_crate` to avoid having to do so f=
or
> >> > each crate. Remove hardcoded `cfg`s for `pin-init{,-internal}` now t=
hat
> >> > these are passed from `rust/Makefile`.
> >> >
> >> > Signed-off-by: Tamir Duberstein <tamird@kernel.org>
> >> > ---
> >> >  scripts/generate_rust_analyzer.py | 13 +++++--------
> >> >  1 file changed, 5 insertions(+), 8 deletions(-)
> >> >
> >> > diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_ru=
st_analyzer.py
> >> > index 147d0cc94068..b96d3cbe3df1 100755
> >> > --- a/scripts/generate_rust_analyzer.py
> >> > +++ b/scripts/generate_rust_analyzer.py
> >> > @@ -35,7 +35,9 @@ def generate_crates(srctree, objtree, sysroot_src,=
 external_src, cfgs, core_edit
> >> >      crates_indexes =3D {}
> >> >      crates_cfgs =3D args_crates_cfgs(cfgs)
> >> >
> >> > -    def append_crate(display_name, root_module, deps, cfg=3D[], is_=
workspace_member=3DTrue, is_proc_macro=3DFalse, edition=3D"2021"):
> >> > +    def append_crate(display_name, root_module, deps, cfg=3DNone, i=
s_workspace_member=3DTrue, is_proc_macro=3DFalse, edition=3D"2021"):
> >> > +        if cfg is None:
> >> > +            cfg =3D crates_cfgs.get(display_name, [])
> >>
> >> Could we add a brief comment explaining how the behavior of
> >> `append_crate` changes according to the `cfg` parameter? Since `None`
> >> and an empty list have different effects, documenting that distinction
> >> would make the intended behavior clearer.
> >
> > I don't think this is necessary - it won't age well when we change the
> > entire API surface here in the next version of the series[0] that adds
> > type annotations.
> >
> > Link: https://lore.kernel.org/all/20250424-rust-analyzer-host-v6-0-40e6=
7fe5c38a@gmail.com/
> > [0]
> >
> >> This would also help later when we add proper Python docstrings.
> >
> > Same as above: a lot of change is coming. Is this worth considering rig=
ht now?
>
> Fair point, thanks for the context.
>
> Reviewed-by: Jesung Yang <y.j3ms.n@gmail.com>
>
> By the way, could you share your plan for upcoming major changes? It
> would help me prepare and align my series if I know the intended
> direction. I currently have these on my radar:
>
>   [1] https://lore.kernel.org/all/20250424-rust-analyzer-host-v6-0-40e67f=
e5c38a@gmail.com/
>   [2] https://lore.kernel.org/rust-for-linux/20260109-ra-fix-primitive-v2=
-0-249852a4145a@gmail.com/
>   [3] https://lore.kernel.org/rust-for-linux/20260120-ra-fix-v1-0-829e4e9=
2818c@nvidia.com/
>
> I assume you would prefer merging [1] first? Please let me know if I'm
> missing something.

Yeah, these are the big changes I'm currently aware of. I'm going to
look for ways to split [1] into smaller parts. The main thing I'd like
to get in ASAP is type annotations as maintenance becomes much easier
following that.

>
> Thanks!
>
> Best regards,
> Jesung

