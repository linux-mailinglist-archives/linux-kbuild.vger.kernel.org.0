Return-Path: <linux-kbuild+bounces-10416-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A835ECF1CBC
	for <lists+linux-kbuild@lfdr.de>; Mon, 05 Jan 2026 05:32:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A64B630042AE
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Jan 2026 04:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1C63322B67;
	Mon,  5 Jan 2026 04:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XNVa2boE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12223320A20
	for <linux-kbuild@vger.kernel.org>; Mon,  5 Jan 2026 04:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767587533; cv=none; b=lM450mOGSoDEg5t0M/+Esu4hXqg62+Nm+Sh7s1+zwRGCrUoXdmpoEAxwP/hN0kYHKLJ6BHVKVCGVAJhtgOhRlWlqGueig1w1AHh8UGq6v+W9SW4gzeQW8NzHZvaiz5cRsUBLDg288PQ/Kvh2+l1JnJSiCUTCFzS6XpQa2BbPDOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767587533; c=relaxed/simple;
	bh=e4mNUTVMd3pbP2gaHBEUKskV1yFr7MQyVaNr9q7Kg0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S0gl2X/0ULjINCk26MaanpNYB7nvYtFFjSJXsyHbxXVHi+xG87lMn4/ud+qln1pvwhgfZTw+2HKoPl7E5ECXlvn9SHxTzL9kKrl16CvppqDmDf/pSPGkiq1K/ROGxOXT2009f1hwuM55h7WyVnSyKnCgsKVhCjIhFx9KWzhihRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XNVa2boE; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-45a3145faddso263392b6e.2
        for <linux-kbuild@vger.kernel.org>; Sun, 04 Jan 2026 20:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767587508; x=1768192308; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=saUVAgEsyurYO5XeH99MQT53kwNGQ/V15cZ9Ga2UQbo=;
        b=XNVa2boEaVyUfuLdYZQSQoFnchNF8CXd9Hj64k7vvgQUFghYKAz8viM0i1Leq3/1wT
         mW3Xq9KmhI5JKBqx5+RI+iy/7tcuauIgImJvyzxNUfNPg8hKctEcQ4JIsavLE8Btqd8q
         oLSGZjzoZNjP1Pud9PgSHTMukEFRFiqODVMKJ869XR9wpPqhnhwF7aMcbGRssOKZQpfj
         fcJKZU4dsCFQ1lYrDlwtaonJdUC1QQcz31ZBj2J7Bxfoq9uRSjrXeUwHjqSDXLtWgwQK
         LGFOyEekChQAc7sRPdGHgJXVH/hUTtE7SyftSDPwkaMSGJJh70z9UQURtnO56imk2WTG
         BcYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767587509; x=1768192309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=saUVAgEsyurYO5XeH99MQT53kwNGQ/V15cZ9Ga2UQbo=;
        b=CdbKOFOjpNp/jHsjN0ZcuMFUsf/7/P18lpB3s9X3PopVBww871xTUk8Pyz/tH5Z8gJ
         RX/YC7WuY2OvSfcfNy9lhbkKq/1+JTb3ERgTICJ8tEz7v3upnQA0HI9Lf1sqoetNacuO
         qmlTKlmH0oyDtDxcqh15J3hpVzcyo0zMALbc/uSLCdU+eXLipmAPAH56vKKHMHfhPisL
         wonamLZsCvgdY3FztYgqnUugSlSI4HaYcdPmkCASYPSGt8/0M40p1wT45emTsfuynDJu
         v0/y4zUNKbNHRYpLx9WiBleKsGN6CE6TS7XmAjMzT/0am5canRCPaFS18tzj80xzjElq
         LzvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKfV3WRwrc0QOeaz2B/JrO+jDNScdMFR12D9UwRGQiuclGIBO06utGtkisBg08X3JK6d+JlJsjXWZ+Zq8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJEVl4vsD8AH4zfLCM3uibZvciKOnCbvXrVl+KOdD7zawGr2aE
	PS6cYDMoW0mbxyiJwqm0I01wRfDqVb2dzQjUxr2IasN5SzqUm0KCbgs/JzX8k+7kUfexhhuCqDu
	ZEQbjQfxRtQh8lhId4ymkLVILGIHSLyo=
