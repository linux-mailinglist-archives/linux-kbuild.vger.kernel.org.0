Return-Path: <linux-kbuild+bounces-4343-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F52F9B1F84
	for <lists+linux-kbuild@lfdr.de>; Sun, 27 Oct 2024 18:59:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 951D1B21136
	for <lists+linux-kbuild@lfdr.de>; Sun, 27 Oct 2024 17:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BA9817AE1C;
	Sun, 27 Oct 2024 17:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S8+jptRD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCA217A5BD;
	Sun, 27 Oct 2024 17:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730051967; cv=none; b=KlYVvAh6aMfY3lRjzdTzixX3kfh9WEAUUVnyxUEZPs79fiTegWsrYfTP7h8/MCrQdpsnbwhdmNYXKyPFA21fUUMF10VKa5v8WfOqAp1a7oxqt4Nz72a0MZhygiGdDCmqDPocG2W/xtw8Nb0NQw7ukvCpnyaCFbanjtVLCOTHenc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730051967; c=relaxed/simple;
	bh=0UbSjGcSDB+S7wUx4CXOcRobJQ1oRD4vD2zOYuX2Kew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=njEbJBonSvOj57oLvRw2ZzXUSU3oDJ/gsWbBPN3PvESr79m5p81/lPPMQDiVcVH8wHpJpOQ2BdO1rdOlMZD9ywedjgKIU5kdoRtwA1djp4INmiX60G0I4/6qE+541OQboujuTaZviJH4sNgSEPVMwGNJ6eXQznggRVcrmJwORGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S8+jptRD; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2e2b4110341so546704a91.1;
        Sun, 27 Oct 2024 10:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730051965; x=1730656765; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0UbSjGcSDB+S7wUx4CXOcRobJQ1oRD4vD2zOYuX2Kew=;
        b=S8+jptRDxdQvS48G/xhm56EIul+yW3Ynq5k33sKpguJisZetTPh3fuqZ4vyB7qOHM+
         VKIAGEXsMI9kBlrj9pnWRibAoHFMPXF+A1I+/CkqxfUtbk5REr5D+nBIGpZpxiEG3Axr
         NJ2DHBNDROvXqPyaW4BwMFbcsqPA+BKOSH+eLwsFuHlpAuPUdr9q59sZK8gH6H3cZVw4
         f9TLUBzB6GHtBx4bTXeFdD1ba9UMqtHXeO9b5EzWJiMiYV5I4wiwKXKiocHvIrzd9+92
         k1Ej+6NLPmUZuTordMqpqKAauTkGvHBkeIZrvq9oyK8cJUHqA+anLKMwiifkMZ5TCGkl
         LTUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730051965; x=1730656765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0UbSjGcSDB+S7wUx4CXOcRobJQ1oRD4vD2zOYuX2Kew=;
        b=QrrkKcGNf3Dvpa0QcdTIRTvAbxznxGGM2+XMHeCqvD4KWQD7XXFI4DYNS7hsDoE4R8
         qx+aDSNjNed+YUHBcqI1HigvfaYAF15xpMoololm0hzuWhdaLyRL3cKswVW5c1dvXUEh
         AamfRK4UozBCgAKo4qFcqmtXD3Fox5agfIA7GGexuHyH/4O3UxlP6QyJP9AnKiEU9/ty
         MeMBlOWK7T7nBcsygqP8KqF4cnZmQc0jcSrBYX5naCaESzDeq7QCpbP3wh4yjxEBo2Qx
         GCqS9mkCmNWIjJ32T5/JYDcCzUOimOd8kTRNZDELycHwANz0jOL/eZrUtj40CaLERmtc
         3VHg==
X-Forwarded-Encrypted: i=1; AJvYcCVDtx7dY0a4D0CpR/x40XeARrsfpNotOY2eCzMiHhNb5qOVpNrVj491hxSSame57YoSUJ/Dl3JJL3R15jLAmU8=@vger.kernel.org, AJvYcCVxTco1xncuW1P95kObHEA0j5iuOWAjFLtYur5Q2HrwGqsK+YXpTQLBaM4mXqcbPiHzZg/2bEGW4pm53TM=@vger.kernel.org, AJvYcCXM3shwESCzC2ZBSxRFJU7DfQ7Wi9ZiSn0GszQPg55cZFvRWqCLvQzenQgXnozE25W+sL3I337xYH5oxSCZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxDhdLJe4Q4CnwbTq60tVk+eXM18zhRaBwl0TVlRgnE9A4oFrsm
	Nw/jNp2uOdzGMEIC9xWtunkMti54UtSVTEWaEubui1A2gwTD46qv7oM8/Gx3esvRKLIiHDzrOk9
	53C7GcUwTLYAaKvH7jJjG+6/X64E=
X-Google-Smtp-Source: AGHT+IEeZnnHbXtBp8iqrs4W8ijIFAmvZkYu6WsDP0Rj0vVPVd5O/4PVkQIVuOKO+4nppet5edWf+GUBkU6bai5spq4=
X-Received: by 2002:a17:90b:3cce:b0:2e2:c414:80a4 with SMTP id
 98e67ed59e1d1-2e8f12e1014mr3006581a91.9.1730051964867; Sun, 27 Oct 2024
 10:59:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241027145636.416030-1-ojeda@kernel.org>
In-Reply-To: <20241027145636.416030-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 27 Oct 2024 18:59:12 +0100
Message-ID: <CANiq72n3mFKeErzp-OVk=+yZD_sZurR-6u7mEn_QunfMTKD-Fw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: avoid errors with old `rustc`s without LLVM
 patch version
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	Thorsten Leemhuis <regressions@leemhuis.info>, 
	Cameron MacPherson <cameron.macpherson@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 27, 2024 at 3:56=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Thus, instead, just make the match stricter.

Applied to `rust-fixes` early to start getting it in tomorrow's -next -- th=
anks!

Cheers,
Miguel

