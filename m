Return-Path: <linux-kbuild+bounces-11976-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KO25IdVNuGlHbwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11976-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 19:37:09 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DC80329F1E9
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 19:37:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D12EB3059F3D
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 18:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91F0A3DFC65;
	Mon, 16 Mar 2026 18:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PgfOIo9N"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6515D3DEAF7
	for <linux-kbuild@vger.kernel.org>; Mon, 16 Mar 2026 18:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773686117; cv=pass; b=eyk8A4hxXpWo+Hqo921Bcfk/XitNFMnFO1Lu0NiiaGpprICmGJFRImdHzriZkwR2oWGpU8J+4CdY8JSDl7tcXEO8l6avr2FC/DOJRcGxUqp1Jbe6yjDERUaLJqM404/qo2A5t8n9bqhoCO3XR5+UOVCEVQYiEbdmNy5Gth30kCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773686117; c=relaxed/simple;
	bh=yrEyG7Zg1OKvNpdmfZ5HCplbeRQt/PTnHrM1O8AjF+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l6M7hz9dyibYK3tVZtDJEb+F+7hZTcaXOGZSkmvlhkXmCJYmo6NiZdLuxbVmwufQes7Uu1sTLF43WoCHqsdcoNY6X0l/Zqg1/qFrEvKan7Kv0yiIjSnUYkMmjn2DPJkDSrpacFzgG+iWTrWlsQ1g3yEZY4099pucthT+2IdxgaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PgfOIo9N; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2bd801b40dbso322531eec.0
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Mar 2026 11:35:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773686115; cv=none;
        d=google.com; s=arc-20240605;
        b=RehfvNj6sEGmhJhgv8ZIgsXUrZ8p3EeH/0Mg6Iy4sXnSRHCWlPqlQnB3Rwi4ZPNBg+
         5NErD4pA826nt/R8WWPMnEGq4mcGly8fRD0oR/dIv4J0MKzDnTYEgGMz+x221p3kTlTn
         tuMUNrkmpgd9odzArlW4M/4nAubRHf1seKmCAya+LonfjxvZ908oWMPWKdWq1nXZ+mDi
         HxiDx7yFyiqRQGefF3PJjwRV/VgLs88UFYeSgmQjpxe23WwmjbANPWWFO0NFb9IFtnLg
         ms4o6/oEvFgTi7vBh2rInjfJ06B5mP4MMU1AxihlizLHItFgr/KOBZKxALGL/CGc9R87
         lVkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yrEyG7Zg1OKvNpdmfZ5HCplbeRQt/PTnHrM1O8AjF+A=;
        fh=SJY7eJxWVu/S3YRut0/AG0pbQ/UvaYzQqZjhcOGvQRk=;
        b=cVjHqx8X++SG/uIZEeoU+C+iKcpsbI6OPyP8E14vW1O4A1W/dJEm1sqZrmti2pQfl7
         gjxPQ13jwnXpxxAblEJFqgnnaBvZG7ECNb9UxCstl8gYebWklm1FKMhBlFbQRe2f/bbq
         Szue8AMtzkH5hM5cWF0rYqC1yQtl3O6M85sF2eqRTlL8L/PAhbFAaLbIUXTaGLaEpLcu
         LSBJvjnE/UHukP3B4NvMjLbbtopUQi+Vs+vSE4nKOXAgIukF9OXbrLhkydcGH23KHLOS
         1gi2uYtk8bo3+7JHM4uj3+bqn+lnHC1S9oTnfiITc/8tpXKJdX1RNYmJ8aqPHfY7bBf9
         NSAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773686115; x=1774290915; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yrEyG7Zg1OKvNpdmfZ5HCplbeRQt/PTnHrM1O8AjF+A=;
        b=PgfOIo9NFTBVMF+ATh5Gcn6P4hUNo5p/NIQ+HKvLfpgNvw0yPfbZ3GFJ01Zeg6FjLk
         j7tayGKIl06vhTvH3cpLPDoSn1mIFOlAeR3cqSaKi23FtkYCHS+D5ny5LOazVTnaKK57
         YFVNHN2BwLAOGQMEUTyvd3mGQoj1PBv+PLiVA89Tx5kxxWDM1W6fB2ThMimkMog+uKA8
         dQs6yZg2Ma0MXMPoKQ6xlPUeyoUWJhFyKWqxJ7GyfptyvP0rOEEM51Z6NeEdWPI3oNA8
         5W7zg+tufKCm/1YICqQEt1g7iR5pielc5hxVmC/Xy3kDniH8e0PLEPB5ur3ZNuu+rDSM
         hazw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773686115; x=1774290915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yrEyG7Zg1OKvNpdmfZ5HCplbeRQt/PTnHrM1O8AjF+A=;
        b=Cuemn6Ni7m+T9oDXZ+KKn3TPorbIoatairFGaS4AOAPpjoqDSxlJQKM/9ZxM68mbrr
         9+mAYVfLEd6Aw8xjcBYFxdLEHQ9uRA/KTkK5R/8Mjkd/UUqQ5sQepWOBp+tUTHCQZcOq
         gvC11AVIIIC3EjD2xdbShRmH4/Sj/SKN1jEiQNDLqku84oAa+UAu2sOpTzagXB0Dy1T3
         /looUpoyEeDHBggozI23AjrlKTdjXIGwjNtjn77Z4NXE8Xf9/LQAQM9t3hDDA1IsYOuY
         n2ObpmmYCqw0ZNS6J+XO2TyEIdmdDU320cnvj5xX73GNsv4rqabknfUyl14FEfm8mMZJ
         oasg==
