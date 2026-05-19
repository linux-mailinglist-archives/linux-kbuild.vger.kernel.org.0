Return-Path: <linux-kbuild+bounces-13271-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGNzKeEyDGrdZAUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13271-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 May 2026 11:52:33 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB9857BA97
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 May 2026 11:52:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E120F3048DE5
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 May 2026 09:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DEA73ACEE2;
	Tue, 19 May 2026 09:51:01 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D470D3F44FC
	for <linux-kbuild@vger.kernel.org>; Tue, 19 May 2026 09:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779184261; cv=none; b=D9LwZzm0SoqUK8cUKcOnI2WvZTMA/y67MQj25MtpWcguffrp8FPlxCOinYnacr9XsS+KW0rdKEvzImSlVV85hbQ39dwFIALWxiKINpzfqrKG6GuHGzuDtBtzDTkv4hHSM8jmWcHFRxXKH9g/Kp7yXsUIZi6HCFMPZQUtnGDmoCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779184261; c=relaxed/simple;
	bh=VV0WQeCgbPqBTi7yab+uEYQeq6u9LFtTUX4clbsM2Vw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rwmJguqVsMIJdNCT/ZzeAzQ1t9S6DIcgn3xVYryTLvsXIV1U2e741iCfmHR5+f71PeZZ358cf8tRyvRRQsO5vJbSz5vZcQ7OwlDd4v2PhE4pcNYAXBj7ITQ92lNlKKYCLrhnNk1pE6gSA9bqCQr608Sq6I/4MPXJ3xkarI7/UiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-47cba53479aso2455082b6e.0
        for <linux-kbuild@vger.kernel.org>; Tue, 19 May 2026 02:50:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779184259; x=1779789059;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+2SZGl9spcuw3ZVraVsNeWL62/l5e6HnqNdDh6fCso=;
        b=oyvWr3qYVeaLqXujeUWVZN92wThHsGnTnTsSq77HCK3je8W2zX30/FianlG77Ph38l
         48Cg2ITSQ5GNNvyTQ7CEsvcs3g98jewcH+ZPdCJaIlyW3vj4E+NPEhEuXGf6xvy/n/zV
         lFM+yzvz93qsowS6PlfbZGKo1Utz1awL8KUr1RBLQEa6foYKxLcqQ+k4wlCCX365AW6O
         IaUKjiKKvMAB6oDxr32FeNq3AD6PvDDOx6d6mMs5yPJQFPfOv7CDfo1dQlRV3rgG94Pt
         xflfWRZ3XZ487W3xGQyIOai5957yvYrGNCLCbMjOGaNwAeslP8Meb7izfpqNxQc7b78d
         NyxA==
X-Forwarded-Encrypted: i=1; AFNElJ9P2sGsJFWrNymedvCBrHtRB/L27rlshJRxJ68U1fbzsxvy75DcAMq76UZeBxsQxnH7RSa0HDAx0OK7bhI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSMAbRAOvc0sLAijGDzW9BtLdjtHczSitzXu0IZ/3yaZttWmK8
	78Gl2cogjEg2c1FvYeMU5PkAVqaOmq0HdJ6JXon/4lznDdMZf8ztER7/sAs+GNBe
X-Gm-Gg: Acq92OGMVUQuFUajyOcPrQiJESpAQhNmt0tHB6BlJsmOLX7E6TffZD9F6Hvk37llZs7
	kMGjME9sxKyk3IjZnH88qa/9qZne646TFYaZ/7Zkj9ieiyzx0wrAMXqaQrSc3wWTK9JboecfWJ/
	Zzeauhsopu/2g1XiJNk5T//m/1ueQLtD9UdUjZxtLJuL4FQ23Ybb6wVss0z0A+NFxbZI55J0qch
	bQVCxKjv+Fy51P3L3Vgkzn367Kt2ZrK6RgiVzTbamMyYjxLOPhF1wWS6/RWrlvyVlpAwk3Ghq20
	0HDh45pAApgy+QyB63Cp2N4BwUo+qTDk4cDhh5HvL0+PY3qyNfURFicH69A/w/mNOw3vOzuLB1x
	mkzx+HrWjQ/7hwkEbOqJ2pPJcmVHxwwArQrL7r+0WzOERDGBsI7GD+CrakJUsow9cFlCktzlX4t
	oPuXvzRUomS/EyGoJbo3drXcgQWLPyB0npt5Xd7+qHVd/E6iubju0AilKC2wkK2XFPYgiru54=
