Return-Path: <linux-kbuild+bounces-1774-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D88E78BBF82
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 May 2024 08:48:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36D1E1F2169E
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 May 2024 06:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79DE35680;
	Sun,  5 May 2024 06:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m/u9CJUY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0840E23B0
	for <linux-kbuild@vger.kernel.org>; Sun,  5 May 2024 06:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714891719; cv=none; b=cA1/gWK6anPcuw6ygDLr/f7h34zMu1AwwPme4Awwl49hOv0p5QxWZ7H6y0ELMgOucwOc8nLxI5Q9hjJVFIc6pLZRU7EvoQH7PzA1BiKsAERsfONpRPaJk62V2wWDMXP4irH6K4rUGisNZWWmJmgFCNbFIDAJSRfg8zcQmlUuLfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714891719; c=relaxed/simple;
	bh=RXOAbrpDgpGLFXAx46orQOJKxD+B8azOxvN9slFpzaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sEEY9jfPRh7jxTSkMAPAa7OvrCtbesw8Yajx6oxyVMpjgX2vdJN2Cugd8bEKiCVmtVJJKwCBFBuTgS/rLt+LhPTAcC+LGGJcXuTfyLQ3TQjEjI0hnHJXY+UEX6U54mhpnJeIS6b5V7baIuIYpRiG99h9ZvP40l5BTgvq3ntY4/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=m/u9CJUY; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1ecd9a81966so20443795ad.0
        for <linux-kbuild@vger.kernel.org>; Sat, 04 May 2024 23:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714891717; x=1715496517; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jHhjXzZFksYbod+Id4KGQBrNHX5j07+oNfn2k/vQfaE=;
        b=m/u9CJUYgIhnVbD/S2wlLnDkC75h94E7KFUGjobsAQNKsnfNij5kfDsaDY5B0wufe5
         BBuYTljSYdNBtfFvgmU2IhzoJCi3ZOOzOjWRK4q4HnsarugokEoCQxh6yTB6wg22btWW
         MIMI8RCM+FGJoY+PKKmdsOngeWbvYKR8evOVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714891717; x=1715496517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jHhjXzZFksYbod+Id4KGQBrNHX5j07+oNfn2k/vQfaE=;
        b=ijTXwNdvenT2RqgKkBmEqXIycvF8H0pvsLBQTwr6kLk3fsjhPEecTlzj0Pmc9opZLb
         p3OmlOaaZHGNWsRD1eFmppUTIkmSV6ZPzADIjhj/annPIV/eejva3Jzguweq9XQbWRHj
         B93IRnXTBRF5gIj/A089IZ+Noqox7vUQrLqoMqU5JBTP4TkYtD76FBK/eg1FR3Dz0rVl
         1om7+kJBf9MKaZdyot67h/16o/3yHblZmDJjfEt0JsK3KUWTDHeBe308hGBDUhmrpIJi
         MNhXcuIrWIFsh3uP7/yJnr/oJz5S/DHA7TqQy2kaAnk0Hq/5FFMTnn4YUo9vkOfLGjjf
         AiSA==
X-Forwarded-Encrypted: i=1; AJvYcCXy5XXwdKXq4KqMvRqYp1HzWDPmwDJNpj0GWpXbDswmXcdZRaiY+toU/Klf7qO49CV/u4dKgcbBn5KeWdkQhyg9iRScus/5jw5IUiqx
X-Gm-Message-State: AOJu0YwJmMRajcDgm5lucFu2nL2e6wgIuZ8qOle9WY6MHxYQdKR6zzgd
	msHMc4q+t/J6fca30PI2Tn849osZCB4nTgZG0dG29nGMkyxEf2dF+auqLWxcqw==
X-Google-Smtp-Source: AGHT+IGHFQZeorrILclN2v4X0ie/TALNwsi+wwr/27nntpfpvsDMRS89bEaJxITb4Y8FGrRf8qcf7Q==
X-Received: by 2002:a17:902:dac1:b0:1eb:7162:82c7 with SMTP id q1-20020a170902dac100b001eb716282c7mr9274029plx.18.1714891717283;
        Sat, 04 May 2024 23:48:37 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:8263:3b89:bcee:2ed4])
        by smtp.gmail.com with ESMTPSA id j3-20020a170903028300b001e7c05cf1a2sm5978407plr.112.2024.05.04.23.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 23:48:36 -0700 (PDT)
Date: Sun, 5 May 2024 15:48:32 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>, linux-kbuild@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>, Minchan Kim <minchan@kernel.org>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH 08/14] zram: check that backends array has at least one
 backend
Message-ID: <20240505064832.GC8623@google.com>
References: <20240503091823.3616962-9-senozhatsky@chromium.org>
 <202405041440.UTBQZAaf-lkp@intel.com>
 <20240504071416.GH14947@google.com>
 <20240504161004.f5a0aab5e5aa1033d4696c20@linux-foundation.org>
 <20240505043957.GA8623@google.com>
 <20240505051305.GB8623@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240505051305.GB8623@google.com>

On (24/05/05 14:13), Sergey Senozhatsky wrote:
> On (24/05/05 13:39), Sergey Senozhatsky wrote:
> [..]
> > > I guess just pick one if none were selected.
> 
> How do I pick one if none were selected? Does Kconfig support
> something like that?

This triggers Kconfig error:

config ZRAM_EMPTY_BACKENDS_FIXUP
       bool
       depends on ZRAM && !ZRAM_BACKEND_LZO && !ZRAM_BACKEND_LZ4 && \
               !ZRAM_BACKEND_LZ4HC && !ZRAM_BACKEND_ZSTD && \
               !ZRAM_BACKEND_DEFLATE
       select ZRAM_BACKEND_LZO


drivers/block/zram/Kconfig:17:error: recursive dependency detected!
drivers/block/zram/Kconfig:17:  symbol ZRAM_BACKEND_LZO is selected by ZRAM_EMPTY_BACKENDS_FIXUP
drivers/block/zram/Kconfig:52:  symbol ZRAM_EMPTY_BACKENDS_FIXUP depends on ZRAM_BACKEND_LZO


I'm a little surprised by this - EMPTY_BACKENDS_FIXUP does not depend
on ZRAM_BACKEND_LZO, it depends on NOT ZRAM_BACKEND_LZO.

Let me Cc linux-kbuild. Kbuild folks, how do I workaround this?