X-Forwarded-Encrypted: i=1; AJvYcCWZPMr7ENSPiOMNWwb1LOlWep4Eh2EgTFRp4hZha0ernpNdCCMSuA7yzpDVduPyYYp2J3wVuYnh+PdkL90=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeX6z+Sd8JCa3+gng2YO9SN3o8Q7Oef9RkAWMNNKg9uJ4qqOmi
	a1LY4wz6wM//ca6TwJY/xmpY5J5nCCOEUi4pVlu5IrWDTK+kVV5GZF+S0QBXjb8gPxCBL7ZHrkx
	5s02dc9mP95ebljnJI+tWcZfkhPZtros=
X-Gm-Gg: ATEYQzy8CWAHHzZ/oYCSZNx6Kie7Gmz72qYj/eFhBMpWkzIrNYQ2BEEjx+ibBn1muM7
	csXUekjUvsQMXw4GAlWyKRmO6Dkh8t+SRr4n9IYYuVxzg4fCytf9KErhCR8wj2fo8dzPtltzWK0
	Wf6EGc/HnSTgDdHMahy68FdU9B4SS8nssFKXRXFz3H3ZTudgZOpf4upthoeJsLg15ZewqTrAp0g
	0emQJ4VMQPlxOpcmmdGw938OHeLavPuyxcVoPTFjAEmexAJwQ09nK3q8ylOGQ72b4bSPcOHmEYe
	wAckbW2XAzMQSP1Uesx5xXhyAeO6ZoK4FZi8dGWd7ztM0b1JLpy/q7UfEMU0YqtvsC1BPxUR+dn
	1YYn/wutYhaj/imf51KQUfmc=
X-Received: by 2002:a05:7301:1924:b0:2bd:d8e6:90a0 with SMTP id
 5a478bee46e88-2bea555c8d0mr3576087eec.3.1773686115426; Mon, 16 Mar 2026
 11:35:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316150720.1646109-1-gary@kernel.org> <20260316150720.1646109-3-gary@kernel.org>
 <abg_C-X9LJ2vAoqq@yury>
In-Reply-To: <abg_C-X9LJ2vAoqq@yury>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 16 Mar 2026 19:35:02 +0100
X-Gm-Features: AaiRm53HxmxvP-1v_9tfeVjOFSQr5UVIZ0rfMH5rbuUhD5Ow6r9jfA3VP17Rl5w
Message-ID: <CANiq72meoQ4_b+Tq-NMLv7LzGJKV1oy6bXuriaOWSsQW0jv6MA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] rust: add `const_assert!` macro
To: Yury Norov <ynorov@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11976-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[garyguo.net,kernel.org,protonmail.com,google.com,umich.edu,nvidia.com,gmail.com,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: DC80329F1E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 6:34=E2=80=AFPM Yury Norov <ynorov@nvidia.com> wrot=
e:
>
> Same here. Miguel mentioned in the other thread that newer version of
> rust will make this list shorter, but once that didn't happen, let's
> follow rules?

It is not a hard limit, and there are a couple other nearby lines even
longer than this one. The new one will be 82 columns long (including
the addition here).

To be honest, I don't think it is worth making this patch series more
involved for a single line that will be temporary (or it may not even
happen depending on the order things land).

If we want to do it, then I would suggest doing it in another patch
(and likely in another patch series too).

Cheers,
Miguel

