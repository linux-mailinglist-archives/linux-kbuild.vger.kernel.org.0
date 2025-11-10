Return-Path: <linux-kbuild+bounces-9490-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC610C45E2B
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 11:19:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A42B83AD60B
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 10:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 763F7302CA4;
	Mon, 10 Nov 2025 10:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UtgdWewe"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF97E30170B
	for <linux-kbuild@vger.kernel.org>; Mon, 10 Nov 2025 10:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762769973; cv=none; b=PzcE8AmDu8uKrhpxyKxU5dYKTW6ZZPPati6CQvwI1+tedOPGVZB4sqFbRsj/FVJ1hDusP2fymV8E8BIoB9Nc7ypoxrtGqcvRnezy9gusQogHGDqZMSE4LzpBGD8Z+1KD197Dm8IMLngWOkKWALr7bk1olESWivAeJbtQngvgnoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762769973; c=relaxed/simple;
	bh=2GGpzP3+SpGhGrCwsh+gDg6Isv8qPzoSRYTGoMRT1HM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HbV9elgBzXVCSfG5AowPBkQqW3G9+j8Dl4nnhg8BRFzAsYDFSgwczdgAIL7ypgyryTLngxEdrHIU3eGxL+Ree6exHXlCdn9e8jpSnI3QQaXBEM1IZA/BFjEWJ+H7eBL+5nkr0ieB6TfzlGmVKdE13/OiFq+NgzM4fYAdhGv5kpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UtgdWewe; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-297ea4c2933so588555ad.0
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Nov 2025 02:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762769971; x=1763374771; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2GGpzP3+SpGhGrCwsh+gDg6Isv8qPzoSRYTGoMRT1HM=;
        b=UtgdWeweR9/lv6NVw6Wfskc4r1yK5dmSL88Ilk8tToguCJvbTy3KaX31nBMjnWqBhH
         zP8dPw1PXr4unrBCVUnPtluVN85l5Rk2NmbFukFlGzx7PeX+/ApRK6nfSamoVeayCDfR
         tGanf1ibqQz8KINUU1zYsxsAVSJur1z4NKAxl0QbeOtTAo1c0Wn1iyuUWV0DlwtV1hOo
         Nbbz/2UD2WXXi4x29arHg1iEo3crsCNa0NoTEIsP6JqFljg+tKMEgosDHoaXeqQ9eg+8
         BF/cqDk3dPqtmkCKiheRXKbuZOnmy4yZDQWhSPnlKqeQPRYbKyz477rinG9exoPEskPP
         w2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762769971; x=1763374771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2GGpzP3+SpGhGrCwsh+gDg6Isv8qPzoSRYTGoMRT1HM=;
        b=VzXugUwcoJofmofeQmYzZmf94GxSTpzDFHgFzPeisnbEYNUoPx60+o4HTrPQx3Nszt
         X7WGrIT/5ZHFMIP9MW0vkcEuYRY7jSUqZcaWBDix693JYlTt44BthU2yRWlWbEqvMwQW
         Iwxx+sTbOC3TCn55+QYfBpPLNxw9JoTQNM85WGpW/dWiE5ecKooPJPFEQ9PjPoN35Ntg
         HS8h0wDgkVRUEXLsvm+yObP/AG8Ub+7tSFv++yvWWV/pd84E08yF0T6bvaUNrU6z+adQ
         U4qjdQZO4xTLTXrrBUQjrFaCSJ8K57rBTeKhgKu3gIo49j4y4dRtb5lFBcAZYOu5fDEE
         iFmA==
X-Forwarded-Encrypted: i=1; AJvYcCWLP3fJVdxvd8JslS/b280ALFl55Q+WpWL5fXlMuY934JEiA7fRqwZiB0k9JOYffqSEgNzMywNxN3HyPFM=@vger.kernel.org
X-Gm-Message-State: AOJu0YypmE7huxFxzpMda65d90lcC1EUsDeIaPt+B08kNXdpNIqrP2jD
	Co0WAAgU+LK9QMtV/EOvAjdpaliWZsS+oF3q7VSCR/l47GKxrQCuXWF7fKUFauAOIkSUsua/Qqe
	uvgZEpF1V5ThGdqmYphHf4kWSB3piUAg=
X-Gm-Gg: ASbGncsJAAcIkhkzykHQDYQ4SXccfm683CBJfuKi3GBHI7S4yjhkCq+/eqOZ4tUCfUg
	z8TqJ78E9cTAgfKy8kRyw3sfgvkoDgfc8XFiY7NfCkH9ByTtbeGDCMQXhORpUEJpIac/kzoWkCO
	rFK/P2t+qmTEfsL3tyqShwlBuNFy2/6pW+9JUszKDe+0srOL0714nulSAefVvSfZCisF3rat+Nh
	B4g8xgCFOoyaGbM+vsI3lOvsg3FYTBHyUsYlIa0K0yczWN45nndkWYbdQiuUHIrtPZXUey5NZp9
	sW4Ar8DAzS2EKJ4osWb1XkUCCwuKIWedEUDdf3QPcqVlcIQng9iC6v4tjyMj1M8UVibNHdQdE9l
	dxkFoSjPOpaYn2w==
X-Google-Smtp-Source: AGHT+IFdFdVhwPLfh+yTbdERl64DQLjGM0Rh3dpM34UNEX4KxB1YYZB8zJPvvmK5YGpWecjSiRSDrXRu3SuqxEmyZWo=
X-Received: by 2002:a17:902:f683:b0:297:d825:bf22 with SMTP id
 d9443c01a7336-297e56831acmr54002375ad.5.1762769971269; Mon, 10 Nov 2025
 02:19:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110095025.1475896-1-ojeda@kernel.org> <20251110095025.1475896-3-ojeda@kernel.org>
In-Reply-To: <20251110095025.1475896-3-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Nov 2025 11:19:19 +0100
X-Gm-Features: AWmQ_bkb3t3uALt-6fRzPMlQAGQiJXQm8chK-T8Qof8lqrSz2aUgJvRPu8rtcUQ
Message-ID: <CANiq72n2TDN9oa7Yu2otk=HfpJQ7NA_X=up4uGO=JszGvaGspg@mail.gmail.com>
Subject: Re: [PATCH 02/18] rust: kbuild: introduce `core-flags` and `core-skip_flags`
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

On Mon, Nov 10, 2025 at 10:51=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> Thus do so here for `core`, which simplifies a bit the `Makefile`
> (including the next commit) and makes it more consistent.

We may want to eventually use `--cap-lints=3Dallow` here too, but the
skip flags here were already feeling a bit more than needed for the
series.

Cheers,
Miguel