X-Received: by 2002:a05:6808:6503:b0:482:86c5:3d1d with SMTP id 5614622812f47-482e5763b71mr11773671b6e.34.1779184258819;
        Tue, 19 May 2026 02:50:58 -0700 (PDT)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com. [209.85.161.46])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-482ee4fd036sm6362495b6e.12.2026.05.19.02.50.57
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 02:50:57 -0700 (PDT)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-69b8c270821so1749313eaf.1
        for <linux-kbuild@vger.kernel.org>; Tue, 19 May 2026 02:50:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+KrrSIryIlIzA6SWCGuEGNNpSi3MpupTHPp4MSSyfy+CSLzWgtPAy93HGSs5DfyMewk7eXUIjikfYEEyc=@vger.kernel.org
X-Received: by 2002:a05:6102:511f:b0:634:d42d:15e2 with SMTP id
 ada2fe7eead31-63a403ac9a2mr7077474137.26.1779183821499; Tue, 19 May 2026
 02:43:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518042833.272221-1-enelsonmoore@gmail.com> <20260519094820.1f05ab8e@pumpkin>
In-Reply-To: <20260519094820.1f05ab8e@pumpkin>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 May 2026 11:43:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVw349EBZUuYZAns3FnTndx0A=PHbznxarYuAQr8nbqDQ@mail.gmail.com>
X-Gm-Features: AVHnY4Lfn8Mcrjf-CZtgFTL8ilhwbGlXFwz-O3Z8xcIZpla9SRL4d3C994HiNs4
Message-ID: <CAMuHMdVw349EBZUuYZAns3FnTndx0A=PHbznxarYuAQr8nbqDQ@mail.gmail.com>
Subject: Re: [PATCH] nios2: remove the architecture
To: David Laight <david.laight.linux@gmail.com>
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>, linux-doc@vger.kernel.org, 
	devicetree@vger.kernel.org, workflows@vger.kernel.org, 
	linux-arch@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org, netdev@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-csky@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Hu Haowen <2023002089@link.tyut.edu.cn>, Dinh Nguyen <dinguyen@kernel.org>, 
	Kees Cook <kees@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Nick Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Dave Penkler <dpenkler@gmail.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-13271-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lwn.net,linuxfoundation.org,kernel.org,linux.dev,hust.edu.cn,link.tyut.edu.cn,redhat.com,linux-foundation.org,infradead.org,baylibre.com,analog.com,lunn.ch,davemloft.net,google.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[49];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-kbuild@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-kbuild,dt,netdev];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 2AB9857BA97
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi David,

On Tue, 19 May 2026 at 10:55, David Laight <david.laight.linux@gmail.com> wrote:
> The company I used to work for used 4 NIOS II inside an fpga.
> The instruction timing for one is pretty critical, it has some code that
> has to complete in 122 clocks (worst case).
> Our solution was to spend a few man-weeks writing a compatible cpu!
> I think it came out with fewer pipeline stalls (in particular it 'lost'
> the one for a (predicted) taken branch).
> The maximum clock frequency might be lower; but it is ok at 62.5MHz and the
> higher 125MHz in just impossible for all sorts of reasons.
>
> OTOH I really wouldn't run Linux on it!

Sounds similar to what CoreSemi is doing with J2 (nommu, also for
predictable latency), but their products do run Linux.
See the video from the LPC session at
https://lpc.events/event/19/contributions/2097/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

