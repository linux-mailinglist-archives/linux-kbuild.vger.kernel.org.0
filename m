Return-Path: <linux-kbuild+bounces-1446-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DED06894F36
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Apr 2024 11:55:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A11A28212E
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Apr 2024 09:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43E1158AB0;
	Tue,  2 Apr 2024 09:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KsvBWpxz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA04E5914B
	for <linux-kbuild@vger.kernel.org>; Tue,  2 Apr 2024 09:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712051747; cv=none; b=r3c/lYQaD5fqIse3uuFUiCazcZS8TQLynylFb4e4FoYaSk1KHdFUgkmVWyostYzegDqaC5wDOfmrRv71aJ2BjQXHR+FVh16EEF2T6uyE+obLQxfOgXdyOtFj7jrgt78mAOL5Vm5QWHB1MnmGFDorYU8CZfoOUDYObfZDQhgxVgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712051747; c=relaxed/simple;
	bh=a+YljDVrbcAwyR/tcUOKBAwbhaSbQeo8lJMXH+opy20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I+0EcCJDeMzjjQGOryQsEcXWKLZKXuxzesHfahkBoxnRypzBBznDZPQMQi63qxE2ukZjXfB/5fZWVMXVcu2fvT+CuLOAnTP6ibq7wu3DlVhF5pyt8Bh6gyJcB8+GGs08iPv72zH0TY9dr0Q084uPzkjk8MbP5myHgBmQSWE76KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KsvBWpxz; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4765cffb446so1510222137.0
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Apr 2024 02:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712051744; x=1712656544; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a+YljDVrbcAwyR/tcUOKBAwbhaSbQeo8lJMXH+opy20=;
        b=KsvBWpxzvxZIGoUiZxoyoVLoBnnOQr5jJFGAmVj6Bcex884PDy5mjSF17mTEouKYav
         YL8DKHYIb1th5ZQ15mYwGhM0GdCx1U8+dc8SjF5ao7dkQUfmENfVzzEkPSdMpSTS1RVS
         yhHVhvePqYceW4HzwvFWhAFk2tJUbyr/wDLgJQuzTrrz5kicjj/bl/icy4SxmOsPN+Un
         /J+JdCRrjw1HeEGRKtjjiAMfgYQ79JVj53+/GkX6Aonx54orFhtm3Z/z7icotcunvbnH
         vpg8IY1kSrXtrC+ecIrcYqXkXOcgDuX27ppYT07j0VSq5vnRvCv4oYodj1EkK+r/fIsn
         sEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712051744; x=1712656544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a+YljDVrbcAwyR/tcUOKBAwbhaSbQeo8lJMXH+opy20=;
        b=KHK8sg6BPBKIF28boDd9QWQll2uF3yiRXh7cEEFo1ac/CfiLuoUWMALYXPkhr+hqur
         e1L+X0jdLq4oX5uNT5GcL9Xqm07/S1Jhyae7F1fnHJ07yT1BSfy92SAuxFFgozccGGAD
         N7UzbBAdJTQpzKf2K0oDbCXtfhBG14N6YrLotvYZGwAjvwSE6whvAB8C26FGmF31LekG
         U+pFBagNHzGZBs9kjVLQRnbl8QjMDBB67yrxhfqLx7CF+9Kg8N56M9zKDoXQtfEcXbeA
         SrobQeQv5HV/RSFABq4O/d+jBQrgmmmLxLez/zkI6lvXbeKIEtpRi1SnZGVOf5nP2e3L
         H3dQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8f6tGWNNOM8UIsGxF7e16oalKkdnjl82oYMzpqHE39kS/VmOl19KZNKdbmQpsbOTbLrY/Z629aIKVK3S50vSs/EzkLvMQp6+iyWDb
X-Gm-Message-State: AOJu0YwkoHxLG2GRLnfLMQ4uQzeiFboWqh/HTatOL6/A6JTm5JC2dv6L
	eLUmaViZuxiFtH+bzAGAUu/FiAy9pJVHxukW1SezOZch0yQm6IWo+DMBq2rWn6y8q+YJ1eMMviJ
	xi8JU1kYumOgnOSxyMh34piWAHy0U3D3x6vpf
X-Google-Smtp-Source: AGHT+IGv3VAH51GyjjtjsnXbb/DrFswdNA8szNO89cktWs1ewiqSuc3VC/AWKEjqHLDt3jRpmLOWygntlWniMVRckAo=
X-Received: by 2002:a05:6102:378:b0:475:fe59:f33 with SMTP id
 f24-20020a056102037800b00475fe590f33mr6501047vsa.29.1712051744314; Tue, 02
 Apr 2024 02:55:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240217002602.57270-1-ojeda@kernel.org>
In-Reply-To: <20240217002602.57270-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 2 Apr 2024 11:55:33 +0200
Message-ID: <CAH5fLggb8jr2yaQwcQFmrP935_h+SRPT=xH+tRQe7dngiLB2fA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: use `-Zdwarf-version` to support DWARFv5
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 17, 2024 at 1:26=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Rust 1.64.0 introduced (unstable) support for the `-Zdwarf-version`
> flag, which allows to select DWARFv5, thus use it.
>
> Link: https://github.com/rust-lang/rust/issues/103057
> Link: https://github.com/rust-lang/rust/pull/98350
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

