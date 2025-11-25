Return-Path: <linux-kbuild+bounces-9852-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F63C874DA
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Nov 2025 23:16:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E0543B607D
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Nov 2025 22:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C6282F6560;
	Tue, 25 Nov 2025 22:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="br4EIPft"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEDF2EB878
	for <linux-kbuild@vger.kernel.org>; Tue, 25 Nov 2025 22:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764108943; cv=none; b=t8eDEr1/E1bEggHYUCKumE5PTeDsdVDNn53HwivwInyZM/Mv3PxLHXhTLpWoW2gIDBzkz1YoX3zl78XWV/EaWXjKc39oWKHvcbQIxEzNMcGVhDSapPDKBA3ADR15r77zFaEeAVPKmsNYoUmNTOR9+VoPk70C4jV1YZ9Su4W3LNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764108943; c=relaxed/simple;
	bh=0thTz36F//Qi3EqaFEUbrA7iiqOhq0gyhg1DwrhkMX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WRaG9rk7lN1CZkEUMcw+8nr3qHAXQ0kNZ1KavZpweK2o2R3BVge48rMMiTKKDQ+eEDpjzuBt1vCERWWxdyKVmREZ6RNoNsyFP/E547MukACs/9EMl4PhW9Sqtuw+Cxctq99vE3zGuZ5Xcq3AX8KIWZOdhIHqRcefGfRJWAfYK8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=br4EIPft; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b735e278fa1so612341166b.0
        for <linux-kbuild@vger.kernel.org>; Tue, 25 Nov 2025 14:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764108938; x=1764713738; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HtR/2YjoiUNTsd2IpUJ04e8FXM2rTMbgT5l5/carPkU=;
        b=br4EIPftMZcWf8knEH+EgeAnRGuEDLi5L7Hcq+RHnft77LIIJojfgFaaPN3+Gk4U1Q
         oCHToT1xTCFoprYlgV4YUm9YZ1BAXpGGGG3CYWO9303HRijMCkOcNYFs8zLiJPchzcsa
         WSBcjrt9NwaXZmJv7eAe/h9Aw69NyEgnPgHKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764108938; x=1764713738;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HtR/2YjoiUNTsd2IpUJ04e8FXM2rTMbgT5l5/carPkU=;
        b=IUWWaR9fvZwCzgIUN4pJqdQnojIEFA9bREuCtf7y7be261km0Ny/A/0kmhI4ksT/sz
         UQaEPCm3bqqoW2j2HG2352G4JoopY47B1kkANRH5VsnHhTrceOlufWw0q8fxmidV8rPX
         VTM5zNvSfKPDDdNIvg1oTMA715sSRAWiy18ZjiAaf+SrHNhCo4J16ww4IGMDu5I+3AJJ
         TsXLa0LZUILMzAcvoFUfGSFhQoKnMHJ4cggYasQbxZy4KyMbPaVFbI+47H0zauk4BcQL
         LMn4TfS7m7acrOHMnqCIih8Nwm+Cqmaa1wHLWn9TdYb98ATvcPd1hTQFCVai1Jl01eZR
         6K+A==
X-Forwarded-Encrypted: i=1; AJvYcCUVJIBHmaRwSbVqAEr/hwlDnbyQEgJmRzVJ0XD0UX0+kWR09RHIB76FEaSGihCOuJuU8mzlIL8Zyuy9GOE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtkd7TCoDDa5sEV3jtf28Ww3oiVCy0ZRnqTKhuXxG31xmU9yaZ
	D3kZDE65c7dzre6qQ6L6BP09eQgKFygPibJOkRGRXgimuA7CbNAYwbV+NImuiZesKIDcBumnd6z
	5RaOS8N3zJbbvRuA5f37FZY/q/MTYRmcAph4U8/9a
X-Gm-Gg: ASbGnctKbjhsyKaXE1oT5fRrjv2VeQikuye+ihvcxzXHuzYfue8q8kLw1ddRCU9xsS3
	dgfYm7wZoUiqcq/Sdif5uYaTJvvKrScg4sBSSXzjjNnsY5qMG0dZnqpCfUfKBmOzoV2IrL7+cFR
	+fyHEK5LUxEqvoOmbAdK4gW6vLfVyZyo9kWVJtZdMSTDKUbtFb9XTmQDKq1sA/T2Nq3RQRjXUog
	1Hh+gheJG6pJDMp+hH+t62EgzmnQJ01z+RjSFDMRq/mennZCQ8Dhc1iwG1QwZjtP5+uLQ==
X-Google-Smtp-Source: AGHT+IG/kmK8hmL9wigX4hWEiptI11HhQjQaGhlzAQuJn61vQbvpUp8K/4HP6vDTTB0eZVYtmAEZUMHfl+FMBldYsb4=
X-Received: by 2002:a17:907:987:b0:b76:277b:9a58 with SMTP id
 a640c23a62f3a-b76c546da61mr461710566b.9.1764108938508; Tue, 25 Nov 2025
 14:15:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125-cpio-modules-pkg-v2-0-aa8277d89682@pengutronix.de> <20251125-cpio-modules-pkg-v2-1-aa8277d89682@pengutronix.de>
In-Reply-To: <20251125-cpio-modules-pkg-v2-1-aa8277d89682@pengutronix.de>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 25 Nov 2025 15:15:10 -0700
X-Gm-Features: AWmQ_bmyyzcvHvKb3hiONSCA81Sb60_fTF6yrv3jpLEemcE9TF3r9Vum_MVTr30
Message-ID: <CAFLszTg1Q=dkj5TOfqkZARK00frAt6du3RP2386fooG_jHiMXA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] initramfs: add gen_init_cpio to hostprogs unconditionally
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Nov 2025 at 06:18, Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>
> gen_init_cpio is currently only needed when an initramfs cpio archive is
> to be created out of CONFIG_INITRAMFS_SOURCE's contents. In other cases,
> it's not added to hostprogs and no make target is available.
>
> In preparation to use the host program from Makefile.package, define it
> unconditionally. The program will still only be built as needed.
>
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---
>  usr/Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>

