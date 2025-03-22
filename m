Return-Path: <linux-kbuild+bounces-6301-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE922A6CC23
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Mar 2025 21:12:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31FB816F3B3
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Mar 2025 20:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D6A223372F;
	Sat, 22 Mar 2025 20:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="Bgm1m+1F"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BB5233153
	for <linux-kbuild@vger.kernel.org>; Sat, 22 Mar 2025 20:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742674345; cv=none; b=qLAWnq91r4/Ta6n5uSDswRQkw0IfwQZfscYNZxofLtcYg3xUIDABO6u5cjXArkWz/WJxiQRGyo+FdJfY3WdVQvfFWKK8QCNRT08jpJJnp3jfqI3cGtjiVeA9cX8w4r3uf2efUV9xMFhLVI0+JsuuhwbLLQlOFQEaFQ5A/qDRkUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742674345; c=relaxed/simple;
	bh=FyKkeKQ5wFneLXjBFFmhNdP7NtjNnMECbVyBDl05Z20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=coDQ+coEpziljCOpILZAZQdKCZs0PkzdoPLrrwUk3VY57VNaKAeyAtFJWFwYipOUMMK3ETXCXwyKtOVc5X433Sx8rDOVetMm6TsUMJRuYGo6ZjilkRFwW24090njSpCgy4DJRga2ZXB6yHxP55CMuf9090Fcarru3aEUngWJFrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=Bgm1m+1F; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e5ad75ca787so2729187276.0
        for <linux-kbuild@vger.kernel.org>; Sat, 22 Mar 2025 13:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1742674342; x=1743279142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XftD/bet0ahddNcDhTpxgjJPCDxkr3EcvVPGIXtlOks=;
        b=Bgm1m+1FdeLWjtREBOPjSk9vY5UBtgXcpNHpOuueqRpYA4vamxdeRh/+j+WnBrEOWq
         uoMUHIgLuSane7sljWj9063CGK/5/6MMvukCUMWbNYLxdNE/7yGrM9GqI1vQ4utblYhq
         8JQ2jNfs6LkMPylJ4guJBW5FL55Z6d2zZmiVdT0P34s/WL0NzTJSwL0FzYhF1euZkXkO
         YBeELP1ov+qDDivvRaTPXyxmKWiGDUamWdGqLQr7TlxhwBgs5AAjCbKcfraMUv0D6lQ4
         0MudcL+5Mjzi++nLVfgJQl5HEbtZ/jqQblnWngF4NjL16nnFY8pFVF12Nqd/Yl+Odqkv
         UutA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742674342; x=1743279142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XftD/bet0ahddNcDhTpxgjJPCDxkr3EcvVPGIXtlOks=;
        b=mP2HOETeV9PhHCrviH3KABVK/LsH8gWns/EWYDe4ZQr9e8OxLWe98PjfgjNJHL/oeF
         Hp+z8cKYyy6glVkKELq7wJeQQGCP/UTYj8FKiI5I/kdTUZF5KwzEdSy2g82Qqe532IEM
         P83wvQWkNysVjtgPSpPR+Um/iMSDAwxJVRpqdSgY1cH6T6HfX+UZ/sjh3501MLBuhbMd
         LipaWqrW/npoukKj3ErOQOTqX/Bv/xs9tfBGDTCaTLnH7MTGlPSE4Kl+IRsIYNh8bcZF
         TF9FUPCBiVNkZRqnaXnMwj2STudLsPaWTGcFdj2dJE0bv4+/qIQUukncouPF22Plsx8T
         QDNA==
X-Forwarded-Encrypted: i=1; AJvYcCVVqQSpIITuoPeHd4f16v1iCV15zsQK7vgnZ70HQhrCBgbxE7WG6Sx5AenlngvHF+FZDXCQr2790wr1jns=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNfaVt6YgPlyMly4tHHP5H/8UiW6dQFU9zQ+8jHTK6KfxomN6p
	yXQkvKMYkK+mMc8JTlN0ZMBYTx2guVQjW69yMOOp0MEEjTcrnsNXucMHT5PQVAk=
X-Gm-Gg: ASbGncvkVWeaPBGuJ0/9rQkBS6AdNSfnpuUfdSjfsTjgux8i53h2ZIaLHhU54mIdDK6
	nI0cDXzjLdkGLFIzYlQ3t9hxxJXTdXuV2BMcDS5eujKbaWOlM77APgI8MPt2F141nqi2f5skY8z
	Ccs5pe7CNvJVKdhhGv26BUDonmxncrtUFPq8PH5D1pPwe3ARrLvO+LNUsQTwznqCbrom2DmhZbC
	f/vl96QueF1IXVzKAKuoif33WeNnfbeG5kzSeM23Yu4vioXXm3+5qY+bCyKmOQDmVSKemXBFMZm
	XJKMGltSvOY4jXJznkT5LCtqA+pIrNe30omMIKBR13bd/J2kSfD6ExcHnWl5zz+yZz54xsVcjrE
	kyiaePyLlm8jJNIUW2rHu0E+AVDd6Qg==
X-Google-Smtp-Source: AGHT+IGHS6lOSvoLhDMVoyZEV4FQ3Hl2dcaBZHwKEjAP67NOWR+FvTBSQKC3rq/SW7tAZ1/KBxRqTw==
X-Received: by 2002:a05:6902:240f:b0:e60:88f9:b081 with SMTP id 3f1490d57ef6-e66a32ab0d4mr10539765276.17.1742674342100;
        Sat, 22 Mar 2025 13:12:22 -0700 (PDT)
Received: from Machine.lan (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e66a4246db8sm880436276.13.2025.03.22.13.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Mar 2025 13:12:21 -0700 (PDT)
From: Antonio Hickey <contact@antoniohickey.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	aliceryhl@google.com,
	benno.lossin@proton.me,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	contact@antoniohickey.com,
	dakr@kernel.org,
	gary@garyguo.net,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	masahiroy@kernel.org,
	nathan@kernel.org,
	nicolas@fjasle.eu,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	tamird@gmail.com,
	tmgross@umich.edu
Subject: Re: [PATCH v5 01/17] rust: enable `raw_ref_op` feature 
Date: Sat, 22 Mar 2025 16:12:17 -0400
Message-ID: <20250322201219.1947215-1-contact@antoniohickey.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <CANiq72=5Q=H1dUD+RQE+Bg579HvB8iE=hyFmtDAJD77JqoUjpg@mail.gmail.com>
References: <CANiq72=5Q=H1dUD+RQE+Bg579HvB8iE=hyFmtDAJD77JqoUjpg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sat, Mar 22, 2025 at 08:41:11PM +0100, Miguel Ojeda wrote:
> On Sat, Mar 22, 2025 at 8:12 PM Antonio Hickey
> <contact@antoniohickey.com> wrote:
> >
> > Ahh ok yea that makes sense, thanks Tamir, sorry Benno I misunderstood.
> >
> > So the reason I extended the dashed line was because before my change
> > the dashed line perfectly aligned with number of characters in the line
> > I changed. I figured it was supposed to match the amount of characters
> > of the line.
> >
> > Giving this a deeper look it looks like the all the other dashed lines
> > are maxed at 77 characters.
> 
> Yeah, it is just following other section "lines".
> 
> > I will update this.
> 
> Benno is right -- no need to send another version for that, I can
> remove the change on apply. :)

Yay my first patch to be applied :)

Hopefully many more to come, thanks a lot everyone I
have learned so much just through this simple patch
series. Appreciate all the help and patience +1

Thanks,
Antonio

> 
> Thanks!
> 
> Cheers,
> Miguel


