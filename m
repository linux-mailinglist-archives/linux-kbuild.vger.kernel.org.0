Return-Path: <linux-kbuild+bounces-3579-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D893197A3C8
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Sep 2024 16:10:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 820ED1F227DD
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Sep 2024 14:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFAA5158534;
	Mon, 16 Sep 2024 14:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="brD82AIN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AAD158A2E;
	Mon, 16 Sep 2024 14:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726495643; cv=none; b=SgeuIH7Ow3ZJFSHyCf0stXYZTyBl3nip08lAxdVO2qUz1m1DnZ6y5/QF+MbeQLDhe9AhEm/WnoMNZOMfoDYVIQuvz63eXt4+wxZxtyzMEMMtQCP7XcMff3iZQ1iYm1fPfJQ9vVEwyggDcf0B9TO7X5GSzvf9tlpeQBIjDp55Yi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726495643; c=relaxed/simple;
	bh=Vy4NWQxV14tmm7JrF6hlWYF5qUYH/NYLtBrvhuX2SDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rx4zQTNewoQO7TwbrIfMuoBDvGfocmIV0TNcTdZgw154lDIdBV+p1zegZfexnaqaX+YJwnqKfWbIFvimRhmO9anlfQ8AVl6xQQDGdeEWlpqgqQbwoCc+RxWo2aVadiQFApruIr7Shf3iQ7HydNn8+Vda+pjlyOtEIMAx5xaJmBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=brD82AIN; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2da5acb95d2so701979a91.0;
        Mon, 16 Sep 2024 07:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726495641; x=1727100441; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/aw0uqDaf8ksxtLiKLqNDtMcY0LCWVs6aYfzCIFqzKQ=;
        b=brD82AINJSLW9lqvyD4zRpaN6GztwwL17PiVqfuHsaO+wAvH4WbguibhDDuRPtnv0s
         kxPcGjQdRfzbZ0cfP2mbiP2q5ODOa3nF/NbQTMmRc8nKhfL2j+rfM61fpaCiGeE+IPzs
         JPZoMkRTzEYGYYn0KathqSQthVYaxHJAWQ8IJ4GJ7wpigalTl9vu/2BGv+x0yR3pYZtH
         U3Emd/6dK7MxvIfIgQwWIzv1s1apGYU1tg1GlocWI66SaH4huIG5yBAYLlzGwUG9VtXx
         p79nO0mBaxnRhdF7kG+j0fhbE7KQCMWBS6M0Ie9m1cjENv2xIskgibx1S1KNdtx27PrE
         kFdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726495641; x=1727100441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/aw0uqDaf8ksxtLiKLqNDtMcY0LCWVs6aYfzCIFqzKQ=;
        b=exktyw+3EPSEviwrrzfY+n/Y8UXclYhVkY6mZf50EJqr7zqnhUzYC+gplk5yynEQTd
         2+b69zwRVmQ9tqY3CqKl3wUmJnvL6m6LOGh4xeo9M+kqv0ZuOIgEvHcMUSBFgVdA853o
         g7FBSkkefScyLz1wbLkXKtsww50NYQF8uOWYbFMOBTnB0mEkesr+IFB2WQDh43bnFG7f
         dsdBZdGw2bJvp6seRMYF6tzXmwNo7bZg5seODkahQmpBqWNZc1TYKpSy9tve0BLZoIFE
         K0BGxLj0X2I/sb5QOVEEkoHO9s0b8MqcbctTIZc/bHz/27HE3qfPK1QYG+4Lm5Z05YD7
         g+1g==
X-Forwarded-Encrypted: i=1; AJvYcCUMN08Jbgo8c/ofB6U7IHKEG8ztcX13jUy0dpXnqoNvQEZHUDd7VqMsHhclVc4WVcb9VRzG21xQVaAJoAM=@vger.kernel.org, AJvYcCVC1PAajoDw2XW+cCRUJDZNaiu0Vxt+GSqScEkXaXzgX8IVDHZU/lADCYa4MDFqa3AcpPnnn2dIlBh/xbj4B8k=@vger.kernel.org, AJvYcCXGmXNPORQ4eh2UhNTuYsCtIZpSASD6DNMgkvehahDAVtZ5IkVZBGGrISgBYVFMXcD2x+cqMeHR5MiPNiPZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1dvPFqAYVtJjz9h8obcS8dCTHdYQ2zEb3AW2Kz+jyOeviqaPG
	SxrYZw9Xt67PODePpCVCAbQGfGlxqG3bI+opG/j26bATL/u0uMkEu+BIH1oWKB+mRNuW+0PPCIo
	I2OctNVTfjvL6gE7kU60Qmabbrf7c23JjnZnM0w==
X-Google-Smtp-Source: AGHT+IF9g+RfQd6F6wIRrFUOOAQW/s/rg2u5tQq2iisn93XRBR1UU+bMKSRkJItSw7iyL4k0psmVMhvNwwclbyjVwFI=
X-Received: by 2002:a17:90a:d806:b0:2d8:8254:b913 with SMTP id
 98e67ed59e1d1-2dba0014995mr7719970a91.4.1726495641171; Mon, 16 Sep 2024
 07:07:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240801-kcfi-v2-2-c93caed3d121@google.com> <20240801-kcfi-v2b-2-c93caed3d121@google.com>
In-Reply-To: <20240801-kcfi-v2b-2-c93caed3d121@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 16 Sep 2024 16:07:09 +0200
Message-ID: <CANiq72=B9NmC=1eSaOrg7XutjueQsSXGcBQb7dQFPuL0SFjPsA@mail.gmail.com>
Subject: Re: [PATCH v2b] rust: cfi: add support for CFI_CLANG with Rust
To: Alice Ryhl <aliceryhl@google.com>
Cc: a.hindborg@samsung.com, alex.gaynor@gmail.com, benno.lossin@proton.me, 
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	kees@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	masahiroy@kernel.org, mmaurer@google.com, nathan@kernel.org, 
	nicolas@fjasle.eu, ojeda@kernel.org, peterz@infradead.org, 
	rust-for-linux@vger.kernel.org, samitolvanen@google.com, wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 9:55=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> +PADDING_RUSTFLAGS :=3D -Zpatchable-function-entry=3D$(CONFIG_FUNCTION_PA=
DDING_BYTES),$(CONFIG_FUNCTION_PADDING_BYTES)
> +KBUILD_RUSTFLAGS +=3D $(PADDING_RUSTFLAGS)
> +export PADDING_RUSTFLAGS

It is possible to have CALL_PADDING && !FINEIBT, which means one can
trigger a build error if the compiler is not recent enough. Should we
test for CALL_PADDING here?

> +       depends on !FINEIBT || RUSTC_VERSION >=3D 108000

Cheers,
Miguel

