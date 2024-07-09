Return-Path: <linux-kbuild+bounces-2435-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CA992B46A
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2024 11:52:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8FCA1C212D5
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2024 09:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 317A1155730;
	Tue,  9 Jul 2024 09:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ztAxLAxN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997EF15539D
	for <linux-kbuild@vger.kernel.org>; Tue,  9 Jul 2024 09:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720518739; cv=none; b=P1NTapd8KQSPQ9LqOgQ0eNWQkFZcL0dpmCmddF7XpyVYLNb7i9elCZOLIudf0QoKaLKwZDAqCdy57cQvapgjkfNOmB4LjcvWXES51hglpJ3JnUGcwh1zTiX+MRjg1B7uaOpBJol2nCdQNP68YET1X1R95NgraXmcOsDJ8lZ7dEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720518739; c=relaxed/simple;
	bh=i7LfNc6qq1+aDEVX+3WD/8s4yDV8gC7rFYVgqcVfLhg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ho+AdisvfdP4XE7e4FKMy3z6F5VPterxBaUHJyfXC5cDwApQv4OFxU2jpMu2foMSekh6JBGexVGBJE6STRS8+m55clKtO2AVxQ+2yB236qyg5HoRdZzc7lVw/45tvMj6QtWj+Nv+//75NI/wmvaYa6ItfwjZnDiVGlJDOtEzN4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ztAxLAxN; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3679e9bfb08so2864974f8f.1
        for <linux-kbuild@vger.kernel.org>; Tue, 09 Jul 2024 02:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720518736; x=1721123536; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i7LfNc6qq1+aDEVX+3WD/8s4yDV8gC7rFYVgqcVfLhg=;
        b=ztAxLAxNlBzqlkn7Jjt0h/icaXPqSYMxgUBPinhXx0DifV8VImw8Ff8yH5/dIUzdk4
         Dyk0Rh3hDq5urZnm9xhToYmomHFL7iqh+UboHGlKW64Rmw7tl+D8iidF/b/DHAyUt964
         17RNWo8MmJokxTn84sfUZ8demr7q5E4AbRhOCJaVZs4FzgNzdeZhfsU/DlEkZF0eElu3
         RjcZ9AE6gaGV7Klo0XoLKdWOvA9CKUmLSViqIm3OFzll8KESFT1LQ6C22Mi5GE1Sdl/0
         D62Kq2xZs3A05mnayE7u/FOkFAFDL8/S2zCAb+cna7ptkMoHPqsPg/8CiRVVOmbQEA6k
         bCIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720518736; x=1721123536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i7LfNc6qq1+aDEVX+3WD/8s4yDV8gC7rFYVgqcVfLhg=;
        b=O/MXZhshUwFU7MqUA1nebQrKtmTcrmHHMs5hP8DUEF1v2dBLPc2FG/AgLmFA1oZj4n
         Rod0K1/W4XgWsGdvZBcu+EsJ5b1HwyNUCOXlG+MDIzNJzNnwJXss668KAii8FPLu6Jy8
         MaVaBmamKXs1+tEqB0RQsRN/4O/7iOZZCQv+Yhr1enD0k6TC4NwP1lkKk+Tqc1LFOWxf
         dxIm9PmBc4BFPKkt7b2ZJ+4KaZcgffwthFQ0xAGuCdxPLw+2nFg5ZywFs4S7ko5w9irb
         b5oyiausBgEpiL6Lg+WU0SsFSD92I5m658CQdzkhjkNWn4Nxi+rJVjvG34if4LOaoO//
         crCw==
X-Forwarded-Encrypted: i=1; AJvYcCVRBinO9VP7Dh7TzxX5nItAJG/5S4g1Al63B94mm9TBH/f34U28QHTN7Cj1Hqs+fWl7D0HGqOJHQ8WE3SqDloUsgoNvsSHdtNWdQDT3
X-Gm-Message-State: AOJu0YxFS9D1wEOHOQ1XI4d52sbwa4xevIVwlUceQP2tlGzsm1UW0O3D
	q1lT6EhiKrnvCHaYSya3cZyxmy2h+NBzxtNRVPvFmsMRO9/www7pmMxAu3FjY1vcZvMWit2vh9v
	LenlXrywtBhV0Q3czY6FG8UkBelY2Bi2hmpQt
X-Google-Smtp-Source: AGHT+IEmN00CynNCsDDhXsM0XpdwEU/G9mbSqcBJsKaThKIblLct7tNNCUBwvT2H0N0PDa2zNXTh5YziYvGRh1xvDus=
X-Received: by 2002:adf:ef43:0:b0:366:df3f:6f9c with SMTP id
 ffacd0b85a97d-367d29476bamr1590756f8f.3.1720518735880; Tue, 09 Jul 2024
 02:52:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240704-shadow-call-stack-v3-0-d11c7a6ebe30@google.com>
 <20240704-shadow-call-stack-v3-2-d11c7a6ebe30@google.com> <20240704-unless-cache-8a971c244348@spud>
 <CABCJKufJz5Wu5ivbEuUFHJd8qk0M-W=WQDCOe-pR6w=4=YyEag@mail.gmail.com>
In-Reply-To: <CABCJKufJz5Wu5ivbEuUFHJd8qk0M-W=WQDCOe-pR6w=4=YyEag@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 9 Jul 2024 11:52:04 +0200
Message-ID: <CAH5fLgjNPAYHEsWS5zPtmCH+c33LFRcxBkOcp_camJFMXPVzXA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] rust: add flags for shadow call stack sanitizer
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Conor Dooley <conor@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Kees Cook <keescook@chromium.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Valentin Obst <kernel@valentinobst.de>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 9, 2024 at 2:10=E2=80=AFAM Sami Tolvanen <samitolvanen@google.c=
om> wrote:
>
> On Thu, Jul 4, 2024 at 10:17=E2=80=AFAM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > For these security related options, like CFI_CLANG or RANDSTRUCT, I'm
> > inclined to say that RUST is actually what should grow the depends on.
> > That way it'll be RUST that gets silently disabled in configs when patc=
h
> > 1 gets backported (where it is mostly useless anyway) rather than SCS
> > nor will it disable SCS when someone enables RUST in their config,
> > instead it'd be a conscious choice.
>
> I agree, we shouldn't silently disable hardening features when Rust is en=
abled.

That definitely wasn't my intention. I'll update it for v4.

Alice

