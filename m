Return-Path: <linux-kbuild+bounces-9499-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 32128C4631E
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 12:19:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42E571890804
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 11:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75FA0306B00;
	Mon, 10 Nov 2025 11:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H90T5VYd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63D32E173B
	for <linux-kbuild@vger.kernel.org>; Mon, 10 Nov 2025 11:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762773444; cv=none; b=qKAhoJxaJQeVRZ8h7faDtmeL/hJjlXYLlFMYiJp3Wr2Cp9kF5SHHbq/ee5EPayRCmfNK6883h7WxaGkf3EBkiZacyMOoFyq/G7E0mZLzID6zavHiEaCgVUVSpgkkbypyJLH2szra3qH/23JSEEecvTuHelcsj4Ffcqntaiod6Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762773444; c=relaxed/simple;
	bh=Qe3d2RAqo7YTKqv4jYgqUMxYnjMyEHYM/6ALuA5VeDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QZg5XYjkU5gXUBQmeTv8gdANPJ1mPCVVnp8RdY8f+K4Fvcj6Pq9qdr5neOe3UmB2ALZQD2gJF75Jj8MjAM+uLfYZO8hovP4fTkH6SJ9jFH8bj4tuzC1tqg/2LB3Qom5JoNv4yr7bGJE7jzR3BcP3zUnKyL2hQ0ZU82KP+sZPHAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H90T5VYd; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3727280ce17so4866761fa.0
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Nov 2025 03:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762773441; x=1763378241; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qe3d2RAqo7YTKqv4jYgqUMxYnjMyEHYM/6ALuA5VeDc=;
        b=H90T5VYdjMAn2DU/l789CThU9ybdM9HDtaPfv4+VVYTlb5o1bXOucbWJ9NrMvKo+mv
         bWERo6YD2uNoGA1ghAwukLx47fz041VPjx534b6BOsRz/viioJ5uVKX8OAwKB5FXPvCZ
         NOOl0OtYdqgLxAiS3OmMo9Q3b+1X33fNgkC6jD4yHjpu/yPidtSna3HWvZDSCbHpIR1l
         Zc+xp5wvElJTsnzUGpwZVGruYHlI4t8QDBta/d7u0kk9MRKR8/XN1w11ybT1ynANJ4g7
         Zp8s/YTkxShi9cZWSy1yB1YZ8RLV7njLLokQT07txxHd3EbKuB4rEH+omRwO3eODimBE
         lpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762773441; x=1763378241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qe3d2RAqo7YTKqv4jYgqUMxYnjMyEHYM/6ALuA5VeDc=;
        b=ddRmguHT8kg/7k91kedic7hPvZx+aI3tBiEkAJZZTxAF/HlZAmgj8wRWzdPrXr8aN2
         0KG7TfrCB/a6K/TSmBPWuBCdTH8O65Qhj5GKhX1kEmhMQaVEcy2HiUHq/DKMPQ0B6eIF
         BNF74/FeyKuyNAf77Wo4NsslMo2mFlWCxDdIoyi45knbLRg7pQ6Xe5Ns3NY43b/KXrnV
         kW2k9fiNfQLWjvCVjyFYJCSn43hdUafFY2oOk+tnbKMYOHdx+p4pGTnFyXrR6GcvXVvf
         H29Y2Z6kCboPfCLG4R1oNDx6jZphbE5uKRKZG6zkHbvhm0raUVGQyq+Vqx5IxvBvH6q1
         rVfg==
X-Forwarded-Encrypted: i=1; AJvYcCWjvARg4bOCEYvrOgenNh6ofMNUIEx5UMJIqcwo0SynSvvORv4NQhKh53IhAFBJm3R+/TuwMuX9sQpVxVw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFx55qipZJ8soeUkhk8BTcyipgcNSNvjU9fftmD76BRDArLFV/
	LzC9gPoxWJ8N4wJ33aMrzg2AGq9mu0RxQsgnDqiGcg6GdI3Z8vm8nfXDX0edrUMHX++836slO+M
	lPC5dm2keD0eUgkP5Uffr8pXW639yVko=
X-Gm-Gg: ASbGncvmeJTkaGIQZVhn+P6VJiFIjCrskcNhqLgBq02Mz3WBgMPDAFJTYfOFV/KlWF0
	GNK4Z4BCn8NVqcQ4+fEn4RR7xO6u+9zdVEWbEXO5pr33yGP1QDNNYYn8uuEYtFx0gvmjpBqTvIx
	wmLZm4PD5Q8T5gMFBX5k1/8ORT5rD2TDL9YTx7jazAlQ3dWLBLAu+7NOuasUGf+1slNnTa4pWYB
	RqJlQ3haiu1oTBYtWQBOMdObtNhJZ1uHLGiXUq+VdocSdERRpPvkN/x8a2rKUY+hAxXvKUqJuGc
	vjvHFgpvvje8Zc9zZhfr2mrhmre9D7vVDiR2wjs2oZ34Csxo4J7PPxOD7Nzv88SrEWbMfVnk/H7
	ZZiI=
X-Google-Smtp-Source: AGHT+IFBdQ/Kf/pBba056RwUp0V08lYe+9haO2B8HlujtJik6R+WJ/BwK9jrSO5+6zHV9sZYoG2V1Cx82A2l5RDsRZI=
X-Received: by 2002:a05:6512:104a:b0:594:253c:20ad with SMTP id
 2adb3069b0e04-5945f1e1fa8mr1168234e87.5.1762773440599; Mon, 10 Nov 2025
 03:17:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110095025.1475896-1-ojeda@kernel.org> <20251110095025.1475896-5-ojeda@kernel.org>
 <aRHBu3RoOLTrMA8n@google.com>
In-Reply-To: <aRHBu3RoOLTrMA8n@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Nov 2025 12:17:02 +0100
X-Gm-Features: AWmQ_bkXotkhTxYYTuTPjRF1aS8uhIalsBfLfpXM8Q6vG63LofMfHcNy_ClSXmQ
Message-ID: <CANiq72kdkTif=HHL9ypoztDc8JiQUFCEuKyigQ_6ujXjR=cTyg@mail.gmail.com>
Subject: Re: [PATCH 04/18] rust: kbuild: add host library support
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 11:43=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> This is a library for the second case, not the first case, so it may
> make more sense to name this rule procmacrolibrary?

Making it more concrete sounds good to me. We can always rename later
if we find some other use.

Cheers,
Miguel

