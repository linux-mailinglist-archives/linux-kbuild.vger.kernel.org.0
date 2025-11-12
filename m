Return-Path: <linux-kbuild+bounces-9585-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAC9C51E7D
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Nov 2025 12:21:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EB5E3A6181
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Nov 2025 11:13:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FD2F303A1E;
	Wed, 12 Nov 2025 11:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FBdcHOPS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C5F3002C3
	for <linux-kbuild@vger.kernel.org>; Wed, 12 Nov 2025 11:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762946035; cv=none; b=k2SOprz66/33+B+m1QY8FdGxKckXEDlf1zSJvnNZZvWtvl6JzozmItBHaLwfvHB3fBN6ObELl3h9QWNsP6jBck9wSdDPIR5etmab2H5XPD8NN0w0Q/+9XQb62gxI0AP5uq5mMYNW662N2CiWUxHjHovskYbgsb9DBb9iQvGiGbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762946035; c=relaxed/simple;
	bh=HKRQgb7qkXFEXY0rIg9AQCQabb0xmTPYzrOWr+EJXY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q/w+r0DEu1SPzSMw2cJts9aUGlii+oAe2BQ1zgIu6yOFpEIpplDCiAkQI2GFL+HWPfw1FjhiJMrlpzSbUswcGkmerviHLysWfboLP4xzfpW56illAqxCDy2wT6jYW+BgGf2g4y6xJarCG4d6qAZWCkN9q9bqyd5/gBd82NU31h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FBdcHOPS; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-297ea936b39so1046165ad.1
        for <linux-kbuild@vger.kernel.org>; Wed, 12 Nov 2025 03:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762946033; x=1763550833; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKRQgb7qkXFEXY0rIg9AQCQabb0xmTPYzrOWr+EJXY8=;
        b=FBdcHOPSk/RCte6K8VHG3Ca0v2zHxnekNbAxUvgw0m7tRPb6I/fuKEJ6JfEeGex7Ub
         mTlcYU9o9m/OLM3cfAaKQsDHEY9fEuuAMMkDfsIkXyu54ubQol6cFryQ3hI88bhs5AfJ
         0Z6YFEDuDTzYpxwSXiWZLe82VCx2iA6zz2COnL4gZm0aE0mpRgOP9JiwQwLX/n3M23R/
         mIwv0LLFvFG89IWTwUBWrkafu1Xc9eb8+9/kiDkSPwfWaScjig5jt5WK8gYEtyCVjvaO
         LGyrfRs47PDHXl3iTk57VX1bvdmbnopU5U0fERG06YSXJFummkiqe13o5a2EOTFE352+
         BX0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762946033; x=1763550833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HKRQgb7qkXFEXY0rIg9AQCQabb0xmTPYzrOWr+EJXY8=;
        b=YGtHZw1Z71njatr5fRs8ygPLKkyl8InnpsTgf2kPQCJCFeJW5scodqtE88IR+epyZz
         PLU2bGuLcBwi3M4HkIEwJjAvxMQkE+5kwNU9BfqPP1l87Nmj+8qrXF/aHq+puzlDhXf6
         /5szb40Jd3Df3uaC5jBQV/sY5bbJUDjJ3aWgrj8BsSFJohCqf9z5W7DZ+OcXGWGnZJ6x
         MVI9rXHY2MXzZgjldcji0DZ9DmZEjIz5NTLHV+DkuA29JU0tQtHMosE0ZHQr4PgBtgZP
         x9xrF1Ge3sPB8nLV4PiS8SOirox05bJPPDNaAsZXpEujs1j0iBoR+VSVK0RjFhqtePg4
         k00A==
X-Forwarded-Encrypted: i=1; AJvYcCUpThIQ5s2Il5bIgi0Oy1utRoUiM8jpdP+2kUYq0p8scL/YupshxLXLns5kjd3/CknrOodY1RzK6PSy+MI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyocY2pfmV/6srpYFW18bsGzfRkIMAS6VSxnPOBf3f17voCtbMP
	xBlUGcPGyN743GTkwOBHLZO6oDd2q7CedjgDV/VKZinpiWSDhVKnBSeqjqEX8lOn0SkOpMH7HJY
	V/OZwW+zlx5t1/ylvaX8Mc3UN/Dosops=
X-Gm-Gg: ASbGncuX74hRKROWoxC8zOxR6mmgrI259ICpCKkwaQ3uKShNZyFxRpCOrrdCelMeAZ0
	fHsMXIxKMQyKdK/+bZ+FBHlL2adz67fdPtu7nQwUN9NkkvYNNQmLIb/lpz8EX9Zu/3JZoOpeUOQ
	qOTO9uajZjqdmFOj/uqr3km5ZrxGHNYosbUiC8wbhqTaD/4kLeYpGifY9PIdglENzntdJjYFiQk
	hSFZfWLaxuzu7GJRXsz5KuzVSuDid5cwflc8oMlGNJUG2pBAI63d8gMhbFOiON8IY2aqqeIvsOl
	I1zBmFZAaAnoAZB351bIkByn3/TMz2NaAoLuPsQcM8eCJwuaQWqqMNaPBNV12D6JCixyOmsDwbw
	J8Zc6vFtqstzV7w==
X-Google-Smtp-Source: AGHT+IEMVOPLQ0kfBxj6LLguRfI9eu1jQSQHIP8wiKHhwLHRC1rvaWObMB1+XwvZaSaxDEkp8LUmHo0FgkmnVhYp2tM=
X-Received: by 2002:a17:902:e84c:b0:297:d764:9878 with SMTP id
 d9443c01a7336-2984ed48799mr19398545ad.3.1762946032845; Wed, 12 Nov 2025
 03:13:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110095025.1475896-1-ojeda@kernel.org> <20251110095025.1475896-3-ojeda@kernel.org>
 <8e58087b-17e6-4362-93f9-f9aaac6c4476@nvidia.com>
In-Reply-To: <8e58087b-17e6-4362-93f9-f9aaac6c4476@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 12 Nov 2025 12:13:40 +0100
X-Gm-Features: AWmQ_blP421Ww4skNX1IA86Afm7j4Lia0EL-t0RKvHyVdfTUWYuVKwSCLUjZdhU
Message-ID: <CANiq72nssjH0dZ5Yso8fp3sjHOMK2YYyfZG+uG_Fb_09xd5=vw@mail.gmail.com>
Subject: Re: [PATCH 02/18] rust: kbuild: introduce `core-flags` and `core-skip_flags`
To: John Hubbard <jhubbard@nvidia.com>
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

On Mon, Nov 10, 2025 at 8:18=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> I agree that switching to ":=3D" for this kind of Makefile variable
> is a good move. However, it should be mentioned in the commit log
> so that it doesn't look like it was accidentally introduced.

It was meant to make it consistent with the upcoming additions since
this commit is essentially about that, i.e. it was not intended as a
drive-by cleanup (which I usually oppose), if that makes sense.

I will clarify in the log.

Thanks for taking a look!

Cheers,
Miguel

