Return-Path: <linux-kbuild+bounces-6179-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F58A62FA8
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Mar 2025 16:53:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DC7316C283
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Mar 2025 15:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D9F91FE44A;
	Sat, 15 Mar 2025 15:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Si1na2N6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B6A18C93C
	for <linux-kbuild@vger.kernel.org>; Sat, 15 Mar 2025 15:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742054012; cv=none; b=IHDNInHXkRbyS577faKACzVUOnwEfy+n3+gso9JDcJDM3cOHSL6QnaETsvEueqbnTKpErhu+S1YP3h8W7sLvpIxc3I/mGeDK+ql1FBHTdWF7gTOZ+HbBgv1iIS2AoRfCRbCtuVuXxwkLnltRjW0r69gvAaaG0nSfPv+7+PFnieM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742054012; c=relaxed/simple;
	bh=LwyS+A47iCg56z9vvE9NHobt1hXMoM71/Xb052P68tA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PrybLdDCclDZg0Mh/FbqNw/A6Ritc0IFe3h/AoxW8M9Ok6LNYSqWvYBQB1Ex4pC6JIvnqE2juiMQn5rnXQw8CsyBdbhvR8O7/vyS+VUXhp+XYScKJsgTJmoJbPEnAU5lbqKhB4/9M6OYAZrkPeKTclGpPbMVMdU0fkMk0kwF2vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Si1na2N6; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ff5f2c5924so87696a91.2
        for <linux-kbuild@vger.kernel.org>; Sat, 15 Mar 2025 08:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742054010; x=1742658810; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LwyS+A47iCg56z9vvE9NHobt1hXMoM71/Xb052P68tA=;
        b=Si1na2N6xlcTIXQwvZM5fI1TrhgYFS9uEtahcFjA43ye3YTHrO0GMn14PO/yKRORFv
         xLXuZ7M2K1aYFYH2TwsaXCqWR2920gGC7l/E22x/PCMd/Wku0y2pnP2rJC39uKPUu1pj
         wVHR4SjcDzheggm/n9MZTTk//Nh109uUvqf1D4rMLm3oqek1+0KKm3WvertmCG9h+0Bi
         g+vjVuCUxs/I40zKQgincp+zopVEIdUP0YBGBFTD+/M17haf6PUVDvM35pVXY17ZFYTw
         1R1sSA6GMLKp2rP/jTy0WLCOKlr862OAO+cAFAZ4fY8Hpc36YUa5/j+1ouu0+7cQLR1K
         6a0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742054010; x=1742658810;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LwyS+A47iCg56z9vvE9NHobt1hXMoM71/Xb052P68tA=;
        b=r6vy2NdAO7ZNMRHbgI0iROVvrbTIoU5SqYSX9zkEm3ZLDkq185LiFAViPJ/kDmaQNC
         YelIrophxY3fP9+U/J8wVcTC9m5IA5/bJ6It2Pt699xYt12mLpVeQ6Nxir4Y0ou+Y99n
         MVEWWhMNEiawCEZyDx7ZyVRVSDoJiRCLG959fJ9kvNSWdS554e5SUCG6yPoAm68gOuFX
         ae+6QTuu3QxSt4ohRAfm9ty5qHmG2BeB0kqjODGGCWIGT6IPTDc5QEom0Q81pR2a2QvY
         c93bTF+hDPRFHsYnn0QkFzmtvhIubDYAbOhxip+ULIdAicNxVcJqGqEBTfBI7rBqL1Ec
         eorw==
X-Forwarded-Encrypted: i=1; AJvYcCX7XTmkSOI9JNrUiXg+2POlQBB/hPrmjFhogyEjNNugsPhmXBG+lnmlYymE2yea5iiYQgOR/5NIOXxcgbI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu/YKaKzFrc4vFdwDF1bUgwyVYVSMkvkVit/BFs0mnJOFrqEbr
	RqNkRaOI+MymyoZulr6MQyeRv95F1TNQxN3Wg7DCei37PEQXRhdYeQ6pzNbToaFbcD4kHjDBa7G
	Ww6ZZTowq5LJW/QEv9fJZHf8SwB0=
X-Gm-Gg: ASbGncu/+TrdaKXIZwegzjmACT4lSn8+kbLcEBmSpWR+5cfxDYIAje89T67kr7urrBV
	mcSZwxWJjtErGMeMR/EaABB1p3+G/nKl2b5jvrXsx87fZe6mbkOL8RGa1nrKZ1GIIJC/Zh9XIB2
	F18KwFlPKmBxqgtmkpmGWXqFEqfQ==
X-Google-Smtp-Source: AGHT+IHoJdqiFffFIEX4PGH+eNGg8dU9mGGXsxE9RJVlD3AJ3VsW474CP9GQiqncyttxQgyMVKiY1B3MtSw9bjEU4N0=
X-Received: by 2002:a17:90b:1652:b0:2ff:7b41:c3cf with SMTP id
 98e67ed59e1d1-30151d4c068mr3167505a91.4.1742054009887; Sat, 15 Mar 2025
 08:53:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z9IsEPOnC+MGSAEA@rli9-mobl> <CAK7LNAQpbQCzKha63SnJG2TpyXCFB4Vu8Q9xua9G8ht=Fbk_kA@mail.gmail.com>
 <CANiq72md8yWAHdZeJFWAQFxb_9ftTFMiQciK+ZGf+3Lp_Jxa8g@mail.gmail.com> <CAK7LNASrBdCRVoELc-C0JGgdNJsi5WArsqTkaYEm1CgTsjTC9g@mail.gmail.com>
In-Reply-To: <CAK7LNASrBdCRVoELc-C0JGgdNJsi5WArsqTkaYEm1CgTsjTC9g@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 15 Mar 2025 16:53:17 +0100
X-Gm-Features: AQ5f1JpLxa31TkNsANiRg7vQHqmi3abo8scORrGuk6pzhcuxvWRzBjzKlLEuvo8
Message-ID: <CANiq72kL2stNAfmm2HxMXntL2vbHkR0rxrHMRgLu0iG4+mV=dg@mail.gmail.com>
Subject: Re: [masahiroy-kbuild:kbuild 15/20] error: Unrecognized option: 'remap-path-prefix'
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: kernel test robot <lkp@intel.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Miguel Ojeda <ojeda@kernel.org>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 15 Mar 2025 at 11:16, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> The 0day bot provides the reproducer, which only executes
> "make olddefconfig" && "make prepare".

I got confused here for a bit, because the bot runs other targets too
(e.g. `rustfmtcheck`), but I didn't know see it in the reproducer, so
I thought perhaps it did not show it. But I see now that the
reproducer scripts are different in each case (e.g.
https://lore.kernel.org/rust-for-linux/Z9IpZucc6V067mh6@rli9-mobl/).

So you are completely right -- what happened is that I fixed the ICE
issue first, which I checked did not reproduce when combined with the
`--test` flag, and then when I found the second issue (flag not
existing) I didn't expand it to the other case that passes
`--remap-path-prefix`. Sorry...

I am sending v2 -- this time around I will do my usual full test
matrix, just in case I am missing something else...

Cheers,
Miguel

