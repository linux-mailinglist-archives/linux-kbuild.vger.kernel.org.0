Return-Path: <linux-kbuild+bounces-5575-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D518AA239A6
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Jan 2025 07:54:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29ECB188435F
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Jan 2025 06:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70E6C143723;
	Fri, 31 Jan 2025 06:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="pTT0Hcmn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F2114F70
	for <linux-kbuild@vger.kernel.org>; Fri, 31 Jan 2025 06:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738306457; cv=none; b=tTYis2vNVxIqfOli2aVEW49eC7t+Hxw0jf454SvD5ZzMcj7U6r3sFaAOV2G61a5NcoXYBJpvBnPO8jPyucVQJVgeK2KWcr+Er37wEnUr0xmYAMgtueQpK3EgQ178iGuXp8he+r2FbdxEdR6UbtcNW0l5DmqXCwgbEhqm4tv/+n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738306457; c=relaxed/simple;
	bh=wPPZdwcTNReY/45pINziN8cWtHxbCtGIYeZW3L13D2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PHo+m9pLVp2OmHekscLG31FD4eTnvEFBzcIo55H64CfNu1MtDQBFPYjDvCxDHf0z2PPfeRHDaO7uORnkgWyMRpxyL9lo7y2dHyh4Def3E5oHdBec+a/XSjMZveYEitEukRbt19quDpy04R69meXwMt6zQlnYPOMR9GRYduZazDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=pTT0Hcmn; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2eed82ca5b4so2746372a91.2
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Jan 2025 22:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738306454; x=1738911254; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qjk/Bm1nilxEN/HqMvYtrvEtTOGs2l5rMV27l42M1Jg=;
        b=pTT0Hcmny+wYvuaAFQjccuk+VdhUR20p9P/Tx4DR2e/J1rsXy6cJMAxNhGuwD/zNqj
         sx3HAKt/VYY7NE2SljQ2D1Wl51MmcdXa6DJ9fJAU0JtyoQRJv9SIv/eE3DbJ5vGEmx8a
         s0x9YPhczIqhDWJJFdFXX1bZIV+/pYRPGQiMrDeHddA6ZyDY9mPyCKRvtd0IY0amzgaX
         6JBWeB998l4jpxM4MQc7e8JOP5kOyYZsXWjElg53WnNYtFzqtdCxGP78ijNUZspx0Wpy
         JqmM5Nq6R/X2+p28bJqSl6LpgBur4O+EnqI2s5r//IeFtl+0L2KnbY/u1XRPIR396sVd
         Ya6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738306454; x=1738911254;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qjk/Bm1nilxEN/HqMvYtrvEtTOGs2l5rMV27l42M1Jg=;
        b=Fc1tGMo/y0u/rKrywYOSf4ZH+Ptbr4YE2ZByDGyK3VQrKe8s9ldJgbRy8KS/uOXaRi
         rmo7GtPkRo+08sHoKQwYLU5xvUscIyRU34+HqXxltqn2+lqjsEGmzQ/3KNcYu5bRnPCK
         F7SzfCw9tStVrYVupahD+ZQQZ4JCmS0u0ZsP81tGeVZw6kvcrrMcF0iq8DwbUmoslzwS
         JZWakhsMv+Xkq3L+8CFT+FjnWZOI5AVR0TMIkekk2KkRk4eq6L7+gPnxaub9A/HHvxds
         CGCe1LsGhMqC6QNAiEZ4tsnFUnMYMm3CJzg52q+CQcMlxKRE5/QzV3FNc8EiTchlOj+t
         qhIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUbmuJNBH+IH/4moOnc6DohH+lMu9dK5SjdYeDZI4L6sSc4ODhaSt3HOoNgfG+yCfmP6Yne4aMkBWXTzY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKno44LYRs3zSxyRp+adeudSe+qt/xoggSWSTYr5Eif7fHw/Hk
	YPJR4QG5bOBq9HPlpxYaW3c4un6uqAqJJS7NvCJ1N/Sr2GZ3tp3eyNPFxBCRXt0=
