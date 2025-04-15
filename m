Return-Path: <linux-kbuild+bounces-6619-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 017BBA8A71C
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Apr 2025 20:48:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C5C9190042C
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Apr 2025 18:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3751D230D0D;
	Tue, 15 Apr 2025 18:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HIiVbQtB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF5522DFB1;
	Tue, 15 Apr 2025 18:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744742894; cv=none; b=Wu4Kikt3c5IiSPn+bvXK1ZsR/DzYG+BUb0QBfUMFk72FN1Jyzva1HGEhGYEbb4EjYGLQJlxoeKIZv0cULzA3Ng30MCB1sj54sPlj8UWQFG6J7i4AkLn/pYhPut1xexBqfcJjpnpdYhN1jSdoyB2tXZjKSZ47sgc5Gh2cJOhTcTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744742894; c=relaxed/simple;
	bh=2Kpm6GWhgo8Q/IOC4ec8PNWFZP8KUbljZZldwykeRhg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mjPiUDDQrhQwekJtN32h9sKp3pLU3leYf+rCbdmmQomdOQTzOjKsrt/THuI7xtkeCkESC5d3DpMNaP6fNm6ROZBtobq3rGtAULdfijilGnZNNPltfpMd3E3eZzHXUh2m0q4QC6tR0JjN7NBxlegN9UmeNyvDDKHndks2TTu2z/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HIiVbQtB; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-301b4f97cc1so1063099a91.2;
        Tue, 15 Apr 2025 11:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744742892; x=1745347692; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Kpm6GWhgo8Q/IOC4ec8PNWFZP8KUbljZZldwykeRhg=;
        b=HIiVbQtBB7qJ2st0SdiPbyIZEPsnaHPWFxUrqWfJfkedVFiDGO8FMspMkjBMJQQ3Iv
         m1pNTHXDobarqPQlimbRVeY+wk3tJmevILg78wsLOvgTCmMxHtH4uzBJhZhHb3IwTy5W
         lrE7ZVSMUQI1Tw5xPkO2Mw3zKv+grITgi3A+Sv3ztKP0rakytR0dbTVmLgxK1j8xFboV
         Im5GQsBi58CwwooHCR/KzUj8jlxYUgFp6FuMO+SqOjqpGeh0WFO360Hof0iXiffJUVvL
         czN+D6/CuAcO0NRqDSSY7gTfHhthLxBMhhZ0Xr4t4S0kU4bEwQ5WzKgBmpTylL1Qldte
         ulfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744742892; x=1745347692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Kpm6GWhgo8Q/IOC4ec8PNWFZP8KUbljZZldwykeRhg=;
        b=ArBEQ1T1FW1CBnAZdaUfHx5ox3OTP6FPMXoju9IhLpqBQId4IWLI+F+giwScT+5gmS
         Yniw360n7X/wyiGyW04ppJZxZoijgFUxkTNCteE6SbrhFX+SLKXklGipsKYxdF2aOvpB
         kQBiFEimjudY+BLtvd4a8TMOMSXCQGyWzJ7iM5GKlxBbJ2sa99cg1thdKGHxKYoFSau2
         ZXgL+MhDVfbZzLmKmQZIDfgo6gOuYMI2UtVW+fVXlP5XPjf9CBo7TUvBZdEQRn/fmGb7
         tPHE/dQQ09+88l+RX+rnlau0buC16oBxDUPmnIAoE7A84RVmVoc4CmfE25qKmG2Zmw6y
         enXA==
X-Forwarded-Encrypted: i=1; AJvYcCUMYs99lRV/BR7hA0eKowGeV16yAWFmxFuQP4EgX/t/Bdb9GpGbULTzCEx1waPcmaQmpaMUEviAmFNVN25pV8c=@vger.kernel.org, AJvYcCV1oOEsz8N/PAyqW0G1F3KLPZtrSTEA9Gu56b7CePBXGZzMy+cyHt4v5MsOOcHNfUQYV9R0e0ai@vger.kernel.org, AJvYcCW8Qyo73XnajweX0GiSdecrdh9nx97B5Z+0t/E5aA3e0iU+6w3vFAEPaSxIgknQ4h6QdLx2sg3cpP8luRA=@vger.kernel.org, AJvYcCXxkbdeHvHHg/p/X6pfOtxz5MXGNGcITZHDuVcjQQxyn3ktIBbNpo5DiO+fvmFKV5yd9C3BCNtv4ez5PWHq@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6+7+cs76AgMWIqPiNS05Wbb8+aJrfdmvC6OtT4KyiS99T/gNm
	A6AULizDzc+yoK1bvUu9WUoFE/5sKzegS8I8WGc1L34lePbUpC/YOJbWA6QFpF2URvfpFFMtUDk
	m29WZ0nUf9rnAEXSBkQMGRLeF3uo=
X-Gm-Gg: ASbGncttFrE+DYkEZumAO3cjQ7Nysqb+oTNmqdV/cFSgkq2rRVM8htgp//bWy7zBg5Z
	BK/PgMBBWE3OfwDu+3F1W7O6p7ng043kwxBHx1OX9+LLtBuXeQiammnzA3xFTBy8JmH+EEmbhg8
	1J2WPPTvo6nHhfW9EgG9Qplg==
X-Google-Smtp-Source: AGHT+IGL8QPPlQgTyuSsG4JtvKe3+bJVrcOq2MMMB3IlnsadEDXTmZNsLahV3jTtf451YqR9z6dcky4RKUZe/0LTBTA=
X-Received: by 2002:a17:90b:1d8f:b0:2fe:b879:b68c with SMTP id
 98e67ed59e1d1-3085ef97db8mr121803a91.6.1744742891943; Tue, 15 Apr 2025
 11:48:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414171241.2126137-1-ojeda@kernel.org>
In-Reply-To: <20250414171241.2126137-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 15 Apr 2025 20:47:59 +0200
X-Gm-Features: ATxdqUHTA9TZry6P0hmW1nNr51e7jiPnolW0gnctSwGdT8fOOpZMfrf6lSkmxuI
Message-ID: <CANiq72=TjjW+L20su+N_7-FGMvhGZDTUEHnwk-Kz+XWUWyQVUw@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: use `pound` to support GNU Make < 4.3
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 7:13=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Thus use the existing variable to fix it.

Applied to `rust-fixes` -- thanks everyone!

If Kbuild wants to pick it up instead, please let me know and I will drop i=
t.

Cheers,
Miguel

