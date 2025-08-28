Return-Path: <linux-kbuild+bounces-8641-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D7EB39CD6
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Aug 2025 14:19:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7EA720234A
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Aug 2025 12:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98A9C30F80A;
	Thu, 28 Aug 2025 12:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HqIRqEq4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC9730F952;
	Thu, 28 Aug 2025 12:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756383127; cv=none; b=ZnApgiyt50LjgdoYnTYintwYaeC8lMJ1RZBaZeY6M000aOjGYsEzFKbZQRxWJHgUEiMZ8KsmGidvbRWYLURwaYRCnNdAM3eamFaWrp9OoR7dx+QadLqYAkIU2eSXLCvJ+U9aqjusy8oUCPuJganOr59zGZJLK8Xa9Lb4+SM7dy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756383127; c=relaxed/simple;
	bh=gBzvIT3GFkBSLfKgD0eHJCY11TPcf6eJ4FO6sX8esZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tEea8Xq66T2X67Hl9A5W0Ep2Hej6jc5Y4iriqvRYyh8VxA83yHvnDuVISikRgaaieRSqHXA65SKdGI8AWHoPieGAiLwZCZ//1YPTouL+HEA+N8loh1VnPV/FFJTXgeW6eYoWRHeCC10DrkXdE7k/afGqWbMURo7uanON4tJVL04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HqIRqEq4; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-324e2c12f43so158501a91.3;
        Thu, 28 Aug 2025 05:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756383125; x=1756987925; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBzvIT3GFkBSLfKgD0eHJCY11TPcf6eJ4FO6sX8esZI=;
        b=HqIRqEq4oNnYiIxuF7z6VjkLYA8EErsxEKulBi4s6sRrXtnTAk0Vj1Rc+5YTTrPg23
         US3P7yYSZgz5Lz8f9s4LeC+rtXBYtq/xr9ojsjhPoElyr88e+7vhylyZJPf/qE+J+M+C
         /lr41WaZcx2yXNv56Nq1JEJn85AgaIIPh9CaSkYDOd1XhtKbstWxen1IUWR4Z2E24VET
         PGJtB3FOtJQYkUfCxB4kCJmN22M5TOTq8uYTtSVGPu/rRHvTelJxjWuXghJ/4IgYUNkT
         NaGJt+tSIbWeqkr0O3VA1hWTFSywTDmqXkFMYr77U3hKw2Bpl+imu/MaLyJgl2wb8vd2
         HwxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756383125; x=1756987925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gBzvIT3GFkBSLfKgD0eHJCY11TPcf6eJ4FO6sX8esZI=;
        b=dZHQ1VpIdW22d4kKptbwQmn1N8ZMc3iiEH+D6xhBeJYS8RQ5T9BYWGsipAPZN8rp/2
         56Dv2zH2b448fGlPSkDdvfkR9GKEtS6dh5oIuLtdMBfWUraLgO8NG4W8B0TXpmTIR4Uu
         EeljutpUpOAX8jH/vxA2HO62rWD6H0VgAv078V6fQxtzRWwnrCHfRKeb8CEGYUEms1A0
         7TNPo7GPC5hbMjjqYiCDZLVTR5TEcQyYdjfKpTo8UxVyaQeedKou9UVOS8mNayzx3yEY
         Db7mv7XSqKwvtRPmwee5mIFyXHZLAt3rc7CbUYCm/udM0uLZlv6IvgzkU8PoNMEsFmS9
         IQJw==
X-Forwarded-Encrypted: i=1; AJvYcCUHfUkYm7rVH6hAF8PnzQajcyX8h9fSErVOcFPX9izQQHWhOTjLSKtTsyGRcT2DUvi7TpsqBSRNK2xJibY/@vger.kernel.org, AJvYcCVu3H1BG7ZbVi22zL7ZqgSNH5utTXpXVmnt652Ka+Bq8N7QSVhjarbzPzTu6J88vybVrZRdyr4H21I=@vger.kernel.org, AJvYcCWsE+0WGgTJK2bxcU1rR7fqFuQGVsLvlwjHVK6rD7bYjE1txwQ0tdupu8reZ5fnUAjpCp1ZPMKJxNFHaGEKUUpL@vger.kernel.org
X-Gm-Message-State: AOJu0YwiZ/01oBwzAYRFFW9GiVIy54YCtNArWeSfYmiVUfRdLo8i/4MW
	XDG98EXvVe6rr5Qde0mQCVNusCnNQe2xN5BzCv3pX1Y/lhaThHziHCWJCrQSgp7ItFZ688dW3ko
	+M2DzYgsJ+8SM1a96uLibLPipHSps8AQ=
