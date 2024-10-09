Return-Path: <linux-kbuild+bounces-4000-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF72B996B1D
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 14:59:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4FCD28739B
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 12:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 387351991D0;
	Wed,  9 Oct 2024 12:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hrK1iEF3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB432194C6B;
	Wed,  9 Oct 2024 12:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728478477; cv=none; b=BFe8ufscCJe03wk9wmweGojENKD0JrKSGRpFlN7aLDth4HYqaMaTkOpWkczF96+3trYDde3KXGeuLCktKJZM8mH3tQoMn9iXOODlRF0CBpV/LUSV0OZsBW0eNY5pXBZleCUlbNFRIuafRiLDDRhgq2Ly490exbdWEF1l1q+cjBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728478477; c=relaxed/simple;
	bh=5Qq927bXqNYP/A5rIMhAs8NCBb5ce81w2e5AbfdlT1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=okK40L78pyYw3NzufXVqqeDIBRmKFoJ/adXu2hKKYbWo+jCULb9uD4qHOgDAnb2DPW8uX/sac26Qjd7VsxJGX6ubctNjPXxRqYEC2BL6xcinqHHu5dpLAj9aKxN1MaKNp9dJVAUqEluTU7dOy/iMhLonW6wCKxTSbG5uP8Uu1S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hrK1iEF3; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-717839f9eb6so772896b3a.3;
        Wed, 09 Oct 2024 05:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728478475; x=1729083275; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Qq927bXqNYP/A5rIMhAs8NCBb5ce81w2e5AbfdlT1k=;
        b=hrK1iEF3JqhkYrGh2laThaqwR3yzeAsJUkX9Hqmfj1wiCSFqzMvHqd1gIuyvRgdUiv
         ug+5hPi8PFmi6nCRLUpwUQ3Kwwilagms7YD5ONyBs63I1hCht8nvYvY6Q02nu6w3xQ3i
         MJRpqRS3X92NU41VV9rLRqVp0CUz0jyL1vGJk0QPiuObQ5TQ0lMEyVj06QUWb4srfsmX
         QawtqWltkMAHN43AFX47ebWphNDsHhtVqztBLAMn40QffZwoPSH3lRoKJI/8n9dGm6F/
         28IM+IbaVv9wKs/Aa06aRFRNU/eigXw0u/CUV9WvZiVEV8y2tMgnZMGQJrBaRMLpy1M/
         Xv1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728478475; x=1729083275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Qq927bXqNYP/A5rIMhAs8NCBb5ce81w2e5AbfdlT1k=;
        b=Q9nteF2K/YZcm38P5yyHeFnz85zTM68Vf4U0CtgKBwTuY1oIIwduJ4FLkNZhOYBFjW
         pPj+q0A47cZwIX8rlknwfRZ6RWkwt8Tgu1VCyoD1u/erZoIMmu8ji9LQlkIRQ6Bp7gDr
         4/280lYMfXidTYLnstgdG4OmpXqIjuEL2wuKfUFyeO8lFWfjpCHJss4G76yBJkfcqVjk
         Z0mxkRPFwT+FEup8zBHZsIFvs6197gf81UCDZq/HoGf5dCB4KjBoNU1utJOTsdTCC9PY
         45nCgfqJiiTibLx1JcaK32q7zp+QnBojjK4+dRgyNsNT1bDqno7grfOew2yxGmLo66sf
         5MNA==
X-Forwarded-Encrypted: i=1; AJvYcCU22JoaFreQHWpYI3sdedYF3l85v9EtjFyFKoXDE3n6OgzFPjO8LXgCfEgqOxa5QYWu8zoQILEqFnY+w6E=@vger.kernel.org, AJvYcCUtuPrO79UslxY/8nPtSOJ81FI0fmgzcQ95kmlg1DtWBsknTAP7hjpCCpeBpR8H/FrJUo2CtCJC+Vudf62V@vger.kernel.org, AJvYcCW29hWUz3T7n0JOvQj/lseRVhMuEOPEevtcGJiym7Gyr2M/f+iTBrnbpe2q1+LK578dFzCyxQqai2waMeBBmRk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRWsxysoaGumX8TTLhHd5lFsPT62sSV2u2Jh1waaLF/ALuY3qG
	xhYjFitBb24+LCjGev2ZwonXA2jFnR9odl0BtQtlrZESRGL/6/CfcrsvWwBNLROhkYcfANFHIxQ
	oldG202xjMjDIVDEi2Ndct0R4eaw=
X-Google-Smtp-Source: AGHT+IHSWnZb8K4iARPHrgBuoqLJ2e1M+J7ok+G0Ta9lLZPAE7PP6DMYZOHxziQIJmNWOwKJaqbPcUCZmqcBQEmxt6U=
X-Received: by 2002:a05:6a00:3c88:b0:70d:140c:7369 with SMTP id
 d2e1a72fcca58-71e1dbb5432mr1637001b3a.3.1728478475010; Wed, 09 Oct 2024
 05:54:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009-rustc-option-bootstrap-v3-1-5fa0d520efba@google.com> <CAK7LNATSA32f8U1GfiDMwe0CYktTSdecR12Z1YoMZUYJgQCUoA@mail.gmail.com>
In-Reply-To: <CAK7LNATSA32f8U1GfiDMwe0CYktTSdecR12Z1YoMZUYJgQCUoA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 9 Oct 2024 14:54:22 +0200
Message-ID: <CANiq72nwdPV4KEwifT2A_eyyr6HZEV1oD2rWMePoFcgJ5uvQWA@mail.gmail.com>
Subject: Re: [PATCH v3] Kbuild: fix issues with rustc-option
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 2:52=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> V3 looks good to me.
>
> Miguel,
> Will you apply this together with my rustc-option-yn refactoring?
>
> Acked-by: Masahiro Yamada <masahiroy@kernel.org>

Sure -- thanks!

Cheers,
Miguel

