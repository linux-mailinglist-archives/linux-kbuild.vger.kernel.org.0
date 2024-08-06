Return-Path: <linux-kbuild+bounces-2873-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC24949C77
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2024 01:46:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5D601C21596
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 23:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC50415ECEA;
	Tue,  6 Aug 2024 23:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EqquyR4S"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81768A59;
	Tue,  6 Aug 2024 23:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722987998; cv=none; b=Qj5mfRq99oE77wJbMsggizMhV7kcAFdRGvffejzwiBUfS2/xqpojVDAz5Jco4641NRtdHYEQvj9f1TP07vVE5GHrV4EWglOZfrv6K/G59lzL/izoUHtI9pDWOYjoJOY8a5S/4BncZJlszhMD/z205WUsKz5cA3F3NXH1o4spMEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722987998; c=relaxed/simple;
	bh=Nxt4/uhwOXAaUpQmH3K0cMnBkKacb++XEiN9uDo6iXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pw5pG/y3yctjeMFAwUNcKPqauM0VLACrg0FfgELwL8sxfQLPf/66QW69EgBas0aCxJSCNXHdtBOXXyWFHGc0et4GKhscHZTpzhIKbkTdMkpmCgLGt9PPUcL704CSKww/skXB0GEacfFphLO2aLBM3B0TuLAEmxn5NF1s9yTQtPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EqquyR4S; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-70d162eef54so952486b3a.3;
        Tue, 06 Aug 2024 16:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722987997; x=1723592797; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nxt4/uhwOXAaUpQmH3K0cMnBkKacb++XEiN9uDo6iXc=;
        b=EqquyR4S52+PzA8UXftCOiBLsxEHJ06LA9LmncFXqYK3eDTcHE7H8hM/UbnPMpXf76
         /L7Mzy+SDXU7mBkskCMu7pkEyHTb09EAYcXrZbn8IwwdDhEO5ZbKCDYhIezGEyxSBDtv
         nQg5hABKe7Mwvnc26tAZuIGPrGkCJ+2cj3yQk+NpYORNKsRDdGwQoolXD2ocs+4QKVnp
         cMvNHkqJm67Ev9pK4Y+d/C2G+k3OHao4JXYNBIrPeZtkQGhomg2OfNYNzmUwi6mD+gmL
         jZMI2Lp/+n40np920VvcJM7PKaCbiB7B8l/yBNSkP+GU0cTCO9REhRaYOccn3fVHL2UY
         8HhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722987997; x=1723592797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nxt4/uhwOXAaUpQmH3K0cMnBkKacb++XEiN9uDo6iXc=;
        b=CmQIe9sYd8C7vagA6bMvpsrrVdCXsp8eOakare4/vrFspyV9y2MPo++YGUYagKCkG0
         By/zqPC+svtk0AYaTPXsgAV6lcYT4PH9VpyRvHJDEwoZBmYvYu6+lREiFLWASkyCgcJ3
         w2aIzU6yHQ2ZTpXGTPaFtJ8C5Mhfa21X6Wqlr9xkGbMMUVbGw24sF9MGH18jm0BPymgu
         V8w455WGJP47HMQrwXtpkpnWuYLfyvZsmSd8mYgNf4ZV5KuueY5ecLrgXRHWbTBhIKNC
         NBU7WbBq/Yv9dvRJyc7iD16zdKZ8W4aBNIasSuiVtjolwdgGtDdRwyEbJx5tO+5qL3Pd
         oX/A==
X-Forwarded-Encrypted: i=1; AJvYcCXmgV5ELzhQCoV69opoXbj9+SLpqwb0+u/ULBWbpvYEWb1Ud73RScuie7Pxdp56NnK4QxWHoZnnWe89dk1+HqnZ1XlWNho3t2kNP/nPvQre0tyQqxVFa4uZZj/dIGdGH2Qn67bTYE5A8hx4CkqEVLNco/aYBYCOcfJO9WHG/5AF4o0Joz1+KWTLYUE=
X-Gm-Message-State: AOJu0YyA89OR6aG6uadyG37yEHBpOWwXRraX38mo9Q7bW/pwmxi5llF+
	bM1W7tYi16TEEIGnTtIT2CcYooVVLXFhdszY+75A0n4qi90K7ZuSmhzz8kXhHpc1zLViEKaMqO3
	Y745tCjM7vXFPezh6IXUrEkdjU6M=
X-Google-Smtp-Source: AGHT+IGreoqXB2qMOm+fSZsrYLRie0H0PHRwoixFKL2kUWCknXKLMoQQwbr7ACBTms88XDe5GA410mg8A+Vx3KxPo4w=
X-Received: by 2002:a05:6a20:4a29:b0:1c6:bc33:3ac2 with SMTP id
 adf61e73a8af0-1c6bc333f1dmr6976173637.3.1722987996759; Tue, 06 Aug 2024
 16:46:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240806233559.246705-1-ojeda@kernel.org>
In-Reply-To: <20240806233559.246705-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 7 Aug 2024 01:46:25 +0200
Message-ID: <CANiq72nHfibkDWMbLh9hwY-pTEjau_kHLFEMnVN2vm2VZnTH3Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust-analyzer: mark `rust_is_available.sh`
 invocation as recursive
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 7, 2024 at 1:36=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> Otherwise, we get a warning from `rustc`. Thus fix it.

To be clear, this happens (only) when calling `make` with parallel
jobs, e.g. `-j8`.

Which does not really matter for that target, but nevertheless, some
of us call `make` with jobs enabled most of the time.

Cheers,
Miguel

