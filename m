Return-Path: <linux-kbuild+bounces-12974-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCGBOWPH9GmPEgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12974-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 01 May 2026 17:31:47 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F7C4AD905
	for <lists+linux-kbuild@lfdr.de>; Fri, 01 May 2026 17:31:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5D283018AFF
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 May 2026 15:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C44543CFF41;
	Fri,  1 May 2026 15:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="stKeNSxY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760FF301472
	for <linux-kbuild@vger.kernel.org>; Fri,  1 May 2026 15:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649504; cv=pass; b=oaoNrS/L1970I9Ltn/WdNvBKA4OdQiPSvQpYS6yY2O8NAYlUpJ1cUg/esYYCN3uMVzPfabEaKfSaOpU6zpuDSNGlLhpGdXr1EzNEzqmB5zVdbNQl4oABRzt4efkM+S30m7qwYglcEt+mVd46orjjRo/F0/MUHe0WqfI1buXWb0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649504; c=relaxed/simple;
	bh=LQm9FlebjcspKv6fTqA1mawXQMaJDUpiIXw8pb4GJnQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nu08IrM527gsgKeE78m+3AspTbnLqd7POC/7ySV3zX7hti0pejRqbWBAbSooNkp8UBeHhQWE09mpiBB/BiPmNYA+KGBue4If3SpFLYJqqnAGIdd+7I9sxYHuKUywrKy8Pp8rrcEfYF1U4sY73Ep2JcZvwP9o0Ld8NeQs35GAzxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=stKeNSxY; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2e92c54ba73so215923eec.2
        for <linux-kbuild@vger.kernel.org>; Fri, 01 May 2026 08:31:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777649503; cv=none;
        d=google.com; s=arc-20240605;
        b=f6lFKZ7RG+UFUl+wyMJ5gA0AJrcKZ+e3IdG1aATeiJMUlZhQ8DPSkEtqM+HvD+7S2E
         k3CBaaUlqSaFCVDXpiJnVuLUIjNxFNMDrAPBmcClwH8MTGc5HXZtz8SFVzcuVS2RGFuW
         BdlZM+caCa32CcsmYR17o59sTe11xjl7BD78KyJgmMincHMF2L9UZBK1nt0D1Cr6YV1T
         Y2k/Z4HKzWn+IO0vxkOzlWbPClR3FnB8X7UjXre9LlaY2N3RqMl9wLOO1/jLR6fzgDYr
         ZsFr/f5TarCF8oH4fSj5jFcnKFywm7utqBNkKZ1bUgBlRJGwYpudfRYuHkUud3YJlI6x
         qhhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LQm9FlebjcspKv6fTqA1mawXQMaJDUpiIXw8pb4GJnQ=;
        fh=69PDTg4n71+dxHWyFNf4HpfNuGuF8WW3u77L9gAf6FQ=;
        b=GDhVRuSXtkS/cILAPYqXcXde8nGzH4OXW3gfzuYH3CwZOgdVznufhkyCUFuvZfH9w0
         4ZLcSeT8ueo/i1RIz1BH9G2HIhl5bS0N8thx8pFpnkOPEJGbaCnM2UvaI6q7Tz7Louad
         8N6p81o4MJxCnwc4eHB40NB94aPODxAAmyZ9UGgME0m0qqMPJLzlf0Kl8o9BtZuL8Alj
         EhFaEMTA6qLU1vAZcvWCjU+Yl2QsPlm9zIKGJK+QtbuiYE4G60Vj2aduIt82J6JR8inY
         1AIQ3jiliMKtatUjonGNv2XFATvFQ08uUaH3YdOznK+hO74DaWqGDDFZ9VqmmffjrFLf
         KiWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777649503; x=1778254303; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LQm9FlebjcspKv6fTqA1mawXQMaJDUpiIXw8pb4GJnQ=;
        b=stKeNSxYCBOGjcBcEzN2Bqa40l2FTFHB+8U1np6POVtUUYiiZ1YZvYfYY6V5R9NEB7
         /G0z24ahPq4XwqpkRCn1JCJN71GaPrcTLgBwNJ8XW+gnyMuSZH/Yw/o7pl0cO8EARarf
         kXgmcXVMDU0k0eCRj7q+Gbhj5be815ji6gpXYba6C6Nw4GvQdrgBfDJkMFxfEizfWooj
         MFMd+udaH5fPR5e81ZmkeItnq97/EwcPyn2d/hyFiLYrzKq63BiZViaKOjw0QwBXSeN+
         7ThOWqasftZhb9SZPvYB2TUeKAxCh8yWuDri381RlU4sm2ZaXX9vCHxhXWry3Qfj9hPA
         wisw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777649503; x=1778254303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LQm9FlebjcspKv6fTqA1mawXQMaJDUpiIXw8pb4GJnQ=;
        b=g5DS3kIjaQfzKUE/ciWcOAoHUcyxuROMcJduTh5ixAHQ2mo8tVbzAUBTlz3/5ACISx
         pMYVzUM4Enj+/Ikyrrh0TBiNkdAS231YRy+R4t22zI3nGcagqfqny0dDMjCzuyp1K65k
         3ehbll9XDpiMTPdaO6lJEa/X8qwT9hbt+ibUVWpwayHPzMqOvB6U9UovuImLLputhUbm
         Rzpu+azXGC6W+fn1MUK2MlAfimWCJXEOyX1iYSWnxMdXjdYaU9glnbQ3skXq3cDqRwhw
         pCnJoprCCnsmTC0ZJUDFDGiWii2FE78i1+JoclvwQUZRI3g6TzOwvNtmOHW4Nxc71huh
         Uw7w==
