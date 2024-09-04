Return-Path: <linux-kbuild+bounces-3366-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B94296C967
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Sep 2024 23:15:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B8E31F23702
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Sep 2024 21:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8CBD13D28F;
	Wed,  4 Sep 2024 21:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NdrfwItM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C5B47F4D;
	Wed,  4 Sep 2024 21:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725484528; cv=none; b=YjRX59GUEe+pZ2usVy1/Mc/ct5g3Fjs0nCpKAGgNUENHLh/gpPo32pi/j8fC1HbJKMA3eauEB0Rc5JMsCjuROFoGiDDfSxAbo4zfTswPtKBUM/HWa5MA5msIsw3rKPSIZ6gccX8BuokAO/9tPZIwVSpx2SFs1fXEG2SUgQ+bfTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725484528; c=relaxed/simple;
	bh=apdfSNyJqL10mkLY3LtYTC/6akJ9hEvc4z9zKzdH9xw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=scSDStBY6WvJV4OC+Q7EN2ZYPM66+ZxwgYOGUa6VUO9TscI9BnP6NTT7oqiceYLEWjcGRpIFeACvxG8LQV62vCLieP67kUnWo/pXe9v0qf9p60EixFHfgJKK+vlZdkkV9uRRuhrzVSNFFhvn+ESZRzF8EaOfoKFqNNCpeOYZwkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NdrfwItM; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-71423533ebbso5323b3a.2;
        Wed, 04 Sep 2024 14:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725484525; x=1726089325; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e2NDtCRBACEs0nrvdhkLL8awIsNK1GJ2z5Df4VJoj54=;
        b=NdrfwItMMYd8/Zk7/AwZzT1Khv58wRH8JYzCW0bTsAPRc/7Q443060akkHCtixduy9
         rrFtNsS8IQdjVk5uYopW8CQ72yruLgLpxgJuhBJHNhbaKl9NDz3FnDnj80m45CHmv5pk
         PNhHJ0eNAmZXD3xDDw67jQ2IoHzOE7SNRvp5o7AyGIIDR2TXI/Nqnqq5eFuk82Mk9MON
         Za+uKM9lw005I/IqsEA41BM7mpJ6x0CYP+TuaNa1VY5XhDyZoGt1qAWjQJZTMgLO8bxP
         l4iZCitDRuVH6+9TBl6TXuxh1UYUa7rOwOh4j8v2IPn0A2LKjoLgwGIsitmnpojvJdxL
         8Q4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725484525; x=1726089325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e2NDtCRBACEs0nrvdhkLL8awIsNK1GJ2z5Df4VJoj54=;
        b=TRuHLvLemJIBVKiLWREzY+S5hWeB1V9DOVkYsEjWT06y8IpGE/nIh3fgA9bH5BVo3Q
         iFxQA/wxcQA3lFp3Kr3Z/d6CZWmqsJTvFbe2im6Na36RyQ4IcZg/UsJjBz3lZjVG5GCu
         ae6RE67UJUMS9pDDt51RLHXly2RFE7VgfLeUV9qI9qvlANWB/uksuvED+OoUmbBSbry3
         yPLk0wT2PwzWAIgRSc41DRZ4okqNteCFzc102UA2BU6dQgMFFYKmiNVxWFyjI+2cllLQ
         PVjWT6NVYWqiykhGaIEtuBbfgHK8i8eHbOqAx2llPiHY8iFQwZaTu3S66Uob5PPeGwuL
         sEXw==
X-Forwarded-Encrypted: i=1; AJvYcCUYeO2L0/ORclSv88J3P7lW3Br0jcOFQNCJU/jvHg6wwjgDe36DXdvqHY/P94GaUKeGPI4m5csQrOV4WETH@vger.kernel.org, AJvYcCWH/kbY0dpQBjbWah449gMsOR8QX94TFmKeP24WFVZwTZGL5uomJddPWuNq/uxjfXUPK65UEgSgs/UEJdCiGBE=@vger.kernel.org, AJvYcCX/b+9z58cgsBEUuscpoYEzNCRE2vgPUjqKFmHylc1BU2rn21d38mlh6JqNG/NhZwuXWiTemdE5F6xoH7E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyltQ9/rjPPxKnafnjw1Gy191BLqJamvYiYicSS/pTKZBeuEB6X
	UmtXqNNKB8Y+FbF4zHRaW0sZ9fBWCiT99OkUK7OfWCPs1AhQNIW3pljEgvCgs4xJtk/1xIyOitv
	49mIu/KpDEpvUL+6wAtgFVWbaHes=
X-Google-Smtp-Source: AGHT+IEpNZEnODRv2C3k3FWwEmmvU2X2wTQwZbNIghh/NH54H+1xtdzyzD01T3Qjmc1g/hyeUwaZTvpQBnPEGBJIh6E=
X-Received: by 2002:a17:90a:ee8f:b0:2da:5aa5:5d5b with SMTP id
 98e67ed59e1d1-2da5aa560f4mr4434871a91.3.1725484525023; Wed, 04 Sep 2024
 14:15:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902165535.1101978-1-ojeda@kernel.org> <20240904-cordial-zircon-grebe-ba4806@lindesnes>
In-Reply-To: <20240904-cordial-zircon-grebe-ba4806@lindesnes>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 4 Sep 2024 23:15:12 +0200
Message-ID: <CANiq72nEoJd4dJxt-OP6DHL=KgbHNtbDdd-fUPz2KcCOQDqBNQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] `RUSTC_VERSION` and re-config/re-build support on
 compiler change
To: Nicolas Schier <nicolas@fjasle.eu>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 9:32=E2=80=AFPM Nicolas Schier <nicolas@fjasle.eu> w=
rote:
>
> the whole series looks good to me.  Thanks for the good explanations.
>
> Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

Thanks a lot Nicolas, I appreciate the quick review and the kind words.

Cheers,
Miguel

