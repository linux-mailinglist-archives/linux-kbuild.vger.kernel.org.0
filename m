Return-Path: <linux-kbuild+bounces-1785-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 718C28BC7BF
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 May 2024 08:43:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27FAF1F21AEE
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 May 2024 06:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E165F4D9EC;
	Mon,  6 May 2024 06:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RflGFmp+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E8B4C62E
	for <linux-kbuild@vger.kernel.org>; Mon,  6 May 2024 06:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714977822; cv=none; b=imvvlhI2WI4TEBqGmoK0/uXe/qo9dBAYo328oFCq5uUcZhZ7YFQ2xQWP/xcCEJV+MNvkoIkO2vwymw/VMfy+HW1kTOja9DtOi00/A886XcGBDA0Pwtkl8ISa6hp5wwzNAxNWR9rPI3Mvg5KiRJXgXXVswdpQ7YdkrU6FSa+PsSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714977822; c=relaxed/simple;
	bh=TTtQyHcx8HkIEEBoI/wvFIf+0GYqPB/yGd00nQkF9Ys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QlsV2ranDcKwYX0ALR74IPHIHsOy33fOZvCT1TWu1b6tRN2X+2vCnUyB+BgaX0El0unI1HIf4jCTz92Nahfkxk+8AqUZktvSQ8Ke9LxbsC+u92vXX6MNufbKDzpze5Y95d8zjAGGoFc3sXXBzyVJNHMy04XGA3CfrZeMGBrUPAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RflGFmp+; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5dcc4076c13so937027a12.0
        for <linux-kbuild@vger.kernel.org>; Sun, 05 May 2024 23:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714977821; x=1715582621; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Awh0YX9sFOZlmXGVWv7TrQyTmY6KwzUZh2FsqtFN28s=;
        b=RflGFmp+l+BXhk012uKZ6aGuTeT6YcCrQtXctXqH+GYKCsoFUkUu+ncgwY+ZsVSEPf
         Optz1qPMVDD6ozHGvn9LX7Vbec04BflDCvLwMgIJnuOo6N7bOWYZBSyKR8z6jaTMREwx
         jbKOWzJ+JqoF4pLVdtWNcOTcBDLi2H9zqMAT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714977821; x=1715582621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Awh0YX9sFOZlmXGVWv7TrQyTmY6KwzUZh2FsqtFN28s=;
        b=fZSpNF0t7gqMtYxj7F4wQfqYlyAcFjHGR5T2bBEdY1ifhO8a2QfuLsuBDYHHDQLHgA
         XRoBOCPOnL1IFQHfiAi3/ep4a3phEXR7ZSPCbs9kkJtAz4b0fcmHUYf0QCzWuDrCDONP
         qC6/Iro3CGmrz8bRL1guPaS0V862Yj7x+rCZ/ALAgyQ7LzpjXFeg7vEC/RvY6SwEDrDl
         9v8AmiD2MuR5pxDyZlFTVJNPKrUIJiemv//rynhkpAnQSea1LNUM6/pe5kBmaUEIW6lh
         1mabQAf1nNMSxmKwqvVAd3FC4Sjw0bXOpZjyNFXf+7bNWIBBhZT/eUQLqLTEFMtxeKJ5
         gMAA==
X-Forwarded-Encrypted: i=1; AJvYcCXMykyd1DRDHIu6WPIiqLNCJ3Tp2PIl45KqzqwWRslnQdbxTVHCv12oU99/QOBipaZ0dxPBLGaiFWpJyk+4QJ6tQG8y/oEsQ8esvx/H
X-Gm-Message-State: AOJu0YzZBmabVl7x+ZZDtB9R6NQXTe9qgPXW/jL/x/GjFOeJkhX1RPv8
	qPu31WIN/TfXxqh6AIAG7NjGjCGjkO2RO//KdO6lbQ53UZ32EhkZ3ImHNp8za/Ng0AV5NEJ1EVk
	=
X-Google-Smtp-Source: AGHT+IH9/hiNrPAZgMq5yCe0qsmK1lm2LH0SwY8LB+Tn+zX2oS8PqcHxJee+fl5rH8OfTgRdDd1VYA==
X-Received: by 2002:a17:90b:124b:b0:2b0:763b:370e with SMTP id gx11-20020a17090b124b00b002b0763b370emr18238105pjb.18.1714977820818;
        Sun, 05 May 2024 23:43:40 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:4e24:10c3:4b65:e126])
        by smtp.gmail.com with ESMTPSA id rr3-20020a17090b2b4300b002b113ad5f10sm9316590pjb.12.2024.05.05.23.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 May 2024 23:43:40 -0700 (PDT)
Date: Mon, 6 May 2024 15:43:35 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kbuild@vger.kernel.org, kernel test robot <lkp@intel.com>,
	Minchan Kim <minchan@kernel.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 08/14] zram: check that backends array has at least one
 backend
Message-ID: <20240506064335.GE8623@google.com>
References: <20240503091823.3616962-9-senozhatsky@chromium.org>
 <202405041440.UTBQZAaf-lkp@intel.com>
 <20240504071416.GH14947@google.com>
 <20240504161004.f5a0aab5e5aa1033d4696c20@linux-foundation.org>
 <20240505043957.GA8623@google.com>
 <20240505051305.GB8623@google.com>
 <20240505064832.GC8623@google.com>
 <20240506032207.GD8623@google.com>
 <CAK7LNARUBuR3gDtX6GfB7Zv6dydt1+qzBB_XT58wOg3WeCTVvA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNARUBuR3gDtX6GfB7Zv6dydt1+qzBB_XT58wOg3WeCTVvA@mail.gmail.com>

On (24/05/06 14:20), Masahiro Yamada wrote:
> config ZRAM_BACKEND_FORCE_LZO
>         def_bool !ZRAM_BACKEND_LZ4 && !ZRAM_BACKEND_LZ4HC && \
>                  !ZRAM_BACKEND_ZSTD && !ZRAM_BACKEND_DEFLATE
> 
> config ZRAM_BACKEND_LZO
>         bool "lzo and lzo-rle compression support" if !ZRAM_BACKEND_FORCE_LZO
>         depends on ZRAM
>         default ZRAM_BACKEND_FORCE_LZO
>         select LZO_COMPRESS
>         select LZO_DECOMPRESS

I'll take this one. Thank you.

> BTW, "default n" you are adding are redundant.

OK.

