Return-Path: <linux-kbuild+bounces-920-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CE0853E79
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Feb 2024 23:19:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C079D1F236F2
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Feb 2024 22:19:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D6A62156;
	Tue, 13 Feb 2024 22:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iLmyXp3O"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC78B62144
	for <linux-kbuild@vger.kernel.org>; Tue, 13 Feb 2024 22:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707862746; cv=none; b=Ml8qn8HrOo/g7Y8nmeAmqnU95+vuD/+pis+FW6PtbFcoxvek8Z9xq1RSPoKN2FqY1mAiX2sLk9Bi3iZS8qqBgPCEc8de99BHBmfJSnnxSHo+khW7J17+OrN4gJkmBmUHXNfkNJJzeKg+F6xyGZOmVDi2+B5GmxhhI9IT3k9wasg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707862746; c=relaxed/simple;
	bh=fupPzFq/mOzPQg49g5zT0ntfs9nXTHiAGCPpCwKSJQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CLKMXs0Ln3boVZAoOa4HqjdP9oBafdFtkdUNF6fTRTQe87URqHcWdcVk4YFTw4ZAh8+ib0BU6gzfxUue8j8jZXJyK004+MWQ68S2x3cgoGsDV5qAUMuTGu3/QjiMhHKmoHt2Ic5QVPl0eSFHW7+HHSRGvaT+dkXqutcH6SvkCwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iLmyXp3O; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3bba50cd318so3725257b6e.0
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Feb 2024 14:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707862744; x=1708467544; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NEtsz3nbQBwXPKC2RpUXbyPnr0oHPliF/lmcdhUWxA0=;
        b=iLmyXp3OXGZVc6HBBqe2Sz4YllkX5VLEpU+KJrQ9XQuoeUB1ax5oB8RDoc3/xtZOUS
         zjX5vQVyxT5u7znjdAf+adqg2lxJtF41R8wbtvAEx0xhP7X+xYN/I5SD+o+SqSmLWd3Y
         50lvD+Wv+ksNGDXjza8yHbSVxWSVoXFGV3q+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707862744; x=1708467544;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NEtsz3nbQBwXPKC2RpUXbyPnr0oHPliF/lmcdhUWxA0=;
        b=KhxKWaiosH+31AJ+xgZIlQ4Gtel7kdnNT4ptiyDEXEZWhB/TzELMfjZcc9ygMFOq4N
         0ba7rNs9d55Z25xNqewiiqRf09yMd6Fd7637/CZxCEZ86xHG8GCM+y6h+O8+d71qpiL+
         KT0eXmI6B7y1wF3of17izL/Q9Uz1ItQkZaB801dbJmeaTrXwmlELog4cCoX3hIAuWNno
         yPddPTOCsIQrs2MAqB6TdY72mCWKnYOeht+7+z2+OPWpC5yoZ8xmdC7GHBrQP/RN2NnG
         +xL2Umdi9LX3biw+SnL8fxZILvCWUHDMlf7YK7xdAaaZYmz5wv5ezQ+/S3RdUbYteWWC
         FLfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHPk1UA8v5U5QqcJO3dX2I0N9rlixIpeTh2OtINb+h+K8oLdv7mvvtxa0EWY5aTdPJYI3CREqOqkfIdk48qtLKp434jc6D1Gj17Bjp
X-Gm-Message-State: AOJu0YwStmjlaoEamS080EUb7ZAEIqlGauSsDzNZUILRv/ixucqLixYT
	UKrRMVkOPnjneJ0M57LNy+OJgo93AD2Eu+7q5z9jJMlmwvXw8ec4ZoTBqdRfJw==
