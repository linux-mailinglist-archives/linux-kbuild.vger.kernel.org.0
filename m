Return-Path: <linux-kbuild+bounces-9745-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EAAC780D1
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Nov 2025 10:08:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C7376361BDC
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Nov 2025 09:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06CE833EAEF;
	Fri, 21 Nov 2025 09:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mQuvCI1H"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574B8338930
	for <linux-kbuild@vger.kernel.org>; Fri, 21 Nov 2025 09:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763716093; cv=none; b=jZ01KSD8deSQyQVCwWokB92BJSjlS2KVv9ZS6ngjUnoN5VTjOJy0TgQ/5/ac9rQ9RpI8PXlwfQzPDnSyRtvJD+VxD31XU2Qv7d+RgR+uDzbTHk1I+ls53Kn3NC0luGskr++rN3Oup/kaXBIpxa0hSXGZYlDdlFq/FtjJDiZmYLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763716093; c=relaxed/simple;
	bh=/VgZi4aX+4bGSV/xhVlE1Vq10NnhANLOSDD25ABY3d8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wlmxkx019w7juMul9jhbVLm6wvNPy5vzqxC0gXRTPjddqlHGUyTb7ymQxXr95hAJO9AIgxG/eBaTitotmlxPn+2takfzlCxN079EE5nIyeg+KNrBJSqVMDpa1FtX7VjpQUrEOi3+b3esgNvyoEDpaWxCNjw7CL+pyPacBzsAeB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mQuvCI1H; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-43380a6fe8cso9737965ab.0
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Nov 2025 01:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763716091; x=1764320891; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ETrr3JCzkruiiBfVI5YFLmlwzMZJrfA36kDNRDzkq0c=;
        b=mQuvCI1HNPLnjfN0hFH5LrSsTWQWw6H33frfD92SaDwzG/zHtYDNi+tuXNSHpgMd4r
         1yiAXRaJzUFgvFOB8KGelpTh8rXlcVWzU+WVpn+K7zKTLYv+epIyoiCsYwBhaSL5VAjV
         LR/lyS/6+iChkEM2YrB6X1pu3hrweblZnCZXhFNyk16rD2YiVw5lPbtSPdq7RVu6JZcx
         QODldobajLkDF5gjjuLUi5WKtmqTSQ8gXACKdnt3dV6n6XZOPmQX9Zvya5xG97pSxDnt
         A0n2hvbd6w9wTmm5LtTJalxH8NGydxOlQSgfaGRHG2XTX7gIf9Mhy0Ip5YSDVEIRKXfl
         sFwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763716091; x=1764320891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ETrr3JCzkruiiBfVI5YFLmlwzMZJrfA36kDNRDzkq0c=;
        b=AAh4kWItx5to0gEXb2UcNUxmmYyTu+SZKdtq22B3nkzANo/HwkzlTYutYYGurt1dU4
         dmAysZB7DRW9rm/nQBG4Au7xK8gyGjP3sZM4j+a9pM8P1IxJTv/JObWzOqIQou4OJNbT
         A2VH0GFYy7t0xtPPtNBtPBj0scxRshbYHlGsybV13px7m0cDFag0BUxDvVhB7Mj07v2K
         sfiK7AYoIMN26Up09jaCOQ3klNhKIUqkDHHWkCoOamb9iEdiAS3bwsJrVqMgT5nJk8i8
         YQCi67dh7IqQRBKd6k0E+Jl34nqO0glkvfzjUUCpepQArSRUdsQakLnocGGZRZLYwGwy
         D2Bw==
X-Forwarded-Encrypted: i=1; AJvYcCW2Sd28wf5u0/XyzcBoNYYSl/NECZEwrmionKlJm8yXAk1wuh/IIrGV03l9p9VocEFHFLM62dVtTVRLTI8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzA3KUlrzFLJCfy34VE1rIb0dIIshd8dtwaxqNvAHPvI/XHARKN
	1V7htO9rNPbE+pc2FKU37FWLzIdG8f1CZy65/DhZWeGQSt2OhGUxMIhvtM2BJCUzbxYhi6ur/nP
	UuWYZ+Ptu4EklT1NZcucY2lG24zkJ6tY=
X-Gm-Gg: ASbGncvPF1EqXHK/KTAHOLfMcBJqHWG9hy7OZFZGolJ5SzSdSReiCrz5nybutP00HPc
	4pUnYzH+VXivBecoPE/oXkKEEbCxvdZUlsFNyaJUQ9bxkJHNnCFjxBfU5mKH4J8lL6A08F8Fcd0
	+P3jYuMilrsJb5YRinK7jHKSW7Tr5C1HO19y3d+rLQF2OSqOHz2A+SejZ18x5Hc2qhQXlndcwNd
	VjQRG00BYHrRA3OuvQYUsbx5PHTsYyB/XC6M3VxbBCgxFPT6XL8DRWKioxkIeB3pLEefwBTXKt3
	qxHYEf6V3y/FRg==
X-Google-Smtp-Source: AGHT+IG/3To+AMr2oK2HFxlz92e3h2/vQsBM/+3FjkkwwtK3YTD77aA+5Xb7tvgJBid47+5SozvZZbOCBcUhC9NITZU=
X-Received: by 2002:a05:6e02:3499:b0:433:2a9b:165c with SMTP id
 e9e14a558f8ab-435b8e51411mr12950455ab.27.1763716091414; Fri, 21 Nov 2025
 01:08:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251121043750.298843-1-y.j3ms.n@gmail.com> <20251121053633.1594703-1-ojeda@kernel.org>
In-Reply-To: <20251121053633.1594703-1-ojeda@kernel.org>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Fri, 21 Nov 2025 18:08:00 +0900
X-Gm-Features: AWmQ_bkKRpQOmfQwxZhx7gcZHJiLyZriJu20U1pwBRC8eMsopftfFbaK_bzrDgM
Message-ID: <CA+tqQ4LX2ihwY11VJk3LNNE-STsONJWF0rdDa0Pq09oA7YRXEw@mail.gmail.com>
Subject: Re: [PATCH 00/18] `syn` support
To: Miguel Ojeda <ojeda@kernel.org>
Cc: a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com, 
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, 
	gary@garyguo.net, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lossin@kernel.org, nathan@kernel.org, nicolas@fjasle.eu, 
	patches@lists.linux.dev, rust-for-linux@vger.kernel.org, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 2:36=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
> For using (all of) them from `macros`, you would need [1].

Now everything compiles. Thanks!

By the way, I needed to make a small change to
`generate_rust_analyzer.py` for rust-analyzer to correctly reference
symbols from the vendored crates:

diff --git a/scripts/generate_rust_analyzer.py
b/scripts/generate_rust_analyzer.py
index 5b6f7b8d6918..147d0cc94068 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -110,7 +110,7 @@ def generate_crates(srctree, objtree, sysroot_src,
external_src, cfgs, core_edit
     append_crate(
         "macros",
         srctree / "rust" / "macros" / "lib.rs",
-        ["std", "proc_macro"],
+        ["std", "proc_macro", "proc_macro2", "quote", "syn"],
         is_proc_macro=3DTrue,
     )

This might already be covered somewhere else, but I'm bringing it up
just in case.

Best Regards,
Jesung

