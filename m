Return-Path: <linux-kbuild+bounces-3081-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A9213955F59
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Aug 2024 23:33:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9DC91C20B68
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Aug 2024 21:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAF99154C14;
	Sun, 18 Aug 2024 21:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RHGZWqae"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8482260C;
	Sun, 18 Aug 2024 21:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724016834; cv=none; b=bht5628a/kQnQ3KLP49BmLKqru9Fiu/usyxoB9Y3gRYhK9SbMntCPkVpudJhV7AIDczicoyWtJ1bhuQFV8CAjRfRxFXRrXh/GxBP+8lZCys55+54nwhwNJGVtXvL4Y/3z09KCfg6DbYgMCAa/6iJ52+WVXOWpWAdvf1eRqPdQkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724016834; c=relaxed/simple;
	bh=4lc6TE7CWMFKZ+bmE8fuI8CZXuZPQHsU1xmgIAvf/6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b9wJEIRD21DJkwzb0u5nPk6ctxDOp62lalATHKTNbbFJ6I55hF61x+OBiQ2moCncZn186nuf8c1KV4Wd5nE4V0cfU8Oaiw/mb2c8+BPF3pMDA3PrFIWasCoIhy6BbK2iAhSGoe2BTMG3XKnUbczoWWWrOvbo2bHYfByTiBJTPnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RHGZWqae; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-270420e231aso790897fac.2;
        Sun, 18 Aug 2024 14:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724016832; x=1724621632; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jKUG+3pMZUAWejTPVmMOG6S+oNn6rhVixGYSr3sRdo0=;
        b=RHGZWqaeQk9TzEi86Bz9jpw3gAB7AG8pc+EMsR+o1NITg1avPX/pdWDMKuW1mMOiyr
         iVI6UcqJUcSH8UNGWpkVqzU+ZBYo4dPTuvbqi04ACHpVFmtrhj9kq3ljTWGnJAN59Kjb
         eBUn0YOGiZVYCggWJuP7uiL86JVFdLzQ8sEASxoQOSh4GXgq0l3Gi7TPYeBg5kuhQLc2
         PDlitJdXe77vH4lYMg9fkhGyhfEXtnqlsVrTt3d1t/vitJkFq7+QHl+RrbSUed3yOwFg
         wXw7ZONShWb2tkpeV3sUpLF3dYj1YOeXHfz4giNNJEb8RxIgm0Lfvw+MyzumPYZMMFbB
         HONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724016832; x=1724621632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jKUG+3pMZUAWejTPVmMOG6S+oNn6rhVixGYSr3sRdo0=;
        b=LJFp4HoNYnEpslK4b4IpjioYC3WTDCdVIbjb4FOzFqOULFV7QYnwaexTSjyxkKeRHv
         Jp4LT5RF6bN5UfnXNgUY35LopE8JiL61kuMrJND7fYFyw/4KfySyG9jclwjzyCeGNVWZ
         QlBiw96dH9rWi5DyVVqLfOmmEt5A3bL3Ss8mSN6RR8MaKPavIV2YZuKgN9444Mdzxgl4
         oXzGKf0xJ6hr/A1VpzvFPAcS9YawRZnjTnhpTY7d6/G5PPoUu/oSn2yQ3ZyT2/xLt5/+
         gpRD9IbwRqflsaCPwFyY2Gwt9E2+lMlFKxWpPe3uM7QIHjid4spBzpIQHUbu4vLcAusC
         YHiA==
X-Forwarded-Encrypted: i=1; AJvYcCWa2k6EH953tZFiTPOedYbvnYUSZgkOeHhPm+3cj2IbGfA9g2BWJgiAsvw1RkPngLZXJTB2IT421El5KL2kuH71oPhmRgkIOlzI8MqK6WH3JrcEHACr8bDTWULjkS97ndtLoalCx6kn4f7iqWTYDEXWTz9AyOZkDvkG2n4Byo0L6CWQHIV/Na8e9ss=
X-Gm-Message-State: AOJu0Yy93pXLS3nlYSQEgKUO3XnG3nPjUJCS3nlQfBN/W+SmPtPtQK5X
	F1hruDyFwhI8d26OBC1VSo4QUaceddpAZzopBWriZLdNpy+qvIwRf7pGM5qWSVGEIcElIaqoknT
	8XaKoACV7jh/J5EOn5CAeYaB3Irw9Iyzf
X-Google-Smtp-Source: AGHT+IH/qTj0ausKACBFrWKDRotnItBUL5uUOMv83OFc8KeWr2R1hbtOuMBotPoPy38BAUUN3+WGuXgqKVAZyhLGx/0=
X-Received: by 2002:a05:6870:658c:b0:260:ee93:f388 with SMTP id
 586e51a60fabf-2701c52028emr11107115fac.32.1724016832229; Sun, 18 Aug 2024
 14:33:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815103016.2771842-1-nmi@metaspace.dk>
In-Reply-To: <20240815103016.2771842-1-nmi@metaspace.dk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 18 Aug 2024 23:33:39 +0200
Message-ID: <CANiq72mwh3du-_EcqG5pVtTTRMTwpMP0bzGgY3C0QvKuSHT-ag@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: rust: split up helpers.c
To: Andreas Hindborg <nmi@metaspace.dk>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	=?UTF-8?Q?Sergio_Gonz=C3=A1lez_Collado?= <sergio.collado@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2024 at 12:30=E2=80=AFPM Andreas Hindborg <nmi@metaspace.dk=
> wrote:
>
> From: Andreas Hindborg <a.hindborg@samsung.com>
>
> This patch splits up the rust helpers C file. When rebasing patch sets on
> upstream linux, merge conflicts in helpers.c is common and time consuming
> [1]. Thus, split the file so that each kernel component can live in a
> separate file.
>
> This patch lists helper files explicitly and thus conflicts in the file
> list is still likely. However, they should be more simple to resolve than
> the conflicts usually seen in helpers.c.
>
> Link: https://rust-for-linux.zulipchat.com/#narrow/stream/288089-General/=
topic/Splitting.20up.20helpers.2Ec/near/426694012 [1]
> Signed-off-by: Andreas Hindborg <a.hindborg@samsung.com>

Applied to `rust-next` -- thanks everyone!

    [ Removed `README.md` and undeleted the original comment since now,
      in v3 of the series, we have a `helpers.c` again; which also allows
      us to keep the "Sorted alphabetically" line and makes the diff easier=
.

      In addition, updated the Documentation/ mentions of the file, reworde=
d
      title and removed blank lines at the end of `page.c`.  - Miguel ]

Cheers,
Miguel