X-Gm-Gg: AY/fxX709f+Jmc9ED3lAbIdKhV2CSCca2d61ZdlGuvcnw0GPOhfJQVhjn6DAX/0m2po
	B0tZuTn21UphwLDUkRKJ1KmFLyHLq+3qJ+d6Tw79s4sfby/ciFdz7nwzh3Xg0K7MQla2zrOQyDa
	kdybcGIfK87Q9+hp+AaMkEldZNi8r5/SeOwt3SY2fUQoTeCDJWAoLOIN3ujWuQUjI3bwPm6R8m7
	E6j/Aws50jFrC7FuwQ0EpnTwo7ZVgbqisFjy4v3RRTHX9lCjeSO3lb/lgNroh71LOcc9Lo=
X-Google-Smtp-Source: AGHT+IEBOFNjMVIcp+sMlVXjYpjBEZMMFX7+jPvUPM5+krXxGK7by8/Odk0UZPWbo60zUg8SgiWi2xJdtgeEwAt0Zqo=
X-Received: by 2002:a4a:b789:0:b0:659:9a49:8e58 with SMTP id
 006d021491bc7-65d0eaa85cfmr13980797eaf.40.1767587508671; Sun, 04 Jan 2026
 20:31:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124151837.2184382-1-ojeda@kernel.org> <20251124151837.2184382-20-ojeda@kernel.org>
 <CAJ-ks9kSFp8CpyNr8zSKh6mniuXiYNrZCc8FC-8Z81GdbnaRog@mail.gmail.com>
In-Reply-To: <CAJ-ks9kSFp8CpyNr8zSKh6mniuXiYNrZCc8FC-8Z81GdbnaRog@mail.gmail.com>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Mon, 5 Jan 2026 13:31:37 +0900
X-Gm-Features: AQt7F2qrKlVRmg6Qt0U99y98HY5qajxFqWZs4J8w3JjjhlpBLoCv1Y_qfJM799o
Message-ID: <CA+tqQ4Kiypr8hZ8d9zRgjkoTDaXcszEm6U3k_OoJL=mhGd_kgw@mail.gmail.com>
Subject: Re: [PATCH v2 19/20] rust: syn: enable support in kbuild
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 5, 2026 at 8:17=E2=80=AFAM Tamir Duberstein <tamird@gmail.com> =
wrote:
> On Mon, Nov 24, 2025 at 10:25=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> =
wrote:
[...]
> > diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_=
analyzer.py
> > index 4faf153ed2ee..5b6f7b8d6918 100755
> > --- a/scripts/generate_rust_analyzer.py
> > +++ b/scripts/generate_rust_analyzer.py
> > @@ -100,6 +100,13 @@ def generate_crates(srctree, objtree, sysroot_src,=
 external_src, cfgs, core_edit
> >          cfg=3Dcrates_cfgs["quote"],
> >      )
> >
> > +    append_crate(
> > +        "syn",
> > +        srctree / "rust" / "syn" / "lib.rs",
> > +        ["proc_macro", "proc_macro2", "quote"],
> > +        cfg=3Dcrates_cfgs["syn"],
> > +    )
>
> I think we need to add "std" here -- without it, navigating to methods
> on e.g. Vec items defined in syn doesn't work (it does work with "std"
> added).

This was handled in [1], but hasn't landed yet, probably due to lack of
Reviewed-by or Tested-by tags. If anyone has a moment to take a look
and provide some tags, it would be appreciated!

[1] https://lore.kernel.org/rust-for-linux/6dbdf6e1c1639ae381ca9ab7041f8472=
8ffa2267.1764062688.git.y.j3ms.n@gmail.com/

Best regards,
Jesung

