Return-Path: <linux-kbuild+bounces-6094-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D86A7A5E430
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Mar 2025 20:11:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24A123AA5A1
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Mar 2025 19:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE454258CD5;
	Wed, 12 Mar 2025 19:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=proton.me header.i=@proton.me header.b="ShRSisAe"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1561E5B71;
	Wed, 12 Mar 2025 19:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741806665; cv=none; b=mtYDUW2J7rm1Mh8EsyTyay1ohpfNLTWwA5K0NdyfvbMZTLIGWzMB7R1dTRY5dOUjmO8b/WUFSyrbB/21uoIIC9LL9kkGYRuDWu7OGntJOvTCIhyTxZOuZ5tLMZjxGJXW83I3XBzKMCO7OKjxo7jMSfI40VVRKONk0BcjGfbCp5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741806665; c=relaxed/simple;
	bh=K5jtKIRj1Ea5oIHybtXIdJa/IN6jZFgqgVbH14jNNHQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=avUAULHy7qZ1tYfS11LI4Fok6ZFh5BH0HEB65pQInHdArTdnV9Fc4rXcXtwcrKm8lMbEZaYyqUZhJnw4pKlU79LVWfAMhb/ANbaCRBFFGd5MOIPPUT4KVhnK5WpzkLeimpa86wJ2ivtqhnMS/yTNiyKYFI4XbTRfV/n/kqlvhLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=ShRSisAe; arc=none smtp.client-ip=79.135.106.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1741806659; x=1742065859;
	bh=Fj/nMbDn3oXMvQIB/vi9kH0A2rTDre+lqjrLWiHr2Ak=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=ShRSisAeCQVbd1brnxp6coemUJ7gDPk7RCZkBzKwlzgR4SwdmvgrRpio9io1emcxU
	 5KOt+KIZd2I1bkw9gOAIJ4moEP6iVx8u9yPn57Wn+OW+kq9I6JFEfvqcHFvPJdtWx4
	 o1L8riCESO+2D4ZoDftCipm3aRtp5K6oVlv5UiioK9O2wS91VMOyVU3eyhgkWxm49O
	 8kNnCKZxRRbvn+jx45NIBbLx0prTlnnBFJ1Pll/S/2N+Bz8xb3QFBTW7v3Lcz0UfR3
	 NF8/jIJHUKxBlDvyeuWXCVLD1RBS/Tk5IUo93Hkc+BvCiMd/spOMQqn5v77To15hMW
	 QLGt7plTCTbtw==
Date: Wed, 12 Mar 2025 19:10:56 +0000
To: Tamir Duberstein <tamird@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, Bjorn Helgaas <bhelgaas@google.com>, Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
	linux-pci@vger.kernel.org, linux-block@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/5] rust: enable `clippy::as_underscore` lint
Message-ID: <D8EIXDMRXMJP.36TFCGWZBRS3Y@proton.me>
In-Reply-To: <CAJ-ks9=+3MQb-tp8TAwYvVj=GOFFFVKJxRMprc8YXZHKhqnDrg@mail.gmail.com>
References: <20250309-ptr-as-ptr-v2-0-25d60ad922b7@gmail.com> <20250309-ptr-as-ptr-v2-5-25d60ad922b7@gmail.com> <D8EDP4SMQG2M.3HUNZGX8X0IL7@proton.me> <CAJ-ks9=K06OT6cutUABj2QDHJHJ70719c-eJ=F3n-_bhkYbZ3w@mail.gmail.com> <D8EG9EM9UU0B.2GLHXRU2XROZ3@proton.me> <CAJ-ks9=+3MQb-tp8TAwYvVj=GOFFFVKJxRMprc8YXZHKhqnDrg@mail.gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 0d0c4b8d82d5e58811ae5b2f1a2235ac98cae2ba
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed Mar 12, 2025 at 7:01 PM CET, Tamir Duberstein wrote:
> I think all the remaining comments are about strict provenance. I buy
> that this is a useful thing to do, but in the absence of automated
> tools to help do it, I'm not sure it's worth it to do it for just
> these things I happen to be touching rather than doing it throughout.
>
> I couldn't find a clippy lint. Do you know of one? If not, should we
> file an issue?

A quick search gave me:

    https://doc.rust-lang.org/nightly/unstable-book/language-features/stric=
t-provenance-lints.html

The linked tracking issue is closed which seems like a mistake, since
it's not yet stabilized. I found a different issue tracking it though:

    https://github.com/rust-lang/rust/issues/130351

We probably should use both in that case:

    #![feature(strict_provenance_lints)]
    #![warn(fuzzy_provenance_casts, lossy_provenance_casts)]

I don't want to push more work onto this series, so it's fine to leave
them in. Thus:

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

We can either make this a good-first-issue, or if you also want to
tackle this, then go ahead :)

---
Cheers,
Benno


