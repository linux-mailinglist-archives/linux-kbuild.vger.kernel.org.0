Return-Path: <linux-kbuild+bounces-732-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F37848431D3
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Jan 2024 01:23:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54054B24F9A
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Jan 2024 00:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA6E736E;
	Wed, 31 Jan 2024 00:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CfFMa6vL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446866112
	for <linux-kbuild@vger.kernel.org>; Wed, 31 Jan 2024 00:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706660590; cv=none; b=tzDtFYITVsu/r64Mwdim+WGIH6hIUOm1XoblKDHfomnSAvyxxBzMfQyqbcmi7jHGX5BkmuWyQ4btsZA6S2q8C+BXy2AYRyMld/UeF5EUiW1ETGXv6yABDLO2LeQSjiY4/nNhoRu/W0hco1OpzqGNhNKv6lm2ltftcaThxe3jguU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706660590; c=relaxed/simple;
	bh=pm2N7oUeERv+06v6O2fh+acWapMpskZ4Hzz3mp7IeUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UJCgGl5IU01DHoCsFjVpJQlI9bBr1k7V3H4PxbQuPJ63AhNQD25DnejyGxJb/AhkxnpeN95WoTVkNsDf/Wx89mtdvVfk9O2gZuwALNkgnz4pxHwUVV3sieNGKbJN6FKCE3OqrVMxRniw1REcEd8db3O6ijFvpPvciONjYyaMY/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CfFMa6vL; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d7232dcb3eso24091325ad.2
        for <linux-kbuild@vger.kernel.org>; Tue, 30 Jan 2024 16:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706660587; x=1707265387; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GrKyT3L9zChc2Gz10XND7t6rBKciioSGKeVdhzxNLiA=;
        b=CfFMa6vL/eWmujkgxwM7cIU4jfFnYKjqV1Aqj0EyxQDjWwdm7eZDxC56uOZ8roPpOV
         dAAo5wCQfsFPyjJGrSojBUTaQALD3F59KoIkf21l+3kOoABAy+UoRfKSWe7Lp0s0o10C
         h9buo5F38k2LTTuxNyd86zUdevqLbgyIinfW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706660587; x=1707265387;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GrKyT3L9zChc2Gz10XND7t6rBKciioSGKeVdhzxNLiA=;
        b=lbv1kdgd79B8g2k4jVwI5xheSTYNRryUvMHeTS6NEyml1AHtLnpeTYOt2rNdaUPuV6
         dbj1F3dLAzrDCmjcSa0zPwKUbFQOZBQVX+3fuTyytfbnrhwdkIPHHtjlO3cL6yXVSNDv
         rVq4793tV6NdL+YXZn+exLK6kD6ioib1TeRqTRWxiJkHbCnQJOi0ZVGJTsprJcY1xGVj
         CA8tXrhQH3QzZdHoyXtTPvz6ifPs+rnbmyRqGc3ql+ZWjGq7SuueNAcHU2+JhrNm2720
         EsxKNUAzWSDyD/BPrztBuo/uSnlNSpOGk08mhcyXng1uR/JmkQf4whJuUIJ0nbCaIm0n
         KvEA==
X-Gm-Message-State: AOJu0Yw9CmXTc7HKbStTN/s/lxWUcwLD8V3a0dSMM7ZhMeJ7RIO7RMsQ
	4sci8VvmQ9At0UiBASa9+Z1jdCwJj0uv+Q5SthS8KapOXpOtoczSKHjSD05HMQ==
X-Google-Smtp-Source: AGHT+IHG+l5Et4v/m8kyxO10f7cveekT8Hi6ERqgkiTc1P6vnkwm/p0jd1nctHr6YsJZz/jBL5cmTA==
X-Received: by 2002:a17:902:ee4d:b0:1d8:e5a3:be8b with SMTP id 13-20020a170902ee4d00b001d8e5a3be8bmr198884plo.2.1706660587582;
        Tue, 30 Jan 2024 16:23:07 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVyewbFcC8BDzLxtInEOTkD2V8L5QpPKa5ps2SH8Wu2GVjGxso95TlHRnYqvmO+TIisyRonIJhEIjiOkMmkADJXLfpmE0uP4WZkLOgFdf7O3miSgFaL/Kq7j7JDUaSDxmEX1aoDVYgie94VoS/cohbU9sai4dgTBSw8J8uw5d7lP9nrPCWD5xnLv/b34cAAIQK1Z434NVO7bdz4BuZK442f+apFKxfqJlA3nCFUGPrhlS5Ba3p3GcpZKUVjZhG3jxq7VQgOPeKhbbSSXFRTU8a5iXvbCaZ1Ubao34gKT3hdC9yikbofsGfys6Y5FUGbrDdakJUq85nY82qE8O55O3KMb0CFjVtY8VpzT7XCKROtjGavw55pnoQ8ESVsVQevPqq+vz0PKD7mmtDYUnsac+Ey6xk5OxVV/pkVdQ1J/qdqSpHleA==
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id z2-20020a170902708200b001d89ed2d651sm7783313plk.102.2024.01.30.16.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 16:23:06 -0800 (PST)
Date: Tue, 30 Jan 2024 16:23:06 -0800
From: Kees Cook <keescook@chromium.org>
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Marco Elver <elver@google.com>, Hao Luo <haoluo@google.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	workflows@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [kees:devel/overflow/sanitizers] [overflow] 660787b56e:
 UBSAN:signed-integer-overflow_in_lib/test_memcat_p.c
