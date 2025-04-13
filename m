Return-Path: <linux-kbuild+bounces-6594-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9B0A87439
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Apr 2025 00:25:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EDAF57A2DA9
	for <lists+linux-kbuild@lfdr.de>; Sun, 13 Apr 2025 22:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9560C18C031;
	Sun, 13 Apr 2025 22:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lHyN8+M5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1F318A6C1;
	Sun, 13 Apr 2025 22:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744583093; cv=none; b=r5e3DZq6CuYILe33eLYvimhdX/H8mxyo4382aBd6Vlt2oY5022yMUYJqGy54aFCGqCViEUkU2ZbJul9PqIUZJnupXVQm02JZ6s6BJLI77Xi/v9XDYkvPLTv1uuTSh2ZCoIjLSCy3jTkl5FBXgM9pTYKTf698yb6oakHkxqFw2RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744583093; c=relaxed/simple;
	bh=zFhWszMXgcrrhbxro47Xom7wsLkxxg0I4+qRejGxZ4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bpY8TF9uMCb+Dnjjq/m2a/rvJwNPuO2iKuJb2b4CQ41bgOqvIztHnXHHPL/h8P3dlBIdo9GTuubdp1le/DFkNsbaz+2HjAfOJowOGAs88K5sNXknvi1EtjhGNMX/wHtQvn8C9swKQCpEIo4GxmQyRcUt6osmZQYSuHkgtI237RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lHyN8+M5; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-301a8b7398cso699735a91.1;
        Sun, 13 Apr 2025 15:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744583091; x=1745187891; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zFhWszMXgcrrhbxro47Xom7wsLkxxg0I4+qRejGxZ4o=;
        b=lHyN8+M55JNyT63CkRsnk3p7p8CAOLire1tn0crW4+l05G0RCWnhc3x9vBY3dNh9Ib
         6Al8XDeUcSbasTeO5JQsf6xzGb+ZDptPGJfhBKMO16MywPC57apQxNokWVJADCCZwro/
         caFHu+RawozpZz0Q0uCVUxLpev241KOCDJyJjmGaZFXQ5UOABLlOHvlTKb7oTKfdLH9Z
         SEwNgHO/WEuD4KEjq3gJH8datteS2+9soQ+Sf2OFQGcT7g5jyDsbxpUgY5FSvfyBCErm
         3yYVDSKn+klx5PwS85T1mHYq/l3oLjxRDohrfAIOsLCdULxpmy0OKiGYcVrCQosF/Xw4
         UjOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744583091; x=1745187891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zFhWszMXgcrrhbxro47Xom7wsLkxxg0I4+qRejGxZ4o=;
        b=egPqqJFIIqd+b/VUtqrN9uThdggiZjq2w8e5hoi8/uRwn34h2Dj9oEDwxTtbpAb4sS
         TOj1qXtCqkweJzJsWf5k4ZXSO5t7Hf3Grij58yv9qgsAn59J1vSz9UNk084HEmPNAZL+
         Nd4RycqT7RGCEKvdwx950spT2GesABdqcVdQUaiq3xTJOoIjqIVD0C8Wr/Jz2WIPu7Yu
         R1aaI3J3IuGtUDOmrR6ZPW4UN3zKDpXstaME+XgnULzWr8jBbdbgtPqSig8CYO93FvIS
         IKUlhB+piV6IKV9fx+ILgojXi7VuVyrD0KXqJuqo/vj5MCgt7nECt6lT/maNcMGQSLw1
         RfkQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9RU3+Cb9ZnnJ9ACZmnQjjYctTsmSnT7uEHaQN4bO7JbrVLANjWteVM3PksxZtizxPpad0ThI/o3k1xiZF@vger.kernel.org, AJvYcCVM9ISBImOmr9ow32Sd+oEKenyTBkRaIsHIpc1j0oNUv+Z6qPkxLdo6UyFrOnPPl4pGzjov18VXH2uxtaM=@vger.kernel.org, AJvYcCX7q5upDlghAF3fBWODT+CEdM+zQffXC8OPgGSVndA0S1zG6jWDq7+OIkddCC/2fxshT+4zyEOHTTJKKLsCmpM=@vger.kernel.org, AJvYcCXh/kVP1wo1cDDisw6Lwu9Gnq2ROFypGKn3Rbw2dQx3I8DVKLrjRnUUL8UpIT3j4lomTauD0EuV@vger.kernel.org
X-Gm-Message-State: AOJu0YyWmSlOc38rxf7isQxltD/8KD4mGQ6Htygce3rmmIkFR+zBSXK3
	IPRhkuQbxmT7D9Svox8qNrZW0aOzHsRAPn6t3qIcECKa4lklPXF96eM84Ggy/3M2Jyl4FTdzdLS
	ELVPXK2rytyTW47rXF1nIovHfLBI=
X-Gm-Gg: ASbGncv/ZbtAyPk5iGeAdhBUR+UMPXeLZEIV2yTmkgKHHb79kuyMVUed1GLAboxHHn5
	E0wKA3U8itkFil2PhFM9gbsbyS7Aa8pPGHAaB4387UEvYLcORcM7KvatFBAD0dOBzfY7OUBdEXy
	ONfAjEpWZdqw07Wwr+e/RBpQ==
X-Google-Smtp-Source: AGHT+IG/LchdQKMox22QGMHkIWwBwPyMFHqfgkcpLRiUpZjH6w3oFEuC/XhSYgZH5QECaauRKtTcSLIWVzEWcqpeoa4=
X-Received: by 2002:a17:90b:4a89:b0:2ff:78dd:2875 with SMTP id
 98e67ed59e1d1-3082378c78fmr5674698a91.5.1744583091360; Sun, 13 Apr 2025
 15:24:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408220311.1033475-1-ojeda@kernel.org>
In-Reply-To: <20250408220311.1033475-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 14 Apr 2025 00:24:39 +0200
X-Gm-Features: ATxdqUHU76_51ZQ1TnRtKTvt1ZG1eN1xA3kopPBEH1n6HKtgRxWv-zmZkdx8n_g
Message-ID: <CANiq72mxi7_RXCzEmWeLYs5x0Dy9j8BNYTA1ZSZ-8=yJFrfMyw@mail.gmail.com>
Subject: Re: [PATCH] rust: kasan/kbuild: fix missing flags on first build
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	kasan-dev@googlegroups.com, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	Matthew Maurer <mmaurer@google.com>, Sami Tolvanen <samitolvanen@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 12:03=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Thus filter out the target.

Applied to `rust-fixes` -- thanks everyone!

I am applying this one fairly quickly, to start to get wider testing,
but it would be nice to get some tags, so I am happy to rebase to add
them for the next day or two.

Cheers,
Miguel

