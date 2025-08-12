Return-Path: <linux-kbuild+bounces-8413-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6E7B23956
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 21:55:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39C536E210F
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 19:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 373AC2FAC11;
	Tue, 12 Aug 2025 19:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3idmMqT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EC72FA0C3;
	Tue, 12 Aug 2025 19:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755028413; cv=none; b=Qnp1SZ0NI7uQcJsFfqjNuYvYMiJN4HwUgJd0Kg6dA/yj4RbgJP28w5we34p8EPmh4YSZm1JEmrTmC2e/r4MjWm/fD/E3rsVWLJpgYMC5b0K19NKqTONNxCScqAzRkt/hwXyrKGSEUppf+gjU9IESZ+6VCO+NTqqdl9t9BSUY9+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755028413; c=relaxed/simple;
	bh=vhKEJdDCorgUHjle84atTRE7pJ5rUNqpQxJLE0r93UY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mam06iIQYOFq5vfqHGRS4uObX1ZtL6plVbOEbk3uD4C8baBeM8V+LHWkGD/rAuDK0NJ3nrMuZEJy7888uqK8+Hyy1gz7FqRUp6kIsr5Fg9m0A6wvaHDdIFifE4KR7GrFW0Ug9HZ79yWGPsmA7K4BeX1geIEJJVVpBLRPGbSgKQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3idmMqT; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-242abc28161so9089975ad.1;
        Tue, 12 Aug 2025 12:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755028411; x=1755633211; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xUy+WBIe8s5eG7yD9G+tniGamA+stC4Ks75UPKA0L7U=;
        b=K3idmMqTP+kmUyhIi0NbiOTgorAJtC3pRgKuBRFPgsLOp8okTaLE2BIVDa5+XNL1tx
         /jkG/L60vTC2Z/66tPNDKP3slTAYiGDSXaEwOpROatzTVkYz9z0Gv7xfAWHCdwevbIgN
         JPTIu7C89tsXuAXSlZJmTBtOTTaV5cEZlCcGeQGquM18HccClOkJvCcY2V/hD3XEg/KG
         E279GNcAvwqims8AUfqdHSJ9G7Nr/Yrqt6nOfUpAkhR960wEeF/0eYDbI+0sDu+2rXPy
         PF0smlfYRGjLe1s8YJIP0UV1l7RlNt+JMaD2rGfIrkJ094AjFaFRHYCbsMrxWjclaeq/
         4SqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755028411; x=1755633211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xUy+WBIe8s5eG7yD9G+tniGamA+stC4Ks75UPKA0L7U=;
        b=KCT9gy/ZJCnXsdFb6IXQgamrwJObUDO1h/UghBHHviPPlU+fEgDrzNWBWkQrykFU/T
         7Ob6vJur0fAXq5DER9RfAccCUAOTj9XTRG2utPtngtMV2oPiVRivAgocDQXoPVd0GsWT
         kH6zX3T+Tk4Ge0btgDNBES3jCXXdLMSMvHyEAVGFQgW41fT4K/FKv0dEe4cHxBSL9Ahp
         upilmgThqy+l+xQd2HNKxWBwsp40UZGmxTyNS4VNVLSqO9QlQrpPqnXPyPg7Yb2eSP4A
         Tv0mpdRwUBAZig2T1HmbYiiQRH3aaeWnKrjWgtjlSOpVXxfOtL50olg/Hkrjj0RUZ+Ee
         GVQw==
X-Forwarded-Encrypted: i=1; AJvYcCUE2GnXUKH6kYGKC9OY6OhTj/oyMAR7LpEyyVu4gzRcf95QKHomu88M4inNkBRQ0Ui4J162zzO9@vger.kernel.org, AJvYcCVPxzd9PaVlMdpKHXQnnSEftmW4WQjg8np9OLbD/DarCN+WrthgfoLJ1r+jOshRQx1GlVPNSeHqrEWnJgvbrQU=@vger.kernel.org, AJvYcCVX0jMDMEm7xiit3JqIzqOXeg1xL1ANVuOXNBeLv8bJJ8vFLklP0rDD8MojGfcUHRS5IG6PD+r1pOr08aKb@vger.kernel.org, AJvYcCXGE24MfuFVjIG0dwSfi3uwHY4A11leoeE3CvQXJcPNiTTsu5ucmjECnK4fW9bEwAbAyisLgGQhY3hIAfM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0ynGNSC+94jcj5Tki7UBYYRBpFobMvSE1hmWZkmDjOACvADUf
	inSBs1hyFOxw/BUAEW63xOH0B6DYhLp/nhO5veSpuzH2PLT0nMgDOiXem20O/qqOnggJpzdZwlY
	KiGSer8DjEbytV2Hax5/vgiZdRpCUz9M=
X-Gm-Gg: ASbGncuLLGrCWPuTaX3UN6Q+oFiC9BWwWrWM2mP4z0LcqZU0PNg2Z9f0q2gpsNVJgkK
	eV4x88fBL5Qfc+ALZRtXCfuXnWlu1TToPUQOAmk4tPBYa+Yd4BQ0A0U8bW+fc5J6Yxvg1/z/Upy
	bRSUns1AfmKOb+8varpUoDCRFtYt8oxWm0LCqFNfceyPomcQriIbt1mU1js/dlJb7Hb/UCwB0TP
	CBarTfo
X-Google-Smtp-Source: AGHT+IGJF9vlSl6LtugLF3G5FrHTTGXElXZh3V5XBDYr50G2/qrw0kFxML7ITvym8eH96YpjpZcxBgyhI2RTXm8ZkWs=
X-Received: by 2002:a17:902:c405:b0:242:d237:e20b with SMTP id
 d9443c01a7336-2430d0f9cf4mr3360985ad.4.1755028410985; Tue, 12 Aug 2025
 12:53:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250726133435.2460085-1-ojeda@kernel.org>
In-Reply-To: <20250726133435.2460085-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 12 Aug 2025 21:53:19 +0200
X-Gm-Features: Ac12FXw9PM7CHJhFQfCIPFdA9X2yBdN7wgOVawlhnEq1u63q42B2t16j4ZB72TI
Message-ID: <CANiq72kbsj5nJCZOo_jh8YzsiX8RgOKVAF=x8vDYbFjoCh6mjg@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: clean output before running `rustdoc`
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org, 
	Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 26, 2025 at 3:34=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> `rustdoc` can get confused when generating documentation into a folder
> that contains generated files from other `rustdoc` versions.
>
> For instance, running something like:
>
>     rustup default 1.78.0
>     make LLVM=3D1 rustdoc
>     rustup default 1.88.0
>     make LLVM=3D1 rustdoc
>
> may generate errors like:
>
>     error: couldn't generate documentation: invalid template: last line e=
xpected to start with a comment
>       |
>       =3D note: failed to create or modify "./Documentation/output/rust/r=
ustdoc/src-files.js"
>
> Thus just always clean the output folder before generating the
> documentation -- we are anyway regenerating it every time the `rustdoc`
> target gets called, at least for the time being.
>
> Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned i=
n older LTSs).
> Reported-by: Daniel Almeida <daniel.almeida@collabora.com>
> Closes: https://rust-for-linux.zulipchat.com/#narrow/channel/288089/topic=
/x/near/527201113
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-fixes` -- thanks everyone!

Cheers,
Miguel

