Return-Path: <linux-kbuild+bounces-2251-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0790917A51
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Jun 2024 10:00:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D94C1C237B6
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Jun 2024 08:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0641013D2A4;
	Wed, 26 Jun 2024 08:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o0CVrRrh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528272869A
	for <linux-kbuild@vger.kernel.org>; Wed, 26 Jun 2024 08:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719388829; cv=none; b=ssR0EXdzctghSGP+xVsi4OaNrHoh1v/qZ+IyfHhL5lxtGnqh0Ow+l4+Vms5TYsm+e3Yfe6HZ7pHs5aIFbwlZnpY38QADpzHZQvJRHdsGWnuTb5swGHps/jBB8JrgCLbVGndebeAAjSKW6v0y9FRh4JI44gt9d/kRlLHQOuDwxqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719388829; c=relaxed/simple;
	bh=laZdbTy8eS9uMajVxpeJfWljM4iIqizSdOix/w7vFms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OK6+R6La8FKK/yYU0rK8RABEU+5Sf9fOFKPlQZ3V0YAzllWbgeDKDA6qNogmBj0YPecPJSJjAMT87VlddtFm7+kkyHfYbZzwfMtZ2TE6ooGKDYewPuUUEpg4C4d2ESVRvJ2vOFzeogzCaYHS5OxUc8ylZsk3WCVzHdc6oMrcJzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o0CVrRrh; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-424a3ccd0c0so11989615e9.1
        for <linux-kbuild@vger.kernel.org>; Wed, 26 Jun 2024 01:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719388827; x=1719993627; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c7Q3IkL803SLgV6z8ys88NDBo/QBGmu2fV4E89499Ts=;
        b=o0CVrRrhb5ZLM9bzN1sTl9O+bY9xcyUtHVc8sWX809V6g1W2Emoj9IPwHWybcPzOxf
         4W/SF2elxL/BDVTVrFE13ZLQsjPtBgxL3W2knCwzEuSFbgEDKJpH/a9bh565MMu+Z6d7
         fjETgLd6BvRcpLiwik9sBhtFEr0Pg0mCWYRQNMnBVV9BHM48vm4r7BSLuzBkCXn34qXy
         1+XMA81TZZaXiU/4j+/re5uOuHWu/K7pLS09dQl5fl6oag/yXtH8UQL1Lgb6DC8r1UOH
         mwSVDCeljHcWYDHoTUTR3FT6UCArEx1Nf2c/l95HamIEkJBP+cuwZZ6VGyPyNil+jki9
         eTqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719388827; x=1719993627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c7Q3IkL803SLgV6z8ys88NDBo/QBGmu2fV4E89499Ts=;
        b=mz0S6WTkZozW8WpwvkX7DxrdHxk+zZvFLOWBjqqE4DZ6j7lSuqTnc65t+GAa71LkGT
         k+mQVHXE6g3qsWgfofa6ku/qW7XaSRrloimHJx449WDQda9vmoEXShHCeGZgr2aKnmVs
         nbGCUFk9lE/d745VKQP8w7qXIfqsSECK9i094FmTkj3j20865roJvVUEQHtACghf5AyD
         wPeY1hxr2vRiKwPxZwbge7aibVxgnaCjKMNvjBcYz3RTyO2hwz+7rd2Mo4UtjJzf8AGz
         KivAmeBEOwmEOo0XdF6GMiK3vej3ERVWhWbZONpBnsIDqFR4TBNLze4c2a0e6Q34qbkK
         IObA==
X-Forwarded-Encrypted: i=1; AJvYcCUf0hY0bS/SOfA58T8zhEth7CyXLSQXUZWx1NODSZJ9V3gGukCxgHgnCFmaaB4LmOAtuJeNde4xdtyid3hMjfdUvW0MF1A/qQFzeg5D
X-Gm-Message-State: AOJu0YzwaEPR9E1iMI2ICKOAbi53/8kV4pBRNCZM+DyuTNMkw4ENEDPB
	Ucd4vBGs9TJ8+EqZqXzPoDM77f8FkRWsJs8mSxgjercGpX2FkF6ZNCmfahOe27lv4vkxnWL1WPz
	8ZpU83zD2I/OohkbG3QAIiGGQ/w+SOgDfYqts
X-Google-Smtp-Source: AGHT+IFItsjk1ACcla1EuGTcJ4heCic6G2ZGhg4p2ESBoP/ZiP/at9PWI6/wNvCL2Qe05EHwd3WiOnSuoZHosj4Yh7E=
X-Received: by 2002:a05:6000:4020:b0:366:e991:b9ac with SMTP id
 ffacd0b85a97d-366e991ba88mr7267698f8f.14.1719388826333; Wed, 26 Jun 2024
 01:00:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240620205453.81799-1-jhubbard@nvidia.com> <20240620205453.81799-2-jhubbard@nvidia.com>
In-Reply-To: <20240620205453.81799-2-jhubbard@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 26 Jun 2024 10:00:13 +0200
Message-ID: <CAH5fLggqb0nDLAD_fWgVR2vV7cvZXiR3VskxMSUAJPdLh1PNZg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] Makefile: rust-analyzer target: better error handling
To: John Hubbard <jhubbard@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Greg KH <greg@kroah.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 10:55=E2=80=AFPM John Hubbard <jhubbard@nvidia.com>=
 wrote:
>
> 1) Provide a better error message for the "Rust not available" case.
> Without this patch, one gets various misleading messages, such as:
>
>     "No rule to make target 'rust-analyzer'"
>
> Instead, run scripts/rust_is_available.sh directly, as a prerequisite,
> and let that script report the cause of any problems, as well as
> providing a link to the documentation. Thanks to Miguel Ojeda for the
> idea of just letting rust_is_available.sh report its results directly.
>
> The new output in the failure case looks like this:
>
> $ make rust-analyzer
> ***
> *** Rust compiler 'rustc' could not be found.
> ***
> ***
> *** Please see Documentation/rust/quick-start.rst for details
> *** on how to set up the Rust support.
> ***
> make[1]: *** [/kernel_work/linux-github/Makefile:1975: rust-analyzer] Err=
or 1
> make: *** [Makefile:240: __sub-make] Error 2
>
> Cc: Alice Ryhl <aliceryhl@google.com>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Tested-by: Alice Ryhl <aliceryhl@google.com>

