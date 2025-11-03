Return-Path: <linux-kbuild+bounces-9388-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D38C2E241
	for <lists+linux-kbuild@lfdr.de>; Mon, 03 Nov 2025 22:22:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB5CA1899941
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Nov 2025 21:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D01AC218AB9;
	Mon,  3 Nov 2025 21:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lVLhLsnJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B02B2D0606
	for <linux-kbuild@vger.kernel.org>; Mon,  3 Nov 2025 21:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762204950; cv=none; b=Fehb/1w912nOM1psa7jHuml2e4Jb+IqLrc45I6UWV3XkaWBDfyIQRzPDnFxSfujS2UthhYbo9dumBZLiauwcbaq0donYruH39JOtBLpxUsTQjlQuUV0PndnIL79ncpLzV/REAzHs2sFq766wwuju2O2W6OQVImsg+F+T4EJVEM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762204950; c=relaxed/simple;
	bh=MDGzFe54Gf7s2MG+FUe+jE9KA0+XPARryXnFLSlJ02c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gs/zwK2arLxQ1szfqUR0lsXxKrcsq+eZjRGY+d2fVDsl7P0n+ZsZ5lVKVcqpZn1YGSQiMH+L4mChoeBVgi7CSY4ybKAPBvh+kFegYSBotN+36iMm5YYC3gbHErx5vC3SSpRLqAACXChGGBxbp3EsVo43ABrnGDedPZutdlu9SfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lVLhLsnJ; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-4331d3eea61so27032495ab.2
        for <linux-kbuild@vger.kernel.org>; Mon, 03 Nov 2025 13:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762204948; x=1762809748; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MDGzFe54Gf7s2MG+FUe+jE9KA0+XPARryXnFLSlJ02c=;
        b=lVLhLsnJseDX6NwBvIqiOW/ywaJ5+T+3IIA1wkXRP03KRcBfMzJkH0soLT/t6fNZTT
         LmFY7YeNWKyKkYqN7+T3xNWYiJfMwzvyJ7DJKTsXrSU0x89DVHeBBAegpGdXxSsZNF4Z
         g8WO9fp/cR1XW2QEegD9X7hYGZSwdjTkD3WmbEr3SL5XeB44wvTFl6K9oNX18eZQDjcv
         HkJPsRg61ueZiJh1ockEhM+T4pl8yxmtYgDXz9UirPT6A0a+UehEsHnw3xvmQCDDiNAi
         GTLj/FCyyrAiib+bjpfdSl8F3Stm/E/iPDTq+KMW5MCBsyaIwpWeCbZb+Ce31WjhkCGt
         cTzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762204948; x=1762809748;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MDGzFe54Gf7s2MG+FUe+jE9KA0+XPARryXnFLSlJ02c=;
        b=QLE2PMPj5swbXQu99gz4draqGOAJPr+3MQE+ASYgiK3LoE+vl7r67v7t7+ydhSrpEA
         xjFY9cv1D1zyuQM3YOWVPhc/WrUM3fbYgJXuV+mUr75oBmkOdU7cErZJEDMkbTBK4d32
         lr7KDZmbjI5fLNy29e4xn/BnHfN/Gtm1+b3Xws8QWK0lPpbgQ3OSAqeG7VL/hJXKP+Ny
         g7uwJ9D8ek4SK7VvJtddSqi7ongaxpxqn6aws/+J8I3hfuhFXLwuWSkLbVoWxEmig2fz
         wHUz2fcbSPTHJC268A0qGGDy21gVAR373B964pXbthjKAQr8EWEDVvVPu+1LM4tKcncC
         hNxg==
X-Forwarded-Encrypted: i=1; AJvYcCUcC81jZaeLb/f7l/YPzmivGzJnjgNtcDreye6KzkGIxHDFvn1HLpwjT/Sqdz6ilVz9EbceSJn3rtDyKps=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlO2uawuDSzzBzZjKJaUAkX8uKM/DWKMqVIjeRtzpax9zq8ZAR
	jqRP0Cz7JjauCPUEqlv4PHrHD6wzwJhD2wsPmOoS6qtZAz9gvPgVBrLON2k41FgYXuMWTggASUs
	IxspcoERiKv4IqWxmTX3B/LVvlZucb5Q=
X-Gm-Gg: ASbGnctfpgR/+zSrdm3QTpanrMzgdtF3hxrTbQVp6Ay2quderjYYd4pO4u+USt0JW59
	BKzCsPWoXIUMKiaudoljUVLWtwOlynzhQSEx7omCQWnUdqDiN3KImmy47YrWc5RiwVU5s6u1eBi
	GnnvBvmAtI+6wkFU2AJjNxSedXmc+muay4+RINwAmFhrWj2n7Cn+XJIOz4IcBX7dZGQd63AGMEO
	pRWk3b+4n2IvmPh0KNv1QsZonNKpQir9dJ6xtTFQtYFYU7XPnc8nbO8id4wezCBtgRcAzmxF8Qb
	IVN/aI0TMqgLLgx6/A==
X-Google-Smtp-Source: AGHT+IFNixYKjoLnJqH323AyrsTEoDvRF2ugn1rI/mmb0i5ScQXnNIFTHq2Er0DrsAsDpn74uL01br5L9UmGuFUIpM0=
X-Received: by 2002:a05:6e02:2701:b0:433:377:abd with SMTP id
 e9e14a558f8ab-4330d1c8c26mr194809215ab.22.1762204948334; Mon, 03 Nov 2025
 13:22:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAB95QARfqSUNJCCgyPcTPu0-hk10e-sOVVMrnpKd6OdV_PHrGA@mail.gmail.com>
 <20251026211334.GA1659905@ax162> <CAB95QASG1pZJT7HyqxM90_FExhSVjoHmPqYHeQWXnrAzCNErmA@mail.gmail.com>
 <CAB95QARmr9b-jVdgDLpA4Qq=3WN7CYS46YEH4Ok4gpSdZHpq5A@mail.gmail.com>
 <20251028174541.GA1548965@ax162> <CAB95QARtzDWensRzui3d-7+jhymcFBOBi78ev9LMy=ZFJMDCTA@mail.gmail.com>
 <20251031220732.GA2254630@ax162> <CAMj1kXF2kKyEOc6KSBfbdUMf5m4o=DLZXk4++C3q-utA_9g4DA@mail.gmail.com>
In-Reply-To: <CAMj1kXF2kKyEOc6KSBfbdUMf5m4o=DLZXk4++C3q-utA_9g4DA@mail.gmail.com>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Mon, 3 Nov 2025 22:22:16 +0100
X-Gm-Features: AWmQ_bk0dpU7PhYOJirlksCIv-nx_HbB1gVQh-PAcie412xHSU9WGYGYvI7q3YY
Message-ID: <CAB95QARrcOc6h9=YTzLKkNE0dEaivtiLfK0kEQ1jNp+v1w4yzA@mail.gmail.com>
Subject: Re: Can't boot kernel 6.17.4+ via rEFInd
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ard and Nathan,

On Mon, 3 Nov 2025 at 16:00, Ard Biesheuvel <ardb@kernel.org> wrote:
> Eugene, can you try whether the image can be loaded by the EFI shell
> directly? You may have to rename the file and give it a .efi
> extension, but otherwise, you should be able to boot it using

Did that with the kernel file and it loaded up until the non syncing
VFS error, but I suppose that is enough to state that the firmware can
boot the kernel image which rEFInd is unable to, and I should look for
answers with rEFInd author?

Cheers,
Eugene

