Return-Path: <linux-kbuild+bounces-3982-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7B499584F
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 22:22:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0FCC1C2193D
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 20:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BAF8212EFB;
	Tue,  8 Oct 2024 20:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cRTfmJZt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D89F20A5FF;
	Tue,  8 Oct 2024 20:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728418922; cv=none; b=bGUtDC0l63d1/hot2F03aXnT34HM/p+TsTH07n7JGFklDSd8/bwC4WCbbPtMVzG+2JLhg2DHXWNqeo6KOTerMhH3ncHP3BgTFixgYqE9wM6lOdinAq3yE7HpLoRLVU6cBVObMkY9/0AFjNP3jtYqeQ8zNXeyKuOwMt893IsKK3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728418922; c=relaxed/simple;
	bh=LFxSZzvhXgVqcf5ySikHzMEFK8xCiqhzOjLHBHZPURU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CFVFS3nWn9cU+cOdfd4BP23Sf3YDxJ04cA8qyGgWTrAHtqIVyWY2OYY5jNc81JUv4o0qyNpHdGrlt5D9fTvBeoIJVwD/TX0QrIZqNEKLnbuFkV7IEFyeogmYaQdGMide4AHQ3Fm2dMYOhZoaZSrjmfdfaYBsLYdGuS48R6RZeW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cRTfmJZt; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71de91427d5so608646b3a.2;
        Tue, 08 Oct 2024 13:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728418920; x=1729023720; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LFxSZzvhXgVqcf5ySikHzMEFK8xCiqhzOjLHBHZPURU=;
        b=cRTfmJZtl6c30A6VybSk0diL2xw9Ic+dgB1V89vq7h10RvFm1e2VQD2xt3Vc5Y63dU
         EiQE8Wdht9agyP6iz9qnnhViTU2VKs6q+rKud+8eA5EPdPny5weTNPK0TzmMbHs6D2XX
         jIF/ZVk6wNlSD0QA5qGkrDHpnSINkTSQ2AdDDgKhBCpAfB0nVyxk77gghDiyZzQ3WgHG
         fRZ0xTIPaZERme34p49If9EYKPVCbEiPJ8iwQ1+8XKp3wE1c6W3TQVBRkQqOv0DjPYSA
         ITbDX76YS/aiV8RRKtsLlvPrjEttRn2osEeA9cJfk5/NiLD3it5wq5holtMvd/J1hYkg
         E8Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728418920; x=1729023720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LFxSZzvhXgVqcf5ySikHzMEFK8xCiqhzOjLHBHZPURU=;
        b=rZBE0tQB7e36ieM/qqX3q1f3W8riCv0KdYmTcZZpnaB1P35ylkHlQJt4nIONWBAHiw
         X3g7bE+uaKA/jAlJxSFAVy1O2TNvC80j9iuRLEVs7u07eNL+7Zl69G6UegZek6j1TWDD
         bb5H/j6rj6NzY3ftLl+LpCKFuUARjMfmURv9mghL6JRe+Zfl6ticCGv5diR6P6ohHl5h
         yuHgVQd1F9l6QKlrQ25wsduyt/rcrlpTCFX2WWNhHsVm+aiqyXQ/K8aQvfP9XbM/NoJe
         WyXN+EzxXW3GVOebbY52PgyEcLuHHbLaWvkr4SPOA7B8qaDWeLePIjmYAfl5zcfRpEM6
         nKAA==
X-Forwarded-Encrypted: i=1; AJvYcCUO0AhPWSeN6Pj87Gf7nkbgkqsK8v2k9PbwUbhMYx0v0sQ/ji3Qcc9FPgllLHgFX69FQYnwFwRH8KqB/GCjfPM=@vger.kernel.org, AJvYcCUhlgsl8eeKUce64TSeLg2eVDgeUZOK/pQXsCJbqyY1gNzYXA5afyVqQu1lyF3VLZli9MCorUSPhTtXUxUj@vger.kernel.org, AJvYcCWQZxT/tmKXnPgllKGFz3lUjIInbaconW9qRNbLJTyJDMgRE2qNAsBaw5s3jNq0uJvLtrD8rHj92SQzJOo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs9kETa2FSqaHa/uUKyDzf/YiiNIPHYsFWqxyAQU4rJgGbV+Cd
	PF6R55P+lbTpUgtBHXAy2LbCfuWyqekiHFaE+0fRS0YmxTxyrT1R3l4ORgyScoLRpHozjNee0mp
	7c4wDUfVsVYUg+XLP2MtuY5wr3us=
X-Google-Smtp-Source: AGHT+IFCNl1K/3Vma/E39VDDqR48vuLUbb0xI4yYwwNtn9j+Lyvu6g9FH+S8bvnutNISnrlIwUE3MWtNSPTW4YuOBXQ=
X-Received: by 2002:a05:6a00:3e28:b0:714:2051:89ea with SMTP id
 d2e1a72fcca58-71e1db6491amr61080b3a.1.1728418920352; Tue, 08 Oct 2024
 13:22:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008-rustc-option-bootstrap-v2-1-e6e155b8f9f3@google.com>
 <CAGSQo02oVWxazut2nyh-9K9gK+937zKCfYMBkT4EQE2CddvZtg@mail.gmail.com> <CAGSQo01FErmGbeu-+_kRfpQrO4xkaGuSo_zAXTmGHZuFVYXpNw@mail.gmail.com>
In-Reply-To: <CAGSQo01FErmGbeu-+_kRfpQrO4xkaGuSo_zAXTmGHZuFVYXpNw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 8 Oct 2024 22:21:48 +0200
Message-ID: <CANiq72=40bsTubsXMqn_Jjx8TdfuuE9Z+eQNFvYrVXnX9S1-zg@mail.gmail.com>
Subject: Re: [PATCH v2] Kbuild: fix issues with rustc-option
To: Matthew Maurer <mmaurer@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 8, 2024 at 8:25=E2=80=AFPM Matthew Maurer <mmaurer@google.com> =
wrote:
>
> Err, slight amendment - I think you want `-o $$TMP`, and not
> `--out-dir $$TMPOUT`

We need the `--out-dir` to avoid temporary files being created in the
current working directory.

Cheers,
Miguel