X-Gm-Gg: ASbGnctdvVIUps0jOKo7IHY+Boa/KwAxgczcgJY+7HRujLALpD4iTk2N9sAKgAH/VZR
	56dUYsPLVHlZlxD1W/Vuby9eleVF/mZ+mKlRvRaY++tGq0YE8wEyFIpHz8OGaG0rlalygaO9HuX
	bH9yLJKVBT9lD8bpe1COTSh29iyFsOVkcAuWtQTIVSKROGRjwlv3gfDehkKJHZAyuErSQ1GI0/+
	+hqbyoRAs5Hi/KtmhRl+TX9F66Fn1Ssx9DrJsXlKzMqiDVNiB6MRYD3F8FDTqSD2Fu2XDMzTKyI
	UvXIlb4t31OiB4g74AeOg26UxWf4w4nfWSvAALYg+9J36mE=
X-Google-Smtp-Source: AGHT+IEHY3yqO9UJS3OJVe1SDsi7P25l1Vl9fz/i5xssn5nzwTw3KmrO7fDBd0I6tpqkx5s1cY/itDMI0psIb4lzmPQ=
X-Received: by 2002:a17:90b:1d03:b0:327:c9bb:be51 with SMTP id
 98e67ed59e1d1-327c9bbbf98mr469357a91.1.1756383125171; Thu, 28 Aug 2025
 05:12:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250825141316.work.967-kees@kernel.org> <20250825142603.1907143-5-kees@kernel.org>
 <CANiq72kc7Ky6+7Ny7jR04s8vU-g23qBQC0rQrOZDxDzXT+m1TQ@mail.gmail.com>
 <202508250834.E2456B9@keescook> <CANiq72mQsLqhpX29NP3Zm8HZ5m429tSXjgFcRYJM3e=Zac1G1w@mail.gmail.com>
 <9CCDBE93-7DBD-41D0-B9B6-05900F2AB1EE@outflux.net> <20250827013444.GA2859318@ax162>
 <56c2b1ce-00a4-403c-9927-79bfd9a23574@infradead.org> <20250827193815.GA2293657@ax162>
In-Reply-To: <20250827193815.GA2293657@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 28 Aug 2025 14:11:51 +0200
X-Gm-Features: Ac12FXyJC97cqOYkicibM9SLfUWzcvxlb3Xn6gpRe98j59S9iV5Oq9n8aEdlnuk
Message-ID: <CANiq72nX7d3XQtQKDdeUh2RFy5HqSg360m4pzesJyBP+y9K7FA@mail.gmail.com>
Subject: Re: [PATCH 5/5] kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
To: Nathan Chancellor <nathan@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Kees Cook <kees@outflux.net>, Kees Cook <kees@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, 
	Puranjay Mohan <puranjay@kernel.org>, David Woodhouse <dwmw2@infradead.org>, 
	Jonathan Corbet <corbet@lwn.net>, x86@kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 27, 2025 at 9:38=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> I am not sure I understand what you mean here. With the series as it is
> or Kees's suggested fix, oldconfig still prompts the user to enable
> CONFIG_CFI with CONFIG_CFI_CLANG=3Dy in the old configuration. Both Migue=
l
> and I allude to that being fine but it would be really nice if users
> with CONFIG_CFI_CLANG=3Dy were automatically transitioned to CONFIG_CFI=
=3Dy
> without any action on their part. That seems to be in line with how
> Linus feels even as recently as this past merge window:
>
> https://lore.kernel.org/CAHk-=3DwgO0Rx2LcYT4f75Xs46orbJ4JxO2jbAFQnVKDYAjV=
5HeQ@mail.gmail.com/

Yeah, I think for pure renames one we should try to avoid churn if possible=
.

> Another idea I had to avoid this is introducing CONFIG_CFI_GCC as a user
> selectable symbol and making CONFIG_CFI the hidden symbol that both
> compiler symbols select. After a couple of releases (or maybe the next
> LTS), both CONFIG_CFI_CLANG and CONFIG_CFI_GCC could be eliminated with
> CONFIG_CFI becoming user selectable, which would keep things working
> since CONFIG_CFI=3Dy will be present in the previous configuration.

If we are OK with something like this (i.e. waiting a few releases),
then isn't it simpler the `def_bool` approach I mentioned? i.e. it
means one less symbol and one less rename later, right?

Cheers,
Miguel

