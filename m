Return-Path: <linux-kbuild+bounces-9449-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41965C424D3
	for <lists+linux-kbuild@lfdr.de>; Sat, 08 Nov 2025 03:31:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E91BE18921F2
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Nov 2025 02:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B745923EA9E;
	Sat,  8 Nov 2025 02:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TZkXb17V"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237A513E41A
	for <linux-kbuild@vger.kernel.org>; Sat,  8 Nov 2025 02:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762569073; cv=none; b=OHnUa0eNWIBTi73BoUYhAvTfPJk7hu4yv14lAo0fgUx7jNEBF/c8UKC598Vure4Hen3kqrocpuCfe3xOBtiIiaoBPIQue4N1zSo3f1jaxl233l2TbHdqhYcNiQweAzJI5oBcatlm+hlp9BX5uYql+o6W1JvGMoW7PhF3CPogg6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762569073; c=relaxed/simple;
	bh=hEsds1aJcMa/MFnGEl+oWU8IGfV52JAmFi/ogcjALRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WJCFrEpyIhnmc7ohSKK78nFRoKGjwiCoBgB8luXZ408/9NmcfN1AsCkPfOUQd03iEaZRIZyXb2jwYGERAXUAX63Rgb72ZzKDbxBu3wXk5VyEfd/8ovTqZ1TIAQhE4WoIV88nLgXOGkSlYDlZlDBosPBeQrfxRWnP7fd7/GCi9wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TZkXb17V; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-343610f3990so153745a91.3
        for <linux-kbuild@vger.kernel.org>; Fri, 07 Nov 2025 18:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762569071; x=1763173871; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Ywt5KnXkAWuPtF4O67B6+CrKeKvSZlIbIOBaVjdLrc=;
        b=TZkXb17VDXSi/hdNX1nnsUIBUikCDSDYabE2oBnc3ou2BnHl91qhrr8ryuMls+eW4+
         iBXg+fLjOHRcvN1gpg3FLTPwA+TPMNItQ5PAdWwL6eO/+P80WsaqPG5lW0A/6WkRSK6i
         G0uqVqIw0XwaQyN+EFtNoxWqKoEq2gH6qLe/3FqLdOVnIU2YOKl9HUQ4qvaE3EYaoNvg
         BJUKoX6qqzMmXobdQdas2gzy6c/RVHzxcq5XErBAC1g3FACKOP14RVuGsm23EvyndIyz
         d6LBl2nTzq/foUEHxJLTbB6OLk2HIPjAbMBL7I6bc9mns0h52vgFl8rCnvytZPYOcoji
         X3+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762569071; x=1763173871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4Ywt5KnXkAWuPtF4O67B6+CrKeKvSZlIbIOBaVjdLrc=;
        b=e/civHAq36IsbIzN0ck8oKzsXgPFMoqBKPPWemkzQho28PwinppwDCUl+kAQVKHjKM
         Eft7xthrbPkXU3dEnLscWw1Kwq5VbOsqb/TqJhfB/wj6s2bgggRZdiXHppLzzEnn/Tr6
         HM61H9GXsnwcdfcf5LGiOh96zZxTv3z+teXvMy2ckHlt20Tqnt1oNhAFRL8KS0I0wYR4
         uL1zdvKIZbTte7hWYQjiD1P27n9CBQqbWVNK7InsJuDG5zqdBDZ72HuICliDhywDZnOQ
         d24tRkbGhA2Gi7vAROE3YwkfXFZVHB80xh4IqjEhqVogA0Q97v6TeKpNo6llYZGuZp3+
         8UzA==
X-Forwarded-Encrypted: i=1; AJvYcCWXYxrMi9Pbyc4gr7uWWgBTkT0379nKHt7Jkm+iiq3+q25E+8yFemObAiamu1o1FiDuyMEOSp0kSh46LEM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCvwBeqebbPwxHsRUWGrjUVDCTLblAU42yb816mYD/BwNCHIu5
	M3FErbrxBIQW5VK5XstFFgNmKL+kHuVroszEBmrZd4BYW37L2U9GuNXIYf1dMpy53+grC2S/AYH
	wDxLDIiOwZD63Mse6I6ODaVAAVjk+lv8=
X-Gm-Gg: ASbGncv6wtZg2Xx8t5pYEMwGSq5EG4bteYGQ75DcuJLLIOjVjG721ODxjC06stF3bH3
	NzV7DZ6ouEn0mROSPOijVRi5MKGKwbRE6UpdO8WJS1T+p1XKJT1VilO+jkzXs/Xu9KlJESB4kmJ
	jzBX3DxZ+u+4Jqy9mVEJAXbgAg9em53Xa1ehIDF610NHnEdv0Dgzwcyzjjn7eCwO/bTTqmyPvG3
	Cklx28yS9B8E3tgS7Hc5L9e8bYO6YE/tB4i+LaLT0vZRpjACJzQNOrPHvMeegdOJ5vOdqobaBoq
	+CS3G6dKIphGJmlpiCB4Z+TjBTi8YtQU8CLJgFB58fvbWnfxXDRfX7uyTs73ebq/SaIHSLOzT5+
	Hi/M=
X-Google-Smtp-Source: AGHT+IEPt/zum4mIPzur6pOWm9ugmaOB4ZnZwdF37jH/QJbMUq5i1HmGSC61s/z25m7jSEylTziMZI9njr8XmEb4iEk=
X-Received: by 2002:a17:903:ace:b0:297:e67f:cd5 with SMTP id
 d9443c01a7336-297e67f0dc3mr6100935ad.7.1762569071389; Fri, 07 Nov 2025
 18:31:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251108014246.689509-1-ojeda@kernel.org>
In-Reply-To: <20251108014246.689509-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 8 Nov 2025 03:30:57 +0100
X-Gm-Features: AWmQ_bntWx41R6dVeerjev8Ne9qVeKQ30TdFKSebUZNEnjznMYZ4D9bO5nuNd7o
Message-ID: <CANiq72nKC5r24VHAp9oUPR1HVPqT+=0ab9N0w6GqTF-kJOeiSw@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: skip gendwarfksyms in `bindings.o` for Rust
 >= 1.91.0
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org, 
	Haiyue Wang <haiyuewa@163.com>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 8, 2025 at 2:44=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> note that `CLIPPY=3D1` does not reproduce it

And obviously this means we have to special case this one too...

    $(obj)/bindings.o: private skip_gendwarfksyms :=3D $(if $(call
rustc-min-version,109100),$(if $(KBUILD_CLIPPY),,1))

There may be other cases that disable the optimization or similar,
plus we may have other small crates in the future that could also
suffer from this, so it may be best to simply force to generate the
DWARF with a dummy symbol from that crate for the time being as the
fix:

    #[expect(unused)]
    static DUMMY_SYMBOL_FOR_DWARF_DEBUGINFO_GENERATION_FOR_GENDWARFKSYMS:
() =3D ();

With `#[no_mangle]` may be more reliable and it also gives an actual
exported symbol.

And then later do something in the `cmd` command itself or teaching
`genkallksyms` to auto-skip in cases like this.

What do you think?

Cheers,
Miguel

