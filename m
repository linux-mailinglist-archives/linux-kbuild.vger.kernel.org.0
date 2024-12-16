Return-Path: <linux-kbuild+bounces-5153-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2EA9F34B4
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Dec 2024 16:40:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 834E1168E0A
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Dec 2024 15:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B97814C59B;
	Mon, 16 Dec 2024 15:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mSXb5449"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DCA1428E7;
	Mon, 16 Dec 2024 15:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734363585; cv=none; b=hbeVndxBbbpx4fcrPQXpdDDQWoaduyVGYHkEJBpSAbvSfqFkqiPsoS1M0Xpig8WoFOZ1C3TltB9EeJgKymA02bO6cJJ0hJbDAgSweycC8lqYBrXBxhPwvs714mQmu4XHsYNG3pYsRgoCgYd3JvzRZAEal2TVkm8G4dBKB/4JWR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734363585; c=relaxed/simple;
	bh=G3jXQkmCVJR+czSmCQpoJX5ld3pVQDw+9BH9K8pgbm4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=COb1wFHFfhHPJBELUx31OUXmEGTti273mj2i92vxRCJdg3qGr44tVlsNwnejiYCSh4hfYuGwnx/gZeTTj8SbaJxE0mdvxJaMQ1gOouQJlCSBnLt5o5KFA3tvX84oE0CxBcvlEOfFefrB0e8z2FE5bKW2T2o49Fj4KWgndctcbu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mSXb5449; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7feffc649efso464730a12.0;
        Mon, 16 Dec 2024 07:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734363583; x=1734968383; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VjgcFMN4tLyFamFSG+GiRwfX5Q82R9135wmYUKoKyPo=;
        b=mSXb5449wP8Hle5LMFBYQa2WJ56oJDkcdQHrE/5XJA4iXADGQLj3eW5TLerTdFueRL
         sLB9Av4EiN3hRJvFTV266D95GAscUw1Tp5gdlw/Sm10WJt1BoWEOKZtsnsMUfjDnHInj
         dF62k9Y/t1GqqwhhPDysmr594phj1W3kj9WF7uK6JtfNWEbYMqcBewcnHxYZGigN70Xv
         axCVjbXlNLSOFrVtt/gNwrDM6NulHGBbw/M3jsymEBgEW5bK6awIhUq5pU4Xjl4nif8W
         xFiSca/8+S7eNIVMUQSQ+g/ZumStAXjm1FYbN5abgOMvr6R5OLJwBCAxiZGfXKzQSIiw
         w9UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734363583; x=1734968383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VjgcFMN4tLyFamFSG+GiRwfX5Q82R9135wmYUKoKyPo=;
        b=o0FpFJga4n+LTwuoXC/TTU3FsYzDyl1xHDRlpt4O32jhUaYJg3kgQiNcCGpQkAM1RX
         t5ZU4vVf5U1gEa8l9Jec2wtXnwzRWBjMmtOF3CjcwsYX+OW4PDDCFLYk7FuIVuVXGON6
         gL32gFQdkvA3BC/dNVawXMiBucQD6w7/jvnVR0ieyx0JP1TpFkR9EwTodlbE2elHg1SU
         72KZdjrQ9oJJ77k0zAHqjl3GEVOkn69C6OMcvFw3/UqoCPSjCPnex+hUcfoo1HTC/tU0
         CFqvRyNvk+nHqdQ3Qdw8t/+heHiCZwOflRvfiFWF6jLOJu4x+D+iSfs4aPLWZo4ynNvE
         H0lw==
X-Forwarded-Encrypted: i=1; AJvYcCW8DCcUBYYXf2fTope4fTo2aH59scATxjEH/v27BpeEtroBSKf3wpoWOgiJ7VR4I0GMDq23FMy6sZZgGlR9ZPc=@vger.kernel.org, AJvYcCWAY+X4iefIzaOBH2uu9q2YW88+UZvMQtd7AcWCVQ3cHQzgJgtn/QYiNrXI92h0z22Kk02N7i4HMm6Mxbo=@vger.kernel.org, AJvYcCWlWrRSdpR89QVFKHSlONuN1TqZ+hMtYnDoZp4TojgQHEjhZBy2+jpYUTOH6JXIcVXD+bN5WTjyOlTyRdjB@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2/Z759qD/Wx2ctDW6ZZ5jP56p258wpRepf7uRa8R5FN/qYLgx
	vkfvKswnK6cLAFB8u2t7+g/Ou1yZK2lyhqVQ8ugJQzSu7cUcBhjjqGB9oLAhvgBLOrxUzuRpWdp
	K9gHDNZJKDAasmm/wh59JLASzBHk=
