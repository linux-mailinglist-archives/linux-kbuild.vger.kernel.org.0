Return-Path: <linux-kbuild+bounces-2742-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7A8940E41
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2024 11:51:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B00B28821A
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2024 09:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 725F3195FFC;
	Tue, 30 Jul 2024 09:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SOSD2aEI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF71C196C9C
	for <linux-kbuild@vger.kernel.org>; Tue, 30 Jul 2024 09:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722333079; cv=none; b=m/BD3EU2KtofCcy7HKXqeZs1YIqX1MqXiagFyYInOnay5IBnftKKoIiPK29hzQ6FzWZoY2oUcKSw58o/itZlEnas+HL3Ir316X4ksbnZbInIJrf0ORAbUySQqokUOlQTF+3naA4gPqa2DbTB8hMdvhfEpyfA10XflhE5ZWSI8nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722333079; c=relaxed/simple;
	bh=pG0/q22Jl93ehcd5L6RcUyPD4cxH1wdOucz6oiQ7oEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PS/RlpKiirCtq6tp6AOTw8RousVonCyF0WIiQZjp5SFEMjHjHo+upHrVL4vrIK9e4GJP0Il8Q7aUnaJ1ee/rTob2OQXhvWGlRqmATSQBnqheJEJT1uHNZn7FAiDAEAa8Wu1/Vhr9QslCAzYxo93yJ++iQIzKrnYQfIA8UEK2L2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SOSD2aEI; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42819654737so19662085e9.1
        for <linux-kbuild@vger.kernel.org>; Tue, 30 Jul 2024 02:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722333076; x=1722937876; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pG0/q22Jl93ehcd5L6RcUyPD4cxH1wdOucz6oiQ7oEY=;
        b=SOSD2aEI9Y6QCL8OQZuej2rMi0QGlDnHJnIpWyz+DkoLPq1LzWL2FL5XzV0CE+TRad
         iz3wg4WSo4yCn2LlwtTfZUuVj8FmUChJwWixd/oOoudRjDGGUzC6PJd+YK0xQ2mU3qhJ
         4+G/rd99VAi4RE7KBVCdEYOPIv1hd5r2woo9THGWX0sATBTMF8xUg3wpIDSjU8gSRegn
         ilQk/LWTOtviuKP6r7K7f3yIJ1qw5x7iMj0fzuDhemtyiw0Yz/P9F36Aw8mkkXAmtSxJ
         OzSkTW9OGBTENv7l90jVF68NMK61EvRnb8eQnq/pYAh0CW4aQRKZXmDkAk95S2CCp4tK
         uc3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722333076; x=1722937876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pG0/q22Jl93ehcd5L6RcUyPD4cxH1wdOucz6oiQ7oEY=;
        b=pcpjd5r9AnOtrisUMxt5UMNf5sSdfJDZcf0AxR+4TC0UIUO9DmrYdFEYikqS4PmZBx
         f9h4nFmMujTj4HRrcu/L7VJa1v97Z33HaCy0UTvV0tZKVozKohIHpU00c3PofWTN32F9
         wq2Y4+0ONfPoiIhMisFCC4aVnGTkFOTBoDIlT2Yb4IQGFJM3B9xkELO/DOIyUumXhvjJ
         f7h9gyois5IcqIP2CwR3xDFUb41AWFk/dMQD2bozadXDp0J7O8T0BosOL2F/t4a2LYGi
         PiCN0nOLvJCJ8mcCEVe7xnf+n1bN760BloKLsdtbtT96ZFre67tdK467iFbuEaIqQf1t
         OlCA==
X-Forwarded-Encrypted: i=1; AJvYcCUtt3oTxaAWUbbVK4atMEy15E8+SlSTjMHN+aoW3o7JC8e5jtzOJYCmmbs14ToX43YNrufYMHxFhJyqVecrurRsd2BETnMSG8jxotFc
X-Gm-Message-State: AOJu0YwU/z+dP4qSJzZObkbEErSnD2rCjotAc0Qsrx4HaOEZb/pRkmsP
	qsHipallqALFQ8eC+aF3/QJf51skX4X+2ZJtwZ1tsoqIoklkojBqAJzyYySae7B9zbt/yASy4WW
	3ko0A5gFE/0Ap0Bi5JY4eFTHjkPM+n31KJ2Iv
X-Google-Smtp-Source: AGHT+IFP5k+X/a8etFEgTfWg0cxDTZKAXEQzGf1YY1CabSPV9fG2FeY05fu9q7Y4QTzlK3SCKS05MTgrpT9lmBurHNk=
X-Received: by 2002:adf:f7c1:0:b0:368:31c7:19d3 with SMTP id
 ffacd0b85a97d-36b5cee3060mr7555279f8f.9.1722333075916; Tue, 30 Jul 2024
 02:51:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240730-kcfi-v1-0-bbb948752a30@google.com> <20240730-kcfi-v1-1-bbb948752a30@google.com>
In-Reply-To: <20240730-kcfi-v1-1-bbb948752a30@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 30 Jul 2024 11:51:03 +0200
Message-ID: <CAH5fLghz8psC499vVochcW-jC+utDXQonoAvwc-9Na4+31Hdig@mail.gmail.com>
Subject: Re: [PATCH 1/2] cfi: add CONFIG_CFI_ICALL_NORMALIZE_INTEGERS
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Sami Tolvanen <samitolvanen@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Kees Cook <kees@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Matthew Maurer <mmaurer@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 11:40=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> Introduce a Kconfig option for enabling the experimental option to
> normalize integer types. This ensures that integer types of the same
> size and signedness are considered compatible by the Control Flow
> Integrity sanitizer.
>
> This option exists for compatibility with Rust, as C and Rust do not
> have the same set of integer types. There are cases where C has two
> different integer types of the same size and alignment, but Rust only
> has one integer type of that size and alignment. When Rust calls into
> C functions using such types in their signature, this results in CFI
> failures.

This should say signedness where it says alignment.

Alice