X-Gm-Gg: ASbGncs918c657eqktmfsd2xIcMGxwHHGNNQxbrW0wV2n/tPTkOGohPiLhq6BqjYMqK
	YHLrXMikFo3FbJ06WFSpNd5xsp4+yKteOuwV2lQ9PXIc1RUs/dqUQuwV0s0Gi3RB19nbFPXdHtq
	AOY+FpFFUX57whUqMHiTSMycMah0InHHPhEF5NnuVJDemCczL97mhQFdSWjGtBKgJV13cJdJxzV
	FpMhrLMJ3YGrrl6BNw7OFNrb/2Z8R0TOQ2FH8/RHlkKjbCf5WITXARS7q5JfYGtqkjOxETcntnS
	mmGYCHgoXl3D7MK10USt8UsNYSYHyO3G9toSZUn+o2MVUnKneA==
X-Google-Smtp-Source: AGHT+IEz7rjrhwL3HJk43f36FIy7rrYdmVDDgayhVQoH4Dh/eG3AVR0uPbtT1vdB4HpALYHMe7rawg==
X-Received: by 2002:a17:90b:5408:b0:2f6:d266:f45c with SMTP id 98e67ed59e1d1-2f83abb34e6mr16241576a91.2.1738306453920;
        Thu, 30 Jan 2025 22:54:13 -0800 (PST)
Received: from ghost (c-24-56-227-58.customer.broadstripe.net. [24.56.227.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bf9497dsm5104201a91.35.2025.01.30.22.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 22:54:13 -0800 (PST)
Date: Thu, 30 Jan 2025 22:54:11 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] kbuild: Use --strip-unneeded with INSTALL_MOD_STRIP
Message-ID: <Z5xzkwwZAWRRLCdj@ghost>
References: <20250122-strip_unneeded-v1-1-ac29a726cb41@rivosinc.com>
 <20250131035245.GA47826@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131035245.GA47826@ax162>

On Thu, Jan 30, 2025 at 08:52:45PM -0700, Nathan Chancellor wrote:
> On Wed, Jan 22, 2025 at 07:17:26PM -0800, Charlie Jenkins wrote:
> > On riscv, kernel modules end up with a significant number of local
> > symbols. This becomes apparent when compiling modules with debug symbols
> > enabled. Using amdgpu.ko as an example of a large module, on riscv the
> > size is 754MB (no stripping), 53MB (--strip-debug), and 21MB
> > (--strip-unneeded). ON x86, amdgpu.ko is 482MB (no stripping), 21MB
> > (--strip-debug), and 20MB (--strip-unneeded).
> > 
> > Use --strip-unneeded instead of --strip-debug to strip modules so
> > decrease the size of the resulting modules. This is particularly
> > relevant for riscv, but also marginally aids other architectures.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> 
> Is there any sort of regression risk with this patch? If so, another
> option may be to give another level to INSTALL_MOD_STRIP like 2 so that
> INSTALL_MOD_STRIP=1 continues to behave as before but people can easily
> opt into this option. No strong opinion because I am not sure but was
> not sure if it was considered.

I do not believe this would cause regressions. The description on gnu
strip is:

"Remove all symbols that are not needed for relocation processing in
addition to debugging symbols and sections stripped by --strip-debug."

The description on llvm-strip is:

"Remove from the output all local or undefined symbols that are not
required by relocations. Also remove all debug sections."

gnu strip --strip-unneeded strips slightly more aggressively but it does
not appear this causes any issues.

> 
> Regardless:
> 
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Thanks!

- Charlie

>
> > ---
> >  scripts/Makefile.modinst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
> > index f97c9926ed31b2b14601ff7773a2ea48b225628b..c22f35f6b9db3cac3923b9e787b219f752570642 100644
> > --- a/scripts/Makefile.modinst
> > +++ b/scripts/Makefile.modinst
> > @@ -80,7 +80,7 @@ quiet_cmd_install = INSTALL $@
> >  ifdef INSTALL_MOD_STRIP
> >  
> >  ifeq ($(INSTALL_MOD_STRIP),1)
> > -strip-option := --strip-debug
> > +strip-option := --strip-unneeded
> >  else
> >  strip-option := $(INSTALL_MOD_STRIP)
> >  endif
> > 
> > ---
> > base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
> > change-id: 20250122-strip_unneeded-cab729310056
> > -- 
> > - Charlie
> > 

