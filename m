Return-Path: <linux-kbuild+bounces-8217-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF60B13382
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Jul 2025 05:59:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E53B616639A
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Jul 2025 03:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84A401AB52D;
	Mon, 28 Jul 2025 03:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e6yk5GPC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074FBEEA8;
	Mon, 28 Jul 2025 03:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753675167; cv=none; b=Px0C5jf7o0lb5Yvtz+GUu3dZz6gd9G9TgZid7bzcLE36OkwVHLc/vXY+iv65hY5WYyRnPFLspM6fdKzIN8+M1C/ixhXAtMEZkdzreS8F9HXpYXT5FMokrbXtFB+a0HOVn67WPr8iDvSo1k4g7IRzNMBM2X8JXKwGo0ry1MdXlqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753675167; c=relaxed/simple;
	bh=25WCZfdlSmz3Rs3lTNoAlENbPfw0G6bC1g+GHwEHQ9A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m599XTybvKJ32Ir8r2po2P5ljRmf2i8ifZESh0Zyig8waABhBMB2Lf1FrGw3l6IkkINn8eDy7yJPhBWcNAO8gjZmlNvqujIViRWBF9oCIJXkQ445e7ABwy96fgTJi2M/SzGxXRNzLwRjmvBuBPYqQgjESrJUzUxMLL0Oxe7YsZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e6yk5GPC; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-73e810dc03bso603973a34.3;
        Sun, 27 Jul 2025 20:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753675165; x=1754279965; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZQuttMM3zYnydbjU8s49BqMo+slGpuyfhBNGS8FBZUg=;
        b=e6yk5GPCwaSY3Wzd+1r3LTv3GHY4YwAgDbAAKlMxza33c4SJnBfzvHQqA2pmjYb6AR
         cBF/Ag6xOgcdQ6WJfeVurOqN/2B7hPwpnV7TV/+d6Eo3cRUccV9AfsNv02PZG+Ch0Wrr
         nvEQ1aU4T16TqlBOllcT7ImZcO1NLR2cwDdwWClMvFmVvHgkARvwACq+eX/Y1cy2yuAg
         +OXRIwu1mqv4/25kLh+6C/yBtdg4bogTappcafSDRxQaxVDBNCK+HHmgSoPSx52/Ggjw
         IKR38RiMNdtphWS5pb/ZaxxMmknzXpliw9XlXF4U25WUFjPnUvXwUv/QQUTZn/QirjOb
         AiDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753675165; x=1754279965;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZQuttMM3zYnydbjU8s49BqMo+slGpuyfhBNGS8FBZUg=;
        b=T9erIBIWkroddY/2wDZAY/sGVjsCnoTBn9sMyXi+lr66fG+6b7q7Yqu6UyhMXQ/Yp0
         oe4dAt/mSJVxMIrPkIQeXXdrtb44j5ww5INp9hnNCIY7mpgS4kAebbJBNk/X1lHK8qyQ
         0DhTFHY/M5eD+M+sGQhf6G0hi+KcbPSdL3xPtHp9XeEwbPn3FxBvJbNPFZbo86RfGwLH
         X1LeqLGQSyV1BJQDGAkQHESpXRWpDo/paWDKYNTEz4NRs2PIxUQhE3iUbVQ8nE75UDY2
         IgD3OqG5J2iyR7stfQt7QOmSYkr/AKrwpRHT7cwNLOW3lm04r8cy6BSOyhBST7EmzCp9
         HJmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQ9Du+NvN0dVxvz4FBp50s5oUJ5p+V9HkAdw0uvoMGoD8/osY1seNgWmlXGuV5i8IMJNEwkrfgchzxwcha@vger.kernel.org, AJvYcCXLUn4HcrDFw2zJ9gsK1rfjq4uwNrIGwKsyHcRGBNdGKm+nAUMt3NsvVTT05wcuUWmgXm2OqtK5MQ6wgXI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCv8sDis8sAuL9ZuZhrvI6k6kXZDO74K1MYkwdQ0JYSq5SxRS7
	tymyHIi2cgNK5xNg83ZyNOKNrHoS20HHWI05lVra5ig055tjrH1wznDXQGEhs4o+HRSZDoRC+Ia
	s7ziUhDXtXabcCz9igTt8MoAx7z9Yhgg=
X-Gm-Gg: ASbGncu939r4/6us/nQtninvpc2gspLkQJBUAUsC8oLts+kgopg54ZPMEA5imsgMwVF
	+YQ3d9qk/BPKwxz3yQzozppVA7ZWegLA151yvomJFzRasLrgZMISSTp6XVvGxIX9zzms9z8QhOI
	BiY/Vmaq1u+dzcfYJ6RaezA4DXUuFfXb8YQZy9GENBvLp6y6XZVyYHxasXfzxGB/y0NZKDFxcV3
	nOiweQF
X-Google-Smtp-Source: AGHT+IGoxMOO0qrg/WJd4pJPQUD4scsCUweD2Zzk5YErFU34dJjBsHSRkWvbDlDbCyH8+t6n7xnh1BzEUWgAmZHHXlQ=
X-Received: by 2002:a4a:e903:0:b0:615:e61d:2dca with SMTP id
 006d021491bc7-6190c944cfcmr6726973eaf.2.1753675164910; Sun, 27 Jul 2025
 20:59:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250727164433.203775-1-suchitkarunakaran@gmail.com> <aIZ7sDZdHAOg2cf_@fjasle.eu>
In-Reply-To: <aIZ7sDZdHAOg2cf_@fjasle.eu>
From: Suchit K <suchitkarunakaran@gmail.com>
Date: Mon, 28 Jul 2025 09:29:12 +0530
X-Gm-Features: Ac12FXw_dAhiuMtki3n4Q2NhUESTSy3iod6ZPQDaRNyud3xIrmOpJkhZ4n2Rzk0
Message-ID: <CAO9wTFjdvjOcL7EBJiUmK90hRMF3RWp1+w4r2ciDKcNsn0x4Jg@mail.gmail.com>
Subject: Re: [PATCH v3] kconfig/lxdialog: replace strcpy() with strncpy() in inputbox.c
To: Nicolas Schier <nicolas.schier@linux.dev>
Cc: masahiroy@kernel.org, linux-kbuild@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Jul 2025 at 00:49, Nicolas Schier <nicolas.schier@linux.dev> wrote:
>
> On Sun, Jul 27, 2025 at 10:14:33PM +0530 Suchit Karunakaran wrote:
> > strcpy() performs no bounds checking and can lead to buffer overflows if
> > the input string exceeds the destination buffer size. This patch replaces
> > it with strncpy(), and null terminates the input string.
> >
> > Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> > ---
> >  scripts/kconfig/lxdialog/inputbox.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
>
> Reviewed-by: Nicolas Schier <nicolas.schier@linux.dev>
>
> thanks for your contribution!
>
> If you want to continue contributing, you might want to check-out tools
> like b4 which simplifies sending and tracking patch-sets.
>

Thank you very much! Please let me know if there's anything else I
should do. Also, I'd appreciate it if you could take a look at my
other patch that replaces strcpy with snprintf. Thanks again!

