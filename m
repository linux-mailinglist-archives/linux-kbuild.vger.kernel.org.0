Return-Path: <linux-kbuild+bounces-9925-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D44C983FA
	for <lists+linux-kbuild@lfdr.de>; Mon, 01 Dec 2025 17:30:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E39A03440D7
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Dec 2025 16:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45DA23328F5;
	Mon,  1 Dec 2025 16:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BZjDmW6a"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4010334C13
	for <linux-kbuild@vger.kernel.org>; Mon,  1 Dec 2025 16:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764606627; cv=none; b=oFHzg3YT1MD8VbsEfE+TBZLk4E1/Wm7bNVfQHESWW49KLtEHksWbXBwOCyUXUis3/JF7YKhRLSHInG10e+Vq7d4WZfwTafJaE5nA99kVt0Zo52drnAdNvHmWt1LpsSCxG45Aab+j8uNWuaeYCLvKaWKdTkDHqD9qbx5akosAQgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764606627; c=relaxed/simple;
	bh=zpKbkUkQrhP8Z8G+eZrB42QlKP9ymO5xUUiC1g9Bi/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J+m4oFT9oYPax9vfGkp4HZysgVM3fm1tZ8sa6kFevEzzYC4s3L7rLeK5eXZMbRV4L139L6o8dnz1Y3v8lD7VbKI+GJXkwmA1atLBv32rUReg+UE9pOAOxpvYUHN8NTrW7hDKgubS0iLYljI0xebYtTsDdHqHcMN0aBEZYYYjsQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BZjDmW6a; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b9a5f4435adso255410a12.3
        for <linux-kbuild@vger.kernel.org>; Mon, 01 Dec 2025 08:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764606625; x=1765211425; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zpKbkUkQrhP8Z8G+eZrB42QlKP9ymO5xUUiC1g9Bi/g=;
        b=BZjDmW6aSk8coDJLlfCMz7XX/PpeP4g7GsVX6FDsePUr1MhUF0I3ZtGQ4vKl5+8rNA
         dQEQ19BYWduDEZKIUAAN/0YsD0aeAvJ0jHO8ljS5KtJem/OnsY9hpnXbbI85xvTf5UG9
         zwJcyd8XS2JgE2ZLV+3lToGef7yjVmxuNpo74QkFTJ008HjZ/VU29neMgS3MSYh7zr8V
         QCgEG0ottiVg8gjGWBsc1svovyQcu+WmzwPz01U+y5HSj/8n/ajY7ZiXTqFvkyrRubi4
         bR+jOpfc0VzHKS3K6d/fBok0PW67e0s96tiYgkqKYvinmScYhj4iU4ENNiCDWmkTiEF+
         VWiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764606625; x=1765211425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zpKbkUkQrhP8Z8G+eZrB42QlKP9ymO5xUUiC1g9Bi/g=;
        b=eKOSIDXx/6E6kC64KpgQSBfY7dspt3X29AWw5oKxMJ4s/ktrScKx9L/TZrcGTtUlXW
         0GL11fjI1xZnMdm9m1muHSMN+d+MxiEP/u4skgs5YlASS3QiH/gXWbdMfQwv0kdnBb0x
         3dpf+48Epkk2dT60KGgnPa12nx2wCHWhMn5O5hdwRHsy+MEkO+JDFveJdJ+PVxOIESfA
         pQXTiLab9gfZynd0BtYLV4hlhCQnQ7TClgrRLQVxXQJ99apT6a/4jrU+V6ImxoR00ZJG
         XRsyTbTal4LG/H+Rmqc3RMR8PJ7x9jVXjsEA5OSfBDUsmjo1ms3DHf3iprBm7BEfTK9R
         6ObQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmytZcwazPNeJR7lzW2vqOq7+mxDbunJnsAXT8pLMKCLL6iPt2b+0bFBNGWC4KCDSHzeVm5vBLNqX90lo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8TBqgX6XxLX9miR+q/grxv5/A6t/6cskfLPyB934z6c0DaHyP
	jgCnmfDtZqULmBtoA33jOHeKa7nrQUNAjLtwKnedJ2S/L9VLojgK8Hqh+50KmRsZdjEjPCqV9K1
	ugYzwnCY+PnTmKLXfhQvVfP9OSn+Y68I=
X-Gm-Gg: ASbGncvkfxvuWtA0LlByMJTzB5V5Vapv1UFb6f4F6K+WmkU8epnrF51eXnhHOvmbUZa
	t2YX0KzQW8rpFWAJc1e2Voj4PayJCLB5PjBxQ1yV5He+Gz389cLfV6AOEOIWYKMXZgZZl9bxtn0
	8lov4AXL/fzbYRQD1l7WUPx0dZEuARZdeFNSq9Rfm9lmUMUxdpnXDL2CyiM7zvS4lbMo16iofcM
	MPoJ0UnBIEsc6MhyBoO5R5Vn6q735pDC2jOUoozof7zwJFidwdJUF37kb1BnjPPg3+3u34h7nrH
	6DPYMDbuGh3Sn4TtRCDMjRFyntoFyk4uxpIgtHRZHqfOWASCrblwSd+RsXMUtpldRffUSGn9DkP
	myDng3qyqY1gDMA==
X-Google-Smtp-Source: AGHT+IEf7vOC5mAqU/omo2/IqPWzWyzZXuA9/nGkYTAFHB5XIB3JrboNwDg1L1ZxYoKdJ5V3/dY93SPwNN1ywHBmg28=
X-Received: by 2002:a05:7300:570d:b0:2a4:4862:c97a with SMTP id
 5a478bee46e88-2a718ae7143mr24440001eec.0.1764606624691; Mon, 01 Dec 2025
 08:30:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251201021659.1729308-1-ojeda@kernel.org> <470357d7-5958-4470-a718-25b9c7660565@nvidia.com>
In-Reply-To: <470357d7-5958-4470-a718-25b9c7660565@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 1 Dec 2025 17:30:11 +0100
X-Gm-Features: AWmQ_bnMEmfxLG1OVV1esCiKsI9DP3zTI0SclB2p7uTVFkawC9SWtkbSUgpCJPI
Message-ID: <CANiq72ngYj4qRwBUZoaS+aT8uAsjRRvY+i5t+L26GudN_0KVLw@mail.gmail.com>
Subject: Re: `KSYM_NAME_LEN` strikes again
To: John Hubbard <jhubbard@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, =?UTF-8?Q?Sergio_Gonz=C3=A1lez_Collado?= <sergio.collado@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 1, 2025 at 5:57=E2=80=AFAM John Hubbard <jhubbard@nvidia.com> w=
rote:
>
> But if it's actually an option, it seems like a very nice one:
> a durable and long-lasting fix.

Unless something has changed that I am not aware of, it is still an
option and it would avoid us having to play these games.

So if someone has time to implement it, then that would be great.

Cheers,
Miguel

