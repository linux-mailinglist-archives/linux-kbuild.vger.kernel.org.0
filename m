Return-Path: <linux-kbuild+bounces-1445-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C53894F34
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Apr 2024 11:55:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A75C71F25A8E
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Apr 2024 09:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37C305914E;
	Tue,  2 Apr 2024 09:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Oz2XrnRL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D785731E
	for <linux-kbuild@vger.kernel.org>; Tue,  2 Apr 2024 09:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712051727; cv=none; b=rO4o6XKgW110FPLfuZGerUjFyrQzG34ngIUxrZMFzputyBzgm3UUr6+rQkKzcxe+vjemzcgCPB7Os+06djMbT7Dbh7/EfVw8tHwFPx9Cum612moG/+3VPXBi47qFlPXRJrrDHYijQ7KMw25CHP7jtsaF89E1KvORvRS6Y3znhOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712051727; c=relaxed/simple;
	bh=J22cvATvZxVx1kfNpr32VC2EcIinbWlHC5PnuEWb4Ig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n+f3IpmyGhm5AulR3GWY4Keg3kNzrJ1d8D48oxl5cQYxOeu0V6gOi6wVUWqd7lYnWm2OoDFrLNamAbvbJwR2RbrPR40v4DNbBd48TdRJqeeeajg8Bk5ezffvG4WByC5oe8EsR+u/vloyaI2RKmRhQFVp+Ufg9Vbtg5tU62vnMNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Oz2XrnRL; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-7e376672375so527874241.2
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Apr 2024 02:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712051723; x=1712656523; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J22cvATvZxVx1kfNpr32VC2EcIinbWlHC5PnuEWb4Ig=;
        b=Oz2XrnRLX+uME+CBSziLRCDVpzIln2BK/DBu26vVhVX6Tv8+nCUnLNErJS8FKzUj26
         xDs+4yWjE38qeGTM6be0uy/EAku7++qscR5wlNHLiAeWRbdFO3oNZ9z4saRqOdkUrje3
         8guI2bdSRiayVsKYvxrh64OgIwFkF68zsnLj6W4oylGnuKJ8YZmEfCHqvHCbOex8AIjh
         HyaNNUNvLSwU4sNDSY5Wcpc3eC1Ju0FiH7sJnGkIYdISzWj5/iP6Az7TKRiG28qK0Min
         1oTt3KugWciJN7cYiLKLubnQsjJhwNrPNXiTfC79J4+JsRRaVRfV5J9XwZlW4te/yRgA
         9CSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712051723; x=1712656523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J22cvATvZxVx1kfNpr32VC2EcIinbWlHC5PnuEWb4Ig=;
        b=sBLwlOA5TokyotJGhmtWlGoZ8gGT6v+YZxjutM3vyzGFoSlaH1vX4yZVxjs1U/g//T
         i7cSjKABZTa5k+sODrs3hNb5aD1N/dXXhYJ0AC3rLzsMgNz6QOoQZ4MHT4/Wcsx8OQB8
         2ecVLfUwiZPJnGAI3ePxrtc0+wAKp8x6srGidK1SQkLZ46Ft8Kis/Ip8gxJ4J2P02Ehm
         EIMA31LTNRkFu6+i/Xb324KIiQ05svx+wNARpVFiIi3bX/zlUhyiU+9adkEF1lTHl7VU
         MSLP446zDkNI1gR8V1ZWuVwLNs4HzmHHujYgAMN/I1e1Hmmb2mnJVhnPZHDEYUIuKkWM
         jSwg==
X-Forwarded-Encrypted: i=1; AJvYcCXhNdA3GCrkOFH2T7N8gyDTCnV/JxoIUJy0EPVbxt8p4PfEuR4l7lbnvnofn/bR3YAbPr7+NU0kUyeIWxMc8jKCH6uvwx921ivSU39O
X-Gm-Message-State: AOJu0Yyfv5qzVKesopGBISf9Z6BSEDRD6OtPrLfH5C0JdzHVPp5KOOZS
	82qE6N9winHk+wf2YZH0WUjhwodGcym7E/G1kuBp+TcmmmLylQWwzV4I7Niwu5sTVfnf15QYdJU
	tqc/jSuTTpxOPeESSQhHpbqLfuvqFHH2tfZAm
X-Google-Smtp-Source: AGHT+IEcu9bQPdWBbDR9srTAs9tC4rp1YEcz/A6uAognyfQwZDUdoacCnoOivbqDRFhPJKKxEQgRVosZhNrjILkSNkg=
X-Received: by 2002:a05:6102:b11:b0:478:8119:a040 with SMTP id
 b17-20020a0561020b1100b004788119a040mr5557763vst.14.1712051723373; Tue, 02
 Apr 2024 02:55:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240217002622.57322-1-ojeda@kernel.org>
In-Reply-To: <20240217002622.57322-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 2 Apr 2024 11:55:12 +0200
Message-ID: <CAH5fLggsHHVsuXgzHF4eEpScDTp4pUwaq60tTi9CyL5JfuTFtQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: use `-Zdebuginfo-compression`
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
> Rust 1.74.0 introduced (unstable) support for the
> `-Zdebuginfo-compression` flag, thus use it.
>
> Link: https://github.com/rust-lang/rust/issues/120953
> Link: https://github.com/rust-lang/rust/pull/115358
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

