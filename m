Return-Path: <linux-kbuild+bounces-4298-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B33019AD653
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 23:06:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 694791F267F0
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 21:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B4021EF08A;
	Wed, 23 Oct 2024 21:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X4YNJ68t"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF331E5735
	for <linux-kbuild@vger.kernel.org>; Wed, 23 Oct 2024 21:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729717567; cv=none; b=NdO5apxy4BSRUAHv5xjqN7UUlbz+yB857ENBfnpi4klsSfarvUsMy+zWr0heHx1XB6hJt1ITOjONQpqOFmbmRJsv2Bci0mDgEyZwZtyyCfi+vBxL1Q1q0/Uv2071I68Q2JvXI+AdnWB1UDZYZUCKGUCETq9DUlR4ltrRr05jj78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729717567; c=relaxed/simple;
	bh=/JEcIBihja6V3LP52eHEY4Q3j5KZkMGS+N+dxgjhsRc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X6dA2TV20R+BBnu8zzCGi/8voGIBCjQjl6rHWP25ch8yD0AeL4a66kNpqRV7P5X0rA2u+WZ8lrEvDh4SLF3YFZAwpINDB5YkRLaRgWxEw60dIvHEU5B0KW+nkta23AJDpk7QOMMXW0zhs+G9/2kukN25wLiAn/oVhx9LsmHuyK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X4YNJ68t; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4315ee633dcso14555e9.1
        for <linux-kbuild@vger.kernel.org>; Wed, 23 Oct 2024 14:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729717563; x=1730322363; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/JEcIBihja6V3LP52eHEY4Q3j5KZkMGS+N+dxgjhsRc=;
        b=X4YNJ68t0nwRFvxpqTrPL5CBJYmjDBnPdlWa0T0sajxnUKiHqH6PxrgMr7ESOh34Go
         uRnj9cS2v27XeMen/pbCT4inSZRm02OoqPJbSPT89R4TGKiZ6xBhpx9Ej2/f2UtAGK7F
         7T8pCdmA8lMC8cFzK8G8Ts2sTNVbIebfcFU6KlDTuHW/oRL8tdEh3U28hbI3LZQkJKzx
         o6LVG9QUzf7ytipO8RGDhSttTdF/ri4QUukc3vge4W57Mxt0enKDk8lVPvvUNd50/UQe
         3bgWCpGfzLU0I4dMdOsZbkymfmn/qT1CbmRf/UuhCaphnrWqGkKv8hZ0Ovd3bKxPUdAI
         txLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729717563; x=1730322363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/JEcIBihja6V3LP52eHEY4Q3j5KZkMGS+N+dxgjhsRc=;
        b=X6DElTE7L4cNXi5MDp3wJw9ZgbbB8AcQoHgDWV9BK7RsoljoG88FukgWbJ7q8sVJFD
         QJbWEToTUnTSDkEzDQTfWTtU2aqEV7YzaY8c7lk5rR1ToItZCFuPHARFf/OkbFCYcHnR
         0hc1pNRNHMBeZnvj0QGkUaNUNtogSoHFEVbe3ff2HnTxd3HZKkS3BR5qIMFB8GFombWP
         FMstQrxn3B8E+96HB+kSag43prpoOKE2kCeHCDn8AmsA41E6nkll7TnVkYbKL2D9NcOs
         vVnAPra5vpEjEzVd6aNBL0TzEkwS/cxkLeUkrRF/tuUI496qtb7AWjGmBcxJHioSR5Zq
         s1eg==
X-Forwarded-Encrypted: i=1; AJvYcCWgjS3lXENhnuwOyPNzL5P13U8Se3DSkzCJt0IhDM3HdZRmD50VPYHsxh/4EacovriA7iTV8XzlhBhpVi0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHAV/SKWkTETXVzx+8hZHrIpvTLC5KOnzaV5+7dZxzLiAhO738
	vcTqeRuHjaF4wG4zN/Qif98IS+KDC6DKa5/f22Qmgopx71PEeU+ib9gETATlqNVc9f9wU4IO2E2
	O0JcBlb/hpHKaYMI5ZG5xEGxc+Jd2wXGi/qwY
X-Google-Smtp-Source: AGHT+IE7E1sQKkdi+IOPziXhygUCQe4DRbGEMh2n+xHqKHoCU4m0rJ13HS4/hKLnTcO13YuD7nqu8DLLl+hDRTXCmBQ=
X-Received: by 2002:a05:600c:5023:b0:42c:b0b0:513a with SMTP id
 5b1f17b1804b1-4318a50525emr1319735e9.2.1729717562737; Wed, 23 Oct 2024
 14:06:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008183823.36676-21-samitolvanen@google.com>
 <20241008183823.36676-36-samitolvanen@google.com> <55549683-2453-4b67-a380-8ace34b3a06d@suse.com>
In-Reply-To: <55549683-2453-4b67-a380-8ace34b3a06d@suse.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 23 Oct 2024 21:05:24 +0000
Message-ID: <CABCJKudc-f4OfyfWnDwXGM=ohSin7Z=y7Fk92Du_17LB9ptV+A@mail.gmail.com>
Subject: Re: [PATCH v4 15/19] gendwarfksyms: Add support for reserved and
 ignored fields
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, Asahi Linux <asahi@lists.linux.dev>, 
	Sedat Dilek <sedat.dilek@gmail.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 2:53=E2=80=AFPM Petr Pavlu <petr.pavlu@suse.com> wr=
ote:
>
> I've noted some nits above which you might want to trivially address.

These all looked reasonable to me, I'll address them in the next version.

> Otherwise this looks ok to me, feel free to add:
>
> Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

Thanks!

Sami

