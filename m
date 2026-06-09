Return-Path: <linux-kbuild+bounces-13679-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GjX9MwISKGrO9QIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13679-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 09 Jun 2026 15:15:46 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3622266071C
	for <lists+linux-kbuild@lfdr.de>; Tue, 09 Jun 2026 15:15:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=aZ1Pi89M;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13679-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13679-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33EDB309B7A3
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jun 2026 13:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87CEC404BF7;
	Tue,  9 Jun 2026 13:08:35 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5361841C31D
	for <linux-kbuild@vger.kernel.org>; Tue,  9 Jun 2026 13:08:34 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781010515; cv=pass; b=FrXuiXkIX7hP9Js/Rd8FQw4tPPntvpSxfFJW9jaM18guApEIezq/E+pvswtu0YuEMFl7RyCamRa8sUuprS0HSsPbyt+3kospQhXHWQhwizJU5Pe3scFrtpjrDdIe8fPoJC7AOlDArF4FO5KMixeYV9WYwdxGyQMQgMhI3PoSK3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781010515; c=relaxed/simple;
	bh=KPlTDDfBa0SjQqDYsirXwUX3KwsC+Wlzz9vigQGmoU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jlloCk5Wmd6WlING93TsVdfv+HYffY5mDz3DnbrIavZJVCmpyHSfi8SDlggmXmCmwtO/VpwZNbR1YMJFLyTXDjybDnTVWq8tEXVy/vRl9apFMes3EQkgQwA8k6emz3jIbRAi3f5Wlc/xDmRUDWdSAvAcSi0rIObllS34o7JbFFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aZ1Pi89M; arc=pass smtp.client-ip=74.125.82.51
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-137dd3b29d5so310265c88.0
        for <linux-kbuild@vger.kernel.org>; Tue, 09 Jun 2026 06:08:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781010513; cv=none;
        d=google.com; s=arc-20240605;
        b=d86Y1EDrzh+PFhtP7y5N2XAAObN85q86YXuSfoutb2Eq0WFkDn3TIsB9vnsa2D5s9i
         LKH/SzQoE0r3G+1XvOahzQSOQBtbeefg0ZutOdHLI2JqUGaVLMQR3OTw/kl1RXwY/8c9
         QMM2Yhh24n18vyz5PJE560uVlyQ5lLkKOZHwrDQ1v0kjof8ZbTEOI+DiAHqo0S16B5fA
         Dl6OkXTCLchQZr0+h1X1OujjN4pdHreACvMjVJIJRlKv/NCi1CBYK4zvG6JjwYrStiAa
         3fPdFmJLpoeqUaEwr5/zbiW8tcKvxYbUwiF7IUbyS6epWi3YvU+8i+iFbODovWvO2RS0
         dNuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jWLfeb6Fbv3CpGCF6Qhd5cHEXEukaqdq05MrrhMnWmw=;
        fh=62BGkoa2fxBcHgAKACPXmdKZle60pTnBrhYjBDpLKJw=;
        b=CVTt13azFVjn5u43fc0m3iRMSeoZpF/EaEviTZ91+XkDTRDll5d5mPzEDr0OwaU/VO
         pDV1NXULmavBF+MRtlxQ29dH/z2rYUY+p1Cfabl3h1iNRGWcI3fsiOVt86/2TSjGzruH
         TumoLdVBH7dQ8iQP2yNx3LtTF5OmiLNmJR2gOD7Wn0AXLwpENSrn36JHigFpb/p+7RZE
         CfqMB3Jut3OSaLbAdf8aM47zoBvlsbKvGp7xESupjLrkSSCWJ9msWQ28VQAT8WLc6v77
         0+m93dwOTOWUHIlQ/GXGbq/Vk488KsTdPr3KEA72C03T33Syg4a5GfwK5QeCT5qBgNEU
         rcUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781010513; x=1781615313; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jWLfeb6Fbv3CpGCF6Qhd5cHEXEukaqdq05MrrhMnWmw=;
        b=aZ1Pi89M8Zu9ofjG8igXOuVEfKe7ZBzSk/9mFsJgtHz/deJF7Wr2HLg8Uon45DLdEH
         0WhjU2GhpaUJ9ixh/fOIfuLNK3SPuSeW71YlDZ7YA8eFiwXKIkkV3G6EOxvaEC91N86a
         +lMwWkVaT3Zb2hNjl64QtsOEOQ2FI7QM3oqIFECOKm/YcrJ/AUJmLnlc7ni9XVeR2mrg
         db961ykboyRUJkTrmbBGFoc2c9Q5J7Jmse1xfIeLWyz2/H2yZCBVllkYpW2/4SGNaLmY
         dtMqKPgehT6uVaZfjcTU8yezYB4Y0fFLun0PgL2VW7cvUu7EFM9o084Gdcy1Xosm/8TA
         rhPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781010513; x=1781615313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jWLfeb6Fbv3CpGCF6Qhd5cHEXEukaqdq05MrrhMnWmw=;
        b=Pqwf5H3BN3dEM+q8nV8q3REkVq7mgiPMkxAa0CdC/H3b7fRALz4nHkTt4XZ3D6mi5L
         vjAf8w2JjR9JV75q21XJs6HU9VWqbyUn25eRWRdCGEpJQLWEjWLJNFPVzdCBk3xNfc1T
         jbI37y/P3mMtz4l4Oj2Hb1GejJGR2IsiLyQ1tLL0AfvAVQxv5l4r4P4tEqW8J0CwRXbN
         rKo7RX4kv0BhnyvCWmoSkRjJfR0OECYE9aX7QrNtPkKNdZLFEFOwviwTVDTzbk+6OYlt
         SQaCxit6H6v+7pUBvLeafHl4R7Yx5aii+0yM9+WiNDi3Gnjjj/iabHGDwqv0lUqM4kDc
         DfwQ==
