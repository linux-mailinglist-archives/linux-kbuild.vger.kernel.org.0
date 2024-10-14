Return-Path: <linux-kbuild+bounces-4113-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 696ED99D968
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 23:57:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE59BB2162D
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 21:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A85681CBEB8;
	Mon, 14 Oct 2024 21:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mCWDKhvl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458AF14AD38;
	Mon, 14 Oct 2024 21:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728943025; cv=none; b=f43HB5INmw/1Fq7TJTYWsOPTGzNPIdQ74eRXEqax6IFUZA2xzn3sWLb38TD67BYNZJJAGXVnAth8xEVmS/HUYaOPCCT1vy1ftYgRXOQdKhNno6UQuIvDRlZgtoEP4uUwuyC8WPnhybDQ9B7HVmVbDJFKo4hJzk7KfDHoqCucgzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728943025; c=relaxed/simple;
	bh=CCNhB8wRuPqzKYstyjiKWxgd79v0ox5Jx4ud5FEvrkc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TWTZVbB79ODoV9dTHWgvFUHNOV7QtDRmUquekZC9DLGT1EmW4eE77y7L/uFSFdmN8w1GRviRdnonUlMDitrNO2uVW0drghjZAmyN2HDKQuHqkpZFvrUpNvVi5tvonL2HB00sDGi3U/aQJdEJ244yofHLyLfmd1r87ZohUw+7Mpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mCWDKhvl; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2e31977c653so439640a91.0;
        Mon, 14 Oct 2024 14:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728943023; x=1729547823; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CCNhB8wRuPqzKYstyjiKWxgd79v0ox5Jx4ud5FEvrkc=;
        b=mCWDKhvlMvUgvKeqZQTcZkba9J05+lUUZ1quBITspEg13ofQe1neq+iRBPDYaiUuuY
         prSixy/3GPutj1na3pdUiB2ZFVeaX/uzDBuUIB2xpaIpWQH+KxIP3uqUWEptNz47rxh4
         IZpJ1KUIgx86c6tPznIvLj3yM6GPmsQ3PYUtCSNkqTJIPG5LaCHe6IK7axX6OEzkyCdc
         vpwWL2JEtCKQtHlHq+ESCn2RcgD16I2FQxiFQs5uCntQEI1YrMn+5UUFz4MwnXM/p/oz
         6A4tygM4FtycKAtF/g6uXpfQjQrJgM3Ik1P2+u7MwvPuVRdFNwfikWPHC3Myqq/gFtUg
         41Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728943023; x=1729547823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CCNhB8wRuPqzKYstyjiKWxgd79v0ox5Jx4ud5FEvrkc=;
        b=JziF1FRb87a37guobFmy0AbRXMDVM6Y4e2rGNj1uknXYO2tUaV4n2/jJ6dDhu0o4d+
         fBXV+tc884Qj3iq13FVHU2luzhblxiZOJvsaqqFCA9snpgLc6wAyksps7ASIJdsJVRIk
         5M82XL4viNTU0Yik4s6bFLdSDlc+m4AyrwQApCzPSCDZFV5sWNci+DXb3w2k8QW8JiBU
         EeBx7M1rECf6E8Uq7SPmPRcxTAOVs4WnmpwLRD1rVgiK37054TUiV4zHauM8nNejMrP6
         r98nlSAx5SCVR8Qa/LA/9L6JDFuHVd2MpVq0xA58Zm8c3j/37iaV73pVWWJzyvBzv4wj
         SSww==
X-Forwarded-Encrypted: i=1; AJvYcCULQr69Dcd5kfJfnp8kz93KHRAdbqLI7GaL6nXoaJUyLkTma1GR1uYhXSHGRUZ35xDSriAB547T0mix54g=@vger.kernel.org, AJvYcCWum6gvfBKjlxydVyYSe2HPa7NjPvK7hw0OPIKNSMaIacfW1LJA1Alvy/oVXJ5aqpNLKF7M4te+1/ZVk42cgec=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjD4jELxpt1EUIR8ncQ9Sp379g8x44m16F1ww2nA4+Tc5BG3nE
	S8G5U/nByByCqoQyJtWfpa8OLc31CH9LXQmDXbNq0XWQT+Q9Ewo0Kz/ddIUEMsbl7je7lyCvRES
	ab4+YW4NCu4+TQNvrRGMBJwDtGXY=
X-Google-Smtp-Source: AGHT+IFETqmdiRm4yosntRLT56uPB2qh9JnPzC1RN9dEryG2oHGK85k6vqx/f3Dn2DZWnUDjaR0ujQdVXIEAaReRt88=
X-Received: by 2002:a17:902:dac9:b0:20b:642c:222b with SMTP id
 d9443c01a7336-20ca1724228mr63138165ad.15.1728943023484; Mon, 14 Oct 2024
 14:57:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009102821.2675718-1-masahiroy@kernel.org>
In-Reply-To: <20241009102821.2675718-1-masahiroy@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 14 Oct 2024 23:56:51 +0200
Message-ID: <CANiq72k4+upHYWOtYD1vLZ222EHaau9Q5nWW_HiQJ+xNLHLzEw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: refactor cc-option-yn, cc-disable-warning,
 rust-option-yn macros
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Matthew Maurer <mmaurer@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	rust-for-linux@vger.kernel.org, Alex Gaynor <alex.gaynor@gmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <benno.lossin@proton.me>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Trevor Gross <tmgross@umich.edu>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 12:28=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> cc-option-yn and cc-disable-warning duplicate the compile command seen
> a few lines above. These can be defined based on cc-option.
>
> I also refactored rustc-option-yn in the same way, although there are
> currently no users of it.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Applied to `rust-fixes` as a prerequisite for the `rustc-option` fix
-- thanks everyone!

Cheers,
Miguel

