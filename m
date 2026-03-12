Return-Path: <linux-kbuild+bounces-11892-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHBFGA7LsmlTPwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11892-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 15:17:50 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1282732AB
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 15:17:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1FEF430351E9
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 14:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46FBE366565;
	Thu, 12 Mar 2026 14:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kZZlLvnj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6C235CBD7
	for <linux-kbuild@vger.kernel.org>; Thu, 12 Mar 2026 14:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773325044; cv=pass; b=mzn2HexBSJtw3bXOZqI3K9+19bYmv+AKEVhY6ziY27TNELt1EyH7CjvbcvIHaHg8Lax+zJkkzqHrcS74ptLGNtNV30X4odb6PA7ghDst7wsH8OpwE6mxrw5sSAcPeqhdksleXD759kyUX2b+joUIPU3hI9CjoRFMFXKr9XeLuwY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773325044; c=relaxed/simple;
	bh=uNv6kIxa3sBonyIAZsWJ/1YYALDiUWo1uHouUO7Kot0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wch52gMansm1cA5x4KI1cltMD4LgHyjw9DqhjfvgvXylaUQatqdt/hwPBDNge6peQglt2KDqDR4oMqCO2GwecNtCybh8zy1IGE3znXZQrHxBf1qSllhcA20sOs3qfYtrn+z25w4FEqlEY2q/wGYWn6/Rw59QpuXQAmxPJotkZZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kZZlLvnj; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-128d600ad25so21925c88.2
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Mar 2026 07:17:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773325040; cv=none;
        d=google.com; s=arc-20240605;
        b=E+MCDVQVYMCdCQ6szlrPjnNbhD/3zYZfIDesGesWTTLwpiKL/dsIbZN2IgqAq+8WOz
         HnHv5jg/oeJBX7AKlL3DnolsgKG7zlgNZRW3Z2uy21amYD5djl6gncYgE2lG1nj6wGNs
         GGmSLsJuktBgurq2yYSyuokxm5C/vswhSbecnv7CmwCNg2FSKOFz/S25UtAmTZJ0V0eu
         7A10VbCu3Iwe+Da/8vSc4BpH8bXMyGPv9VBUyA7MSpqe4Ezm+v5uq0oH0GUHiYUyaSz3
         14EWhUF8UVA6IQdP7cga1BDdvIe4/IZWqK0y3XNFgeiz3YwjqGh18QIhzIkhK/JrYnDI
         EWFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vbPtKH2motvwMAB0mbkvP4G0RyN0OeH5dUu3v1J2yss=;
        fh=vKp705XzGG4nZKg9n8FANJfZGh9L+jIdCEJpb4UTBp0=;
        b=Eri89gTUy8i9I6l48AUeX9vUnFJVHcbdaVta3rTzQ1DrWxuWL2nfwTuGePh25pdoQ+
         HkjGRzwjAg+GvBumBUfc1CjvDDZgrYCpXwZcHO9v6+7HeDFbzkuttn53Xvmz7KyigDLJ
         9RCciBl0wDnJrmScncD2a81snuwZkqyZGx7w+Wtb1CpFmMUiVZHUL9o2uNnDwgUuY0VQ
         RcpzDo+sa1mKLyecbGfHvvApj57CNjCWQl8x+YruysIhsMFZ2kWSW3mQCXngiASRHtJW
         pKxpUvGKxBHQHGO02s75NQrb+zABYfEEsJ437zTOKHhBd1/r0wRE1TVLjTgzC35Dsn+g
         yLHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773325040; x=1773929840; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vbPtKH2motvwMAB0mbkvP4G0RyN0OeH5dUu3v1J2yss=;
        b=kZZlLvnj5JpJvZTz/OpdlK7G2eRopSYkAUj5YLrcQMoaoaQIBQ6gF5rAcYzmVJN+6k
         hVAoz5quGRnrd5tEPIU3a+wFNOtdKi1H1g0h60eKElw+HLtLtrDurYQVpWlq5qMsqKAD
         cFfvTtD9xApIKpE39qnnmIq7ZemGewGZoBXfxer0Tw0Z/pDNaJm8RWl+On1O6PnW4103
         N8MrREuTpA/DpOAyYw+ziCa7jRW21oFJqGg0L3m6V2HwXoVDCStc5RYtanFWXdFRJQ64
         fjSKWOL4nP3TY8e2L27LCwdG1ZOZCC0gGvSoMODi8zs5CXuEFNGM1bQyntjS85VqsxCE
         jaYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773325040; x=1773929840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vbPtKH2motvwMAB0mbkvP4G0RyN0OeH5dUu3v1J2yss=;
        b=nPW27UcGmqEBq1UrxOFuIcFOcE20A0GaRX6da6XmU+sRncPPoeq3+bA3xb7YjBcJHu
         H+kErEyf7EpAo1OPvCLQt7kfyQTpneHjlFl94rKTtkX8ttlI3T+kt98PFA+dDFoTx2tC
         YdltkdA14zFor/rV3ymPuHPA1E3sxjxFND4hYvBWK9UWgY8BqmCQ1u1u2rHQsZcrCbTF
         l1ugOfs6NlPfAZFzV8dH9IHyBkOSd1zbXO7tWhSe6ENPcufNU0A9gRRwvSvSNK2Mz3Wg
         rzo0F2Ci7ivxavwSaDRKOfjd8Kzm5Bk1Pzzr/jn3XV8+LhY7yw9GVkOKSjITgzhtbpmp
         Fp2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXHIm3Nb+KM3eZkuZY5vBSe+Jo42pLHK4rhWSyIglt7ybnyfdK16xQcJz5jJcSH/NcktT/FWy4DGLnoJF0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpwEKUo0xRsM6PO/yBk3B4umZw2+E9BZah6/oWT43d19Nkvpy3
	QsZT7WIdiucm70AW3UoMdjW0+GTNrKYXP6R4WSoe35OwFa1RXDvIdsh/FSHN6xw73pRttoaxh0v
	kNY6U8Qpm4W3w2/j4cBBRxBn6ZhuQXcE=
