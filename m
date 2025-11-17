Return-Path: <linux-kbuild+bounces-9645-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B0EC62A45
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Nov 2025 08:04:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F123D3B2040
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Nov 2025 07:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 954753168FB;
	Mon, 17 Nov 2025 07:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R+KcNBzA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D099830DEC0
	for <linux-kbuild@vger.kernel.org>; Mon, 17 Nov 2025 07:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763363082; cv=none; b=SjAgmYQQ/jseaiIo2P0jKINSlMEqOIBriLlh1L82QYaUSFuTB3ecxT7BWFzqddC4whJDbyMS/gNvcyfHhkAwrZy8vdsyEE+X18oR1ZGoGnb7ISexvGm8kcLaofoajAEZ0qwBSYzCfBbKk/FpNjeiF1mRnEAxF5vY+369RqqWQYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763363082; c=relaxed/simple;
	bh=CYPw329zmkubMZ4Oqp3vAoduc8Bm9/LkBfg4v4vKqr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bcsl2qav5oKFW+vE6a/VCuzbE6xVpTl2Ls+sCtuSPx2IU6IU8PRONMppmGjQyq86eWGWz0JWqvRG7zXUuTJTUSZDhaA23/WoHLf+w8iSYKfHLZUsxfuMBaCxpPSGddRCZGYwgC4divIfYtRnaQopTHDRHLdLboCZESUE/T4048g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R+KcNBzA; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b8f70154354so391293a12.2
        for <linux-kbuild@vger.kernel.org>; Sun, 16 Nov 2025 23:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763363080; x=1763967880; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYPw329zmkubMZ4Oqp3vAoduc8Bm9/LkBfg4v4vKqr8=;
        b=R+KcNBzAAtB38gMoSP0V4W+ICzrEBQk5VbtjdMDIloAnAlHWiaaYxzECSsSWAJkblp
         qDJ2MW0Q+Q/fFgQIGprXWLo8T4Ih8LG08FAY3EXrojtQ6Z4ttcU2Q5zGvP+LWsWA9Kn0
         1tXEZNzAT9N5yqztzUcRSQjDxiejMfOYPBsq+QteEpeJVQJTGR/Zc75qn3kZlorZg0fw
         km2RjXF18X8QvvIxgzV7MEHAjJnTRZBgkU3/c/QqX6kqh2ZO3cxYFlTXJ/fSdXerXfyG
         /ni9Mgn/Af1IjQ5qVeg5ZUsH0XJXaOxKjsE7DFWwYB9RfcGQyCrkbNOI1DcORydnt/cp
         v0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763363080; x=1763967880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CYPw329zmkubMZ4Oqp3vAoduc8Bm9/LkBfg4v4vKqr8=;
        b=lIAqvLUbAODBXFdIXI9VxbmN9YcVR9TJL1NugB/D2CeCsSj4I2bZjhIn2JMFdp3Rma
         INZk/j28/AlfEHapoJDwQRjMZKt25t2wP+SyKRcOVnzcp7NDi/AbEDlOC7ek00GItmLd
         zkMLZ6JHQxxPSl+vtIBkEoq+AImUCH54rqv2IAwAWuul/l5Wi81yj92G6I6OR2Yej7Xd
         N5gDsQP/PY2EylnCedey+tyOLe6MI/yJZnyNbsuFbvms7BmfSS4Vao5v1EwBo33z0Tbb
         dcaBvAZZPxk2ZK2XpQe3irgBHyAuhJghT0hOZnwHLB39mkqgELPTbfSettQSKRl53Jx8
         ecZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfyz5LadJS+inDRY583ZW7Fyn8e8p64OZsTkldS+B0K7OWc7S1/nfTsYyTU512Rg2B6CD+tbmRGfvizXo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+g6r3gXcEx0e6vTaIPJhuBwTWBvUqttHBBiNfQRElvXVeYg+L
	Mi15sjGitvVZgdsedLFu0tQFN4ltZ6IdWGsuJjEiCQ7nWdiQVnGx4/P9dy5YCO9j69Q+FRlNBb0
	4fRZTHo8oUiJqDHYNYvbPUlFWWpMP2PSK8+PhCL0=
X-Gm-Gg: ASbGncvwiM87Ko4DOoUq7uodihlEhJzvJcz/S646i1BxbM+w0rbrCo3JBmN2HYh/qYv
	pato953faqTfTcCLBn7wEEpTdJrnLWHxnfBucqSsK1vLIf5UcZhLszKdTqKyz7UBkc1WrPQ9NIo
	+F5XVLvLmJw0qJRxEoc+YbcNq7CEybpeRP64JnBTHWtg/I1akWhpyFSx5vyDHWXRDdD+O0tu6+l
	wmJfhmvg3GG+mtP5izxhJF0EFaiaqtYf36RcgTGSHOlIoKdllmu1A0rVIbhi/xsAbsabo1wLqam
	AZbSWmLzTHC2pD98N1f0ldZ8oHKHvgGtF3l2OlXPQl4zcMcr2gylZWMl2NFrxskq7tpaJHwS7ie
	04gU=
X-Google-Smtp-Source: AGHT+IFF6tPDT0L4yizZVI1c10ZclGyviGsHkCQk4kxS7isKo2vtxkOxYRW0hlhC0Uw2BCeIjdVEY0/KECyEd/erkGE=
X-Received: by 2002:a05:7022:e0d:b0:119:e55a:95a1 with SMTP id
 a92af1059eb24-11b493dbc02mr3847201c88.3.1763363079884; Sun, 16 Nov 2025
 23:04:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110131913.1789896-1-ojeda@kernel.org> <CANiq72mjFobjfQEtNvk9aA+757RkLpcfmCCEJAH69ZYsr67GdA@mail.gmail.com>
 <CA+icZUVcHfLru9SRfhNGToiRmyOY+fLw-ASEvQakZYfU1Kxq4g@mail.gmail.com> <CA+icZUWqLbzK4ANrx=MDhhY9UFzazX6O3izbQeQ8bF0obuhT0g@mail.gmail.com>
In-Reply-To: <CA+icZUWqLbzK4ANrx=MDhhY9UFzazX6O3izbQeQ8bF0obuhT0g@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 17 Nov 2025 08:04:27 +0100
X-Gm-Features: AWmQ_bk19CSqQLRlb4nj4Al23oXTqmCbs9eMIWMN-W6GK2KEEvtJiaTpGvDsumk
Message-ID: <CANiq72=4-pM50mp+_0_+gEsd+Yu6m7yBaajnq5YZzdGOz7iGkw@mail.gmail.com>
Subject: Re: [PATCH v2] gendwarfksyms: Skip files with no exports
To: sedat.dilek@gmail.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org, 
	Haiyue Wang <haiyuewa@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 6:28=E2=80=AFAM Sedat Dilek <sedat.dilek@gmail.com>=
 wrote:
>
> Tested-by; Sedat Dilek <sedat.dilek@gmail.com> # Linux-v6.18-rc6 amd64
> with LLVM/Clang v19.1.7

Thanks!

Cheers,
Miguel

