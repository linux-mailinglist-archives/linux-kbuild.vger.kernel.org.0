Return-Path: <linux-kbuild+bounces-2442-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD6C92C263
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2024 19:27:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0E711F2227A
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2024 17:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2388A15886B;
	Tue,  9 Jul 2024 17:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m9wSRZF8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07EE7F476;
	Tue,  9 Jul 2024 17:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720546019; cv=none; b=KJmW2ASHJIoY4AFZGClICjgmUzn7aYuy9dyJNtFp4hLtvUJWwFKAhxizz7W1Zmrjh5F6w1X0MBdcqC/ImZ1Q6IyPvaobxr2DwQEG7FTfSGW85wj+IPitMb/8tuzaHytp//mnKNT6YXVYKlNOQUJvMCvAGP45fDgs8Lbl+Jihgzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720546019; c=relaxed/simple;
	bh=xEGa7zkjzsiIbiqcbCacwWsNu1ijTpLI6cSiJFBTmDM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QAbmC1l3HSqFxAZ5HubdtmLL6cWzrlhVnaMwGGOX+YIAciP2vqb+SzPY9Adq/X4en5T2yxMA8cbsD2O6a6tomNjgZ7hWbeH81ecmJUMoP9EbbfIocbuTnClWaM6gI6fy2pMQRs1nI+10pW/QORIPs9Gg4Y5lnCx5xOIJ6Z/fed0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m9wSRZF8; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-70b3c0a00f2so1307316b3a.3;
        Tue, 09 Jul 2024 10:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720546017; x=1721150817; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xEGa7zkjzsiIbiqcbCacwWsNu1ijTpLI6cSiJFBTmDM=;
        b=m9wSRZF84Orp8AU3K8K9lOF1qMOMy6uLszId+2xYH0K2T/y/mBW7f+URi+oRYGfiv9
         KQWYx9zwOj4uDPpGIWHhXycmuwzT3R2tA9plq/03FJ09wNdNXEFooM5zoB0qY3IywYBV
         QKt20Y7T8s92+Tkgc5ZacSPqMokmaBEwv7Bo9g19KLjrRTTpIBW43riq1Zd/uJKDKmir
         kGULSWBMfp/hwClJRmZlePCDYBkyRlq6fYFibFOPeHqSn/BxtYVwpCyRff8YNWB0ko04
         45oXcnJb656xiKUxhCD9RPYXvSKcVEG3frS8rxeomHfWLE/fDGZoy/Q7dcuuG0WtdR5k
         Ewog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720546017; x=1721150817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xEGa7zkjzsiIbiqcbCacwWsNu1ijTpLI6cSiJFBTmDM=;
        b=EOITeq4nTdNI5bN4YVL0oAijXkTRC2a7HzJmCQkNlCGBpKgFcNNXtfJrNjivJdygMX
         AYxfYTTb5qXH6kFhShfjrGKeJIhntZCkv+ZlaGctAK7WMQ0HBTk4cG+Ojpa8XcyOJ3sI
         Z5+LU/9tqMqEm6YMc/XFiFuZ8YcnDb8Tv6qk9CFIwNZe8DNu2bBJZjRROyvKVLMjkyX6
         EjnjM/DnPt43iI/hE/fpnTfDpiZWg7kBMG4VNN3SAM0Yzk2UOYecWZpXtVjIzL2fob+d
         3QWC3P9WQKP4pMjoOo2qx9l0Y186jz4/3u8Vfbxw27HdtZRnoT/flMYLO1KTN5TehJ1A
         YkBw==
X-Forwarded-Encrypted: i=1; AJvYcCW57OkHNYYI70buTh8uEeXnoolci+msHcbjQwFSlXv3usGbsViguSgFPSgpZRSkoJncX5IZLWujg2gSGDvNHQqS3iOpWvVbB0sxBIQResN4hO/8ptDLu6Nwix8J8FRg614MpLgVNDSlNzFjybccZdkC5fYNGdPIiZlQSWWjsR3fIZa8zLTaX2cMF4k=
X-Gm-Message-State: AOJu0Yxl39kXNOJPTHdKaGffaWmWWYGCBiYVqjnE62BTQQFMSy/ht10K
	GJ34meUB368iQReShnbYcEDtbwovLseRbheowr2IpzmNo4heumGUIxjI08ksUjxCawRYaafapa8
	PJkeHbN0FmIIwMu2zIiH79T8hlG8C416q/NY=
X-Google-Smtp-Source: AGHT+IFD/VyEdp6BX4ESg9u5UEPG6dtbbRDyeOinfTVoM+xlvEchxrjSSX7hROo3qyMmwbS5fz9U9VEDbFyQRuqBE/k=
X-Received: by 2002:a05:6a21:194:b0:1c2:9d88:f2a7 with SMTP id
 adf61e73a8af0-1c29d88f3f1mr2016849637.52.1720546016963; Tue, 09 Jul 2024
 10:26:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240709160615.998336-1-ojeda@kernel.org> <20240709160615.998336-12-ojeda@kernel.org>
In-Reply-To: <20240709160615.998336-12-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Jul 2024 19:26:45 +0200
Message-ID: <CANiq72=kCJB-g03s6fHtSYBWTG_MT3yMW0YvehnAhHP_edHPcw@mail.gmail.com>
Subject: Re: [PATCH v2 11/13] kbuild: rust: add `rustc-version` support
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	Finn Behrens <me@kloenk.dev>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 9, 2024 at 6:07=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> +$(error-if,$(success,test -z "$(rustc-info)"),Sorry$(comma) this Rust co=
mpiler is not supported.)

Bah, this is broken, I just noticed in my CI that I didn't handle the
"Rust not installed" case.

Anyway, this patch (and the next one) are not important for the
series, I will just drop them and send them independently next cycle
to Kbuild instead. I should have done that anyway, even if they were
correct.

Cheers,
Miguel

