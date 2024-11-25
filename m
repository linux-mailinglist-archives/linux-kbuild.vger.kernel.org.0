Return-Path: <linux-kbuild+bounces-4848-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B549D8802
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Nov 2024 15:30:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B5252826AF
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Nov 2024 14:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 140561AE01C;
	Mon, 25 Nov 2024 14:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ol6YLCIK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFF618E37D
	for <linux-kbuild@vger.kernel.org>; Mon, 25 Nov 2024 14:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732545035; cv=none; b=Ugx+0LWLavtCbVE+lo98+W2Fi6j3qExkiiggkqDpKuyWYTVLyPzlxoUznBdAMfsNpFEn86Vpap9Fav2DfVbGK3IXZd/b3PE2f7F/7xKBlr1FfR3/EQ4eMwp6wLkoWUANCTz2OJvR8sj3oqcFGsmMOsvkBZTK17IoAbnhSaaOyms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732545035; c=relaxed/simple;
	bh=dmYeT7WagzkwY7FoSyZv+LRd3sqPOyrA/5puocpIySw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VQk6B/E2BNnt+jb50GM82rtjpK1WlayIIgVu/xZBnH+P1i8eKEMaNuUBiLoCNZsjXlonH/kXRGG+ZwZWYZc6BN0dr/4nTQE5JXchhHAbMhe+fX2beh8sBRQvRjEppkT23r4JR3lGqReboGhvPPMPweKvFnC6EdVhhES7yI9uomo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ol6YLCIK; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5cfc18d5259so10567a12.1
        for <linux-kbuild@vger.kernel.org>; Mon, 25 Nov 2024 06:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732545032; x=1733149832; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dmYeT7WagzkwY7FoSyZv+LRd3sqPOyrA/5puocpIySw=;
        b=ol6YLCIKEEREbo9liHfVf0ccFFuoJ+G4UTKvlW3s9ax0W7rwxAs2rv2opqra1OSVog
         Fc0qrajL8RHU4TQuhO6jEYmDdTOJtLBoBKK+39xt242YNTjQ7bsxGc0I7wXEcuTduEbq
         JMhf4/aH0nYR3ocDy/S4dV5OEmU4Jva2zw+Mnbz/arU1i5NtVzqnasAJUl9A67n/Jjsf
         QO8tye20IEmNUdsU0kQVvt7n5w3ALnNzFHJXbQogQL9kUDa092qka5SBIzE96jD+YY5J
         Rg6mzTn3W2bShGXlWojcaQM9uX3nHQrJ8ffWmOA6Y1khk3Htvqh9F+4I+s2b4s/60y7O
         F2IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732545032; x=1733149832;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dmYeT7WagzkwY7FoSyZv+LRd3sqPOyrA/5puocpIySw=;
        b=hT+NCxFHuEyz6l2p1crnMoERQB3eGjHGPwi1fq8Gb7A5mODXy74c1nn4oGoAh/ZnJ0
         uiQOQkzk559vNp/iQPg38iTk8COV2vddZCpqmUq6j3LU88sBpfX54auaG6QSwgZH7RpV
         MStieDcpUvzG4xKQnl9raaJRHuwc82WP2OHckp78WavCFpwa4WuXwUXogVryhNMLARWn
         LgYIICsu34lAetwZK+KbKHMtE71/O07Nr0ugYPIoaZ85ciROLJi7IBZtiUrg3ZppDdNO
         +fyb+h1rTGb0hkXuLL0WriOpQyvVtkBauR+b4RU+Iq4WVZsY02Le6+C3RCGAYRWsBziY
         CV6A==
X-Forwarded-Encrypted: i=1; AJvYcCX9tEIWnP3/FRs2t132lBVxlmpTsSFmYQmdxHz2Ly8L/wkJunp/eXVpX/JvATE9IQsc3RsuKXXouBL6X24=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJw+MUm348yzKqoeLlQTUAyqhtCpgWqvNWitxk42lYvrLjPhTp
	QSAyuc5G0qVge3njPAgjH93iK6RcQZOJJAURLqCYJhc6T6ga2pLdHsYDmDG48ch2Msm4yLgDGhp
	VH9gcy0QG8V69h5VRUL+4Peh8vJMAMGMLzesg
X-Gm-Gg: ASbGncsxu1blNTfqP9CQV1rW3i0QpnyXyt+nCNJLLWSISBwXcZjreqoM2nqPB6ZMKCp
	OofbPl5Kbh+1s2veku/tDB4HCofQaS9Tt9dCxnn3/2eOJb4JLwQARRUSGhviA+Xu0
X-Google-Smtp-Source: AGHT+IFWKEzbGpUOrfyOjGRqTC5/oGFC/C8dANhbCDJLguS07R1QYiU2nCXA2rPbI2+60Dcss+8N/xSO3iPMdyVL4co=
X-Received: by 2002:a05:6402:d48:b0:5d0:28dc:b2cd with SMTP id
 4fb4d7f45d1cf-5d037fffe79mr164939a12.1.1732545031685; Mon, 25 Nov 2024
 06:30:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241123-extended-modversions-v10-0-0fa754ffdee3@google.com>
 <20241123-extended-modversions-v10-1-0fa754ffdee3@google.com> <87mshntv10.fsf@mpe.ellerman.id.au>
In-Reply-To: <87mshntv10.fsf@mpe.ellerman.id.au>
From: Matthew Maurer <mmaurer@google.com>
Date: Mon, 25 Nov 2024 06:30:20 -0800
Message-ID: <CAGSQo02PiWgAVR2x38JxQgCQr5UVHyn+S7+TQ9oto-hTSh32tQ@mail.gmail.com>
Subject: Re: [PATCH v10 1/5] modules: Support extended MODVERSIONS info
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Jonathan Corbet <corbet@lwn.net>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> I already acked version 8, which AFAICS is identical to this version
> (for this patch at least).
>
> Not sure if you dropped my ack on purpose, but here have another one :)
>
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
>
> cheers

It was not removed intentionally, thanks for the re-ack :)

