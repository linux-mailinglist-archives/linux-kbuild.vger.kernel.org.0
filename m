Return-Path: <linux-kbuild+bounces-12632-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGrKNSyXz2nmxQYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12632-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 03 Apr 2026 12:32:12 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C991393503
	for <lists+linux-kbuild@lfdr.de>; Fri, 03 Apr 2026 12:32:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29D0F3004615
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Apr 2026 10:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05C3A38AC60;
	Fri,  3 Apr 2026 10:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M0JASDWQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BD0387566
	for <linux-kbuild@vger.kernel.org>; Fri,  3 Apr 2026 10:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775211909; cv=none; b=EIuR/CLgj6LYFFexzK/sTNNG0SldoC6wvCZ35mmaxWmTAB7COEOFzSfEwr8VKxSHxrAoflRGwgoMKYDDsEXbYGdIYq+F0no79v5j3pwdFvlPoS+dNXur3nsb2IJ/ZyxN805rstCBa/KvhbQaLKi316lAZkmgn+0BLmn+uwomQek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775211909; c=relaxed/simple;
	bh=U2C+1n4eblBLZUZFn02BGUxCEgYqyusDgYhB8Ehu/fU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UbuGZppxkplTuwldK8JURj2Mw9S+FT6vfo2g9bip8AJEJZ4fA5SKpsjEpn+jE3sWZWALDh0c758kPFzp55Z9oCuZw7IYAKYzNxTWxUjNERs6ugYJBjsZfR8vl/DKobjDCA+xLeiKTzotsAwHlL7GVuKYzgkcyZe8dS47vLJJqqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M0JASDWQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78684C19423
	for <linux-kbuild@vger.kernel.org>; Fri,  3 Apr 2026 10:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775211909;
	bh=U2C+1n4eblBLZUZFn02BGUxCEgYqyusDgYhB8Ehu/fU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=M0JASDWQRdituGJi8xOwO7QYKziizkXol+VSmPb2d4XquQO+38FJUfqWs75aM9qdL
	 8gLCh/zSUxmQ+6N4cbp+kCmoCXa3SirmEpjfe7a5FcyUPmdiflMSxwChhPLMcOv6jD
	 dtN6/MuLy0R7rKf4RJja++EsSVRP8YJD/uSTcPrx7NHvbS0ZrfePJH9lINyX7usPNQ
	 AJnHW1+AqklflOv2Dhz9L33aI9AhqcY2P66HzQl7PhhYUOMDNwf9A35t1BnZtA+2Bm
	 s9DzKJK9FJTVpLiJru2lIEYdvwP22uIU2uFrzwO1J72pqTWZ2k0WKSnimVPs+JEkST
	 aaWQ6xRIra5Ug==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a3af1b7549so521492e87.1
        for <linux-kbuild@vger.kernel.org>; Fri, 03 Apr 2026 03:25:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW2dpn7afziSvFPq4fTTj7/ITo3bgYXxXssJY5Pliw/8poMbxmih1djZk6dT0TXdTkynGa7LriDY8Y61G0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0brN87Zo563xI3+secHRxE8P7BvCLxTNIHBil+LhCsdwfyn+Z
	7NdbByIlOnoy6FPni5c2eBb2p9Cs51aYpjYmsy1zPaqaahYhJWWT3o89j5ma6aQ7au8+NT4FWWG
	Vuf29eb1nj1siRs6zyWncLlb/d69v4z0=
X-Received: by 2002:a05:6512:138d:b0:5a2:c62c:1edd with SMTP id
 2adb3069b0e04-5a33757cfc8mr993241e87.25.1775211908201; Fri, 03 Apr 2026
 03:25:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331205849.498295-1-ojeda@kernel.org>
In-Reply-To: <20260331205849.498295-1-ojeda@kernel.org>
From: Tamir Duberstein <tamird@kernel.org>
Date: Fri, 3 Apr 2026 06:24:31 -0400
X-Gmail-Original-Message-ID: <CAJ-ks9nqv30SOiCia8LE6XbKEURNCa9qwwcszsQ0a8FRxR0Msg@mail.gmail.com>
X-Gm-Features: AQROBzAf1dd0CJ7lpIad1E6G-CnB4P-wdlU0-ynV0Gb0FaS0kedu_jKfyYVRJEc
Message-ID: <CAJ-ks9nqv30SOiCia8LE6XbKEURNCa9qwwcszsQ0a8FRxR0Msg@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: rust: allow `clippy::uninlined_format_args`
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Aaron Tomlin <atomlin@atomlin.com>, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [7.34 / 15.00];
	URIBL_BLACK(7.50)[rust-lang.github.io:url];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,suse.com,google.com,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,atomlin.com];
	TAGGED_FROM(0.00)[bounces-12632-lists,linux-kbuild=lfdr.de];
	R_DKIM_ALLOW(0.00)[kernel.org:s=k20201202];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.867];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-kbuild];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tamird@kernel.org,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rust-lang.org:url,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rust-lang.github.io:url]
X-Rspamd-Queue-Id: 3C991393503
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

On Tue, Mar 31, 2026 at 4:59=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Clippy in Rust 1.88.0 (only) reports [1]:
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
>     warning: variables can be used directly in the `format!` string
>        --> rust/macros/module.rs:198:14
>         |
>     198 |         t =3D> panic!("Unsupported parameter type {}", t),
>         |              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>         |
>         =3D help: for further information visit https://rust-lang.github.=
io/rust-clippy/master/index.html#uninlined_format_args
>         =3D note: `-W clippy::uninlined-format-args` implied by `-W clipp=
y::all`
>         =3D help: to override `-W clippy::all` add `#[allow(clippy::uninl=
ined_format_args)]`
>     help: change this to
>         |
>     198 -         t =3D> panic!("Unsupported parameter type {}", t),
>     198 +         t =3D> panic!("Unsupported parameter type {t}"),
>         |
>
> The reason it only triggers in that version is that the lint was moved
> from `pedantic` to `style` in Rust 1.88.0 and then back to `pedantic`
> in Rust 1.89.0 [2][3].
>
> In the first case, the suggestion is fair and a pure simplification, thus
> we will clean it up separately.
>
> To keep the behavior the same across all versions, and since the lint
> does not work for all macros (e.g. custom ones like `pr_info!`), disable
> it globally.

Seeing this patch a bit late but in clippy 1.85.0 there is
`#[clippy::format_args]` which would permit us to make the lint work
with our custom macros.

https://doc.rust-lang.org/nightly/clippy/attribs.html#clippyformat_args

