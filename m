Return-Path: <linux-kbuild+bounces-8202-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 988BDB12B8D
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Jul 2025 19:07:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD0E21C211B3
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Jul 2025 17:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18EA81EA7DD;
	Sat, 26 Jul 2025 17:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uz+RuP0L"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B81F1C1F22;
	Sat, 26 Jul 2025 17:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753549617; cv=none; b=mzURH1nkOpzYkd6nZAPVS/tdSkpoO28siU2EMhZ3oTB7MMQhDOpQlZB0PIR3uB/wJ/XchUKsMW5vZjunBEmaoRx4TmxrKCWKVSQV2AmEP3GMHhQz5xsBv57kcFDxz9VYR7R/g9CdHLAiMlojae5CPNfYDvQ/DTH5pGI9RBXXC+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753549617; c=relaxed/simple;
	bh=plTJOLeAfmEcQriIPZ4jzQOM2HBPLE08mj7d6W16J+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PSP8KP2iQRM6Mm7Cea5P0cG/dgkHGIcYiHHyLD8l2kKjRf3+rlSeAZ8VII5rHC61lPp9m+wZ56iUkrzcc3cnu0JcooTkgfULtPCmM89/ZY/uA+rmH9ObqycdplHqRkvH/8HVLXldPhF6wo0Bdd4V82HEI5P66MW+PzNUxUoec5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uz+RuP0L; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-41cfa50c73dso1566031b6e.0;
        Sat, 26 Jul 2025 10:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753549614; x=1754154414; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=plTJOLeAfmEcQriIPZ4jzQOM2HBPLE08mj7d6W16J+g=;
        b=Uz+RuP0LJaiEhRCloyAdwMMuJWV2f15TegT79KjnKHckFzDj7xI+53JJu2xuDzLvq2
         3dwY9ub3VMYMBH6VvhE91O8661fg+e36t4srFKwGAogrBVLulLiQyMpSEW7MGD1JOyLF
         nCV9snccymK3QSxyr5tXk+SV4muVrsRzNRiIs8JTVYfKz4eQ+prk+aK7U75VonI5tkwS
         ZUA6gO5GUtNiaYu86zilncXFycj5r96IdGUgx73l0ZkuJmuIDA9GLAzAlxevA+Vo3Wc+
         I7ksfd6FeTB4vKj+tyFMaSzvirjOHf3cY34PkSRFtVta9LiLW5dnWYSHDR4X/dxmlcoY
         R21A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753549615; x=1754154415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=plTJOLeAfmEcQriIPZ4jzQOM2HBPLE08mj7d6W16J+g=;
        b=hbnHQ2O4aPgpsTBXICXsjS55HfmcsfuukNXoJ6fjo4a07auX/OZdnuR7BC3rcCs8J8
         P9Q0IkVRpx8k0UK11Kdu+oOc0yTi4ufNpZStXWVkAFr1daVAAlfiZjLxsR+ohLNTKUIm
         cK6C/UGDaaF7NYxhBq8GihMyg7AiEfhu0scfaLzG/8BXBzaL6owYyzrsRVJ88sSiAkR3
         nknNgnuh3RB6XjfL2VtO8Q54VHQD1b5YJZ/ZMfF7G5QJtznKdhyTK2nlbRcswD3jJy03
         Lib3IuvMFoQoSH+ARqwHOr9NKOSHKFjbE9vaqJ4dzxNufzQoINiY0o7vIMaoR8th5l8X
         zk6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWFfnUTRzlXWgHFrWin8GXE8/My3nf63FyfgKOMbZd0DaESFL0cFl70mZMLX9svRft3rJfoJZcRuZDG85BB@vger.kernel.org, AJvYcCXwHdEHWdjqnvHJy1Ibou8D0Oy4dk8+YXfE9wGPccWd2AknGDGZnYM5kdve4ZeCFxKQj46Lvogjlma99+E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+Pa9Uu8wnFI8uIkoLzuv90BK7jX+4u6CDiIg9RvOxolD+OxfA
	P5wqFTnhxgd/J3S4l2cBRI+U8JA6NOA7YQQIDcnl2W3eXF5f2lO5upjr5mZSFGCjybAzz+3OM3x
	bx6e+iZh2cNfBbxyELO/A2Saia+b/IjM=
X-Gm-Gg: ASbGncsWp83RkQt29hZ9NTlYwAjRSi/X81QL2P6zlnlr5sYNm2Yuez1lP/Tb1zo+xzN
	dbG6AQ1K42I0+yW9O35YgCrRu+00JqyvtuK/mAkSPl5puFGWaiyE7MZguO0RUYAcHpvuGFb0xKb
	E6miFvYF/vo+mop3Y4moRjfHZfCNMS9SOXoKvu3CfwrBVJ/PgoAycdUssET+HSebDHlRIqc4Ivy
	SMGqhgT6ROShutyUEI=
X-Google-Smtp-Source: AGHT+IGAm7coxgOCdblT03RZOPWbrgGBm/znyXOlrO8KFKde6xb4Dy0kiqmdl/tKuIIIU6fb1aBquTrRgP3bYfPuKHg=
X-Received: by 2002:a05:6808:1383:b0:404:e0b3:12f with SMTP id
 5614622812f47-42bb7bc35d8mr3163057b6e.11.1753549614575; Sat, 26 Jul 2025
 10:06:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250725055928.37658-1-suchitkarunakaran@gmail.com>
 <20250725-violet-mayfly-from-heaven-bd66d2@l-nschier-aarch64>
 <CAO9wTFiYRb8RDB9cTRsC3yqa6Zja5+QWuew1AZyZs5gPxbdVGw@mail.gmail.com> <aIUJTK4JOxo0lDv0@fjasle.eu>
In-Reply-To: <aIUJTK4JOxo0lDv0@fjasle.eu>
From: Suchit K <suchitkarunakaran@gmail.com>
Date: Sat, 26 Jul 2025 22:36:38 +0530
X-Gm-Features: Ac12FXyoWhZmXTDFFFeEX_wOwTDPw7EaPsAJ1r4teyE359tjGfermR3z12wcgjM
Message-ID: <CAO9wTFh1mpo2Tr-imiUrKn9Yfg2JnObjQMN9Vd0-pp1fA1BxeQ@mail.gmail.com>
Subject: Re: [PATCH] kconfig/lxdialog: replace strcpy() with strscpy() in inputbox.c
To: Nicolas Schier <nicolas.schier@linux.dev>
Cc: masahiroy@kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
> For the concrete code I'd use strlcpy, for some other uses of strcpy in
> scripts/kconfig/ I'd probably choose differently.
>

Sure, I'll make the necessary changes.

> As Franko already wrote: it would be nice if you could also send patches
> for the other strcpy calls below scripts/kconfig/.
>
> But please always compile and test your changes.
>

Yes, I=E2=80=99ll send patches for the other strcpy usages as well. Apologi=
es
for not compiling it earlier, I=E2=80=99m still new to kernel development a=
nd
appreciate your patience. Thanks!

