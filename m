Return-Path: <linux-kbuild+bounces-3334-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3A8969C05
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Sep 2024 13:37:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 356831F2400D
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Sep 2024 11:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35E951B985D;
	Tue,  3 Sep 2024 11:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N25vRUkR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6C51A42DA;
	Tue,  3 Sep 2024 11:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725363393; cv=none; b=T18NR02O0nIfHVBUpRSc5WZbSQIeH9UB2rZ+3vKdr+4MA9eUNMQIAdlcnHyu2ewgGAivrV3m7NYGr7TPHVfvJx/+8NhDRJuDPHVW2WYJYfRcyvSYAMdwxp87jmEYid+Z4NuZwsCqfptaIULgX5VASi4OZnS/H7mGT1WpLmVPOLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725363393; c=relaxed/simple;
	bh=asARBpP+H7LVbvgp5JjvVY/FQLEWo3k/g+YSUlchH5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NBL8UpySc4mVtkaPWLyk6cPQX+s8/fe2HTaMzRkBX2r03SFoEjfHLkbMaI+jl/kwYYS7LBwFp136WSHkMN1Y9mMWURQ20xA98UbmN2B63WcNco+TjF7HLSjSsjWK1ScktAi0upb+PSOrfCiCB2PRuHji7iAztuqtzQuZoT4bU+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N25vRUkR; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7cd85502a34so172341a12.2;
        Tue, 03 Sep 2024 04:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725363391; x=1725968191; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=asARBpP+H7LVbvgp5JjvVY/FQLEWo3k/g+YSUlchH5U=;
        b=N25vRUkRrekPaa0NSSb6R8bOCEM3MkMUchzny6UdxmkVa1cb5SinGVDdFmDR1heg62
         jKBol7fYrmAPenkNfw91mMRGYbdvZ0mQ3/Ko+QlxA3KSjX+jMaDuyLsKuIVftUHWC36T
         aTiBIDKcJK7/BXhdqCW4/Ut/e0emxJSkRb006WsNiI82KPg0kvdBR74KUEDLDUIkC9B5
         Fooku0Hsl2icQkmp/2+1RrcalmE0vLraujjF2REBbhA+3fY+jlIWf9YLYLMX8MiJRTbB
         cmi8ka5lVFVSccpYX2QbRG72cAJjYDDOOXeWn0nQdt3Zg9o5cW0ZQyXN+/0uCKiw0bkT
         wC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725363391; x=1725968191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=asARBpP+H7LVbvgp5JjvVY/FQLEWo3k/g+YSUlchH5U=;
        b=JtNqzB9htGvZwIjgDXyNgEmXy6wyNipAHBux3y4VgG7c0PymzWHEKdrhPkPzV9I79+
         XcrxR2hXu/vsC1jUn7UQpzGk8hz7uwaA6kCfeKti7OR701g4MLTQAcFkxSQpQ9Me9VqI
         JwAIei8zGKHO6Uo7TMSEjy3a7VP1tvusHEgIKg6+WLHLwHu3v08vvcpVrFSsMu3sKnrz
         g0bcdlGHQRxavY9VeGxAYXA5UAZEz9AWbz9SfC7YFbL1cs9ysCVyx2sVltlcVVocfpmw
         Rc+hPXS2mYD1ZgQB5BtuqyvkNKNbIwqPb5J4UtnySjn2qTOQqdLyaSj4TCIMrYuiEqlu
         NEDA==
X-Forwarded-Encrypted: i=1; AJvYcCUAyVEeK5oKh/YU6wvXyfxsu1XCfYeASyDlv8BLE6Ongrree91hNmaPDLP5UoLM6ezD300uRF9wbmZ6nX4=@vger.kernel.org, AJvYcCUNAV6hEmPo9ehUReDdmtQkmvj+W7txIkpbwxcOJUlf1pS9dKjVE1HbxzTcQbgTyGHRCjhl4cvVlcCZnlYXW/w=@vger.kernel.org, AJvYcCX2DdXCvIsvaXkbgSWxy2FRot3U7HDYkFyhgqEbusQeaRmy0pH3EH7ZAUmOonSUpxjg5wMsZVK+ytOl4Gx+@vger.kernel.org
X-Gm-Message-State: AOJu0Yysl5TqcWr00DKq45kXu+/Z8gKEI5m8KfqbLPT7mzuwjY3QZ9wc
	uVD2KCXr74pfNpgHF2UwaV4towabGPJYZplsCFr37p1O6NpQ+WWGB7WhKgplXt+xKgx975fbBc9
	5LdLOLL33UmLIhqoykjCZjeixpx0=
X-Google-Smtp-Source: AGHT+IF0nZvAxjKxJ4VeOA06CHiHeMYoBFySFmOJlju68zlsJfRDVeV3UZu2EyE/P3zBUs6sodo1eGyKTp/XKD3YpjY=
X-Received: by 2002:a17:902:e303:b0:205:40f5:d1a with SMTP id
 d9443c01a7336-20540f50db1mr61267385ad.6.1725363390792; Tue, 03 Sep 2024
 04:36:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902165535.1101978-1-ojeda@kernel.org> <CAH5fLghEz-6HtcpD5N8qXHZt8AK-8DUXHKXbHgs0YQ-pTJrTtg@mail.gmail.com>
In-Reply-To: <CAH5fLghEz-6HtcpD5N8qXHZt8AK-8DUXHKXbHgs0YQ-pTJrTtg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 3 Sep 2024 13:36:18 +0200
Message-ID: <CANiq72nr+ABsmRC7E-vMp5vR=pKMxoNW0=oLPmA2bEXoME79tQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] `RUSTC_VERSION` and re-config/re-build support on
 compiler change
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	rust-for-linux@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024 at 1:35=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> I re-ran the same tests as for v1.
>
> Tested-by: Alice Ryhl <aliceryhl@google.com>

Thanks a lot!

Cheers,
Miguel

