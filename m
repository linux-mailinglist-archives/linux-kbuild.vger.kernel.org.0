Return-Path: <linux-kbuild+bounces-11095-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WA6xEJDvimmwOwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11095-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Feb 2026 09:42:56 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8A311850E
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Feb 2026 09:42:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98730303DD6D
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Feb 2026 08:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A590C33D516;
	Tue, 10 Feb 2026 08:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g86YfLjH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F0033A71E
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Feb 2026 08:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770712968; cv=pass; b=R56I5Udr/NGZLl765fkhj2p1ZL/YkH/4o4CfTWFRi1cxOWMbl1thUPTd1ocXKVy1oTecV6OfjdQdVii7g2PpTUJ3oFd3aJ4/mSv/jWwnx9Ue71/KJJx4XXupVLxdW74ykCJG8ekthF9ol7V568AB5Em9oIJgIiwFD9tIoaD4698=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770712968; c=relaxed/simple;
	bh=pzj9Ny1KxKgyvqZwK3YaJvtJxyNcZudeF2U8bB6Rm+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MaGe69ISx4FPAGcZjXvMyaAVMgO6tZt1JVQuhrhEMZINWnQQ3FAotzPWOcoRstX5+Tmf2z19B9aMDa+4M1U7WLXdOF0aG/wzaEKRjy8nI2MVFE9usUka2NN0msD+q2hLa2ftIcpM9y4iZZHVE35m8zmaMptZ5R3RiV5JsUOhyIk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g86YfLjH; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2ba6737fafbso71310eec.3
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Feb 2026 00:42:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770712966; cv=none;
        d=google.com; s=arc-20240605;
        b=Gsgn1QpNK/m3577oFBXZ4TE8zkyNvmUfgCYk9o9tvnNRzjpVzLa5SpMgp6VabhFoC6
         6fmgq/bkyqZEGVqa/ZmU7xKlJbd/m+If/y8RSM/8mmxufF48hbSaifjZ7e07gmEbgl/c
         cKOCyS2CC34zs1yF9HuMvikOS86f1llUrz0mLl0VXEpBy1KqIqwto8mjdYzYbENx5xH1
         gRe7Xqz3qEM1y8znFQhw1/0QATMRV5yfVtG2bPRRmgf3xAC51XfFrK2Nm1VmJtTPzQuV
         gJONKGV3k6QjTArYP3D7H/iibPB5ogicea2CAhQMsOtf3ZuNSkCr0l3EoBfzfzq1zbp0
         Fj+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eRd5nGkK/uJsiW/OSeGHF4f73KvZkDNQmuEV0hYZwB0=;
        fh=nUH+3sURVT+8nxPN6FL84uyyIEKjlJ3nkkXZdRHWN/E=;
        b=JSWxKND2Il/BWdtgJK1SIxkbfxe6zXRFyS/k+1xS7s//ZWZsToOJw/Z5/whkszs4/c
         hJpeOlwip5C2ZatC3mLgSAoxN/IYvYBy2PdtxM4apDYevQL2alq/QYWq9VhvVfCjN2Vy
         1k4C+LNqYoz657kYceKKbKa6YIZ8NM7zx0qiYvlNy4IqINqWX6+nU3WtjJLttDbmIRUZ
         u6LdgkFgcNz8NBh8kN15LK/6CHnbHZR8pX8Snw0MRCHT+VBHtmiHIk/nIvRjQT2R4+wX
         40ErJbCoG8w7fhKfP8fc+bNP7yokkESRpgydI6Pq+XmwQHdLiniwa0wDh0D7d8KtYVJ8
         50Vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770712966; x=1771317766; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eRd5nGkK/uJsiW/OSeGHF4f73KvZkDNQmuEV0hYZwB0=;
        b=g86YfLjHLLROwQ2kshoDhTX3jqvWN9mGJHSO/ArVZzzwmHv3dc5RjEV3XuioS9oK+i
         2023y40IxKLhkr7WTc7eQ4UG3v7ZwfYhUp2ovmyTq3LnrovQ5Ar9sU61cYhaK7GQzjCm
         +EVJwa3guOqKJnwnB8iaM2uq9RzJSH7cAw5oAHYlylzxM1QAZncDhSZW27EtflWDtyeE
         NtO1f3fymHVUbXyxLwgL/GHJnAcjz6dvkLXJ6Fd/34IQlrkf2GrcIF6uUfr+xOPoOeg8
         QkxDi0ViaMJRH8RwfmOvCD/W1Q/fgpZkCj4fC/f1xix4UES2MuZ5oR7VH9gq8rVs/WeB
         XLGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770712966; x=1771317766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eRd5nGkK/uJsiW/OSeGHF4f73KvZkDNQmuEV0hYZwB0=;
        b=PbHpBUxLXI7HIZlOX3mHivMVF0qfshyiox1JPggqcGSUG5v6jeCHvCylg+aW9XDOtR
         9ggtywmjwNOmvUw1d+HAEFkxkPOuomMa8F4sbMu7fDmyNiJVcaHBkljRZ3ORYKa5sm9q
         iyQISImhVaeqWCntoPGtclBswiaWKgOEHHULVvtgTlC5Sjs1qW3b9Mar7XxA22yomstH
         bn/v/9WC4zzlsabZYqlEOGruothb9AX3BqDiCIJwIqFr+Tsfs8HnbYDzYr8unBfjEQpN
         DjCPcuHyghC+ngGxrDMa+d1JdYSyJKkOgkIK6zSpKmwPfD73h1b1oG+Dz2cvKHLX8D6r
         twFg==
