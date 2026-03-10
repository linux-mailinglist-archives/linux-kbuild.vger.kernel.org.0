Return-Path: <linux-kbuild+bounces-11802-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJ5EHJd/sGmwjwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11802-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 21:31:19 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAE6257DF7
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 21:31:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8898A30048F0
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 20:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ACBA3E929B;
	Tue, 10 Mar 2026 20:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SkTaZBsK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364523CC9FE
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Mar 2026 20:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773174497; cv=none; b=hZ3bV+TYUlMRWKqd3ylzjc3aWwdpqg7c6FfKY7WEcxUUJUmooMCMQtaTLhbJvtlJEpZGNcyowaRRNAKXwQpv4BKz8zj4KipM7bsaWi6gLSJ9Z0RPOTOs8snKpcKaPGO9Mm3nN1+WVJmRtccweHC7gzKJGXCv/A+shANO0tJMoBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773174497; c=relaxed/simple;
	bh=A4M27D/0fz531oVnIcQ7A7HdZfz8r6eiXYKLzogOL48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZqgbwScb/gAPqVBIxK8DLGIN5r1yLQA7cpzuyx0wtKhVuKaounBm9q3HYMkBM7ph31PKL1Gk+v55dueoLPlLg89Nyl1PHtUrfx7S+O2K3nBLJlHlqCkeg6Bmi64OHo4JPP5PCegeeQEj+lewCsBmOr7g/fEvS4hgTd5GEPmHfNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SkTaZBsK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C21DC2BCB5
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Mar 2026 20:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773174497;
	bh=A4M27D/0fz531oVnIcQ7A7HdZfz8r6eiXYKLzogOL48=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SkTaZBsKvg2qbEfurGfTL5Cn/Am1awaDzXnl0O6EvzqmTclVWa/icY/fRGX6ixIN8
	 P4UqMJxgSFLB475q/eESr7K4HyyfQPO4YPf6b5pkXoph/HIeXDu6RFQwnTFtNIBfDQ
	 ODHiUgJSi8Aq4ny/3Q0STIhGvc2Juxy8gP6sUmlNT/8iyr9QeUlHOypiMeOaylY3JY
	 jaipecCJ8Cl+3XMGNVOdrVdMtnt50U6UYIoihTNNorz4ApV8yS9xnNhcadkv5rd4ud
	 JyIBABXsnTVF6H42+En9p+gIW2pl7AJ0Azg5+EPwDxcNJhBHkJeQWXlrn841mPELmh
	 l14eX+jdNcSQw==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38a439f9b43so26744301fa.2
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Mar 2026 13:28:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXq7xa9bIGdUNGDwSAtUzNjSAHhi0E0v2VSXLYzKvw08DSQlk6OKjBExBGi0X+7m6VV5AosstONoBjvsfQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv/lbEeZCvorF2nFpvmXvVEH7ohm8Q1LLs7b0/E3ghaqaY1Lr5
	kNJJBwp1v6NcxgTvexLtcmZ4x36E22gf+A2klLnJuJ77YBq/WleaXscHcjdOsYPZyeIUHymkmWC
	Uoa7Kl4+34gMw4nE4LcnHBGaUTWPp4xg=
X-Received: by 2002:a05:651c:1583:b0:38a:3c31:2507 with SMTP id
 38308e7fff4ca-38a67e7c711mr264311fa.34.1773174495508; Tue, 10 Mar 2026
 13:28:15 -0700 (PDT)
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
 <CAJ-ks9=ijHBzOGxViDzJzGhEBhLg99ryNpN-FRsFN+NLJwVUYg@mail.gmail.com>
 <CANiq72=MfwGU7wpeUdYWhhOd962X8-KU9NyWDFY=wEo2_iPdqA@mail.gmail.com> <CANiq72m=2qC=DQ4HtiGT_kt0q28NxCVzHCERrjDGH9cw6j5+0w@mail.gmail.com>
In-Reply-To: <CANiq72m=2qC=DQ4HtiGT_kt0q28NxCVzHCERrjDGH9cw6j5+0w@mail.gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 10 Mar 2026 16:27:39 -0400
X-Gmail-Original-Message-ID: <CAJ-ks9ko_w9CFMbyRysdeM8FJ_Y2p4WHMjaN8_R0Mra88ZFM-w@mail.gmail.com>
X-Gm-Features: AaiRm53JI9muoaZGUCeLaaVCqmRC7s4TnRKwz3-RHPWlgGeH7lGVg2WhnoVC9GE
Message-ID: <CAJ-ks9ko_w9CFMbyRysdeM8FJ_Y2p4WHMjaN8_R0Mra88ZFM-w@mail.gmail.com>
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
X-Rspamd-Queue-Id: DFAE6257DF7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11802-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 4:01=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Mar 10, 2026 at 8:58=E2=80=AFPM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > and so that you are happy with it one
> > way or the other.
>
> By this I mean that either way I would wait for you to be OK with the
> change (e.g. with an Acked-by if we put it after merging your branch).

Makes sense to me (that this goes through rust-next after my PR).

Thanks!

