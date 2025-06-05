Return-Path: <linux-kbuild+bounces-7370-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC62ACF27D
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Jun 2025 17:05:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 756E27A936A
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Jun 2025 15:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6C09184524;
	Thu,  5 Jun 2025 15:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JW3Z2UFo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAFA145355
	for <linux-kbuild@vger.kernel.org>; Thu,  5 Jun 2025 15:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749135933; cv=none; b=okDJwX8aginjYik/9VIely/it0pbyFHp6hianCSswfDmseCzF/gDRe5mjD96gT3GZXRMsiSFox/Jdx7YUxuDAXkJWf/1OBz/VKgdvbdf+zWKXNqDwRNvSgXOpaWtbyIyMqsuww+DtTF47mcj7qslL0JrqZ9/BrcEj5hhkafbjlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749135933; c=relaxed/simple;
	bh=vIsCMmmxr9FThGeQPFNO/37Fs7KP/TdJdsBYKpiv0d8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j2hpyDGcs+Z3wL54YnyX7Zw4L88VdXV7+FmT5yQjBlOh6DgwW2qJT/fcUQPBA8GCuRe5UjiwPKegB8rgzmoHop2oZqxvGEkJXl1hqzZjC16r0v1k+ioHm5pe7D41LHIXZkE2fYKFQtHDpLAA+0xnIyf89dIk2vZ1dLoFamfVG0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JW3Z2UFo; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-234b122f2feso1011535ad.0
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Jun 2025 08:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749135931; x=1749740731; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vIsCMmmxr9FThGeQPFNO/37Fs7KP/TdJdsBYKpiv0d8=;
        b=JW3Z2UFoBBBu7Cj5iT93JH8PmL5G+NTHDC4IzfeCTvkLBDHfaFtS/VNJg19Rjpyltb
         Aiu29ZW3vqIuw9PflX4q+QykaiwbcD+cXnyTBY1lgzL+TL8axMLpvdKUohiVY3sVKaru
         pXYB8xyQ1IjS2nMUa+r6B/AG7bDjpT6OcrlTMI2vWwzbBpe5wELBnKekLtBPY21bn9Vw
         8pwlkvDATB2xEWMNX1iUgT7SuKiZ6XYZZY/P4C/Dmsftdn2rEsxdBw1QicgMyy0FA5Bz
         mfeifwT+/blKizLlwBff1zTpgVYSNnx2Ur7zkMQrrUPLze0fLwgcyWSb4NS5UL1QLu2w
         jG8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749135931; x=1749740731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vIsCMmmxr9FThGeQPFNO/37Fs7KP/TdJdsBYKpiv0d8=;
        b=iz+t/SaMYPXT9H4NJATABtasx9fEnUxHY+u/ckKj9ua2cibt4B81dL9PdS0FTd2xEL
         vVk4hZ53AsQ89iUuay663GTtqXrAsa0u5bkXbstEI2eWINePdXJTtd2EudJN9fAr9ZXf
         0qtM8UEB3oarW57dJmaFcYdiONB0hZvYv68alckztA/FXhV17evsaJEMEu1AcN1trgV0
         ftNi+rCguzwamUyqw75T010Kgehx0gD2rsYpK9w/lnKu0e7BfCcwolFTjfvXB50nfFEn
         5eUAxhkPtUT/D5vdmEeKYHgdVKf+uQHvJVnFA2Ykadfk23PDDjbINqRMCmdE5NHnv3jZ
         hX6g==
X-Forwarded-Encrypted: i=1; AJvYcCWrmfuK2rflx80BqaCyCoW16F7O20/eKMvVpkgkFKuU4P26QlLVZ5b6cunBNn376+HPW9LaAgLr4qyQC2k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc+4dvtisg7cF9xkcCGd8yYeHQGXMK6rQBH+Uo6Tm5GXzM8bQk
	rjQf5rTspBk1ZdqGL/IVBjFVH6mwfn74tl6uURE8Ha8iwJkwukjylRvmlYOpuoosUcMinVVUavG
	/I37DyukLjw15g8DRNDUolvw7GFW9nW4=
X-Gm-Gg: ASbGnctSgBkzKxP5r1gvRKgZD3GwmWo2kU7pnUNk20lfxOZcS7PDr3EALX8pIwKz08b
	tIseERiC9ZxJl6GkrmkqdOZ9AHIW4L8CgBM4zM7zQ7jF07lzR7xaqu7Px252WdWJh2JvwNFkkdQ
	nrTYJjCgtdN8RStHZEvaIIJwGTmQrlshikYfSUnn0WfhQ=
X-Google-Smtp-Source: AGHT+IFOtFkUo8QW9DApggg76mJlzlJxfUklwm/t4sj4QfJm66xMyuBLNkWw2yHzUe09iCl1dQYZ5frDrMO7pH/ORwg=
X-Received: by 2002:a17:902:e5cd:b0:234:f1b5:6e9b with SMTP id
 d9443c01a7336-235e1123640mr39236345ad.1.1749135931387; Thu, 05 Jun 2025
 08:05:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604183539.425053-1-martellif67@gmail.com>
In-Reply-To: <20250604183539.425053-1-martellif67@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 5 Jun 2025 17:05:18 +0200
X-Gm-Features: AX0GCFt5cNObbP-iBCPCCARoyGYw5K-_d92Ksvrx5ePHV5Nh6KXlW_ZSsVmKzTY
Message-ID: <CANiq72m48ixGdMSpr7bWVBBn3ckHmj4pfy9GU0ndVefYXQEzSA@mail.gmail.com>
Subject: Re: [PATCH v2] Kconfig: Added compare capabilities for mconf Ver. 2
To: Franco Martelli <martellif67@gmail.com>
Cc: masahiroy@kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 8:37=E2=80=AFPM Franco Martelli <martellif67@gmail.c=
om> wrote:
>
> Signed-off-by: Franco Martelli <martellif67@gmail.com>

The commit message is empty -- please see how patches are normally
structured, for instance by looking at the Git log or, even better, at
lore.kernel.org.

For instance, what you wrote in "Changelog" is what would go in the
commit message (typically "changelog" refers to the changes between
versions of a given patch series).

In addition, we normally don't describe changes file by file. Instead
we try to describe changes as logical units. This may also suggest
possible ways of splitting the patch into smaller pieces.

Finally, I would suggest passing the `--base` flag to `git
format-patch` so that it is clear where this applies (i.e. I am not
sure why the text mentions it was originally done for 6.1 --
development should be done in mainline, and re-tested etc. there).

(This is not a review on the contents or the idea/proposal itself, but
I hope this helps you.)

Cheers,
Miguel

