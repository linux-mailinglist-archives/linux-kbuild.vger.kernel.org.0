Return-Path: <linux-kbuild+bounces-3846-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8564F98B3E3
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Oct 2024 07:45:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AAA771C220E1
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Oct 2024 05:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 040966088F;
	Tue,  1 Oct 2024 05:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A0UnSdgc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998DC36AF8;
	Tue,  1 Oct 2024 05:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727761533; cv=none; b=oEcn+RjZGuE3q8IzYJwIau2TphYceIXZc/NMffVr+qum4fC0s5iyrxQql7cAYhiO36md2jTdOzMBYPi9aPJDTsaydNSJTScsi2v1AAoqwyGQWYErio9QHg2KtVkxsUaoIvUYvn2tSGAKgfRQ+gtCwiUG5PCm8kEoN1P2clQJs2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727761533; c=relaxed/simple;
	bh=mZbP5neb2LAcs0Woow8RcYLJ+WlMOXfxI1//2Thc99k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LLCPwUuRPZ9G3LybHbRjN9jaWJjBwY6/prW7Dsxs4Dq9rwxwUb1Vnk+CirJWlUOrSLBeJq3Udk5xlGUMfSL6pd1xOf4Hi/edXaZ0RaP/zuHUDazwCO0iS4B2AgXFMfxQD32WNkEDhfGFWH04em/O4tYQF0S/y74zj1uNL0H5nQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A0UnSdgc; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2e0b46df34eso679028a91.3;
        Mon, 30 Sep 2024 22:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727761532; x=1728366332; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZbP5neb2LAcs0Woow8RcYLJ+WlMOXfxI1//2Thc99k=;
        b=A0UnSdgc2wYY981TQRlS53M6yFFrqVRErgUSS5m6amqI/WSl838JdNyxwPC/mHHUEk
         oLV0fjxlv7AOjdqfcyu8uRUvzg0Trx5xEd7b8NAFUvYalq40fbdsdFuaHOTe1oH+sRj3
         9zC8acZtJHq4uj81OZYCydcg3/tm+sRSBcSmAeCeafmd8cHmasz8E0vwWJMOXv6gbPqT
         Hz8I5vf5t7toJyUK9N+yzATkcqJF53pKP383KpdUN6LgucViMImBy/fG2tCbFPgsaLtY
         gVjPwvYpfPVLaTDPWXDmgIXg1Jz2/Z+b4WJNKbYN1MwJreNQXvvri60z5raR4GiKgFQi
         9/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727761532; x=1728366332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mZbP5neb2LAcs0Woow8RcYLJ+WlMOXfxI1//2Thc99k=;
        b=e7/QI4aXMz0YAqV8wbgza//efhlqjB5SeI77NKebTXDTPBpqNfcOFEgC3v3vzhZ6y5
         imHSZU0a+nK8Um5Cle+DIe+uIvFr5/CowrCZo3k9ypJ9EIJwQzN3LNbyWT9QLsu50P2G
         uKtp1TdFzZjNkDJ3mdpK+Bd2GyLSVnxB5Uf7rUX++IjA1LLvQG5VZ+iRwFSMq5EawKll
         PIcwu+FcUoCw5Kdy709VEwzReCHU0Lzpl1VUjLql4iDDyuNrCzsLm73HYskgGWJUjHrK
         xySzWvIUT93xG7nqOeRnSgKe48lKbRsA1aAhyRdaJlKZC3ag2f6kOEas1BNNI+v7Y8V7
         SGUw==
X-Forwarded-Encrypted: i=1; AJvYcCUZeznl8t6pBBnFhZiP4lbXlvEfE5xeEK/1tvTqNsmFI477AWPR3m3uJa3me0Dn/f+PyBV3JI9SGIqHj+I=@vger.kernel.org, AJvYcCW2xZW6h8s8V25nzTpPzbZENdzkPYmI2XJYQYMVX8DnVXnE4AUuVgL5jfuopRae2ZeD+I76epH4hQYmI141c5I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx882TVuSv1bwZvKSuMo4TniWTKQVmXPz2+SW7fCW+BRI7DZCnk
	qb62Uo6zTutcNv5MZRVZzBftvXLYryp3dA0HAbH5xKYA+MHhdktAKr5Mq7Mwkscbuk6DJ9o1++5
	xZIT2vFGCfVOTjISf2TjxVTIeY+Xl5IH0
X-Google-Smtp-Source: AGHT+IHH7ahcU92+IY3sVif5+ss3DsFD0wD6GnwGYD7gYeqiL3f71M/5uAuhp5yB9QH33JjXWu9MnRRowEqqDqbl3AM=
X-Received: by 2002:a05:6a21:3285:b0:1cf:4dc7:e4fc with SMTP id
 adf61e73a8af0-1d509b1994emr6679353637.2.1727761531783; Mon, 30 Sep 2024
 22:45:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240917141725.466514-1-masahiroy@kernel.org> <20240917141725.466514-9-masahiroy@kernel.org>
 <CANiq72nPAn1HWwHBL9qFw=V-BY1F3ckgmkb7c23vfKuH-oB9Qg@mail.gmail.com> <CAK7LNAQCbJNnTtWtLPYz=5Y-5Tk9UaoU4EVDp_dayzhekT055A@mail.gmail.com>
In-Reply-To: <CAK7LNAQCbJNnTtWtLPYz=5Y-5Tk9UaoU4EVDp_dayzhekT055A@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 1 Oct 2024 07:45:19 +0200
Message-ID: <CANiq72kCd3BAGpMBc3BPVPTGqFNQbhUNvggQJH9ohK_DPZWnJg@mail.gmail.com>
Subject: Re: [PATCH 08/23] kbuild: simplify find command for rustfmt
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 1, 2024 at 4:18=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> OK, then we can remove -prune entirely.

Yeah, I think that is the simplest approach.

With those changes, please feel free to add:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel

