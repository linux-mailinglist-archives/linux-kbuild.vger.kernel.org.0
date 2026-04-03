Return-Path: <linux-kbuild+bounces-12626-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IN9mJh1Kz2m9uwYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12626-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 03 Apr 2026 07:03:25 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FFE391017
	for <lists+linux-kbuild@lfdr.de>; Fri, 03 Apr 2026 07:03:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2C6D3008A42
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Apr 2026 04:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E1CD3264D4;
	Fri,  3 Apr 2026 04:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ScgQv2X5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBC07081A
	for <linux-kbuild@vger.kernel.org>; Fri,  3 Apr 2026 04:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775191997; cv=pass; b=Q77tLR+CR349osVT4mSbPzU1PWDcvfksS/i0NZu7v3XFpAoptH6RXC3WDiYAqG8ZrngXd7ckHGVvfomoklvWAoRjBV2hjg880T5bvWUvEEp5R7L7x62JaH3iNd0PlKg1iSL2RFqlIfHwJoPy4bFQ35Kkiw604ni0IXKJshYf1l8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775191997; c=relaxed/simple;
	bh=yl2v4HCLZpTTCWiNSHezHoQggNNu2rh4MEf6BSYZ4xo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rTx/0G8dK2btzwKycYTV7/l6QRvUFQ57XcENcCcjHES9uv7VElLxYnGM6WD+MHko2gNLA8DDGsubISgL2SqWKQD/bBkHKMcBhLdtGXF10wAmu160LBv3VsTy5obJ2+ximy1q5mGUSnI6VG+zhnsugLfhOujeyMFLlIJMVDPLdHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ScgQv2X5; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-12734af2cdcso67093c88.0
        for <linux-kbuild@vger.kernel.org>; Thu, 02 Apr 2026 21:53:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775191995; cv=none;
        d=google.com; s=arc-20240605;
        b=GACo9mLojJ8qUiLWB0M43uksq0Kq4vMVdkNYaYLIZ4kt/QGrqHIQjr7Eyha3L3Z7yb
         adPQzIPYxaeR8k/1v+OsegX6K3TNI24uzsEq/wrb+0Lzrofk4z0DSWDq3RJJnYN7wwO+
         DpwHzKItUubMqIxNkJNLNVIx2KhYrpLehNMT2tcZgn2CxV1yflZBllvyEquSzOruuiHm
         Gh/Vvhp9YATSvX9LM/P7Qeypa+IYT1NB3s2JY/jpz/WTxk4BlUm9bc7b9qPSCFSk9vo+
         nY2xLB3j2Va3x4lNlqEA0d0cCU45twxCP+5WPRoK3FfOa7a8LTi/v/0VPgwkaj5FSrx4
         JY6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BFl652h+zh7LQ70IxgsBAbSjGMJ2GOXvRo1wsMp6Q80=;
        fh=C9i8zi45EPSBCnhSetlkxRfobxjdvkvP8m/0gg1yYa8=;
        b=GjZuKsarTleiWWw9J7D7INU7gsMTdo3IGzrda7JUUq4SL1u3K6xUeC1HDHYUIFcgxx
         GgdmCZRpn1UhZ2rMtzF7PStzdHEuk0obxHK2YgCT15dBbnLT6puBy3vMi8MR0O4inNfp
         EPNhw/AE0pvjQ8zHifcrnfKoDz9Mi4y4yLRaqjZ3fNA0xRZBG7SvLLVsFkV9ZKg7FJSf
         /ZXG/ZLxZASfOfj/vwtEeBvhpgHc+AwVhO8RQ/oRjpGMRAKJuM1CnUzdI1hTnXtzp7AA
         D30cRJZ2MXhrFw3P8r63YpFhNGRDx4rfWLL7WgjI6cyKHYAVF22KbyHqjDcuqRXFd/tc
         2FSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775191995; x=1775796795; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BFl652h+zh7LQ70IxgsBAbSjGMJ2GOXvRo1wsMp6Q80=;
        b=ScgQv2X5z/bPy2+z10wPDBjbAJjE3PoN74nC1/UvC8JtZrsNakh9CrdwIoI/YgeAZv
         vPnuj3BDj0nN8pXYnK9uVgnS+bFJraVVqGHAKvAp43hVsAuo9JXI9HsRc7m/RruZY+vG
         rk6zChqSM20v1riLHfqgMxA/BGVzxS2mQvBQsi/njNzqEKa+gFAhXxn7438rzumaCaM/
         I9UCC8FnDWjbGb6klI9w9/Y6Dk4cGDccSFAOfqrlJfmKvW2sre73jo6S+2MGhHYQ2xxo
         Asu1zybAk6UXgPIuDpPXjhff0bq+nGK829+7dFbpRs3XJupsBJS/81apoQjRSdwId/1b
         rCCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775191995; x=1775796795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BFl652h+zh7LQ70IxgsBAbSjGMJ2GOXvRo1wsMp6Q80=;
        b=FGy1qb1fBiv0i1wCNPjANPr+KLK42nxo2mq8MOmDYSlP888ARjmqTiLO6W5R9UP/oY
         fbzZz2RThvQ03m3T/uxs6ZVM25xAkLIoDRZQn/Mhu+eLWeCgQP7hIJ5HlPGZoAmCqB3D
         G3kbrSM3UPv04rxp0QO1qj5z9WJ2O3dlxMYvWWWU+UrgZpHDOWsaB2MQJmvcGGkpRWSg
         KOmcPba56/whKL0kgZskKw/00KA9FInteTUXxGcEtDTFJ7AJ8/r91ax1UGsGq3BbPwAs
         iJ6ByjNcOHEjG6YCQOfPG7soCN0pvgw9sa88RNgirMFqFq2pBzIZdBP45noMuXuDDH4K
         p9BQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCoQvui8trVUJqrYWEXOU8EuVJc597mN1jscBosRH0K7zDvbQNdWLf1WJ2thRtI5oGI6MNcJ4XUb1nMnE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmWkSDeKVW8l9KqqFwJH2b1MSAVSXn0kYd36/G6yTWwZZY+Ky6
	zvSBHFIWmzhYdC0cJpwD9aWS6RNJTarNGB9qCEvL5ImrABLqc3IWFMskg+8XhzRwvYETBa+T9KW
	XaD6oMoZ6fkyCCaooVI9OHpBnCgHYEF0=
