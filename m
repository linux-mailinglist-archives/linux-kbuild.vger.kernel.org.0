Return-Path: <linux-kbuild+bounces-4921-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA6F9DF9CB
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Dec 2024 05:10:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 589F0B21153
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Dec 2024 04:10:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 481951D3576;
	Mon,  2 Dec 2024 04:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KCwUc3i0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9C31494DD
	for <linux-kbuild@vger.kernel.org>; Mon,  2 Dec 2024 04:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733112637; cv=none; b=n7aVOxLJEjGKKk1wnKgh7wSbsBb3O9mYSH63zn+QZENu3zHcgEs8ETJ+xmUIfZjodHr1AK/JVNrO1Ut5zRxs/go3bS3GlhxW7xtW7YAKfOP3g06fyL1AkCZMgXe0g/w6Qgn/k1CaaU4+LSprSyuPXU3Fkg9ctkRLGdHlrXt1UxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733112637; c=relaxed/simple;
	bh=vMWGWHg/et5CqkIdQLtUU5ObJLzO5NosJVeARTBqbag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uttmwql98aXrGkBmmk5xiCzc23GW1dJBlHx75q9s1HpveReL1uOUO1J6A5Ld/0NuETFb4v0aeW6zDu7pNDgXYsDLcahr8ESPszdsAm+C6B87azn/MGTS3a7qL9TUnYRokJ4vGR6GR7tPklexG7cZdU1aiarTGVSbvrjfnfdIgGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KCwUc3i0; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7251abe0e69so3108433b3a.0
        for <linux-kbuild@vger.kernel.org>; Sun, 01 Dec 2024 20:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733112635; x=1733717435; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=76F7lD0eouVg6d3auGQDcfuDktfWQWRUnQNVSJA2ubk=;
        b=KCwUc3i03mNYEK0a5dofjhlYqiVD5sd7+Mqn7AgpUcETYbTWRo7SOsSXUKKxfxx7UJ
         SHyJWF5FvA1vjn7+utOgL9vrKI/9ue+EpkmWsAJ6DA/iGHXGXWfqb0Vp6Aw3tOxcccsi
         lO6o/Y+KgpI184wI77H8nvGxk6ukX6XHInVyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733112635; x=1733717435;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76F7lD0eouVg6d3auGQDcfuDktfWQWRUnQNVSJA2ubk=;
        b=gMtDCAKdAo/W5wNjNME6MVXeF1jNgyjFuiUTexikG+aYlpzhxWIIP6gOds9ZFFFPLk
         BZg9oMEdE0tRHNN/EZstPodQdTaZwiEIhyUEdVAN4g883XvDKvk9F3Xb+t19FuCU5c7d
         0KXNCoVan6+4GKtCVAFUKCqw0TnEu238zyvLZWP1FiK7Is+UpxMac4KXESVNQNuHY4Zo
         py/e8yHl37fKKLwtkxDastDjQ0M7i5uosyEXDGR1BzKelZ4AaYqsY5Hu+I2rQrKy4vEY
         YWYbmrXoF5AIAnBVHnIRF2nC8dpwHQm3yeSQwGVCHnZQwT0f733dmpItXSgq1u1Z/oVl
         t2pg==
X-Forwarded-Encrypted: i=1; AJvYcCUb1zbehMbyADbbxKzmVbShPIV2zQPPKJ23zKSdwGpz6Q36klSDDdG23nqZqtYgUHsxthRi2aSM9vjbvvY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFZZ4lGeJEFzojMnCvncEU3L/fSPPjFI2DzXa678tS6cNigazc
	KPw/NPHK3u6/0TgARHNfW9XLUgQvhPp+UO9GvWsqv+x9F5IRGDKtw6t2gPAnNA==
X-Gm-Gg: ASbGncteR5XZZnmABXopqEq+nDpz9CVIU9bNu2e3HMCK9oap6ZrcbM8sPRBm7gcAFcM
	4/NnpjvutdY92spEZLa4OfDkbOY2JffTNWhxn0ZJxBNRO0nQ2i/Sm71oAZ77eTGy8Q02wj9oAPs
	eDxOIfSC3uwPQp4KV0bf+QadUxyjIttYFGAMS28pCKnx6qkyNJ8UyR1tnyOqWDwF5SAVPDDyhEy
	ix/HzDTzv0tNJQXT+b/SWJzhDksicFAcKg4BLr63SUC1BciClABDA==
X-Google-Smtp-Source: AGHT+IE880m9aaD/PfpcfjpV+6a29yccMszSLvtOM5pzxyZnHHZv7iq/hZ128/DKx4K03e9uIlt/rQ==
X-Received: by 2002:a17:902:ce08:b0:20c:da66:3875 with SMTP id d9443c01a7336-2150175eb06mr346021735ad.24.1733112635088;
        Sun, 01 Dec 2024 20:10:35 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:13dd:b39d:c5ab:31c2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21521905f2bsm67078175ad.93.2024.12.01.20.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 20:10:34 -0800 (PST)
Date: Mon, 2 Dec 2024 13:10:28 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	20241015061522.25288-1-rui.zhang@intel.com,
	Zhang Rui <rui.zhang@intel.com>, hpa@zytor.com,
	peterz@infradead.org, thorsten.blum@toblux.com,
	yuntao.wang@linux.dev, tony.luck@intel.com, len.brown@intel.com,
	srinivas.pandruvada@intel.com, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, rafael.j.wysocki@intel.com,
	x86@kernel.org, linux-pm@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] modpost: Add .irqentry.text to OTHER_SECTIONS
Message-ID: <20241202041028.GJ10431@google.com>
References: <20241128111844.GE10431@google.com>
 <87o71xvuf3.ffs@tglx>
 <20241130114549.GI10431@google.com>
 <87iks3wt2t.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87iks3wt2t.ffs@tglx>

On (24/12/01 12:17), Thomas Gleixner wrote:
> The compiler can fully inline the actual handler function of an interrupt
> entry into the .irqentry.text entry point. If such a function contains an
> access which has an exception table entry, modpost complains about a
> section mismatch:
> 
>   WARNING: vmlinux.o(__ex_table+0x447c): Section mismatch in reference ...
> 
>   The relocation at __ex_table+0x447c references section ".irqentry.text"
>   which is not in the list of authorized sections.
> 
> Add .irqentry.text to OTHER_SECTIONS to cure the issue.

This works.  In fact, this looks like a local fix which we applied
here on our side, but we were very unsure.  Thank you Thomas.

