Return-Path: <linux-kbuild+bounces-5441-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A07A0AB6F
	for <lists+linux-kbuild@lfdr.de>; Sun, 12 Jan 2025 19:32:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A5ED1658D2
	for <lists+linux-kbuild@lfdr.de>; Sun, 12 Jan 2025 18:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE1051BD9CB;
	Sun, 12 Jan 2025 18:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J6HfWcw3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D95C22083;
	Sun, 12 Jan 2025 18:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736706773; cv=none; b=XplkX479zcI+ETNgwK1Z2LbQ6bLjsZgDNQCdx5JqI4BVf2hLZKDgHniw/LJqclXP8tZ/seQOaWb0gkY07Cth+hOpxnqbqI/TscAgEYA0LzYYx71xl5C2lNXkZkN8Vr6gyT0oOhIGdc6ptTcL7L6BDlXNEbORHJuda9kXHfm/Fpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736706773; c=relaxed/simple;
	bh=yhvI24/fVs78yt1gcCwNGyYwQ0Y2pgqQMWlzSDMmOLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OZR+O0VQIMrd0CrHG8Fr/XDlKhOiQVp1y2Zy1W4xBpfHL08JCWcFt7BeM8bkH/DeU323hqsa7QBz3/njxyYCgg2hGJOypkPLxvbTo2Od6u7KXkPmq4n2rqyxw1z9P64lIfw4VG8X0ZZ4rnQnH6fJ2Ol3D3p0GZHsDxGCSZUvs4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J6HfWcw3; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2161d4b820bso4889475ad.1;
        Sun, 12 Jan 2025 10:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736706772; x=1737311572; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wqdXteI6po77iy2QSprlVR4R07cOMcPi4KkHxst/BpI=;
        b=J6HfWcw3wIK2/gsQ4FbrbH5rjcsyfLIfvWintr2w74eEKx+YyUDsq0EWQRydU1/pyO
         2czGyVQMcqO6uOlDNXZb3EImnya3rKr6vvK4KV52bx/gZ3CUZlDs82XdEUMdssMB/Fis
         fGWo5Aqrz0EzwotZCLwpE+ZaCPGUQlj7fF2PZbpHMevSY9qJHgWNBAEfZPTkZOmWxpgN
         qn9aCLxbvtk0d1YRaG7IZXaMDhy6HTpuxTDHObq1udVxJ8ULlEKe9L/L7PGzq7wfvw7h
         KVX7x5BKPDFtb28aSUldheVov2O+03ABRjGG8nDuCuRFV3o6JXJgU59WMzVd/WMmxv97
         yVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736706772; x=1737311572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wqdXteI6po77iy2QSprlVR4R07cOMcPi4KkHxst/BpI=;
        b=oYjPYCp+JdYbZPX1doCPuFeN0ftZygeMYrBVfTt0F/U0EecuCSlDxvC6ccIWeUPrHB
         krQL93O8pT+/p8EULuMqTAKqhUulzNyBsAdZpxdH0BbTRR6870wIuk2mdGcV0Fsj0FrN
         umFJN2h9ymPhieEHcs43X9PG3Y2n29KwvkhLlNYDvBIgmw9HbJQIFsuK766UHsfwCtvX
         x5rtikMWBsVMXsbCKYrGxGdgtKCxOxOEhL+nvs3+keBS21YJ1MhQGBsG9aa8/HWXGvex
         Aovo3wgLX7CSlnTZl0FsNrGUIF+N0GVC0YQfur2C65LB0t2/MdL7ERT7aFNg0FFNVGIE
         iF4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUsRnv7UoKUJpI6YKnKNO9SP0fKHKZbVLyydWFvqxvrzDgFFyI+AE1JHP4cmRy7PQHNEij1Q4Se5AmKEd1I@vger.kernel.org, AJvYcCVJPhugayByAu9nzOdjDrIzNjy3CpemLmV65eG9Li19M32XpXNKUmIkXif3Warj2tEcDjTyORMLVo98/FI=@vger.kernel.org, AJvYcCXUXOotsUgr8YfNgd9DJAh7KlsHcE5kBGgldi3wYnwjFy4CLKQIh0BTXJL1mai0frV+BvZclAJYTjBej+R1EcA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ5M9mub8z8rH9uJEHDe8ldNOlsrZgq9Fk3Qsuxtm6RUhYNWLX
	9swRWgw6tx1M9K5cmximJ6HbI82e4/0CNfLn0SOTcE5iOL1yveG1/F7eAqPSyswLCD2zM02a9r7
	VbcWa6JhKUHbj+JvIjrTY2OsNgSw=
X-Gm-Gg: ASbGncu2HJZFXrlRkF0CABavzCzoTBCEt4eAjhUO1uM22IAveLeklSGLKRvfx07IHa/
	7OmuOu+umCspuxX0t3DsYhmXtUWsPGwZMATQ+wQ==
X-Google-Smtp-Source: AGHT+IE68VS9F2h8PG0xQDi2AIsVODYBWEuZjRHGRen0i7cGHQvgFb8+PBSL1XOvezWGmnqEQlgbvKcD96RTRggxziQ=
X-Received: by 2002:a17:903:184:b0:215:9a73:6c4f with SMTP id
 d9443c01a7336-21a83f5b625mr102738325ad.6.1736706771683; Sun, 12 Jan 2025
 10:32:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240519211235.589325-1-ojeda@kernel.org> <20240519211235.589325-2-ojeda@kernel.org>
 <CAK7LNATPx2wTEM=KDmGtcH8vVTB4suOhh-CUQKP54F8wtPWDiw@mail.gmail.com>
 <CANiq72mcdtNie=t=HHhZnjQa7gQiDZin+TYP_7Rgi4kL83H2BA@mail.gmail.com>
 <CAK7LNASYYYsiZUaA1StD9kWO0WBC0PBPtfY7u32g94WtOPFZgw@mail.gmail.com>
 <CANiq72mzTaKYJqNcv1qT3nXEbh_t7CwaAqxCuYNcx9eHOZf7wQ@mail.gmail.com>
 <CAK7LNAQkUik_VW7j-d56Pr4NnExxDnjMfWSwtxvijH4q4Onctg@mail.gmail.com> <878qrig5f5.fsf@kernel.org>
In-Reply-To: <878qrig5f5.fsf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 12 Jan 2025 19:32:39 +0100
X-Gm-Features: AbW1kvbarXXNox8Aqm6y6l8o9SVEsvFhrrvSgxGIdEGR5pO0-K6aJ8d8RCBOZ0w
Message-ID: <CANiq72nNTc+XLBZxcSBD9beZ+OocEEYQcNOM_e7Be55LuJ1M4A@mail.gmail.com>
Subject: Re: [PATCH 2/3] kbuild: rust: apply `CONFIG_WERROR` to all Rust targets
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025 at 2:33=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> @Miguel: Should I look into exempting host programs, or do you already
> have an idea of how to implement?

I will send a v2. I may take the chance to already apply the first
patch into `rust-next`, since that could go in already.

> Regarding host programs, it would be nice to set werror for those. How
> does C do this? Is W=3De enough?

Neither `CONFIG_WERROR` nor `W=3De` apply to C host programs.

However, you may already do:

    make ... HOSTCFLAGS=3D-Werror

And for Rust:

    make ... HOSTRUSTFLAGS=3D-Dwarnings

I could perhaps add that into the docs.

I hope that helps, and thanks for the tags!

Cheers,
Miguel

