Return-Path: <linux-kbuild+bounces-665-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC0B83D05D
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jan 2024 00:09:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A7C41F25BB0
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jan 2024 23:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 793C4125C4;
	Thu, 25 Jan 2024 23:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Sc1LdxnK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A18312B8C
	for <linux-kbuild@vger.kernel.org>; Thu, 25 Jan 2024 23:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706224175; cv=none; b=tRHXhHpUKDoD3ABcBvE4ztmglaUGbUc7MQ7pnTQR4Cj/r1FvkecNpVndSZqYhly1QGAo4jsKOUjf5aSYMqB+8gquZ80oawrhpJGR4pJGmlnsGMCaMsgo8m4HeZQNSw8/HxfXg1/GgS1f4NKEKQq5HuKbBHIaednvA0n6uFv/u0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706224175; c=relaxed/simple;
	bh=ePte//PcvI+POPvm5pOf9eY2yfLLJls6I8UsfkKqq8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EELr76yZlyf0j5ZNMEdNRXZmL4X5/U4bhREzblQnTsUGI1AY1WIh1x57VAjGnXTbpvrGpv+EFvdtNUrfhtcoiIrj41e0FSbuQMj2aPHzbpxVYH8HpHi8H1rpu20G0JFr5TTKmKxhfZCrfgMuTDOmL/t6Nq4ipZ4R51ivooOUp84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Sc1LdxnK; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5bdbe2de25fso5665896a12.3
        for <linux-kbuild@vger.kernel.org>; Thu, 25 Jan 2024 15:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706224173; x=1706828973; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NNidztSseW3f6ox0VaVwn+MmYmXjLmRwN6RuC1S6ZnI=;
        b=Sc1LdxnKDEn2FUa7jyeJmOK2uxPNAJtUNZ/lP0ZinbliSf5uNrZrpDjZYKSn6ia5z/
         uJ5bsNh51b3g6TcZpf5adCBpke/Fe/rX1kCUfmIBlcuNgtyxQ13JjKyzGbI/CqVgxhj4
         zRJmXZxPyfE5KbS9d6cuxhcFaQBnjBhcoET08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706224173; x=1706828973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NNidztSseW3f6ox0VaVwn+MmYmXjLmRwN6RuC1S6ZnI=;
        b=tzEnxtym44IxOY3V97KeBHFS8AS70nfrfYpf5Q0aZKIpEmu7fCee4TWbcyjpDCchAI
         ZPvHDvbuiC6ZJ9DhFu0Kpw40HiC+K9gpRQhNIIc2mTOtZy0VVtYhpgnfNk4fFsVYpghp
         iieO8JCU2wq1yg6n3AkxsAAz9dQcOPkPfqxtS/pOL1HiSJoNl9dEAbk/mSQSmJ0xGgbI
         zq8tqDcoyZRpKD7ARAo3jW6JzjTZ9QTQxVEyUE6elrBdspHndH2AIqs14Z2nFx8NSunn
         wR2v/UdLYIS6Rw0AH2S6uxuO26YhUEUQ02nM7NrU3x37GLeaDKLv3YpuS4rAHriXCOay
         inJA==
X-Gm-Message-State: AOJu0Yy07ko68q0jECNVFOWTsn4gzRbz97H+bVEp41eQsbioHtvdIAVy
	qFJNkax5fnFzOlqW1Q40CRcCvPyFOsb8CKYKtrVpFC9UGJgMD3MbSP1yJWj6Dw==
X-Google-Smtp-Source: AGHT+IH4wMIY5onoDuNtmQW2qW/oiyEguJjb8r1Cdunh6LBtNU0O2EKFQ/LepjR7KIf8EtqHsgZMQA==
X-Received: by 2002:a05:6a20:1616:b0:19b:5cf9:45ac with SMTP id l22-20020a056a20161600b0019b5cf945acmr452465pzj.81.1706224173278;
        Thu, 25 Jan 2024 15:09:33 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id m66-20020a633f45000000b005cdfb0a11e1sm27205pga.88.2024.01.25.15.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 15:09:32 -0800 (PST)
Date: Thu, 25 Jan 2024 15:09:20 -0800
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: akpm@linux-foundation.org, masahiroy@kernel.org, nicolas@fjasle.eu,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
	patches@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 09/11] fortify: Drop Clang version check for 12.0.1 or
 newer
Message-ID: <202401251509.70789B5D@keescook>
References: <20240125-bump-min-llvm-ver-to-13-0-1-v1-0-f5ff9bda41c5@kernel.org>
 <20240125-bump-min-llvm-ver-to-13-0-1-v1-9-f5ff9bda41c5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240125-bump-min-llvm-ver-to-13-0-1-v1-9-f5ff9bda41c5@kernel.org>

On Thu, Jan 25, 2024 at 03:55:15PM -0700, Nathan Chancellor wrote:
> Now that the minimum supported version of LLVM for building the kernel
> has been bumped to 13.0.1, this condition is always true, as the build
> will fail during the configuration stage for older LLVM versions. Remove
> it.
> 
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Acked-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

