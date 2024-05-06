Return-Path: <linux-kbuild+bounces-1782-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 467238BC62C
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 May 2024 05:22:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3D4F1F21046
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 May 2024 03:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAD524206F;
	Mon,  6 May 2024 03:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QHI2pWvz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A9F3F9EC
	for <linux-kbuild@vger.kernel.org>; Mon,  6 May 2024 03:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714965734; cv=none; b=bmFk0tser3I0OrS1QLIbjfsjlQjink0mMsf2xkKg28+vNU/91r0t9pK7yIqNztpYPDNMcK6Qi4vkLkYRbeykGOlfIvhXsxkfcOxySR48AicUgPqLmBEAG+vk0dCork9oyslp+HcpggpA1J2lVrBs7usX026f5447+TJZQxctuVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714965734; c=relaxed/simple;
	bh=jDX8ASW2qvZ6KlbWPKGaSk28mv6B6mlsXMCBys2++Cg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U2SyBnzjZh4rvUaun71ulzknu/nGSbpmTcYSd6AX79rRMLVr0P2hFyjVAZNoYz1ag2ueBg0rFeXXO6sz0nOUEiRzbaTJDxMWyU1PzdORz67F8lpLax01Nnd2UnaSIeMg871UeTzkaXGsDom3ZAGxwps6zVQPavn1l1H3OUk39mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QHI2pWvz; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1e65a1370b7so13458815ad.3
        for <linux-kbuild@vger.kernel.org>; Sun, 05 May 2024 20:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714965733; x=1715570533; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NLj2W08/AlPxLeXkCP61XrllXdJOfYp00hdT7d+0hkI=;
        b=QHI2pWvziVZi+K8ZQplusfpOnfzn0r91HNLtyjHO7OrPWj2VADftUxIywNK67qQqud
         qNEiMy2BwuyYZjMU24SBqL/SHQAVlkToVFDMZwOXr7KixGUqlPIyVrIM0tgRWrx1vquH
         P/RidO5HwkpVFuBl/8qC8LmfCDwhLzqda250w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714965733; x=1715570533;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NLj2W08/AlPxLeXkCP61XrllXdJOfYp00hdT7d+0hkI=;
        b=O27LpPoO0GvLRlhnOs6ICR/Wipgx09GVnv+qik1ZmTBSPTVQHS6+gNd1lCGDNv7pyQ
         nz8/7K5nwAHm5qzTE7EOeyk+YZHa35Vom7Pw+kd0CuX4NEiCrLekhT7hFbVrzItlemwp
         iM5lSFMlHeIbAv0Oh37Hu2wKjTYkC16PgwREj3XLUASuxrjLJUT1qzIeHB1wUwBOkxOa
         iWFIylE4e45yed+fAa5NVmBn1wN/WkwNVkb9Q+U/gZqBMNzN8bDvuSRgbmNgvtl5ixh3
         FCR9p6GifCeY8CkA07V1URZr09tYNRuOXH0/TMUNYJg6wjJPg730L0JwoigX5RYE4cOL
         /8Vw==
X-Forwarded-Encrypted: i=1; AJvYcCU0dqfywz/1Pjr/HQfFsM1WuLuf8BrYzZQY0guB/bliygj5VyTObKYtUTixONeMoC6Jj+cwl51XQemnxv5+P0irXz505O6EMhNbUTWD
X-Gm-Message-State: AOJu0YxFagkOIcNZd/7W8EEIMGvQQAx0pQUJAZG0/MLbesST5sQg+ejK
	WVW2U1WUCMjQ7jkuFZJAq1ku467+KBkUvv9pzL++NvDqEGffi60l4s3s2I/xjA==
X-Google-Smtp-Source: AGHT+IHdGPyGQrnvWR5Admmi4idMQxhyP5nB96L+iNkf96/MgdQqtZ5qsVJTxOQ1cKRQu2U3zrqpXw==
X-Received: by 2002:a17:903:8d0:b0:1eb:7ba:a4c3 with SMTP id lk16-20020a17090308d000b001eb07baa4c3mr16253443plb.48.1714965732789;
        Sun, 05 May 2024 20:22:12 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:8263:3b89:bcee:2ed4])
        by smtp.gmail.com with ESMTPSA id o7-20020a170902d4c700b001e249903b0fsm7134459plg.256.2024.05.05.20.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 May 2024 20:22:12 -0700 (PDT)
Date: Mon, 6 May 2024 12:22:07 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>, linux-kbuild@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>, Minchan Kim <minchan@kernel.org>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH 08/14] zram: check that backends array has at least one
 backend
Message-ID: <20240506032207.GD8623@google.com>
References: <20240503091823.3616962-9-senozhatsky@chromium.org>
 <202405041440.UTBQZAaf-lkp@intel.com>
 <20240504071416.GH14947@google.com>
 <20240504161004.f5a0aab5e5aa1033d4696c20@linux-foundation.org>
 <20240505043957.GA8623@google.com>
 <20240505051305.GB8623@google.com>
 <20240505064832.GC8623@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240505064832.GC8623@google.com>

On (24/05/05 15:48), Sergey Senozhatsky wrote:
> On (24/05/05 14:13), Sergey Senozhatsky wrote:
> > On (24/05/05 13:39), Sergey Senozhatsky wrote:
> > [..]
> > > > I guess just pick one if none were selected.
> > 
> > How do I pick one if none were selected? Does Kconfig support
> > something like that?
> 
> This triggers Kconfig error:
> 
> config ZRAM_EMPTY_BACKENDS_FIXUP
>        bool
>        depends on ZRAM && !ZRAM_BACKEND_LZO && !ZRAM_BACKEND_LZ4 && \
>                !ZRAM_BACKEND_LZ4HC && !ZRAM_BACKEND_ZSTD && \
>                !ZRAM_BACKEND_DEFLATE
>        select ZRAM_BACKEND_LZO
> 
> 
> drivers/block/zram/Kconfig:17:error: recursive dependency detected!
> drivers/block/zram/Kconfig:17:  symbol ZRAM_BACKEND_LZO is selected by ZRAM_EMPTY_BACKENDS_FIXUP
> drivers/block/zram/Kconfig:52:  symbol ZRAM_EMPTY_BACKENDS_FIXUP depends on ZRAM_BACKEND_LZO
> 
> 
> I'm a little surprised by this - EMPTY_BACKENDS_FIXUP does not depend
> on ZRAM_BACKEND_LZO, it depends on NOT ZRAM_BACKEND_LZO.
> 
> Let me Cc linux-kbuild. Kbuild folks, how do I workaround this?

Is this how one does it?

config ZRAM_BACKEND_LZO
       bool "lzo and lzo-rle compression support"
       depends on ZRAM
       default y if !ZRAM_BACKEND_LZ4 && !ZRAM_BACKEND_LZ4HC && \
               !ZRAM_BACKEND_ZSTD && !ZRAM_BACKEND_DEFLATE
       default n
       select LZO_COMPRESS
       select LZO_DECOMPRESS


User still can select N and then we'll have empty backends, but
at least default is Y if none of the algorithms were selected.
Is it good enough?