X-Gm-Gg: ASbGncsnyzbvCdbkz2w8epqNIgHIWchysEF2DB4Fw+8milOb87T3LhBCWMihgWytv1z
	XZ6LutIGzIsG6N9iLQJQJQV8bpxuU4NcNTtKr2w==
X-Google-Smtp-Source: AGHT+IH0JilcpABRShToSNZ8qkBhkt3foszBZpo/+io2V+NumhgIcWfKhIGMhtFOIPAEAgqX1KbRpBS69XHdQGBpsfg=
X-Received: by 2002:a17:90b:3804:b0:2ee:d9f2:2acd with SMTP id
 98e67ed59e1d1-2f2902add3dmr7006134a91.6.1734363582825; Mon, 16 Dec 2024
 07:39:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <I0v8YGJe3e1ex1oF3mki-7QKimYLCJHnBy6g1taHgoOFvpNmQSrSnsMGJyGS064pGJsJDsTsei-pInFRz5INWA==@protonmail.internalid>
 <2024121309-lethargic-ended-5f99@gregkh> <87ttb7d24p.fsf@kernel.org>
 <hmmCwoNftQc5Mj4BLjFC2qTABem8CvuXSx3ucXzjIfQSwLjULmZgsw7vpq3Zxy0kk5H3Zjpz-vd4d7E1sb4LHw==@protonmail.internalid>
 <2024121344-excusably-resurrect-d01a@gregkh> <87h674c5vq.fsf@kernel.org>
 <UW-ATumT4L-13ZXX-lO1inQGeZK7VgQWNAHE3688ulGj-rvzxWkUdrmnAUlufI1W5-9d6vzH3TXZ4VOmYh9wxA==@protonmail.internalid>
 <2024121646-shelve-series-5319@gregkh> <877c7zbx2u.fsf@kernel.org>
 <8e1b5c5e-52ae-4332-a49c-990add7611f6@kernel.dk> <2024121630-steed-grating-6352@gregkh>
 <64a40555-e3f8-4671-8ece-3c3b677ccdfb@kernel.dk>
In-Reply-To: <64a40555-e3f8-4671-8ece-3c3b677ccdfb@kernel.dk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 16 Dec 2024 16:39:30 +0100
Message-ID: <CANiq72=01Oaszr08hV2ABLbd0RJt9oO=j=aWAizbbCUg+T+aNQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] rust: extend `module!` macro with integer
 parameter support
To: Jens Axboe <axboe@kernel.dk>
Cc: Greg KH <gregkh@linuxfoundation.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Trevor Gross <tmgross@umich.edu>, 
	Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 4:08=E2=80=AFPM Jens Axboe <axboe@kernel.dk> wrote:
>
> Maybe at some point? The rust version is already there, it's just very
> limited compared to the C version so far. The point of the rust null_blk
> is to build out the API so that a real driver can get implemented as
> well. For now, I think the plan is to just have it be the rust
> playground on the block side.
>
> Given that null_blk is the center piece of a lot of testing, it's not
> necessarily an issue to have duplicate implementations of the same
> driver. In fact it may be pretty useful for people coming from either
> side and wanting to compare implementations and how to do various things
> in either language. It's like an actually useful skeleton driver in that
> sense too.

Agreed. I would suggest to consider marking it as a Rust reference
driver, since it is a prime candidate for it:

    https://rust-for-linux.com/rust-reference-drivers

That way, it is clearer that the duplication is meant to build the
abstractions and temporary in the long-term.

Then we can also easily track which ones are meant to be those, and
Greg can get justifiably angry at you/us if the duplication isn't
resolved when the right time comes... :)

Cheers,
Miguel

