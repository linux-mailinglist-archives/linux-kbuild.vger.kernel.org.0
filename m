Return-Path: <linux-kbuild+bounces-5896-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E564A432A7
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Feb 2025 02:52:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89B3417A3F4
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Feb 2025 01:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 800108172A;
	Tue, 25 Feb 2025 01:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NpUl4s+w"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11873450FE;
	Tue, 25 Feb 2025 01:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740448309; cv=none; b=K+srec9CRb7nzKXywJmLLtnqgpiMK1bzbTwitZ1HEmTAkfhOCeu5QjpKv8EXEykwqO1IsogeaMzFtdZWm0YwKjrCwYCmyzCm9aZWzciAiQKU2eKEtLxe4pxuiHqhhu3bGtAMQdbmXKTX1JpRgxKocjXwuBn0AYRKT1X2hkjnRwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740448309; c=relaxed/simple;
	bh=WfFzdi2h0H9yGqlvka48MuPJR8qMHP+nRMTXge4JZzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OnYXS5AdBfyMoU7bk3Qb3mpY7D/ZOP92xfQSFPpvhbX37NjZDNqXW2WwQSfBBvBaOlYOm4nLJ1SIaYHqgQslliip/7i8FCDsD125jMKT5NVD3N2xBIGuXLBL0/JFPpAwsoXwNNoqA29HCbyQUqrNjLlE0Sj5XiV63ay+7IIe+LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NpUl4s+w; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-220d27fcdaaso10656485ad.0;
        Mon, 24 Feb 2025 17:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740448307; x=1741053107; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WfFzdi2h0H9yGqlvka48MuPJR8qMHP+nRMTXge4JZzA=;
        b=NpUl4s+wp3SXlbRprkEWXxShWlK4nOSmMGOnvoBFwbY3X1Fi+D0zOnE1mIC8KfEo2K
         GUtisepQ7hvQk66MIW1ZdctpesMXIISA999ursJXPHLbyN4j5F64TOPnJ2EItcLcCJQt
         D+Gfo1ggx11KpQ2C/pjoVm7DPJVtd+t/FyEmiUl+zLiH9Lk8uXr9v4GD7tPrKalMrazj
         iZsXPFDg1SEWeoInpSZkrNGR5PJk2c/GhPhDWcQnN+DwfJwuMNkiHEkFSHsbLE0qTKkS
         ckdwDwEYd4s+oIa8zvl1XdEbeVmDSkDOOIDLL9IoxzquKggcnG4AVQzjTzOwe1h35cdv
         W9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740448307; x=1741053107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WfFzdi2h0H9yGqlvka48MuPJR8qMHP+nRMTXge4JZzA=;
        b=IbujhmRz+yJrk2euyk1MwpyYgVBEOyrYUdhRMeq3lpA/tvkXfFWcuczhnyr+LKMapU
         Ytk1eyhBkEQMiOQwIjnhvUPHi+04SckWVOpV/UBvtKUbToTduYJcN4BNZL2njAKR7/Ep
         DH/wTx3de6OXCL9g5UyYBAqE3WP6qW/LVmjQ42X4Kqh33S/qpMFSnIiN4tG1FRCLEzLM
         cHERGgB5apm6H2ERgOqot8mjuqAjBq6idI5Cf3wdhFCtg9J8JR4TDHUsgfX3IQNYiUWt
         GEO28ZW9TfDHP/YwNfA+o1Nz0Ty4v3pYXjm2BD1Zi/mEO4CMYUR29W87n9arq67aORcJ
         zavA==
X-Forwarded-Encrypted: i=1; AJvYcCVwbsJsGJujRiAnwk28aJw3kUBBeK9VE/21jBgBwrrnQdMY4OVjZ6hU9NFB8b+9EkMOgBFRLqal5gPZ45WxAw==@vger.kernel.org, AJvYcCW0t3ouS82g7pS/luQyJlCLDPL5JofvlVWNx4cdZU9ARTC1Uk/FnXY4E+Rj70CM4f8uYAv5PuSnRmZu1Ubn@vger.kernel.org, AJvYcCWpyJrebP7nrCelz5qVtgryfPz5EnZk45pjIaQDQK68S0G4OywMdMb2st/MdaI9kGmyaUow0AEnr/fGJ1U=@vger.kernel.org, AJvYcCXxUMw6JoVvgiwCtTW8nPVgtWZspmpFY7NAuBy4Qezf4sfVF89Jv8KcV/ATQgpnELZOv3W3udqSw6DpQK7PIQo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyT6MKqcx7dovPG4CX2n5Kjkf9ZXyXNXDcaGO/IJ2X+yXR3z2M
	mnJv5ULbRmejj9LF6x9rPYHGHc0qq1tDWyn7uIQaZZI28DIVf5frhOst6szXAdjAjqqmgnS7dfG
	lpUO2Ys+dUpaDBkpi/OlcuKh5u+I=
X-Gm-Gg: ASbGncujUg2h7IzhyHDX7//ZZeDKuuOcw/VjC298G2REBN3psAHs7QwbTnnwbiosDhr
	GX23Jxliket9N8QlUbpa+wGv3bdlidwlv4Y+z2dHHciatZ/VhISDJmqQjHGjuuLMGEIkYzLSmmM
	wZYbaeyd4=
X-Google-Smtp-Source: AGHT+IEnoBAjE2CkoJFgQSrKbCTfJQy1crOZg/ALuG9lKJS8aVrTZMkhYHdBvHWLjgg0WC+w9rQ10MHGTh4Xvkiv9B0=
X-Received: by 2002:a17:903:98d:b0:215:2bfb:3cd7 with SMTP id
 d9443c01a7336-2219ffba7f3mr101974795ad.10.1740448307274; Mon, 24 Feb 2025
 17:51:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218-module-params-v3-v7-0-5e1afabcac1b@kernel.org>
 <20250218-module-params-v3-v7-5-5e1afabcac1b@kernel.org> <20250224223032.GA615664@robin.jannau.net>
In-Reply-To: <20250224223032.GA615664@robin.jannau.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 25 Feb 2025 02:51:33 +0100
X-Gm-Features: AQ5f1JqBQysGuc51REO15MAi92-gEKXouYKMgma-ffUQAmk7HPHu-6QHElzi5DA
Message-ID: <CANiq72ns264CeAHPKv9m4rUxS7b8J6+2Mwrk=+xSEQs5wPNoxg@mail.gmail.com>
Subject: Re: [PATCH v7 5/6] rust: str: add radix prefixed integer parsing functions
To: Janne Grunau <j@jannau.net>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Luis Chamberlain <mcgrof@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Adam Bratschi-Kaye <ark.email@gmail.com>, 
	linux-kbuild@vger.kernel.org, Petr Pavlu <petr.pavlu@suse.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Simona Vetter <simona.vetter@ffwll.ch>, Greg KH <gregkh@linuxfoundation.org>, 
	linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2025 at 11:30=E2=80=AFPM Janne Grunau <j@jannau.net> wrote:
>
> The errors go away after exchanging i128 with i64 (while breaking the
> parsing for large values).

I don't think we can use 128-bit integers unconditionally for all
architectures (we could eventually get it to work for some though). So
we should do one of the other approaches discussed in the previous
versions, like call into the C one.

Cheers,
Miguel

