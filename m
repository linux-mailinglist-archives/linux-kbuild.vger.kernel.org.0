Return-Path: <linux-kbuild+bounces-1895-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FC18C9A8C
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 May 2024 11:41:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F00232819BF
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 May 2024 09:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A224225CE;
	Mon, 20 May 2024 09:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aZ9xzG0X"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C602225A2
	for <linux-kbuild@vger.kernel.org>; Mon, 20 May 2024 09:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716198082; cv=none; b=nvTNSiARtMb8FDv8tx2U00M2EskzFcnzba6tpmiu2pPFzuxcRqswbA6XET1VVKMwVxA4WBbJjT0YUt/EAgw74uS+kAdqJceNRK7fjP541jpzlov7pls7zdHIi4turPUWahxkw2DLjDn4q6TE42mEJ7/UvB/O3GXLKDWGhj/fb3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716198082; c=relaxed/simple;
	bh=7uuugY85m3skoiVn07kJvXcB4zJBbm3CV5cNkHDjjBE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f+mb3DZ+t26UMfB0eJ/ckh38jwnoZB4FmrBvdgo1wvu8jmi42KE+aCI3M3zW5E/CGKn+gQqPZkZEv6r7YirwjyMYAcJDW6tjhIS6uDS1W72zTlyshOTqJ2ejzw3UwTcYM2QcbCdwybxFzfyJj6AcrX1RM9X93ItEFhsxRrshDC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aZ9xzG0X; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-4affeacaff9so756871e0c.3
        for <linux-kbuild@vger.kernel.org>; Mon, 20 May 2024 02:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716198080; x=1716802880; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7uuugY85m3skoiVn07kJvXcB4zJBbm3CV5cNkHDjjBE=;
        b=aZ9xzG0XRwlnWv4nP42FIH+tiSnaFlqpvRqqYwx3DSorkig6BcVA3qFnSFrId0ELK7
         Gv/o1Mx2ihBDvkhu/Scg1hZnT+f9612AJM1FqubzNMNcoxI2JbLK4/aMnWHw6mIEBoJN
         aY7/rm09UQsRSwh412d1d0Kl9fxuczUH7JyAuedJRdMlBbPtnX6YJ48P4C/WCvd4o2BW
         MH2piopsMHJxymHNPRZ5Sv/EPB/kGQxN7YpQCQxg6+V554VEoigCledMjif+zlYwNW9W
         I7cLu3O0hQIFlTS5Uqx/0PQ9bUF394LAMiaLAT4hPkyw3A/eOmtPjUJ8v4sxaTHvfw6c
         veDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716198080; x=1716802880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7uuugY85m3skoiVn07kJvXcB4zJBbm3CV5cNkHDjjBE=;
        b=kyaKJokz+Vx3N373FyrMCD0dlhzzfdfUKvoC2NgXah67mhOGRV6QTFsPlou2qtc+Y3
         5MtylPkTJuHGJShaV8bjZOjaxB7pOFjF9M32GPpeMKHIY2Ls2nxe9NRHMIl4zXRVHaBk
         IuOGx4wzZmOTmfknh/0km1GOBhMdbHykkUhxMRJVM+XjmgSRGLNfu+zBH2C97W4nbQ+F
         Bi6Ro+tCc0x9yLNssz7L9Sm7s+NrHS3zBFnQRjvA4zS0yb7IJkbPuLx8N0Esq30MhQsx
         6U0lkSS+LmIkN9iRiwy5XOMzN2L9PI3/YDLU7BS0PmGKEx8WTtenBOUo0CSUvTfND6gf
         J4jQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXUqzEwxIkJ+URECHdqHy6vjYbJ4NzIl77iqj2rbxp2EWeN1IyEyRdkvrHOPkgbkI7v1bzoOKRMOjC8qmj/WdahedHxHKYg1smotrS
X-Gm-Message-State: AOJu0YwgrdqNGwJ+H/j7PMl9HCCZSc4dWCRuD4D1OGhraqGJ5n6ye79S
	DiB51RA2HusC6ZfWD0euGBqJd5w+PfW2EnesrKlwO5n7yPhQiwkU+6ukZknrrzLfeh8/bElZvbI
	4ayNvQHRggG+5qjS1dZvmxEG/mwuoce3uiUB0
X-Google-Smtp-Source: AGHT+IHIRXk83gqTUdQImOJqZPIX0uv6AUm05mTPSzxJ+VjagPZfmFf9nOGa5CXpYjIsVt4/l7jOnVOm53CKwZsfOTU=
X-Received: by 2002:a05:6122:200d:b0:4d4:e92:1a71 with SMTP id
 71dfb90a1353d-4df8835c8d1mr26014914e0c.11.1716198079941; Mon, 20 May 2024
 02:41:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240519211235.589325-1-ojeda@kernel.org>
In-Reply-To: <20240519211235.589325-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 20 May 2024 11:41:07 +0200
Message-ID: <CAH5fLgjiKzmmwTrfiAx05tzFYVHDQUsiFmroMcWd3t=P+f6spQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] kbuild: rust: move `-Dwarnings` handling to `Makefile.extrawarn`
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

On Sun, May 19, 2024 at 11:12=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> Following commit e88ca24319e4 ("kbuild: consolidate warning flags
> in scripts/Makefile.extrawarn"), move `-Dwarnings` handling into
> `Makefile.extrawarn` like C's `-Werror`.
>
> No functional change intended.
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

