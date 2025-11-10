Return-Path: <linux-kbuild+bounces-9526-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2290EC482DE
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 18:03:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1367421BD4
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 16:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F166F30EF62;
	Mon, 10 Nov 2025 16:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LXCIop9C"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0BA31618E
	for <linux-kbuild@vger.kernel.org>; Mon, 10 Nov 2025 16:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762793345; cv=none; b=em9yv4TLa3NldxMhgldCJxc8QJ+Yd8tWkGKXFcUwvPfCYOT7V1CLqxWWKX9/bSxWNASId9LcAl3P685StSNTElRzP9esU6E9xyZNGHD0SMGWnZHxlBPqzXinmyK3juMrqzJHCvmKlWwXaql/AXqO4oghGUWS6L0j1bxjWI066n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762793345; c=relaxed/simple;
	bh=WCn2M9Pn98zQCwXGhIe94Mp208rWyyDEa7Ij/HDRHtE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H4iGN9zjyaOwshXniDCm4B7BZTLoRCxRm/QBd/27doV6OZjsFaBgIV8bnXkKCBPcBPJmobOp8nAWidmbO0rnG2mRpIgNPeKQ+BrLLkRe1XOVsZLBpsnITtMMDpAFlCUL6fcr6ml0/ncYvYFZ0tartZb3ZNFzuQSfGzM9TZJ/cgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LXCIop9C; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b9a5f4435adso259979a12.3
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Nov 2025 08:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762793343; x=1763398143; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WCn2M9Pn98zQCwXGhIe94Mp208rWyyDEa7Ij/HDRHtE=;
        b=LXCIop9C9154lwZg3Trtm3kb7fxgwtRrx/MWfU21BhkvGi1QP8dHv3OAgCWJtm01hK
         sQzeTMCj9AAr+qxes3HBTPDDwt+FhNNRhgoZPAoUJF/KDNwqjy9azSHvI5ez49Oi5W/Q
         cRe9LcY2DZJfksaFhejhBVfAJNu57XIA8qFIn7VzWA3LWJ3Ett3CijAsRTTpzEgEMi50
         X7Ccwwxua/Wefi5U9121aYnrM9GinZ2kc4vZF6bOmH0rFAae6lb/iLvfK8iqdpkNIyYo
         NBF/v2yqn7x6o2qKP0RxJ82yYoFHS3LM1V6sEPbNEzM4Gcdw8a/BO9otQvGHsEEtTdb/
         svHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762793343; x=1763398143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WCn2M9Pn98zQCwXGhIe94Mp208rWyyDEa7Ij/HDRHtE=;
        b=Kx6EmzFmAY4siwlqVdDl/oBWbRZ5mE3lZTWLSpcejWChI4ZZI7moGCVM5ihVc5+suq
         FQufLqVcEZ0PdLjHDXlB5tnEdLf/taLQ2sj0XHPVzpDMu7AoYRhMFBv+uK5ZCRZesoyf
         FMSAwlapKPpLA/1wIxlxSzJtyZpbEacrFpAdFXyYFsjP4WG/XHS+zIzFV29BiPg86G2u
         b3qzoSIokJkS0YLVX0urDNoPHF/zWXqiS7KZgdJZheCyuinGBnBfQqJP+BHbWQLYd3U2
         fmsChMDgGJ5cyK6tnxvmas/NvZ4kIlUnkiTF8hnvUNyAxEhI0PbYJlYeX5Zbt6RIn+wZ
         mgUA==
X-Forwarded-Encrypted: i=1; AJvYcCVxpT9YguGiBB/CTlq+hW6HKGPTYDFSyveAA8jbRRgZrAqDMrnFqCP+AwA/qp+q0Y7gZxQKirGz6JGR07E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2Cea4lmQBpyf8ww/xXiGmdlWNzkLQpegBRJhN584LRvgzSWQw
	VSUSRaF2EUyrKKlU/nAb6DlGpgfl6b22T8kDx9nvn52bxx3kGlufPY0s6GI5f5fLknxxL+wj/Yk
	eTe6YWRnjWT1B0s22x0Gh9gxCKeD7NhU=
X-Gm-Gg: ASbGncvIWUrcbtT9wa6VLUuBoYLyBo81a9EW9wcZljGTXGurO5pZAd2ng+5PCFPtNIq
	RxmuTz1f0WGOkoaQCCvzEtzrnzViPyrXUiKjf3KjDVaUB3nS60rMOHtatPP5L99RtShxdu+PdBk
	+T2HS+Ccqmt42yNQdnuamfeixP/0GX7KbUWMFJLhPnU2hC1eRbem0D1Ri0hZ55Svx31EDEk+e3e
	bGCkCsuE8Fg5olvueIN05smexzzzYzO6+UVAV/jwLtl6G+UY1ElYiefTkmknJ3rophIstskZ8rq
	aelZOflVF2ppyyoTCkDMMshtjgw2oQdYx/y+qxAqsqi6/+6yqTTvzrnJyJtwGq6TAag7ndMtGKZ
	UjgV1WEpBcKMfeQ==
X-Google-Smtp-Source: AGHT+IH5I1+eyd6kWRNYzgBd7iVcE03A1u5jBf0zW8VtsXhcRPQLzp8sRacyFb9Hd3dmI6N+ld/TjvRphEHH4nekiBM=
X-Received: by 2002:a17:902:d506:b0:290:ad79:c617 with SMTP id
 d9443c01a7336-297e5611fd3mr70148695ad.1.1762793343249; Mon, 10 Nov 2025
 08:49:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110131913.1789896-1-ojeda@kernel.org> <aRH9Tjf0tszyQhKX@google.com>
In-Reply-To: <aRH9Tjf0tszyQhKX@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Nov 2025 17:48:51 +0100
X-Gm-Features: AWmQ_bnW52r8h-0gmyLN7ivgaSD0gXN5MS8PTRXx5xySmJt3bBV43-xYwc4HHKc
Message-ID: <CANiq72m4K+UZxodnKqdx3cowbYB+Mj_Z0gB63j=3jE+E-x+3UA@mail.gmail.com>
Subject: Re: [PATCH v2] gendwarfksyms: Skip files with no exports
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org, 
	Haiyue Wang <haiyuewa@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 3:57=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Is gendwarfksyms actually present in 6.12 upstream? I know we have it in
> Android's 6.12 branch, but I thought we backported for Android only.

No, you are right, this is just me being overeager. It should be:

Cc: stable@vger.kernel.org # Needed in 6.17.y.

It would only be needed in 6.12.y if someone actually backports the
feature (which does rarely happen, so I guess someone could have found
it useful since there is no Fixes tag, but hopefully people would grep
the log in that case...).

Thanks!

Cheers,
Miguel

