Return-Path: <linux-kbuild+bounces-11798-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id LjwiAH1zsGnJjQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11798-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 20:39:41 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F0F2570F8
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 20:39:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D7781301287F
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 19:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B626355F4E;
	Tue, 10 Mar 2026 19:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CWgSsSN3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686952D8760
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Mar 2026 19:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773171576; cv=none; b=mx7qVgGTndDopzHBesouW+jPpNTo36pNaUOtgDX40Lkh10wDHnN6K1CY9VE9WUYy2AK97AEEtFJZzvR59msmRYM2WBEw36DHOD9J4PqUhZl1LoDhZaDNVMT19E0ttcI7esRGANYLb0Lyda9z3b4Uu7cDgjFqMJ6hRNzzRKVcOzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773171576; c=relaxed/simple;
	bh=LLkWHxZJHPpW5vcGFfOFy0aDeOlWGpY4CB4V4erm9Rk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XS11g7wmY3+vBopRmwESyNj8DFP59bdqKO+ItqrWojhachgGmrNWy64WE2q59qRsePiGp14dSNs6L0oQZLLPwf4zORTzcA2dZXSdsoh5xEqn58itjAFGVFTltUIX8KXRrERHWr97Th+tFHcwh1TMeS97MVqjQ3a1V00uOJ75N40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CWgSsSN3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E11EC2BCAF
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Mar 2026 19:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773171576;
	bh=LLkWHxZJHPpW5vcGFfOFy0aDeOlWGpY4CB4V4erm9Rk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CWgSsSN3RY0ZGyuvxxlxiOrOWUpC4TX6Ex7yPDglCPvUcigWcZ/oYHEPrLtbEKP4i
	 2EV8CwQt00RfNTidlFs3o7l2xVxG366e4PjKEGLhNQQZr2ya508xK0C38N0SQ34FwB
	 XxG+3qFMzE2ciK377jWHLBJlzTSUt4iuUmSj9ezVKFCufijA9SLRRIIrad7eeAaMiC
	 SKct2ek2c2mddRcGZgDKR/Bj5F5wR38OA0duCfHO3YYgRZi/Hq7IIDBI0OFNTqe9gv
	 +Tg3+wKUQt8NjxseIaeitHG7MqvzmzYlfn/ljzHIhuIlVRMeU3g+sVMoYBxK2cnrir
	 OF2+8pUJfJPRA==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3878de20527so160002681fa.3
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Mar 2026 12:39:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVe6dtusDFVbB9lEN+k8ZTzjmRctU7YsocwaDTvfWoid2yqoj07rx69hoNuxMrv0XIIpzLdcw4oLivQE9Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQRqOnGulMFj600rWoguKsn1A6jOJ5XSzIMpFHFnuYnJvpGDYt
	N4rT0skyPE1wCi67Gymcft93HbJ+XCGsPVgVQAwl+LjrkxTO3gQDcv8C/7xvoaaC+S7VEtc4kla
	JwLSpJEnWCqGvTeyy96eZrl3/Gt7coNs=
X-Received: by 2002:a2e:b892:0:b0:38a:46e8:d59d with SMTP id
 38308e7fff4ca-38a67d9066emr41521fa.12.1773171574730; Tue, 10 Mar 2026
 12:39:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310-binder-crate-name-v2-0-0f7c97900d36@google.com>
 <20260310-binder-crate-name-v2-1-0f7c97900d36@google.com> <abAzTFLYsUxK7VJ6@google.com>
 <177315751568.96522.7020199079773666163@1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa>
 <CANiq72nM6ECBE+iiKrBRzCwOyd7BtQ4w6o9AH4+o5rcrcY30kQ@mail.gmail.com>
In-Reply-To: <CANiq72nM6ECBE+iiKrBRzCwOyd7BtQ4w6o9AH4+o5rcrcY30kQ@mail.gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 10 Mar 2026 15:38:58 -0400
X-Gmail-Original-Message-ID: <CAJ-ks9=ijHBzOGxViDzJzGhEBhLg99ryNpN-FRsFN+NLJwVUYg@mail.gmail.com>
X-Gm-Features: AaiRm52ApbAnnYLyC8yuBI60nzikJiC4itjHSxCXoTox-7Nuwbp0s-__LUHFtp8
Message-ID: <CAJ-ks9=ijHBzOGxViDzJzGhEBhLg99ryNpN-FRsFN+NLJwVUYg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: support overriding crate_name
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 44F0F2570F8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11798-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[google.com,kernel.org,garyguo.net,protonmail.com,umich.edu,gmail.com,linuxfoundation.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tamird@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 3:13=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Mar 10, 2026 at 4:45=E2=80=AFPM Tamir Duberstein <tamird@kernel.o=
rg> wrote:
> >
> > Did you want me to take this part through rust-analyzer-next? There's a
> > significant rewrite there that adds type annotations to this file, so i=
t
> > would be better if this patch could apply on top (with annotations).
>
> We should ideally avoid breaking it between commits, so we could apply
> it after I merge your future PR, with your Acked-by. Another way is
> next cycle, through rust-analyzer-next.

The change to `generate_rust_analyzer.py` is safe to land even without
the other changes in this series, so it should be possible to take
that through rust-analyzer-next this cycle and then take the other
changes in this series after my PR. Do I understand correctly?

