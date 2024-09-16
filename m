Return-Path: <linux-kbuild+bounces-3581-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E7997A5C7
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Sep 2024 18:14:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4F831F29046
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Sep 2024 16:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6579E158A1F;
	Mon, 16 Sep 2024 16:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kZuwtuZX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0457C17BBE;
	Mon, 16 Sep 2024 16:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726503284; cv=none; b=oCygWCn5kk26KTmk9DejMbaZcvsYB363VYiWzS3SCgFRrwEWXCD00FxJ+/3cCHwMjFrRflarIpj473prJP3bH7/a7K/jwiLcSz3X73U9p1No5JfCHxetk/twDZNJzNJlok1g4OenvhCAylaWdiGvofUiv+s0HBJXIS8zeOaDeIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726503284; c=relaxed/simple;
	bh=3qUEcfaK4/ka9sFDUJuHN+W1k5GDQiQOOzJa4BmEGh0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aAzRG+/YDVL2fSqndEN0EDfupQ481LbVdL0uwHXR3V+xSW5wOpfHnvaCKYs5pIYfXBl+kDSndYLBBC+poVrJqiCoX5YwelTaiAE08/X0RocWnxedETekb05su1CqMLwE1dK2u8fzTaBYC3kXep2OZX129+UEVV2F6n3RWFKi4I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kZuwtuZX; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-717839f9eb6so894168b3a.3;
        Mon, 16 Sep 2024 09:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726503282; x=1727108082; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aiIXMBq5XTutSIjV4NConN4WgPc3djgc12b0ziG7diY=;
        b=kZuwtuZXmqfiVGiPwSiWR2FBkaNvDTwzFuoogdFujuVHnZvvL9lJulvG0z4EvN5I7d
         6MoYi4UFBKj7tuGoL5+LYvLhfBoM6Ry5QbfIyHOQHskZZVwY8Kbhr6jOmcXtP4bOMPKk
         qFMxUmgcG6CqddddPeIWTvSG6+rCEzgB6rjzJ3PlLoKsVA5RPmLOGruEQY6nhKMGYX1+
         y1eLab669Tk64YPWaxwOrs40EfDCbCXO1x/Lxd91093NhQN+9EZqOSLYP+PVQ+LlR8qf
         2RHxEsZyYDsadVMxb6ZgoP0p7hwJQOYRe0CWXEqNvv3DZyuROAXpLyF26UimqwkdT8h7
         /n0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726503282; x=1727108082;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aiIXMBq5XTutSIjV4NConN4WgPc3djgc12b0ziG7diY=;
        b=a0YtSOhUjnmff5X8NEZbU1hzup0iBRK7gDfxht1drjt52Jy5VOKSGgwOCcyZkN26gk
         2h7aEvx38neyo6HitC2WvO4tfJ5FEigxa1Uq5ddYuAhOfm36RkjEwQxKBBtmWd263loB
         AoPIoWTZZimef2d1VaHP+6oFA5DXO5ZjIW9H3nQjKx27Iiff8QLoSo6sVDAG9bRzaM+T
         PrzubtMqnE42K2Nzgilsceq/+N3CIpyBS7SEXCI0SrqwTkb7gw9yx6VlFih+sjAE83XM
         pmjNSkrIHehSL3+KjzmHYgACpq4LyqUXoUZB0UMoFgjvjgWKnlzuHPerrLqYhu+LYGH7
         Dihw==
X-Forwarded-Encrypted: i=1; AJvYcCVHGW3943ZxCVygAx1Pf2Ynf83SpwNooQqAyPMqThV6i1MePMzcbzAYTMzfBrb6eplFNkzJM90zi7aYXtyneBw=@vger.kernel.org, AJvYcCVSvRwmbPEWfplIBK7UDAnlGFJ2mhX0rbc+r4UZSsHAoCj7qQf/WsEtBMfP3DWVujicV/NwGsTFwF5dNqc=@vger.kernel.org, AJvYcCW28kVyaReRWjhThy2AHtWrjws/fUpI/q7yw4UzYGKSrCHYY0mX7EKV8ckR8nymZAzVcUFFomzcihN1+V7d@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr1tcNG/BNly71pt7Wzbh18ELZNyC0+klOLmhKBxhLMO3S3JMN
	6dQ3HFE7cI92zX8RXZhyJKG+Ih3TAIjwnZTxs+oKNpcPCc+NUrDx0UOb7muKOnE767qBo1xdZlz
	e6tQAVZFcDzG4TD7rIlLO+EydBxI=
X-Google-Smtp-Source: AGHT+IHNBDz7/fdjLPwJLc6uvykq4pFaJyTiJPPGBGRYb3y/6qXG+SIzr/7QALlDqgIS3UAoxwL7IvBnhervlWoySYY=
X-Received: by 2002:a05:6a00:ccb:b0:718:e49f:246e with SMTP id
 d2e1a72fcca58-7192620091cmr9723769b3a.6.1726503282171; Mon, 16 Sep 2024
 09:14:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240801-kcfi-v2-2-c93caed3d121@google.com> <20240801-kcfi-v2b-2-c93caed3d121@google.com>
 <CANiq72=B9NmC=1eSaOrg7XutjueQsSXGcBQb7dQFPuL0SFjPsA@mail.gmail.com>
In-Reply-To: <CANiq72=B9NmC=1eSaOrg7XutjueQsSXGcBQb7dQFPuL0SFjPsA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 16 Sep 2024 18:14:29 +0200
Message-ID: <CANiq72miDK-Z3v46QX9MQTT_raJTz+ja-Qx5j1qBmptHXkhY+A@mail.gmail.com>
Subject: Re: [PATCH v2b] rust: cfi: add support for CFI_CLANG with Rust
To: Alice Ryhl <aliceryhl@google.com>
Cc: a.hindborg@samsung.com, alex.gaynor@gmail.com, benno.lossin@proton.me, 
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	kees@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	masahiroy@kernel.org, mmaurer@google.com, nathan@kernel.org, 
	nicolas@fjasle.eu, ojeda@kernel.org, peterz@infradead.org, 
	rust-for-linux@vger.kernel.org, samitolvanen@google.com, wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2024 at 4:07=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> It is possible to have CALL_PADDING && !FINEIBT, which means one can
> trigger a build error if the compiler is not recent enough. Should we
> test for CALL_PADDING here?

Alice confirmed offline that she agrees, so I just changed the
requirement in `rust-next`.

    [ Replaced `!FINEIBT` requirement with `!CALL_PADDING` to prevent
      a build error on older Rust compilers. Fixed typo. - Miguel ]

Cheers,
Miguel