X-Forwarded-Encrypted: i=1; AJvYcCVgvMzt+Djm0q44hbPl5FjNHvU6HBwUyZCyrijdY+xHPv8sGaAcZCLAK7k3KX0r6+Eclt1GzpvT2J7K/J4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6XYnYiimBN/fo1YhWelrNwuQxircaiSo9KI5z0GlLpAJRdlg4
	+zU3TvZXe3wuCUsF30oWMYMW3ngCP5HQT7SkGGeofP2Bv3B+4RqCteRyck4A3MOz/llEbQcN+Pm
	4HhxAV+5NpxTN38ZpzxzMhhqwgCrRE90=
X-Gm-Gg: AZuq6aKfapXUJ6048MdmH+HoqX3Img7GuZC8ltuyXDN21bGrx4rBkRq1ztIfI5OjlrN
	5fHkgzGHe2a5Q0g4leEWJQRupH9BkLw4mkH0UdSQ62BHoAosqmmQnoWD6TGUkB9JcXjQ1KZQj82
	Tq7GDdD4VmJNghDKKxYtoAzXlSEELk4FMLrQPe3SjopjXl+A9do3RzRr3FYxjtolnzVDMIF30J2
	+HTfqyR/d9z9OWNi1K0/Ud82Snl4Fy0rlQRCkWQzcn29EqJz4M/AOxESm+X/H7f5gwfzVccTgsO
	LLVixVsMeuQXYEBvjEy/haA0QxK9Fa5M6+7dGUdWOr956KNpRHSH9caWF/reXR3WceUCMMZxRqD
	37tys9IHQ1wpyHAFyxQ18YKyf
X-Received: by 2002:a05:7300:3721:b0:2ba:7322:6bcd with SMTP id
 5a478bee46e88-2ba8cc89047mr187606eec.3.1770712966327; Tue, 10 Feb 2026
 00:42:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260206204535.39431-1-ojeda@kernel.org>
In-Reply-To: <20260206204535.39431-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Feb 2026 09:42:33 +0100
X-Gm-Features: AZwV_Qg-hW3f7kkxtTxv49a5tYvs160zPEvUI7XxUzESxFFA_J56CIIMLUIrGT0
Message-ID: <CANiq72=15XC6QT2KucsBhzLOdp=rLtCgC__ncLPwWK44583S+g@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: pass `-Zunstable-options` for Rust 1.95.0
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, David Wood <david@davidtw.co>, 
	Wesley Wiser <wwiser@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11095-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,fjasle.eu,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org,davidtw.co];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,davidtw.co:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AF8A311850E
X-Rspamd-Action: no action

On Fri, Feb 6, 2026 at 9:45=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> Custom target specifications are unstable, but starting with Rust 1.95.0,
> `rustc` requires to explicitly pass `-Zunstable-options` to use them [1]:
>
>     error: error loading target specification: custom targets are unstabl=
e and require `-Zunstable-options`
>       |
>       =3D help: run `rustc --print target-list` for a list of built-in ta=
rgets
>
> David (Rust compiler team lead), writes:
>
>    "We're destabilising custom targets to allow us to move forward with
>     build-std without accidentally exposing functionality that we'd like
>     to revisit prior to committing to. I'll start a thread on Zulip to
>     discuss with the RfL team how we can come up with an alternative
>     for them."
>
> Thus pass it.
>
> Cc: David Wood <david@davidtw.co>
> Cc: Wesley Wiser <wwiser@gmail.com>
> Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned i=
n older LTSs).
> Link: https://github.com/rust-lang/rust/pull/151534 [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-fixes` -- thanks!

This is so that Gary gets it soon in linux-next for Klint -- I may or
may not need to rebase this one, though.

Cheers,
Miguel

