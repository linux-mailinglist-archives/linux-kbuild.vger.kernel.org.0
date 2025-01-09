Return-Path: <linux-kbuild+bounces-5412-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA2BA07546
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Jan 2025 13:07:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 236603A78CE
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Jan 2025 12:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7A04216E0C;
	Thu,  9 Jan 2025 12:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="urPxAkQN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C3E2163BA
	for <linux-kbuild@vger.kernel.org>; Thu,  9 Jan 2025 12:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736424418; cv=none; b=b3JEnqkUBkVmfd5qBS66l6FlL7gxWYjalLGhIJTwSyz7KpiwnZD4NRcdSXEmOqUvHzn0pk8tVRDXW8t8MfiKSytYu257/xiU1vAa7Zxkhw05+ETY/wAYIZLL4jtAoPeRP/VMrGKIuZ+B2RSktnXEhOJ3vCTiNpcxsusDt34bKeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736424418; c=relaxed/simple;
	bh=7GhU3IehkQzrfLYSiA7FecBMD8WTWJNaVN0XyrbZ/Wc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mjJ9dGmmtzvY11m1l/h1fINr1t/XWQdxCwqfEuQZH32MMMdbzJ4c4/vgOn6fSj7etbFOj3qV5x/qRV7ufEnEHVjsMzePpfl2JlZ/31gO0XdzBR4Ce+wtLqBfOXyGVl474n3aifddyFMCWgo18BmmAZhFZioUZtzuk+mIYMJVOUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=urPxAkQN; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-436345cc17bso6853455e9.0
        for <linux-kbuild@vger.kernel.org>; Thu, 09 Jan 2025 04:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736424415; x=1737029215; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7GhU3IehkQzrfLYSiA7FecBMD8WTWJNaVN0XyrbZ/Wc=;
        b=urPxAkQNSAsWf4iNzDX+znRdi2+TEMV9bwcl60v4Ugplo10jXTwkXh/Quoc2XFpwuQ
         I3hUjTfQjZ9/INBtLxTnzOkWnobElh5Y4NRd4A863F+i4yM3/LRrsJVdlj5qXs7ksPiF
         gkb1HVMApknJas2O515Syp0moEgRH1t9WFFDJO7Lz444fOnY8IjDBRXpKm6jM9pHjzCg
         T1mPMWonE8lbsH9Rq+JvYjRSthZne6NzDPFQkfafMq4ObhjsqrXs5BVxPpsyj8Ujs+4N
         fpwx+f08rsQYaCIgmls+ZCyv/tq/QZb7xpyhr+jSjPljVoU62LcVIUXxAQjoZbKsvvx4
         QGNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736424415; x=1737029215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7GhU3IehkQzrfLYSiA7FecBMD8WTWJNaVN0XyrbZ/Wc=;
        b=Ju2fGdSDx3ZAKiLXSJSX/nQsVN/FYGlcJgYaKEroRCoQiDpVekGTr3UJS7R+WXWbQ0
         HH//bZmV5s4W/mn/sKIcMmWNH4+ozQMRCfemzgu2WWGRrkhHnntQ0fnWzbrEhDxFc4SH
         YS0dPWFm15MCOYNJNt3Z4DTopNdO3nxga1UmiogxIJv4VUxK3a++YNwX0e9G6FnWom/4
         fBvVI6LFbmbPMyOSimz7uDsnBy4nS0Rmco4NiaPBouQEcIWueX8r0kAK3ZgNxNjRdmE4
         fYwxBoPMOzaTBfWJci1Frp5segw6QgeFwYypqp+nSNDKumudlkpZ2DqzSzVOtQ2KGwXq
         Uu3A==
X-Forwarded-Encrypted: i=1; AJvYcCUQbfo+rG+b91uMYVBkHffpv4O3j8nJ6FVpxPN9fPLP4kpQ3Apgab16r93UKhDrcrLwnVBZTQZvZK8GMoM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzBgvx5N/WVqqe3OGJ2E/1qpJCx3KAKw/fm4ZnWp/DinAIE1/l
	U/ORqv1jXprLVDmJYQyWCRLoMeJkkYnDTZmLsvtY2OlwyMlaLOBKbytGdQk2bdyrB9jdLPH5nWo
	g/xUEq8s7xEqH1DfNUraknJ5lFGgiK7I5BUnV
X-Gm-Gg: ASbGnctiAwQuHnfqgPRG7943utAoMtIIePcV5U73/q0LrG/0VRrySqxmWNiStff8/pR
	T87on9liPe9/p3Fn9rAztiFHnGdAw+v1g+bywucQ=
X-Google-Smtp-Source: AGHT+IE2PTdrWh31/0PhZhHiWvPO9sdaJoq3CdwDOjQxrfzNeEXVkPE7TAlhiZZUNTYNoC0l1cMz7zePU+26quoCRb0=
X-Received: by 2002:a05:6000:1864:b0:385:f071:a1c9 with SMTP id
 ffacd0b85a97d-38a87357964mr5290951f8f.50.1736424415438; Thu, 09 Jan 2025
 04:06:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109-module-params-v3-v4-0-c208bcfbe11f@kernel.org> <20250109-module-params-v3-v4-2-c208bcfbe11f@kernel.org>
In-Reply-To: <20250109-module-params-v3-v4-2-c208bcfbe11f@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 9 Jan 2025 13:06:43 +0100
X-Gm-Features: AbW1kvZaoK88cOn9DnUUz3dnowBx-JuJN3St-wf2WsYbDen8KQce6Bx2-TlyoWc
Message-ID: <CAH5fLgh5iTTu_q4N3MmfwEMWb7HzAjLvKeqC-okDhbaB4uMPBg@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] rust: str: implement `strip_prefix` for `BStr`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Luis Chamberlain <mcgrof@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	Greg KH <gregkh@linuxfoundation.org>, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2025 at 11:56=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> Implement `strip_prefix` for `BStr` by deferring to `slice::strip_prefix`
> on the underlying `&[u8]`.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

