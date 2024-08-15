Return-Path: <linux-kbuild+bounces-2995-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F06952CF1
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 12:53:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 321D71C2124F
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 10:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20AB819D8AF;
	Thu, 15 Aug 2024 10:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MqHsfrr6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A151E63B9;
	Thu, 15 Aug 2024 10:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723718781; cv=none; b=D3ABNapM6Fvo3JBtljdQZTkSwZJKedHdMMJpCywpBHxAyuV44yIIsDKb8wd2qxxdd0y7fPB15d3wBWxKAQM4XQqi/ZAKdhJQxl1PqrP2E0wkrdHZqL8ZLBb4Fu7KpRkc8K0QD3YS9x03TFLxdYMjlTZvHVnCo6DnCq9Ajz0C8g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723718781; c=relaxed/simple;
	bh=1sfbKjdp4XRog2yKjWO0bUQvIN3BaMO0GVafmW1NU8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cv7O/bz+eydmLqWEhuDEMg1EFeYqYJtDemCgji/5EwfWCK3OVa1QKb6XYw8cMH/gRwBFAd9hb3+YSU+fNEuCkH++x08qiUcpV3bmYjTTNc3viOrVpY7uNOig5tws71E9r/KPvr7nmSx2yDXfLUJc2IouhyDkgRFMvErfKI5WMss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MqHsfrr6; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2d3d7a1e45fso48431a91.3;
        Thu, 15 Aug 2024 03:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723718779; x=1724323579; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1sfbKjdp4XRog2yKjWO0bUQvIN3BaMO0GVafmW1NU8g=;
        b=MqHsfrr6TMU6ykPkdIUxDz9qt6T3CFYgpBmFdaAMg1J7R8FIA9VdFPYK8PmVurxUef
         1puBcLUGeCF8r3B1bqWL/JBvjNjklkuS+npg6GTL64q+onx6g9PMzBn+3hHcwZgfCGuY
         S1QIYr9nNeiArvqj7rS5dIj3zJskFNudsmwvJYvu0Z5+/nZlhxmf5Yww6RMhyUyDkKCQ
         nbqNO+GoewVWHMWLgNzPOptPqB0wNS6/CAlWZ5HNXr06S21VVbF4/Uz7AMTUHaJOE2OL
         2ibkMroBCbD5gVq5SXWyYUKzUI4tcghasKEOO8N+ye/jfG7KJuVSelZrcfmiYnR1TAnp
         /7aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723718779; x=1724323579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1sfbKjdp4XRog2yKjWO0bUQvIN3BaMO0GVafmW1NU8g=;
        b=i2xNApqsRKWLfIGXMt//BDH9Hp+0gI/qHkRvXsadiPZHgwddlxrZSZgO187mCARPNb
         7qd+ADO85SQ9w4VUwtGEIYCLp0nMUWu5GbXmvewZYB2P45orL6Z24N84R85WqG6os6fM
         lj44K/Uqh2o3ezap7U9ujZ47jYc8HB6ehVaO0kur7vD4BBBENkXMKG2BPnOjUJ7+lLEi
         K1Ng8r3Bou3RA4zn4/NZWVKzz8QsbXFtxDAMsLGl/xCq/uFo0A4UvNb5wtPV2fr/CiPA
         1nlTUi4qj5T1JXfdFVOR3/g4tS6NuN5mmev5VfA+qXud1H2f/LS1PjOVgH130ca7LtsI
         9mZA==
X-Forwarded-Encrypted: i=1; AJvYcCXNARoklyXWVLfwQPMpQlwTPsJa7TTg9Aameb5WulKdd9YTCnDIJ/2N3kNBrMCygHCXAH3vysPAX6vVhlIMhSV/EVxcknExiQxNL8vK5HGLdjZTzuv4FKQK3QQE5619a8x1y3BRPaPC1Ij1f2xRCRAjS7ti2uHAqLnLk6My7BG5odhxWDUotPpmJ1c=
X-Gm-Message-State: AOJu0YyCcRLe1LZeuHG/vlcx/TvGrUgnEVSgbDFVncrNc0tD4Uyo8qo5
	T0Mb59PeuDRu65woJFCNeZs6PlfQ0uqVn85TJCB6P6DiBMfIKFG1glBPRTzIulqP9/2mrvU8vp3
	WRewVK8pAv7mf98A1qwMB7VVvxmQ=
X-Google-Smtp-Source: AGHT+IEkDpoHQO8PiumSbbuFNNw7j99PaZOalClSde2pdVQtvR9e7Iw1n+/82n4QXPa6idpkYV8tRKK1ntNzdRaLzPs=
X-Received: by 2002:a17:90a:dc0b:b0:2d3:ca3f:7f2a with SMTP id
 98e67ed59e1d1-2d3ca3f9420mr1572666a91.22.1723718778823; Thu, 15 Aug 2024
 03:46:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815103016.2771842-1-nmi@metaspace.dk>
In-Reply-To: <20240815103016.2771842-1-nmi@metaspace.dk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 15 Aug 2024 12:46:06 +0200
Message-ID: <CANiq72kfO5-HgCJaPJTX2dLhPe7nw5D1Aqnn28F3Y_Y0EM01CQ@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: rust: split up helpers.c
To: Andreas Hindborg <nmi@metaspace.dk>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	=?UTF-8?Q?Sergio_Gonz=C3=A1lez_Collado?= <sergio.collado@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2024 at 12:30=E2=80=AFPM Andreas Hindborg <nmi@metaspace.dk=
> wrote:
>
> From: Andreas Hindborg <a.hindborg@samsung.com>
>
> This patch splits up the rust helpers C file. When rebasing patch sets on
> upstream linux, merge conflicts in helpers.c is common and time consuming
> [1]. Thus, split the file so that each kernel component can live in a
> separate file.
>
> This patch lists helper files explicitly and thus conflicts in the file
> list is still likely. However, they should be more simple to resolve than
> the conflicts usually seen in helpers.c.
>
> Link: https://rust-for-linux.zulipchat.com/#narrow/stream/288089-General/=
topic/Splitting.20up.20helpers.2Ec/near/426694012 [1]
> Signed-off-by: Andreas Hindborg <a.hindborg@samsung.com>

Thanks Andreas for rebasing and resubmitting this for 6.12.

Unless someone has an issue with it, we would like to pick this up
soon (i.e. in a few days) to reduce the amount of conflicts for others
working with many series outside.

Boqun suggested the `#include` approach for this v3 yesterday, and
indeed it is a nice simplification.

Cheers,
Miguel