X-Gm-Gg: ATEYQzxKt23ZpA9XzRPl2tHCDeUZclR0OT1O6IS0/PtG7jC2e3mxJaLGE5+TMg5ryys
	VhwcL2y7Qdhi0XSeTxpiMDS03mkYaI6do15/WG5WZk/OHRMAkuxuDeF2guUV/72dByYEuJz2GBs
	sTcJ9pMzEmPm50Pho6v8/54ZtqQSHyAZYv5KFXV+jAcyCnF+8MKAmLTg7SWABykl4r4a4GUplQ6
	iUf2zABYHqBaj7GYNN7BBET/M47PKdAFPx2nOQ+vmb2S0ecUpcSdIrZZY+o4X2y+Ine6iKSUowo
	n+dpuMTrw95KwQAhLCBxHeDDto7KturW1KQxVr3Sm2apKgZedH3rOaWzvxF9TFnX87mrfwzod3b
	NHNwcVEYbqjwEECWkGiy+6nM=
X-Received: by 2002:a05:7022:3f88:b0:11b:ad6a:6e39 with SMTP id
 a92af1059eb24-128ee50db45mr394830c88.5.1773325040019; Thu, 12 Mar 2026
 07:17:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312111014.74198-1-ojeda@kernel.org>
In-Reply-To: <20260312111014.74198-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 12 Mar 2026 15:17:06 +0100
X-Gm-Features: AaiRm52IlgB3f2dqIvdLqxC0QGpjGXWHGqE4d9SxnSDtWii_yfdUEsYKET0WFVM
Message-ID: <CANiq72m=cYe8td_z1t-FLbmhwAaVLjUS1mvg3RS+J65onxzRAg@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: allow `unused_features`
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11892-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 0B1282732AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 12:10=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> Starting with the upcoming Rust 1.96.0 (to be released 2026-05-28),
> `rustc` introduces the new lint `unused_features` [1], which warns [2]:
>
>     warning: feature `used_with_arg` is declared but not used
>      --> <crate attribute>:1:93
>       |
>     1 | #![feature(asm_const,asm_goto,arbitrary_self_types,lint_reasons,o=
ffset_of_nested,raw_ref_op,used_with_arg)]
>       |                                                                  =
                           ^^^^^^^^^^^^^
>       |
>       =3D note: `#[warn(unused_features)]` (part of `#[warn(unused)]`) on=
 by default
>
> The original goal of using `-Zcrate-attr` automatically was that there
> is a consistent set of features enabled and managed globally for all
> Rust kernel code (modulo exceptions like the `rust/` crated).
>
> While we could require crates to enable features manually (even if we
> still keep the `-Zallow-features=3D` list, i.e. removing the `-Zcrate-att=
r`
> list), it is not really worth making all developers worry about it just
> for a new lint.
>
> The features are expected to eventually become stable anyway (most alread=
y
> did), and thus having to remove features in every file that may use them
> is not worth it either.
>
> Thus just allow the new lint globally.
>
> The lint actually existed for a long time, which is why `rustc` does
> not complain about an unknown lint in the stable versions we support,
> but it was "disabled" years ago [3], and now it was made to work again.
>
> For extra context, the new implementation of the lint has already been
> improved to avoid linting about features that became stable thanks to
> Benno's report and the ensuing discussion [4] [5], but while that helps,
> it is still the case that we may have features enabled that are not used
> for one reason or another in a particular crate.
>
> Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned i=
n older LTSs).
> Link: https://github.com/rust-lang/rust/pull/152164 [1]
> Link: https://github.com/Rust-for-Linux/pin-init/pull/114 [2]
> Link: https://github.com/rust-lang/rust/issues/44232 [3]
> Link: https://github.com/rust-lang/rust/issues/153523 [4]
> Link: https://github.com/rust-lang/rust/pull/153610 [5]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-fixes` -- thanks everyone!

We were already discussing this in the links above, and it is fairly
trivial on our side, so I am putting it in already so that it goes
into the next fixes PR.

Cheers,
Miguel