X-Forwarded-Encrypted: i=1; AFNElJ9H87S8j8/IgYqb8gxDKlPWJerd8iyUpQvPuSt7FYqOk0sLR064qvjBa3RGy0J9nNmcMShqk13d+LBEGCM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs4ohWpSOCiumcMw8lNnEKI7v7udsc2OoUEVaGRj6pmR3gybnI
	8PPLjUbwP5VutQ2EXHJfeKiMlrWZGIgPcE/XQWSyc0ZURH6CMx7q2CEDy6LmErEoNHIButllRAy
	HLWGt1Zmx4gtkabNXBgVJ9neOfLD2UYA=
X-Gm-Gg: AeBDieuQKpKQjkx2MvYFptyO02z9jyQrqgF6yVsjlmUSkGi3K9Un+1oT8278uIKfRmh
	BXvcZGGDEpXAfGZijhLUNvKgNJd+bCbqRCo+JRmkNyZMIf5/e9MwDdak7wJJTzkDU+gOxojrxdn
	0+KPmVNklcWnzVHfK/WkMENuUiTA0JhBwhKdnsPAr8BCQr1mjQKIDRVsBG89BJIXQMfYUHNOVRD
	kmzAj2Wo4c7vn/i/9Y57BbChfmq45zbw4XAa4D0XNe4ohTSauyjE/ptXlL6EPUOezmbFnStjzdg
	eZmxTo0RWoc/TtPwIgCE9Mn2WylL5oB6eV8xNg0/4nkBTV4dUMyqFyxRYOpSml27YPOTozQzRXT
	paK20i7HRlpZ6vlmvFE5jjWlvMWDynHk+2A==
X-Received: by 2002:a05:7301:4190:b0:2d9:6373:ace6 with SMTP id
 5a478bee46e88-2ed3ea69fb9mr1648901eec.5.1777649502468; Fri, 01 May 2026
 08:31:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430-nova-exports-v1-0-7ca31664e983@nvidia.com>
 <20260430-nova-exports-v1-2-7ca31664e983@nvidia.com> <DI7CZA3ISGOE.1CP5YEM3NNSH6@garyguo.net>
In-Reply-To: <DI7CZA3ISGOE.1CP5YEM3NNSH6@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 1 May 2026 17:31:29 +0200
X-Gm-Features: AVHnY4KtSS48VYj6LcLMSfxEHj79WIZaC9QZG7nspbiebeuoKBEVWk4DqsY8Ue8
Message-ID: <CANiq72ncENCdGCjiC04Yup4i4jbY7S=k62fiT1RtQAYT=5wfzQ@mail.gmail.com>
Subject: Re: [PATCH 2/7] scripts: modpost: increase buf_printf's buffer size
To: Gary Guo <gary@garyguo.net>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 47F7C4AD905
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12974-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[nvidia.com,kernel.org,protonmail.com,google.com,umich.edu,gmail.com,ffwll.ch,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]

On Fri, May 1, 2026 at 3:02=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> The only case that I've been hit with very long symbol names so far is do=
c tests.

Yeah, nowadays where I have seen them are doctests too, in particular
for UML debug builds.

Cheers,
Miguel

