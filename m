Return-Path: <linux-kbuild+bounces-2974-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C270951937
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Aug 2024 12:44:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C37F1C2170F
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Aug 2024 10:44:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 050241AE042;
	Wed, 14 Aug 2024 10:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fy4Iob5K"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FE61AE84C;
	Wed, 14 Aug 2024 10:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723632199; cv=none; b=CHkvsZJjgb62FyZmtppOS54jYkJQMp+hbkJQkyig9oA+riJD6Un41gRIXNKIIi49rRUynx6VZdPgA1WiVN0H1PGQIQ3S7PRAdsa+D+ENORpOiuE9HmVDRVetCFlISWxINsfj5TuKb9Z4pp0/N/3T32yq64qzp1PK4fB7zLhTZ+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723632199; c=relaxed/simple;
	bh=SJgGuHiDF6Pum/YzBX1eIhR+ZuD4wPAvutfWL+CK068=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GuhYGux0zj/DPj76uyDJv3yYe8+tXrlOAsL3oa6STKEJzh9n5ujVnDjcILA1gh3UzN+qIyqVBPSS/EKtsfiBJfMzqgCJRkPpqsJ1+9va4triEq7TpFvJZOfom7ooLtxATml1R1DbSkBFL+4A3iT0JkdGDlVuAwzAr23U9u4Q/y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fy4Iob5K; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7105043330aso5303333b3a.0;
        Wed, 14 Aug 2024 03:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723632198; x=1724236998; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJgGuHiDF6Pum/YzBX1eIhR+ZuD4wPAvutfWL+CK068=;
        b=Fy4Iob5K/lyBmYpymumOJ+AWwqz+c2onNbLAAhYOWPdSDbPvOVxf7w1vQaeBF8gO6c
         P3dcUkpn0NKkYjRU77jiH9NzoxudOcPb9tCuLv5SxaRnH1c2HYHVZt6KsqifOyxzCI+A
         IuvSX85rZjI5okN4JhcYsmTLkIxcf0PttLa64XXSj9NRAVUcwo094KBwheDCgtbo2FKk
         JtLjB93sjJajx7Q/YjaNpj6k+AMZE9iqJSc4+Tt8hkNxvnEddG2ACq6TMTrUYTB39K3V
         zOOJDGv5dAjysieJKiH7rW26TbYJUAW5cB4xsE8ZxICjtuCbfa6knEi75KPqaSBgnQx4
         PU/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723632198; x=1724236998;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SJgGuHiDF6Pum/YzBX1eIhR+ZuD4wPAvutfWL+CK068=;
        b=mccuQ1hYZ1z5mAXpny2tPUVQXoPcajCFAVGMu8GGiuDhtF041n4TOiyelVrTPx3hzV
         aleYQyLwUtWXQfbAPTQIUL4ougMxgcLTxhPVo0B0vYkUIPv9OCIPTZP2wT0UaZD4mwVp
         5IWXHLU/vdGFpQR/RqB75HlX25ZL70+3dbcr8KEPGGRs2hghnj68XABAREnz4cbHQvfp
         1Iu8TMGJpzzuqPcsTmVA7cbyD33UiX8DEg+LhBGVQXvURzap99E7d5M64GrSoGODeOAB
         MUvUi2X2vzVJdJl7DitNMqzx1L18bblFQmjHoOKlKBevddF1jcnfTJHeoVKUJOvEEBXM
         z6KQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3EOq1r+tCBjoroZ7YC5v6fS5zN5yDzRnIOMVBn/qCHgK1Q6F1nu3U+aQUg1sPV0Sr2PB+OvzsdxEsGlydk+o/qHAGRkWoDaFyNae5OHY9Kcm3Urc2BnTOYQlh2xqwlmCWht+of8fUnfSzsVXR8dEKSblzVy3nl5CH8Q/Df3ftcNmOa9bVoMUUm54=
X-Gm-Message-State: AOJu0YxklN+SSDquf2QZTgnafUriPLGMW6a25NOXXkAAYVYaq7CECEK6
	6ny1TvwJVlDMrj8VwI0RzZtYX8OMX6yunjaSKtHQycnDrAT4h6xnSgPMx2hONgdy6bbESf3HV+D
	JGbVTTqAzk6QzPepxj0sBVs38Sik=
X-Google-Smtp-Source: AGHT+IFIa9V3yWXmwOQT0TMkZa8EL8RuR2frnvNvc4Gi/6m3ZxiWzN6173URG1TTCP3M1canYCwYcwApz8Y44mtHaok=
X-Received: by 2002:a05:6a21:9184:b0:1c2:8949:5bb3 with SMTP id
 adf61e73a8af0-1c8eaf63b4bmr2851238637.42.1723632197682; Wed, 14 Aug 2024
 03:43:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240507210818.672517-1-ojeda@kernel.org> <ZjqmfIhRz99BqXtD@boqun-archlinux>
 <29eacb0f-fd78-4024-aac5-1606fe002dc6@de.bosch.com>
In-Reply-To: <29eacb0f-fd78-4024-aac5-1606fe002dc6@de.bosch.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 14 Aug 2024 12:43:04 +0200
Message-ID: <CANiq72nLgdkSJ6SgMOP_k9_PUNvPk2gqQQ0sKLGn6Sn9F0+uug@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: rust: split up helpers.c
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, 
	=?UTF-8?Q?Sergio_Gonz=C3=A1lez_Collado?= <sergio.collado@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2024 at 9:19=E2=80=AFAM Dirk Behme <dirk.behme@de.bosch.com=
> wrote:
>
> It looks to me that this is the only/last open comment? As it seems
> there is some consensus that this change makes sense it would be nice to
> get anything like this :) I just stumbled about a local helpers rebase
> conflict, again ...

Back then, we delayed this one because Andreas preferred to wait for
6.12 due to other changes. I think he would be OK with it now, but we
probably need a new version anyway.

Cheers,
Miguel

