Return-Path: <linux-kbuild+bounces-1897-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA86E8C9A9B
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 May 2024 11:44:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCF2F1C211BD
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 May 2024 09:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8622D36B11;
	Mon, 20 May 2024 09:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pEgDGZEZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE323FBB2
	for <linux-kbuild@vger.kernel.org>; Mon, 20 May 2024 09:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716198272; cv=none; b=YgaJ9EvkMpAEnoSJCAtImAbtnEOxAmOFmmaC1UCkr4yO2wan4BA37LREzoLRtX/DAyPYQ+3+sh0eVNSAinCrMFIXcxmR9Uhtl1TkXSTlUeWinSLihNv8Xp1vf+BxTQiQDpqMZC2hGEWQcC/lweAkB8+P2latQCMcqjLkfNhq2L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716198272; c=relaxed/simple;
	bh=9SQyahqkNTCE11p+YPTRBzNEGuv1mZ4mTj9rW50lNSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=otCd2Fyo9c0Gun9jNIhUUARyNspTtxnHBiNLEq4Gqciw2VKtgt7ku6ApOoiET7i5MKP66wkbq1GHchwZYwww73IPJ05m1SPohdbB3z+KSNY4P0TOJferYxDQKPM8umiyisVKSHZNVuVU9pCvknFZze2+bZH/dqENWyiGyDYQm0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pEgDGZEZ; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-7f3faea0ce0so1142206241.2
        for <linux-kbuild@vger.kernel.org>; Mon, 20 May 2024 02:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716198268; x=1716803068; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9SQyahqkNTCE11p+YPTRBzNEGuv1mZ4mTj9rW50lNSY=;
        b=pEgDGZEZpLpBHz7CSyPYgcd+CG725OdRFCWH4zXcJVDKWNgSZ3dQlrn41HkG0A5toU
         LtmjH99x28Q0twiRNs2GV1ZgmrkMd5NqHjc/Uej531pC8AmEOdCERiC7ILnua5IT35G4
         45lnudKLbGlIdF5ih6IsndaklMdoBDatBEAxt8HW8vZzANXc6uOm5vng+GX5ebnDPNZ8
         jCuS4Il9uNLjhqJtJTINCaJ9K2v0Ti3IYTehfLOazQiciAhfACmC8Y5VBKr9Ul6nkdFl
         bWnOs23JvJ4QaVrU6m8UESXzgs/fPEjrIo//lWCk0TpJJ1vMbP5SyI5ox0JyUItG4TdD
         KfrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716198268; x=1716803068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9SQyahqkNTCE11p+YPTRBzNEGuv1mZ4mTj9rW50lNSY=;
        b=BoPoLOd4uEqVWM4avfctagKs/lKdZ+I0cPjusm6B6xUw4iv12KgajBur1d8KKJHmx2
         4cTix9GqIY1gi+De1p2FNBGORjqL3FhCWmCUhiyc3ulwu9z5c6lKXCauPqI8PIm+MCrO
         Zfp85eTZxAkjtKgSvwjJ9WvLPRiqx1P1xonKUxWSvw8/YU/BHe1d4yjSPyiA7ksPPMMw
         Sez8hlt8HNYaMjuxMRbe1geSQ3gRRtuH4kCef6awKc8r/mawczaoEjGNEbZTLq/kqJXS
         F3yzvtXzEnqOez/EId0J6yB19DJUVKYfbUNuOnU5VIILhFq/7+kXcU51cpySSFKZq2Jm
         wBng==
X-Forwarded-Encrypted: i=1; AJvYcCVYBPU8UmBAP0iX838YOYy2gMvjWqSWu7ahW2L1BAvOxjb9EoF2nhonqQkEFdh5qRBQZZOU6oaLkg7tn4V3n9+yArX9qT7jEbvSkQaC
X-Gm-Message-State: AOJu0YyKrd4SMYVkdL62itcSMNJwjP9ueMFFXWEEFJ5z2wxm/U7B1V6N
	OwsqbIo7sZMuKm0maX4t9rxpqcREXcDl5uPFj+TUVF+O+0cAQW0SQm4ffdf2Agmc2+DbqbUks+/
	UiHNN9hItnUbXl99CWJn4A4gWJLWmbm2Snnmx
X-Google-Smtp-Source: AGHT+IHHXvr+M+34UawNAnnzqJygOBNlCpPhzSst4E67c+2hXFzQu8PTkPa+2afVxf4csgSkRirTEdacdSn42ZMv2C8=
X-Received: by 2002:a05:6102:d89:b0:47e:a214:8d02 with SMTP id
 ada2fe7eead31-48077cc45d3mr28209812137.0.1716198268543; Mon, 20 May 2024
 02:44:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240519211235.589325-1-ojeda@kernel.org> <20240519211235.589325-3-ojeda@kernel.org>
In-Reply-To: <20240519211235.589325-3-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 20 May 2024 11:44:16 +0200
Message-ID: <CAH5fLgij=Wv0Fbd87piUrP9n-riQxM-4BUo26XDgKxuZEQEixQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] kbuild: rust: support `W=e` for Rust
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 19, 2024 at 11:13=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> With `W=3De`, kernel C targets error out on warnings.
>
> Add support for the same feature for Rust code, but take the opportunity
> to apply it for every Rust target (i.e. not just kernel code), so that
> it behaves like having set `CONFIG_WERROR`.
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