X-Google-Smtp-Source: AGHT+IHTEQ8wwSveSYvl+t5iWH5jHvKp2JNEd3pVIZ53DZ3GINpiRg01YzM7bjG1Y+XAbeMm+x+wJg==
X-Received: by 2002:a05:6871:3a13:b0:21a:80cd:734a with SMTP id pu19-20020a0568713a1300b0021a80cd734amr874714oac.52.1707862743756;
        Tue, 13 Feb 2024 14:19:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVqeObbu+ItRZ+eJqf1kncpf5EJ3lH1k5WBhURpbH35pDNdgVhmgrUO67MPvRBOssCYpMpuZghAsI3gVHGWXQ4zr5EoG3JEt5HFIFo4MXQb4GLBfeW2Dv2KZ0v5EjBveV4M/WQpFaCz4yzmL+T4uwyZ86MetJ1r1AGxX1kRO6hoPoQRG11vhleH5xqUGld6pFZPXIGLUB1ZGyf2YJVkUL45tEUt82021f7fv6OGKR0LrZh5dLpaZQ/uCXbrNxGplqQbgaVf1wYD2j6RBG8myUgu97IRAqeuJpaSOneq4dc4fblBs6CE8zzvLMFec+AuCgM+CY+hPM0vF5opoCQPMAFIjCdgpVWJbETbd9cjuiq1Y6n0
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id ck25-20020a056a02091900b005d8b89bbf20sm2522310pgb.63.2024.02.13.14.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 14:19:03 -0800 (PST)
Date: Tue, 13 Feb 2024 14:19:02 -0800
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: masahiroy@kernel.org, nicolas@fjasle.eu, ndesaulniers@google.com,
	morbo@google.com, justinstitt@google.com, maskray@google.com,
	linux-kbuild@vger.kernel.org, bpf@vger.kernel.org,
	llvm@lists.linux.dev, patches@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: Fix changing ELF file type for output of
 gen_btf for big endian
Message-ID: <202402131418.3DB3FF7@keescook>
References: <20240212-fix-elf-type-btf-vmlinux-bin-o-big-endian-v2-1-22c0a6352069@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240212-fix-elf-type-btf-vmlinux-bin-o-big-endian-v2-1-22c0a6352069@kernel.org>

On Mon, Feb 12, 2024 at 07:05:10PM -0700, Nathan Chancellor wrote:
> Commit 90ceddcb4950 ("bpf: Support llvm-objcopy for vmlinux BTF")
> changed the ELF type of .btf.vmlinux.bin.o to ET_REL via dd, which works
> fine for little endian platforms:
> 
>    00000000  7f 45 4c 46 02 01 01 00  00 00 00 00 00 00 00 00  |.ELF............|
>   -00000010  03 00 b7 00 01 00 00 00  00 00 00 80 00 80 ff ff  |................|
>   +00000010  01 00 b7 00 01 00 00 00  00 00 00 80 00 80 ff ff  |................|
> 
> However, for big endian platforms, it changes the wrong byte, resulting
> in an invalid ELF file type, which ld.lld rejects:
> 
>    00000000  7f 45 4c 46 02 02 01 00  00 00 00 00 00 00 00 00  |.ELF............|
>   -00000010  00 03 00 16 00 00 00 01  00 00 00 00 00 10 00 00  |................|
>   +00000010  01 03 00 16 00 00 00 01  00 00 00 00 00 10 00 00  |................|
> 
>   Type:                              <unknown>: 103
> 
>   ld.lld: error: .btf.vmlinux.bin.o: unknown file type
> 
> Fix this by updating the entire 16-bit e_type field rather than just a
> single byte, so that everything works correctly for all platforms and
> linkers.
> 
>    00000000  7f 45 4c 46 02 02 01 00  00 00 00 00 00 00 00 00  |.ELF............|
>   -00000010  00 03 00 16 00 00 00 01  00 00 00 00 00 10 00 00  |................|
>   +00000010  00 01 00 16 00 00 00 01  00 00 00 00 00 10 00 00  |................|
> 
>   Type:                              REL (Relocatable file)
> 
> While in the area, update the comment to mention that binutils 2.35+
> matches LLD's behavior of rejecting an ET_EXEC input, which occurred
> after the comment was added.
> 
> Cc: stable@vger.kernel.org
> Fixes: 90ceddcb4950 ("bpf: Support llvm-objcopy for vmlinux BTF")
> Link: https://github.com/llvm/llvm-project/pull/75643
> Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Writing the u16 looks fine to me.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

