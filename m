Return-Path: <linux-kbuild+bounces-3702-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D016984B33
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2024 20:43:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DF6E1C22E8E
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2024 18:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFC161AC880;
	Tue, 24 Sep 2024 18:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UvxwJMmK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707691A4F0C;
	Tue, 24 Sep 2024 18:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727203378; cv=none; b=i9zCCEgkXhnyHlwNFXsZ3U6RxY5OxmS2rItHq4mTKMzM8Ys/pzMQhU5lbo6UMd0u0rV3XPlWITnCpntRx8vAZQL4j1KtuUgmjh4YPMO1EKtzEWfkGju93T4YmeXAJuI2x597norOF03U4TNOWV6ZrEZEi/oKuqxht0b5xWZ8R9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727203378; c=relaxed/simple;
	bh=qem24K8hDJtqOZflZxzGoBu2Q9HuUP6RNgJ8qSOhPoQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WRcots78mpBnKsQ0T+QiEtK91tAVbID1QNmnOQbrPZuJmYOVEYvt0gM/hNgLYYirNDOv88G1d7ho9lVTYR/yOEgqS1wwGOo8ptUehcuT0QWcN4/f5uPQGzg5mxW8MP9JPCP8a4clMXMz2xXZd0gpo6NdDOmgGvpzj4llIgSs+1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UvxwJMmK; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2d8afdd62e8so1072419a91.3;
        Tue, 24 Sep 2024 11:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727203376; x=1727808176; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AfURFzn65sh6X2dItLUMd07O5TuGvYCWV/xXT4OYjhY=;
        b=UvxwJMmKk/1fHqe++25JLeGaQoTYzxu8qozRHm1QJvW0IIErPMm5/5nHTuecF7VcJh
         Q8T3Q223Da0Brj+LzWmH0raxeOtYVddVRGVG1qzRVN5XUUd0Muq4SOlunyK9SeGSuTGh
         PPihLjZrAlXsjLkrmf28tYmAbxHEUpn/HJCOTiKlj2r6GHgYFPFEnDLrnzt+AyLaEPk3
         bjwL4F5N8GdZkCcASaKyW6dsOD83VsHIyZiojZbRiQrCTWqvBv1pymKiVptsYgEllLgZ
         pUWrr6BZSqPUChBRKlmT1GWhkepJwXv5E1rmi+cyeVYpE6o6MTgA0+XqCs0vuoLK9SCs
         pnmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727203376; x=1727808176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AfURFzn65sh6X2dItLUMd07O5TuGvYCWV/xXT4OYjhY=;
        b=obBkmd5YElShTnVmQDj6ElXg2wg2cuDtBa+5GNjcIQud/XBAYlkn4vS5JSwYADeloL
         AFG47NdE9VknXTQVu9d2pgl5vGHBz8PH3zHA4kdkzRwmPBA17XTMQ5fSzVro9hvNPHxe
         v8MqoxeRdZZ2VOWIdfYizzZ9X5TqjtNb5nU25FVHPFbF483ExcRnVJLR4c5L404PhV/s
         Tv7V2QYvEJH//T8ZanucBHiWXcNOOM4S93TxsjV+Lq5r0ISf/N6zEVzmE8Xs1Tza35ae
         lUoKvk9K6LT/kt7wY1lTWZcgTrexZQuXMwNjKA8Zx6+4dYjq2J+/UlvnujtD+fILGO5d
         guEg==
X-Forwarded-Encrypted: i=1; AJvYcCV/7ryEaB7gVehSy23PsoMhgb4EGCadzgXJBvFWD0j+SHA5ezNd9uCMgqJ7qcn7pveMUfL3Cqq6vyCF5BqL910=@vger.kernel.org, AJvYcCVdFtPWae8ardJ+eJt6x9Giq294vQjkZBGJfCl5V3YvWg5qmmb8PI1WtdHKVEJalIFrzv5cmWL09zpbrKI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLIWvrfe4BjxRlIsnoUBNCkgRAYVRVA0uGk5XHO0Iuwp6B6ZFM
	J6fE/JjywqBhzb4kG4yBuuPSyNL3dhzLtDH93ROl3yCQAGeLI5NsadCdpudGvcpbcnM63HIYrul
	0pmnMtNSoR8g86w03Jy8SbTrw2zU=
X-Google-Smtp-Source: AGHT+IGRLgHGVhSijck+qaah7MB5r4zyIKNkXh5xMY4YGSKcSP21XOEKI+3jbVBEVqm+Ow49sg6OJYTpkozSDQXoWdw=
X-Received: by 2002:a17:90b:1c11:b0:2d8:b071:e10e with SMTP id
 98e67ed59e1d1-2e06ae2605emr63840a91.1.1727203376556; Tue, 24 Sep 2024
 11:42:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240913180622.1327656-1-masahiroy@kernel.org>
In-Reply-To: <20240913180622.1327656-1-masahiroy@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 24 Sep 2024 20:42:43 +0200
Message-ID: <CANiq72=ynULSpiBwvpau62ym0cx+WDd99T-4LBh5V_h1YCfeag@mail.gmail.com>
Subject: Re: [PATCH] kbuild: remove unnecessary export of RUST_LIB_SRC
To: Masahiro Yamada <masahiroy@kernel.org>, Fiona Behrens <me@kloenk.de>
Cc: linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Benno Lossin <benno.lossin@proton.me>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 8:06=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> This code was added by this commit:
>
>   https://github.com/Rust-for-Linux/linux/commit/3f46885dc03ed2d750085b22=
37078a1628323964
>
> Please me know if I am missing something.

I think it is OK -- unless Fiona recalls something:

Acked-by: Miguel Ojeda <ojeda@kernel.org>
Tested-by: Miguel Ojeda <ojeda@kernel.org>

Thanks Masahiro for the simplification!

Cheers,
Miguel