Message-ID: <202401301604.7B7BD5664@keescook>
References: <202401302219.db90a6d5-oliver.sang@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202401302219.db90a6d5-oliver.sang@intel.com>

On Tue, Jan 30, 2024 at 10:52:56PM +0800, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed "UBSAN:signed-integer-overflow_in_lib/test_memcat_p.c" on:
> 
> commit: 660787b56e6e97ddc34c7882cbe1228f4040ef74 ("overflow: Reintroduce signed and unsigned overflow sanitizers")
> https://git.kernel.org/cgit/linux/kernel/git/kees/linux.git devel/overflow/sanitizers
> 
> in testcase: boot
> 
> compiler: gcc-11
> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> 
> we noticed this commit is reintroducing "signed and unsigned overflow
> sanitizers", there is below config diff between parent and this commit in our
> buildings:
> 
> --- ea804316c9db5148d2bb0c1f40f70d7a83404638/.config    2024-01-26 22:09:35.046768122 +0800
> +++ 660787b56e6e97ddc34c7882cbe1228f4040ef74/.config    2024-01-26 19:53:20.693434428 +0800
> @@ -6706,6 +6706,7 @@ CONFIG_UBSAN_BOUNDS_STRICT=y
>  CONFIG_UBSAN_SHIFT=y
>  # CONFIG_UBSAN_DIV_ZERO is not set
>  CONFIG_UBSAN_UNREACHABLE=y
> +CONFIG_UBSAN_SIGNED_WRAP=y
>  # CONFIG_UBSAN_BOOL is not set
>  # CONFIG_UBSAN_ENUM is not set
>  # CONFIG_UBSAN_ALIGNMENT is not set

Hi! Thanks for the testing!

The added Kconfig is:

+config UBSAN_SIGNED_WRAP
+       bool "Perform checking for signed arithmetic wrap-around"
+       default UBSAN
+       depends on !COMPILE_TEST
+       depends on $(cc-option,-fsanitize=signed-integer-overflow)

So it looks like since your build already had CONFIG_UBSAN=y the signed
sanitizer got enabled too since it doesn't set CONFIG_COMPILE_TEST.

> while testing, we observed below different (and same part) between parent and
> this commit:
> 
> ea804316c9db5148 660787b56e6e97ddc34c7882cbe
> ---------------- ---------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>           6:6            0%           6:6     dmesg.UBSAN:shift-out-of-bounds_in_arch/x86/kernel/cpu/intel.c
>           6:6            0%           6:6     dmesg.UBSAN:shift-out-of-bounds_in_arch/x86/kernel/cpu/topology.c
>           6:6            0%           6:6     dmesg.UBSAN:shift-out-of-bounds_in_fs/namespace.c
>           6:6            0%           6:6     dmesg.UBSAN:shift-out-of-bounds_in_fs/read_write.c
>           6:6            0%           6:6     dmesg.UBSAN:shift-out-of-bounds_in_include/linux/rhashtable.h
>           6:6            0%           6:6     dmesg.UBSAN:shift-out-of-bounds_in_include/net/tcp.h

Are these shift-out-of-bounds warnings new?

>            :6          100%           6:6     dmesg.UBSAN:signed-integer-overflow_in_lib/test_memcat_p.c

This is new for sure, catching an issue you show below...

> this looks like the commit uncovered issue. but since it's hard for us to back
> port this commit to each commit while bisecting, we cannot capture the real
> first bad commit. not sure if this report could help somebody to investigate
> the real issue?

Yeah, I think there is an unexpected wrap-around in test_memcat_p.c:

> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202401302219.db90a6d5-oliver.sang@intel.com
> 
> 
> [   42.894536][    T1] ------------[ cut here ]------------
> [   42.895474][    T1] UBSAN: signed-integer-overflow in lib/test_memcat_p.c:47:10
> [   42.897128][    T1] 6570 * 725861 cannot be represented in type 'int'

I'm surprised to see the sanitizer catching anything here since the
kernel is built with -fno-strict-overflow, but regardless, I'll send a
patch...

-Kees

-- 
Kees Cook

