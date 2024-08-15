Return-Path: <linux-kbuild+bounces-3029-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6327C953C19
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 22:50:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C113DB270BE
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 20:50:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 528E0154BE5;
	Thu, 15 Aug 2024 20:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OBD/ahOG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA3114F9CC
	for <linux-kbuild@vger.kernel.org>; Thu, 15 Aug 2024 20:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723754908; cv=none; b=acARuYcc2pdUV7lCfyeCJEzh8V4uRx86GEwQQh43enZAjOMbBPRSkyGujCifx/XYJ4W4gWEjmdN57DRvu/pNG5jUiORPvJrGiqj93VWg+7VrkCo0ZrpfTbER939fVecvFiG5QrBbLnvOvUY5lPcMfominw4x/NWJWDVZz7BJoXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723754908; c=relaxed/simple;
	bh=UWFk8iT+QX+XvTdHdEEQEkz3sro4r7bOKwiITHQ68Hw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A38FXBCIJOx5ENKK1e2p3D0zf62H6ttGm1SPM+YtWKcP+dUhWUsZKspmxR7891b6pJZbsHNsoqPk1dnl7Dyw7J3mTlbHEkqpfd7gL5WpwqFWQpbyXLA2eKsibL7Sgwt7uEtdZSGKTExjGOMEn4gX0hwM/4IqNaMrkpQ/WOyu7Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OBD/ahOG; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-4f6c136a947so600706e0c.1
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Aug 2024 13:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723754905; x=1724359705; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UWFk8iT+QX+XvTdHdEEQEkz3sro4r7bOKwiITHQ68Hw=;
        b=OBD/ahOGj+5fGqX/GCCCQTfdWEAnUgKQKT+Sd6w5eEB5nZlXJPqXRIam8j+7yKPx4n
         njES9omzgf5ihdA3NriJLGOvoD3AwFU3f5pRDs9b2rJbRCdLf1oRF0LsT1L8X/wAqc38
         tNMFnuS7Xrj5AaoMtcFLHg7frtJ+TsFmNFfzE8vDong1Yd5lWegJpnZcZqNN0qnqRDMg
         da7etcpFhJcOSQtOWfyHstSvvoitNTd8/q5LsWs/XeDhf2o9YXM4VkhwfeJKopLpy8GK
         tZPatHH4sIs82lEiY1UAotnrMr/swjB0dbC4R5XmTWZ6ldr7RkdZ1HtYcZaOqG5JbLsb
         zREg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723754905; x=1724359705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UWFk8iT+QX+XvTdHdEEQEkz3sro4r7bOKwiITHQ68Hw=;
        b=iHSiKQUFxEskqIpJOjLC2Fl4STDKXSFCd5ex3ZWXzgDk6axZeUROJc6LRydCIFFd0Q
         R0JCBE4YGTALQyPVz0OdI5mYoWonUArCsOske4PdWDR0G4BH0oFCBBFz+YPdKk6E5u4f
         wCvxmW6o7c6tbchucUfBMaSvDQrBnQrt58RWT8EsN6hkUfQoHi3wPN/nftGLshWsSmgR
         YhYrPLZSb4s7FdoX4Y9PutPj+8P8NanSvnhSEHi7DJriOmqj/q4fvioF2bg2MjhA6bQW
         +i7ouqASslsuRwVwITAp1iDHkayZQROiyp838rdFSguxe7dn2+SHsO6gA7rmxcc98TYW
         3nZg==
X-Forwarded-Encrypted: i=1; AJvYcCU1HoEwuEZwdZ+dTK8nIKK+4rZumNhdxHUsfPfLuGYD8fv1leyYYw+P0UDdZCzwsQCI47NOmB241bmJMftYWOsm0TIoPjS8FQL/xpVs
X-Gm-Message-State: AOJu0YybxEB4trXYNX2XZknRrSzABGBMgsHdmtMJMXcyMnsrJXTmv2Yx
	7i80qLYSl0u+CIWrr5L/58A+IfaNLUm5BNCO90hUqxl234lPgLdzMLuzV7jxgGN7P7TjtcfgL/q
	TaPpScHvh0j8vHn6bCO4W1GMKmrvdR1qEgCIw
X-Google-Smtp-Source: AGHT+IGVnfhBG4W19/FTRIrb1hsBS75Egz6aKroeRS9ZT/fPOBGhFknbNSjR/FE1Ln68gXD8vpeEUMfZUXOrDt+XP5Q=
X-Received: by 2002:a05:6102:f12:b0:492:773e:a362 with SMTP id
 ada2fe7eead31-4977999b09cmr1311619137.25.1723754905259; Thu, 15 Aug 2024
 13:48:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com> <CA+icZUUdevE_n4+PgwisFdpxz=7XwaMciVKn+XnDHo-=UqRZ7A@mail.gmail.com>
In-Reply-To: <CA+icZUUdevE_n4+PgwisFdpxz=7XwaMciVKn+XnDHo-=UqRZ7A@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 15 Aug 2024 20:47:49 +0000
Message-ID: <CABCJKueVBE0oZuvsDGy-etK-LcK5p5RJg_CQJQnPQ8MuMpGyEg@mail.gmail.com>
Subject: Re: [PATCH v2 00/19] Implement DWARF modversions
To: sedat.dilek@gmail.com
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, 
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, 
	Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sedat,

On Thu, Aug 15, 2024 at 8:14=E2=80=AFPM Sedat Dilek <sedat.dilek@gmail.com>=
 wrote:
>
> so this work is on top of Linux v6.11-rc3

Correct. git format-patch also adds the base commit to the end of the
cover letter.

> can you tag it as gendwarfksyms-v2?

Sure. Here you go:

https://github.com/samitolvanen/linux/commits/gendwarfksyms-v2/

Thanks for taking a look!

Sami

