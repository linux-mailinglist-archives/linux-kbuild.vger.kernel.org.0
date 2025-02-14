Return-Path: <linux-kbuild+bounces-5754-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C5671A365E5
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Feb 2025 19:48:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8A1A16C579
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Feb 2025 18:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61CDD1917D0;
	Fri, 14 Feb 2025 18:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YasJWioE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82E4134AB;
	Fri, 14 Feb 2025 18:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739558885; cv=none; b=FYG3hbrEWHsP7p8Em8sP+erzZebqwdGzHAQOlGCV6BITl0zRPlyIXjgBSvzlPSyLoUtaKFGOScCxvZSEm/idTzqwNIrFVLYI9O1QDpbf3bC4lBm2NFuE4jwC6u7fkB/IVfXMCR8hbic8XKJ5TyKqaWqFSEVlqNYPPJSDBB0SyPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739558885; c=relaxed/simple;
	bh=mbPXCYa0Euo1MoCU+SWGOw4OmTSsV7u/JIvOIPr+CKU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cPvYpEOkkHJMdEovZ01EZVoMK8gpzCFNieUvuKnNXNcOUWo9mCx5xS3PQ5hbB9liKgCkwaOsVgv91ig1Hrc85+LO0BZW02cGYZ85S4sbq8RkAydicSye5hy92vi64xxeRS/9q+neV31Xah8coRJwkhbVIuZkIQD4ySyeHs8Fa04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YasJWioE; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2f2f5e91393so526211a91.0;
        Fri, 14 Feb 2025 10:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739558883; x=1740163683; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mbPXCYa0Euo1MoCU+SWGOw4OmTSsV7u/JIvOIPr+CKU=;
        b=YasJWioElOE6Id9eXQUBxCUE5x8dcJ+EQMejVcyyNaQII29zfa70Pdj0me5pRPvWkr
         +vrnQXgNUcj3bsWZkTGtcwV/pgIOLcq/cw/OYvxVm9KiLP9j8kEpJEOnTLj9JXvG+VAG
         bmlntoyIB59SALEdHjN/KHNAWeIA5Dyu4CIAMGeTloL4iSqz9T8vVroaNxcPK+3nMZGB
         tSkYy5sTWekABYQUFwF4Q2Y0szBPGkwHJi28bHs/VmVs4ABLd2eVs5juOK8VWsQNCHBz
         3T4vrFunAlw79UZXgh8z8roT+w2fcfA7tefRSXNDmw4D05V51fHWQON2b+R4ENF3u2F3
         Jm3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739558883; x=1740163683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mbPXCYa0Euo1MoCU+SWGOw4OmTSsV7u/JIvOIPr+CKU=;
        b=PDTsGS6FXe4PPZPPfGtAlnToQVapDqn9M+F0Uu4MUpWPaGvM+gK1XWAq5eJUryaD42
         yiRUB+fn0uNw2+vRx2f+xIho+Vzth1YX1NfLEocpvoMFjlg1Dj0+Vs8d89TsBI1Fr/mM
         oQJbF2+wVBK4IvoUJiYc07AgZ7oigDzR4ixrJ/Ohkg9qibn4wAC7Ks2cvXBvURIvSo0v
         xvS8vHcyKDiMhsimZ3sycIEr65gRrfg4rNblCiUXekWqhuta85Yto7CI2TObAGWHTolW
         XooG1YUR5QMVRpHk/9JrWg3QbHgy3LnI3RLBJ9VBQHnt1FBenj4tptCxPJVbrh+SmIgu
         GvZw==
X-Forwarded-Encrypted: i=1; AJvYcCVzY6YlNCZpwq3xlLUKqEDIAG5FNtfp8UzwwllVhcmUnMaFbrl3NkZqnkZjo0TRdwFY9SG46/qiLds=@vger.kernel.org, AJvYcCWYgVKO4i3kixEKmWi75Ml26QrDuZn9KueaMZeZibjg9pQZcynlvBsql4v2xWmUbBHFcinDMn9bFe2vVmvZ@vger.kernel.org, AJvYcCWgdlqBf6JJ+bK7WjfyYEa43ycAwQ74w0nWO+DgVuJ5FVgw/HjksH3a010WdQvw6LvKY1bceUSzejeJBnWNlzA=@vger.kernel.org, AJvYcCXcLjeHPPmLPmTwN+wZ7dgtjgnkNRlBcFnZ6UAEJEBUmETVS28P9koBlC4HFiaXK+GzepeWDQz9l7npHoJL@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd8JeePVQts9dH6aBdZeUWhkJfqRvu6t9/lvJaa9NpUjKn4Qa1
	VAghqatIDfTKfeyR/Mp0RGYRVM5rSZp2FimVi/R+BuABt3DHfJtDl6+dpapFnRXzDC+sarV+R1L
	n3Xq5qOjcYRuN8FwrgU72TTWUHjw=
X-Gm-Gg: ASbGncs/eS3HdL9aqf4LHqcgd+AweX/KmwFIKFxyQDuQaYa8DYi8+fiFUxan7P/VPFJ
	kEH7A+B0+JY38f/Y8suLaGznAqQikWLo6oKjXrJXa3kv8E6ILM5PvlCG/PNGPCwYbuMjmYO9W
X-Google-Smtp-Source: AGHT+IGUeE04nboJL79uQEQi255Sh6F2ujsdzLVst5SO8l5tm1Su0Y1pKusKL+gCNnpOW2NARcGAkDEUDmt8oqZunC8=
X-Received: by 2002:a17:90b:2250:b0:2fc:1370:9c2f with SMTP id
 98e67ed59e1d1-2fc4103cd0dmr79419a91.4.1739558883232; Fri, 14 Feb 2025
 10:48:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210164245.282886-1-ojeda@kernel.org> <CAK7LNAQBFX5q6yyKBJoxMoD5d9SwdKm0c23J4+LpjwA1eh=bZw@mail.gmail.com>
In-Reply-To: <CAK7LNAQBFX5q6yyKBJoxMoD5d9SwdKm0c23J4+LpjwA1eh=bZw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 14 Feb 2025 19:47:51 +0100
X-Gm-Features: AWEUYZkFZsSwR_pcKDqppTTtKFiRY98pi3gXltfVmX7IBbEAqUtXPZHv7bRa5Ec
Message-ID: <CANiq72n=95jgJs17NFAkit5uzxqtO9xij9Um3ybd_RiMCpFrDQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: add rustc-min-version support function
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 14, 2025 at 2:39=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> Do you want me to pick it up to kbuild tree,
> or will you take it with my Ack?
>
> If you go with the latter,
> Acked-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks a lot Masahiro -- happy to take it on my side if that means
less work for you.

Cheers,
Miguel

