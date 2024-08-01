Return-Path: <linux-kbuild+bounces-2781-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 412739453C2
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Aug 2024 22:33:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C781AB23442
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Aug 2024 20:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20AED14B06C;
	Thu,  1 Aug 2024 20:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1S64wZUr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49370148FEB
	for <linux-kbuild@vger.kernel.org>; Thu,  1 Aug 2024 20:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722544423; cv=none; b=n08NSWJz+tiHuoNQXqOOphwSW0N3J3gp8gFq2/LoUJDFVLP/fit0B1miNfWptqCftNmu3wBbpWerbYH7mZPaoVJeQwkLFTw/J11D5/REePEzA2BCuGG8W19fsTrLA3W/KF5m+AzRh4cPa42NpH6dvCsDWPxgbln8Qr4HBEkJ9WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722544423; c=relaxed/simple;
	bh=uj3FPwEIG0xfFR02AOfEaaHGXag/9QLqipufHIU4Zg0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kZfIpS+GF+vwzNe+V22bF5HDyA5LECmH7XW7iQ0tBBTzNj3eKXG336vKiukx1OBFaDDHZMn2XB+vKlTi4Aavs7NVPuH1I9HBirXCp8rA7rZPKWMuvUa5H3DLsxynCcwggM7/whadiz7CllEPY11fce/ea+iPxsxGEB5NJct86n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1S64wZUr; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6b7a3773a95so42015916d6.2
        for <linux-kbuild@vger.kernel.org>; Thu, 01 Aug 2024 13:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722544419; x=1723149219; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a4LGUqfUQLcaI5k3gnfYaAsiGSEmX4XZthqSuVaynW0=;
        b=1S64wZUrN9QvfqICVzOdMAgivDxNlDPBenaSiM70h6WY/ufwWA8Z04cnOQzQjBlNZz
         TRhLZoskzQhmYoLIZmzJpiPnIzqij2A1FK/aJqJaBYopn2nZQkEV49OAsknzljZGLGvl
         IWp1SkMBL4V1/QxDuyZhFtJnE7i6JiyIC8mWua2xFCp3Tht1N8WB8BZXU5BNm/h1rnD7
         IA6r76Q1RY5X/FhpMZUdGLc+vrkOXnKTALE6vrIJWkFVzb5mkXbyt+YxO5RBAQ0QVoD3
         wFFJi3u7Q24uPeEX4dQFT/bN6eu1flP0kHpVH6cIiPqW9eWPM6cxp2nXTaAodDtaLA5I
         x+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722544419; x=1723149219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a4LGUqfUQLcaI5k3gnfYaAsiGSEmX4XZthqSuVaynW0=;
        b=aPISPup+mEYtHMQMi44m/+76Ds7nUQlJWJ2i4zaxcFCX2Rp+Tv+y6x0kuy0eVIMAC1
         VUaiu5nT42UhCljqLEXymAgiJdKeBt60Nx3QMPplld64OAf+KPIsbdgfSZl8scaFXc97
         2DMPPZH7P4m4znF2QTdua3vW292Ms2cX6SmE/UeShmvlQVZJaZLvA5ilQ19IHiZwjPMJ
         IBYJKfV9a9Eby70GS0m3Cy1ykyy93eTtjHh0zbh4fce3x7wSbCV+X0j05erMzTzgPrCO
         wO9HghGVYJPVcpSKebah3Tu4RdRnHVnG4sWL1Tqta6OTeBKFpfbYPWgEEyP6OeHL1v7a
         K6hQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBO3f1BjXjdVNbSDlCC2PSCUIc9KKsUz0T4FstORs0KCyxR3QFGki3Cv95JLdasnRgdXuJGFETjdMNqhhwtVl2HoUhZ4IIyuV03dBr
X-Gm-Message-State: AOJu0YwxtPCS/SRw4S+c08fgViGYPPDlJhHC1N+fuDBq+p8mGcC50AY0
	Ar/7tdDrF4WmVxuaw79in5uaBsUR5vUmi2l6zPJdUFcKpul+OvXuPz/W8MfbsTdd6rhc/wYYZgt
	xCHPjGrQsh3B8A59cgOuhuv5pzXUWyoU7IqVM
X-Google-Smtp-Source: AGHT+IHRRf+iCcZWfIUk8eMRP01GYpsdBtZcRDR9lDO2O6lJi8LWaU5YtyCRFpNWDktDnSX3GuCXW/wCS7u9+pP4Sbo=
X-Received: by 2002:a05:6214:3103:b0:6b7:b08e:e795 with SMTP id
 6a1803df08f44-6bb9836b891mr13930256d6.25.1722544419100; Thu, 01 Aug 2024
 13:33:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240801-kcfi-v2-0-c93caed3d121@google.com>
In-Reply-To: <20240801-kcfi-v2-0-c93caed3d121@google.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 1 Aug 2024 20:33:02 +0000
Message-ID: <CABCJKue_8S8jJ1b5RRHGjnqpq=u9KYf1SjPTyS0NCWS4TthUQw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Rust KCFI support
To: Alice Ryhl <aliceryhl@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Peter Zijlstra <peterz@infradead.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Kees Cook <kees@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Matthew Maurer <mmaurer@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alice,

On Thu, Aug 1, 2024 at 1:35=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> The control flow integrity (kCFI) sanitizer is an important sanitizer
> that is often used in production. This patch series makes it possible to
> use kCFI and Rust together.
>
> The second patch in this series depends on the next version of [1],
> which Miguel will send soon. It also depends on [2].
>
> Link: https://lore.kernel.org/r/20240709160615.998336-12-ojeda@kernel.org=
 [1]
> Link: https://lore.kernel.org/r/20240730-target-json-arrays-v1-1-2b376fd0=
ecf4@google.com [2]
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> Changes in v2:
> - Fix for FineIBT.
> - Add more info to commit messages and config descrptions.
> - Link to v1: https://lore.kernel.org/r/20240730-kcfi-v1-0-bbb948752a30@g=
oogle.com
>
> ---
> Alice Ryhl (1):
>       cfi: add CONFIG_CFI_ICALL_NORMALIZE_INTEGERS
>
> Matthew Maurer (1):
>       rust: cfi: add support for CFI_CLANG with Rust

Thanks for sorting this out!

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami

