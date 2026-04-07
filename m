Return-Path: <linux-kbuild+bounces-12704-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBOWI1rC1GmWwwcAu9opvQ
	(envelope-from <linux-kbuild+bounces-12704-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Apr 2026 10:37:46 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EACFB3AB702
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Apr 2026 10:37:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6477300737B
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Apr 2026 08:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E16C53382E8;
	Tue,  7 Apr 2026 08:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J3z1KvP+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F6316FF37
	for <linux-kbuild@vger.kernel.org>; Tue,  7 Apr 2026 08:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775551063; cv=pass; b=XjWFeAen7SI39/r4AJL2/Bg8mPSBP/k3mmCRwfezY+gI9qha6rx1Iz/XrBB+x0v6JR+KdIlaITw4LrsnwgmRrlW6idXQ+rKNgiSd4WcxPqVi0i9cVQVpCjYZ2yRBX/SLCvM9We8TbC93OBPSRPZxen+QER3EsaMwtTxYr+NcuKM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775551063; c=relaxed/simple;
	bh=DfoJvrhbR9/q+l6t1NPKmCnTz4p/S80iMM1QrEsDKz8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tJtVlKTJnfHFhY8oCtHtDb+sNOhtwNqod9J8FCk/zuebDCuV2s3HBW2Yc1EKqBI6OrHKmAjVo7o4CnEfw5teSvMfd7L4KK+B7cdCk+OXxXGhb8SHvH9jBvGwAACz21ShOSSfjciJoD7UZSR1iUm+CnHlE27Kcz/NLo8jV2n8Vjg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J3z1KvP+; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2cbc50e6a36so303652eec.3
        for <linux-kbuild@vger.kernel.org>; Tue, 07 Apr 2026 01:37:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775551062; cv=none;
        d=google.com; s=arc-20240605;
        b=VPlGjth5x80LKi3sxVhKg+WriHGOgPnXEpQeyQYM/IdEt9fgp9AHpol93T2W7I/ALZ
         dGwiz/vk6mLQ+8R1yAiyeWR2MKEiUxhv5uVkbdhLyhbU9XAXxin6Uzb+hi0YXcEmDY/J
         hQPIqWJPbF0VlAemYe3Q/uW7eWLJcWpZsrf3WxsUvnrQjJAMMxFcozKnfAL87MLpxMrC
         IY8XaI0SJBoxgZzQa7fGHwKV61NkBjQQr5mnrcs5vRGvNBC/olc9m5S10JDPSkGQXDMu
         /e3TepUD0lCyxhtszvRifWUPY1sFz+WVHqkLJs5S2Vt0eXNaq5SdeUUeRaWWtG4xrDW4
         L9+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gy0ttEzqHnoPOGT+UhllrpZ7VKqpJE2isFAosOgHjU4=;
        fh=iZSzQj+u8vYOnkE0YyQp2x8CS3tixv82uWAWMsA8mnE=;
        b=ln4XK3J1uWy0IMEfKFL8/RI132EQTznqsiB3ds8Vhuzr4heqYYm18XiqdR8aRHiuAx
         u3G/moBpgNMrV4PBoNhORU8FFolmQbdts8pk6EHMQtSMjyVCmyZhN8L8/Gw1D2aYG3E3
         ayuRa1CC4nDpDRZY3FEWfN9Ltbg7MNauTlMz222fIBwDE8RNHhHaHkNgc+/NRF9rClkU
         GW1rILHo2bxMmvYFZmConatVssuyJVbHXRdACRmOmouBLIahR80xBSZVOaxhye/ZyKqr
         LGsbxd9BhnGXVWVuL6iw7D5Q/SNTueQam7G+5yPtw/Ryy7/s69EwyNu6+hTrzIHnJKwS
         xuAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775551062; x=1776155862; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gy0ttEzqHnoPOGT+UhllrpZ7VKqpJE2isFAosOgHjU4=;
        b=J3z1KvP+plrGKYzfUZxtf/Bl93B77UKY7gFXsyg9lnqxQ4lQpfxmrO/IB5Px3zGq8Y
         T+ZNMjJOGcwSbne9t7HmvyK+WzEILe6jT47dIgUyQroNzuY5E93stOPdry4ZVUtk9/Mj
         uCAnMJBY2kCC1pDtB944IjpdTYL7Dw14pNtV8Ld2+V/Kw1cfslaHZ9lkRz3LBrdwG4do
         w4WtY8nQOW774nVjEpKk1UANFMtl8yH6x4HXidfLM6t7tWbCmmWloXHVosYKF+11CYP2
         iQCEiotKrSjXa8syLxVf4uq01IEtVMo+J6nrYj1OKJg0gqWqB7QijeFrErZcJdAywsPK
         k/xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775551062; x=1776155862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gy0ttEzqHnoPOGT+UhllrpZ7VKqpJE2isFAosOgHjU4=;
        b=JyNiZHbWk90pUIVqAlUsglHK+kgcvvnX8CDUoRKxlz8fzsGhNNfr9oQ3hwqLAoGoTC
         ZQHiGRrBKMkhAYpU2P3vsTeFQJvRaE8N4OKzvs1SsIggCp28oGcme/X0VktiOBGH/cHr
         BeetgZ1f0pQfPTztMBxKocxaxxiVHj96maVBPhXMmWCQPeLf/Giis+5gf3zJuq0NI3Xk
         iJvdJSV+ou0gTn2VGtljkqqrnOCWxgAGLWM+zITpXIMxZEUkpNcxVb2qHaIHgHG+9V2D
         cLlZA+hQ15kYLab/XonOVdGhliHEDHuuqkgr7nm65bJ0Vm87qXuYZlA1vpbWrDZTWSNC
         eBoA==
X-Forwarded-Encrypted: i=1; AJvYcCX37Uz7bP7D3eaOUUzXqP9WGHjz3Wd4iMw0kMq9eStwSAtFssr6KTRRh35iZrmQr7wVajd51OThRVTlDLU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp8b+HNZgRuQGhK0XLbGDz0lC8f4GaFSvTk6JLYl0B9kZLEo8Q
	paqg7MzEDGRqJvTkYAfp9jacTFRiQwwI9okpLLvfxDns8zI7q70Sj+fv3tLfLpPGX7nENgp1Pai
	D7F09LRjKQoIxnz/dxgSeSK/+y0+3DQY=
X-Gm-Gg: AeBDievCsh59P9w1bRGy7mszcNi8I49KRjmKikX41V6faIzbRQCAZQmfwkQ5SqA9MM0
	XZ7+P9ZJVHomyoSl1fgZ/UYJ7RoOy32t3D+UJnUqLKc7mzBiycDOGKcaGkcE9T7eWKvakrt2F0t
	t52hDj3aCDckB+AqtENHVjFsUY+ZRudn7UCRNitKuK0ETwvCUH7ikYRMKfuv4RMjbmebMDs22dM
	5/FhJsoc9ciJ1tCDh7/Jm5PPUdTwzwbubTzhfBxG5m/PX9IpLnxRVc89PIyt8ylAUrqb1mvhprX
	Ti2DbF7aVdGt4tWzixRtqBnxvVIF3ozLMAAITV0KUK5t4SLfU5ScsWTe0+ApHE7ALaQA18xi9uK
	G32JAKNReJoejLxUY5qriYR0=
X-Received: by 2002:a05:7301:d1b:b0:2bd:db75:c28b with SMTP id
 5a478bee46e88-2cbfcd54f9bmr3830933eec.7.1775551061539; Tue, 07 Apr 2026
 01:37:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260405235309.418950-1-ojeda@kernel.org> <20260405235309.418950-8-ojeda@kernel.org>
 <177548573697.95472.13544191227699996309.b4-review@b4> <CANiq72ne_JYPodnROckyNto10ZF0PqadRxSrng5-mZyqVovxFg@mail.gmail.com>
 <CAJ-ks9kbHz_KYAXx02vgW1dN2pfb5MFoaSoU1HbJbJg2O8EUaw@mail.gmail.com>
In-Reply-To: <CAJ-ks9kbHz_KYAXx02vgW1dN2pfb5MFoaSoU1HbJbJg2O8EUaw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 7 Apr 2026 10:37:28 +0200
X-Gm-Features: AQROBzD3OQzI1eA28hVCCiGMvz4r5THmhHuU5dUr3xJV-N5wbeOjrOxDF8RLuuQ
Message-ID: <CANiq72mJTT7xFnhm-CeOZM_3ZwGdaQ8F2zUbONpPbqJ8g7DokQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/33] rust: allow globally `clippy::incompatible_msrv`
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,dabbelt.com,eecs.berkeley.edu,nvidia.com,gmail.com,ffwll.ch,linux.dev,davidgow.net,linuxfoundation.org,android.com,brauner.io,google.com,lwn.net,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-12704-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: EACFB3AB702
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 6, 2026 at 5:31=E2=80=AFPM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> You're welcome! Actually it seems the lint was already improved
> upstream, starting with 1.90.0.
>
> Link: https://github.com/rust-lang/rust-clippy/commit/c0dc3b61 [0]

Indeed, I had the PR linked in
https://github.com/Rust-for-Linux/linux/issues/349, and it is nicer,
but it would still fire in a case like this patch :(

So we could conditionally enable it for Rust >=3D 1.90.0 now that we
have support for that (and allow locally some cases like this one when
they pop up), but it is still simpler to just ignore it (especially
since it can be quite confusing for other developers to see it
triggering).

I think we may want to eventually re-enable it when we use no unstable
language features.

Added:

    [ In addition, the lint fired without taking into account the features
      that have been enabled in a crate [2]. While this was improved in Rus=
t
      1.90.0 [3], it would still fire in a case like this patch. ]

Thanks!

Cheers,
Miguel

