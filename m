Return-Path: <linux-kbuild+bounces-9492-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 31456C45EFB
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 11:31:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2A49188DC3B
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 10:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1267E30216D;
	Mon, 10 Nov 2025 10:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gc4DnVVO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E833054F9
	for <linux-kbuild@vger.kernel.org>; Mon, 10 Nov 2025 10:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762770388; cv=none; b=PSQTD02/wyRnNC8Pr/qJQIEEajmf8lGTDm5fFdRH0jGEuldk9QW3dTNDUkngOMxrsUP3uUf9IoBfPpfbH8k7WK5OhRPw/p62GjcDM+Bdx3dKyY7wrK2Omua+ja3pzC8qF4TR+2adGqBkZB46iirQsxqmgKl9b3k15TlP52+1n6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762770388; c=relaxed/simple;
	bh=by8TIrFWHwZKFzoVR4uqzhkqjIaA/Zdl/PpOV94g580=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l4ivc55EMxSX4glqAmHjFapQsayyUncv/7R8tft2Zz6FbWTB775OWhAYYNGl0leOR2YKhXlyPilFUmE2zivI1/mttLeuq4ZDqIRq1y7ENJbigQv6sTAmjio87a9AMqIdDTP78pVS5rEyalBvoUC1OL4EF+HAomCjonqNcL6JykU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gc4DnVVO; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b6a42604093so248554a12.3
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Nov 2025 02:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762770386; x=1763375186; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=by8TIrFWHwZKFzoVR4uqzhkqjIaA/Zdl/PpOV94g580=;
        b=gc4DnVVOk/dfuZn1UleCdaHXfRnTBzfLJQEG3n950vZW87rU9m7oAxZ9a2ka494it/
         non9nHrPdU9AuYzGS2fHnhhGXn1Vwc4WRIliZg1oRuNu5pw3Of2hnD8ssKj+AdxMhJqR
         FV6eFQmJ+GkGBa/ggp7yDAZJ6w1SLUAMJeuzwRUowqSs8weoa/4TAfZlsoGw+IBhlbgE
         xrAS0K7hX08X8+TM7OMg9SNn0GYB1WZBkvUh21OvIbmziYfKu0kWhyxNlu73JHDx6TzV
         k1APV1L1MBD36ThfwZVsiZU44NcJiGr3umtzinzo5o4DsTrZivfST34CBOIXLxsPB+um
         F2/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762770386; x=1763375186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=by8TIrFWHwZKFzoVR4uqzhkqjIaA/Zdl/PpOV94g580=;
        b=vHy4GEWbTk0sxJZGQpkRfGaVBGwRl/V7/3icIQF0hF7Xza8s6ACSG6jo2hC0BLGiPJ
         hMl8OIUsQoIdIuzd/goFW6hRVeFsnYHN4QSer02k61GiaNeTmuo5gqlUId4UX1i/4hU0
         P4hOcyZpmudls3Ivt4MwDJcf3tgmE/QdxUdlBxqMbNOD8YM6/xzLk6ha0b0Mzqc7DPly
         SduPbK+59BvVXCbQa1UtLOm/iuXKK5/NRl23nGZB9ED0HrFAxjJ9+Yi6xVusQZ0dp+lT
         9lpm4kq1dxO7h2a0AzFNpPyNXH8Btf7cQzS+VMBKUXZOBnPuCvPj3onUUrpuD771p3pe
         1jyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVB+t2zBNgyhMCprVsWQMhXCat8tgIrjOMvlCmmbLUAAlDilh3dSXVbxIp6ow9cCShNkVthmAip8MKyxy0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfgZekThr23MsIP41oNR+eh2ShjH3r/vxNaw0mu0p8O2/R1mRc
	ShxOcfc1kWRKHwn4dvzKv0LpS/UiQjRSKxe+CZE2QsRQRoeelveuVBFtEGka56fcsGvBEidCZIn
	iK4pm8cMveCJ1/Vp6G7d1mWZpQtjL4GA=
X-Gm-Gg: ASbGncuJYSK21OXFeo2buQzXa8ShLefSPsuPR31a3MNoXsewel5zall0SDXsg/8WtUy
	e95kVM9ibjxg3sDQDhtuDyKa/mQvq3dOOUlbk+aQxI0D86S7f7BRK+rlfqZ0xRMNRrSNUQuWu4T
	bCxhOmqAre97MQ3CmlwceHYLXhz1yZc4LT0k6UR2o2aKLm9iGn0r+7WUr6ivhcHKS0aPg7Op20x
	GZvjemr2jIhO2t0sVlB37lLgcLfrTYApLyNydESH5MxLVQwBt0K9Yf7ZM1ShU7XZgJ4rsT+eRJO
	eorBD2tGeLyaR+8iGxBt2mSHR9lZSllD7dlA8XBOSoo0QTQu4CtGKFwW4b4215mYtv3HB0iQcWJ
	nirg=
X-Google-Smtp-Source: AGHT+IHj/Ik6F63wXenE2lPX1U/3plGIyl6aQSJtE99W3m5oMNrVCs+apSxU4qv0V2MoDNiFGSAPl7exsm++cKNsBSE=
X-Received: by 2002:a17:902:d4cd:b0:295:a1a5:baf6 with SMTP id
 d9443c01a7336-297e56d674fmr53416745ad.6.1762770385914; Mon, 10 Nov 2025
 02:26:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110095025.1475896-1-ojeda@kernel.org> <20251110095025.1475896-15-ojeda@kernel.org>
In-Reply-To: <20251110095025.1475896-15-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Nov 2025 11:26:13 +0100
X-Gm-Features: AWmQ_bmNF1aFkVdyK0tmwwbxBOtgx8yYVE_IklxhPzUh7f2u3k4oJdZwWsz3eYg
Message-ID: <CANiq72m=dacZijsyb82HYRWc_PgzBOQA9YCSJQPOkUT1O-y2gA@mail.gmail.com>
Subject: Re: [PATCH 14/18] rust: syn: import crate
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 10:52=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> This is a subset of the Rust `syn` crate, version 2.0.106 (released
> 2025-08-16), licensed under "Apache-2.0 OR MIT", from:

In case someone is wondering: I didn't use the very latest since it
was quite new (even if the diff was fairly small).

Same for `quote`.

Cheers,
Miguel

