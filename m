Return-Path: <linux-kbuild+bounces-9353-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A0CC281E8
	for <lists+linux-kbuild@lfdr.de>; Sat, 01 Nov 2025 16:54:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9E41A4E84E3
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Nov 2025 15:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58E9F2C08CD;
	Sat,  1 Nov 2025 15:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J9zGmV4g"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4BC248F47
	for <linux-kbuild@vger.kernel.org>; Sat,  1 Nov 2025 15:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762012454; cv=none; b=SXxNrqo0E+nUVtVJYqxBpG3XXdspV5qQjmLAtx5lmLO6vSsQrVydF25d6rYtQ0VTveSSYPlt1rN0Qy4JbxEWbiYSiFZ06NhzKxvlP4FxS3mYjrOuiC9gRKW7//iTSPUVdzPp8dnu7kAINNyUMm7763q5TGEondX/X7BX9S/CaXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762012454; c=relaxed/simple;
	bh=DZxrvCuj4VcRfVXQNKcqrzWO2/nyvtlkEBnmNGrmT9M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D1d4B1lKackRaQswtZ8deGOANpLn/uuduVzww+081yvfzkeO/PkWxwJXpYzogLwKchKBjBCeAQyvMG78p7ASVpbg7Ho5/1MMuNogNqec/HvMhUpK5rHdNfWriUnFLpidNiP/3zKFfm4zcmKetbA4hwraghL+D3bFMa2VxypwO0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J9zGmV4g; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-295351ad2f5so1838585ad.3
        for <linux-kbuild@vger.kernel.org>; Sat, 01 Nov 2025 08:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762012452; x=1762617252; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZxrvCuj4VcRfVXQNKcqrzWO2/nyvtlkEBnmNGrmT9M=;
        b=J9zGmV4g5/ijhQUpjiIn1YuahtHv3SrKuxmFFkiSY5Ebje0B/FkNsKYXucYjzbmJ9C
         qvxz1yi/RmVK0qPjTgdmzRZirzqA+ayA7mgQaU2Rh5vse1vkqlInsKLmaYuUbp6Hb9i1
         4xCIPlqftSQZcWDh8yM26oe27ZXQViWfhon+HHnmQTsfqVlg2Xg/ClLtR9bmQ2svqBvl
         dePQxvtskIgHPcEq6/G2E4FEjBNCyaFSxwqkoAGLQNujj9wZYd+qpdvMYzuxW5RlSxVm
         aE9VkHh4t/k4X9GSoOmYr11Z57rrB7DT+73FOqR0uew2O/OVidbh2akTjHaii7JqM3Sz
         O1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762012452; x=1762617252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DZxrvCuj4VcRfVXQNKcqrzWO2/nyvtlkEBnmNGrmT9M=;
        b=qKUrtrXArcUbvae0qdeoxmhtja4+9JaZoZWPnIZW8PNumPrk28axc109a/f+/5WqRG
         kyLCIMBxLDpIorbU+nQ4/8iD6UVhY7kamaQ9cdg/0QCRJHqbSqSB9cd0D3x4pjNAV7pE
         rKXZaiPTqWv10BZd6j75tG/FLP+q3LAFy88UGiSn4XuyjnveXtXduC6ZUiGKYwMktoK4
         LtdJDYpEilcXdRZNaehw40VSaG1gtUBJ6GcmIA4JqjNp0KpMsjYQY1oovrWgEaWo80PX
         Wgzz4kkuE3sbrpK9h0y2THFUz7/F9mdHZ1efrAgWEa7b0l0ElC6K8i0wDkNoh/0eJeqI
         2LYw==
X-Forwarded-Encrypted: i=1; AJvYcCVtImNHK7h6KHtJZCmKgeIhs+2UuEIx2Ob/EA2fdzPNJ12aH/Q7FZB3AfQu0JDCHBojaS6l3fbVy9Zt1FA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnAY/15CQM3zTIgTOz+ZPRIJvbaTncAs3XB/CZZgeAi88/9tMd
	qzq6qZNhY686l+7uABYXDcJWLkVwlI1PVZnyGo8jU3FIzmU8KHRMjLuV/gsHJj2PSInFHuz/mkV
	EODK2shxcfU+l+Ze6Adz27thvwB/+dWE=
X-Gm-Gg: ASbGnctMw8A6+lfIaVitrmrO/qy27Cw7Sb20cZmrxeVQd5BIipwS81+BXdYoiCs39vb
	logJFyMwyxzMuLjdVCrgmMux/dC0UKcGTLM9AN+lNd9ZZwyLZDbHoTNLr/7mqq8227oW0C+k2RR
	ylnHBD6E9kyuUxm6quW0JTSrX6UScmWsEhIzwX2UJgpdA2J9n32RbS37QxVzRHZBRu2JjciwEMi
	56BdAJYihoqwcF5H9O0gzGlIZ8ZsTkafVOASajlZ90qbd2i6H5bBm3aeFItzv64GhT82WwmEfXO
	iYM4NbDdF/pZZN8AB6FnRl4z5F+QqxXTQB3nEp51EGUVBJ04DRrsq3Rs1nVJesBUnf7JAS2SfUf
	zjhg=
X-Google-Smtp-Source: AGHT+IH98SKG2dNVCAgDMWAsxf7IghHixGwIwUQXBJWnv1yD4/76UJbZrqEwBLzCN0HeDuDp9PdZmiEDyhXUpHiXB1s=
X-Received: by 2002:a17:902:d505:b0:295:3f35:a31b with SMTP id
 d9443c01a7336-2953f35a4edmr28620535ad.0.1762012452072; Sat, 01 Nov 2025
 08:54:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251101094011.1024534-1-ojeda@kernel.org> <CAH5fLgjC20QmK0s_6ht1edL8wSR3d-yrJ_viuwdOxTCQRpMmgg@mail.gmail.com>
In-Reply-To: <CAH5fLgjC20QmK0s_6ht1edL8wSR3d-yrJ_viuwdOxTCQRpMmgg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 1 Nov 2025 16:53:59 +0100
X-Gm-Features: AWmQ_bmfFv9e45aUeUVbkE-t_FDmtneqkzR5nipR7SAGPuD1TLzugXVWW0zvQak
Message-ID: <CANiq72nBEkTq7vos1Lv5Z1bgdZHt+UQWbauC0nr8xwxhuVBJJg@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: support `-Cjump-tables=n` for Rust 1.93.0
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Huacai Chen <chenhuacai@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 1, 2025 at 12:15=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Does this need a CC stable too?

Definitely -- I just forgot my usual line:

Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is
pinned in older LTSs).

Thanks!

I will apply this when upstream's PR gets merged and send it together
with a couple other fixes.

Cheers,
Miguel