X-Forwarded-Encrypted: i=1; AFNElJ/DqiEchpvgyL7c/aK5Vpp/fkfhRZNkbdpD78Fc1FUTsu7dDsOf4tLFkM1Tu6ba3frgo0UFw6g0T0v7RUk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2tEmUT3v+XVcXJEk8Dl+6wbAZ9Fn6koWGPQusQXi8r0f9iyK9
	y14Mh80Uy1KpoBWNTKaubNGHtDhULnM6jL7InIrY/DTQR1YW+NxUUWNOQLSIvPCgZRMDkKHYk9c
	2LqJbCcEjtBFNIuuI+KJ1/X8YuD7DSS4=
X-Gm-Gg: Acq92OFm108vDejsPsvJpC/+tRpbcZkKwtcve3Gq6M7LKrok9C+QauT2oDa9vwfAAgR
	IXYH5oK8EDS0SnZjcLnY2cxK0FPGAY2VP5SWtybGjsz1spOSrCwUTjVRoMe1A+aOELMsVZjKafc
	d5LEtZpmMxZPckNlsdTXeQwSxvEcOBzGiJCoQiDAaESTxgTYo6Dqlncg1m89BmME15hEdo81cvh
	5OstbXWJdrBQeaxOI+3vWo2ts6eUbBVedSsJrgf1L/rDKgsPRxO6vHWeNSqJmJnff/MnQMvOJ/o
	ns76DObb6lIcioOd6YpZP6mZWfsVrS06pTQuEYQyJ4X7/h3yAQ4fEYqRF5H+XtAeyWFbQ6yLpQm
	o7Bti0pQNrGzlbIQhBafS0DrsctolxNx3LnRwWCP6JB+D
X-Received: by 2002:a05:7300:7647:b0:304:e327:aef8 with SMTP id
 5a478bee46e88-307d5cee0b8mr916334eec.2.1781010513200; Tue, 09 Jun 2026
 06:08:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608141439.182634-1-ojeda@kernel.org> <aigFQcq3JHtdpsIn@google.com>
 <aigKVysaNhloK9bS@google.com>
In-Reply-To: <aigKVysaNhloK9bS@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Jun 2026 15:08:20 +0200
X-Gm-Features: AVVi8Cek00Joj4d_aKKtisUpJJbp7iNWZsbX2BrV8CNc835UtTzoaEOV93gsH8o
Message-ID: <CANiq72=vsePio3EBdzbHA+kTHfPQyHyYmPGnkm1r8ktsCuPrqQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/19] `zerocopy` support
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Joshua Liebow-Feeser <joshlf@google.com>, 
	Jack Wrenn <jswrenn@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13679-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:aliceryhl@google.com,m:ojeda@kernel.org,m:gregkh@linuxfoundation.org,m:nathan@kernel.org,m:nsc@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:joshlf@google.com,m:jswrenn@google.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,google.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3622266071C

On Tue, Jun 9, 2026 at 2:43=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> > It's not clear to me if changing the uapi headers like this is even
> > allowed to begin with. It's a somewhat non-trivial change.

After our call I recalled the tool I was thinking about:

  scripts/check-uapi.sh
  Documentation/dev-tools/checkuapi.rst

It turns out it uses `abidiff` (abigail).

From a quick look, it seems to complain if I add explicit padding
where implicit padding was there before, i.e. as a "data member
insertion", even if the types etc. are the same.

However, for this change, i.e. when inside the `union`, it doesn't
seem to complain.

Cheers,
Miguel