X-Gm-Gg: ATEYQzwUPSrdWRyQdtBI02cPQ3IZ+oB4ELNkJqTx/a4Aa43kQnOSc1nx6R0hmts4u55
	eDAy4NPhfMS70cmw0zXJEB1j0kBoRps6wk79a7Y7db0I/xbOVSvu0OCj+ZyvVtgI0MamXVWDvul
	E+YlNOgrBlk5hID/5P5O7pyfGavdyAZzpWeNupeduWdiEBcX5ecuInIovOhpTYtQUiGrOfyWkbU
	XkjbXj7MZrx7juBipg8FtEsbB4GrgW3wMnDa+KNOiYV8spsZLK2exOESYG+EbWiz9m+o+R6tOON
	ANPoVzVBE3JKhWAEXCk+w7gPU0nOtN16Y6yVvP0RCUAIZ6vkT4sYJpgNmqj97DkNibn+41wNamo
	7Ej5NQG1CBUAxQfw0b0gsxAo=
X-Received: by 2002:a05:7022:929:b0:128:d590:2947 with SMTP id
 a92af1059eb24-12bfb740ef0mr367589c88.4.1775191994985; Thu, 02 Apr 2026
 21:53:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331205849.498295-1-ojeda@kernel.org> <20260331205849.498295-2-ojeda@kernel.org>
In-Reply-To: <20260331205849.498295-2-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 3 Apr 2026 06:53:02 +0200
X-Gm-Features: AQROBzDJbkOKUs3Pbx6-NjHKhuMni-H63EEyi2tvHo0-KK_56o32Fe31dKQRj3Y
Message-ID: <CANiq72kNqmGpFurRy2X+a=9fHV_hxpfWBJ-+dEL_qj2daLM8ww@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: macros: simplify `format!` arguments
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Aaron Tomlin <atomlin@atomlin.com>, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [7.34 / 15.00];
	URIBL_BLACK(7.50)[rust-lang.github.io:url];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20251104];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-12626-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,suse.com,google.com,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,atomlin.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=2];
	NEURAL_SPAM(0.00)[0.961];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 40FFE391017
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

On Tue, Mar 31, 2026 at 10:59=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> Clippy in Rust 1.88.0 (only) reported [1] up to the previous commit:
>
>     warning: variables can be used directly in the `format!` string
>        --> rust/macros/module.rs:112:23
>         |
>     112 |         let content =3D format!("{param}:{content}", param =3D =
param, content =3D content);
>         |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^
>         |
>         =3D help: for further information visit https://rust-lang.github.=
io/rust-clippy/master/index.html#uninlined_format_args
>         =3D note: `-W clippy::uninlined-format-args` implied by `-W clipp=
y::all`
>         =3D help: to override `-W clippy::all` add `#[allow(clippy::uninl=
ined_format_args)]`
>     help: change this to
>         |
>     112 -         let content =3D format!("{param}:{content}", param =3D =
param, content =3D content);
>     112 +         let content =3D format!("{param}:{content}");
>
> The reason it only triggers in that version is that the lint was moved
> from `pedantic` to `style` in Rust 1.88.0 and then back to `pedantic`
> in Rust 1.89.0 [2][3].
>
> In this case, the suggestion is fair and a pure simplification, thus
> just apply it.
>
> In addition, do the same for another place in the file that Clippy does
> not report because it is multi-line.
>
> Link: https://lore.kernel.org/rust-for-linux/CANiq72=3DdrAtf3y_DZ-2o4jb6A=
z9J3Yj4QYwWnbRui4sm4AJD3Q@mail.gmail.com/ [1]
> Link: https://github.com/rust-lang/rust-clippy/pull/15287 [2]
> Link: https://github.com/rust-lang/rust-clippy/issues/15151 [3]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

I will pick this one up together with the other one, but if someone
prefers that I don't, please shout (e.g. if modules wants to pick it
themselves).

An Acked-by is also appreciated, thanks!

Cheers,
Miguel

