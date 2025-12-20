Return-Path: <linux-kbuild+bounces-10296-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D001CD2CD1
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 Dec 2025 11:02:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5507D3011B39
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 Dec 2025 10:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ED5F3043DC;
	Sat, 20 Dec 2025 10:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="em41QCIU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68F5299924
	for <linux-kbuild@vger.kernel.org>; Sat, 20 Dec 2025 10:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766224928; cv=none; b=JRTBBfBjOxpeZZnwbBDo+TZSRNccNqosz4jsOxHq/p9cDFDycPb+MoHzY45PP0wqGlZLz2UeF9SGvBpyOOYwJ0/LGcwI+PU9+aFaKRvfDtgYitIJ4B+9UCc8vHG0FZcumN/lEyzh/eQzc2JimkV2p5EO5QwiuVog+1W9pyXDgvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766224928; c=relaxed/simple;
	bh=bxFgAEY81SjNvUJ+kxxs2m1wYC/4BSvGlgWSuaRMhJw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fw1sdPa3NQEgWuRGJaBvQZpsK6dbTmTrGUq2jOKN9X+K3fM7yYYgDvftfZRUwNDLeYaSCRC0a/15PyNAhjwS8I6wzHgY9F1m/woly2PwSrzepojPQweZwmXg5nqw8Vu6NAQxlDnpM72OFYFB+xFzBUbGXgalmBS28yDNnWftJkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=em41QCIU; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4775895d69cso10418845e9.0
        for <linux-kbuild@vger.kernel.org>; Sat, 20 Dec 2025 02:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766224924; x=1766829724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6b6TgfZ4l4yfYsx0rUlhXwOOOgK1ZGgIr0RlxGtU3To=;
        b=em41QCIUfIpTaePp09bYqEG9fP0XivMmMT6qoKVHG8dQQ5lz21fOYZsasKdptPCM5S
         C0jbJFdWopKnJLWEt0Xz4910XxoiVB7j/Umhjo5OsvhOU6pKrqwKIL4cc6eGAlTflWd2
         0DRk13PDiDaGMLe/ZXkfR9FKmt2i5HRG+1/CRPqGUAJvsARDmg789ogFSMD8ts8XZ5Vf
         rVkguRxaKEB/ktO+1kZqll9fYw3sN7ZBU8Ibt957O1pQgp+nsBjP+RM3cuIxApD2eXle
         OcW8T6SYggyCZ2hJwQ4YDsgUygxCv7vm+SOiL0LYpqiG/SAD+Lx2qvJCxL10Hqxmkj8I
         h0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766224924; x=1766829724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6b6TgfZ4l4yfYsx0rUlhXwOOOgK1ZGgIr0RlxGtU3To=;
        b=qEU+dApWiBgzx5uu2KFvaQ84/gK0FUP5ZG/qrT21E1JzVniEz2HWsSeT/NE61qM1L1
         TBF2T8OQD+3uTVUdjXoVvYCTGij4UDfoFi3gVcBbN3RpWvb2+e4cAgWLqhUoGjGYZ+QC
         aEjkQGa5ttsJoXSl0ltU1KrjJ+fTU6NIINz1yq6QB7IPZhi2IMTDowRYVJJLqpqRspzR
         jrHBEkedYck4fo6oI9RppJ81C5Ptdb6YF23L5OJpTReJm+0mNqdz2wT1r2T4I6SNWkSa
         gy6tDv1wmaa3Q4AFk3mzgc6ZvGr8UEd+gJoAla8mxEvkwUsLo7JfdNSQT6dwTO/zea+j
         m5Hw==
X-Forwarded-Encrypted: i=1; AJvYcCXcoXyCyVcgzaCA0sUXU9j41SuqVSSKR5oq0uJ2WCSp1feqCQeZilx9NRMiQ/hUdxanSbFaHFJqpFJLtKU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzavz0A0upedw7acYejxaKrmEctUwycoYTA2uKqrxBT0IEyTKwq
	/dmhgco2xCQjOMIGN2p+zbnLBqpoo2h6dQu94RJocJijLCLxxe7rDF1z
X-Gm-Gg: AY/fxX5c+WIFH2Ib0x4KmlhsPRsDpCofYgwQpynR/NfliwlILxPx7h+XNEk8zCffcFj
	Hxmvk412SXmbQ/0lUq5YjLB00Hac/I87u+Hl0RCT7MD1jj90EmI95JpMrl/Xz4gOdaI2BrNU/6S
	RuNTGb6XcVJqO7u/gNYtPt+f3sCu3OakoJyBuxCcowQ0GWdKllpoDpdr6yjprUVxYqBa9sJFTkZ
	u3O4bII2pcS2PI6PWqkMy9PkSC84+StuKFCO73tSSNdYGgh4oXnnxJvKI6YHJUJK/xVJgThZoPl
	jpS654oyYyXx7DKXcAdvskZAy1iiu2Fb3z4v1+njzA6f3ShBRAQHkG5oRaN0kv2mCYaeBYw6fAX
	W25piLeldYSGX7QNyptUpJCONbJLB7/69XgQcpUPEPTSYw0vUXQjvihoiZ4pLjiHHx6+3WauG5+
	N3JFjF1DiShBdeJpw5cbEfYXM49L1IqI9KKHLhGOx2Ma17L6EnMs+k
X-Google-Smtp-Source: AGHT+IHQOJ0Ua+zWZlb0QPcZUUI/HtzVKK9z+yFIQMbNJiEgWc0RnGqXX7qQpeO5IWGkqcyJJpZw3A==
X-Received: by 2002:a05:600c:1d1d:b0:471:d2f:7987 with SMTP id 5b1f17b1804b1-47d1958f9c5mr48722805e9.26.1766224923818;
        Sat, 20 Dec 2025 02:02:03 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eab257asm9840402f8f.38.2025.12.20.02.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 02:02:03 -0800 (PST)
Date: Sat, 20 Dec 2025 10:02:01 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Vincent Mailhol <mailhol@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Chris Mason
 <clm@fb.com>, David Sterba <dsterba@suse.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, linux-kbuild@vger.kernel.org,
 linux-sparse@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-btrfs@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 4/4] minmax: remove useless cast in __is_nonneg()
Message-ID: <20251220100201.26d9b0db@pumpkin>
In-Reply-To: <20251219-remove_wtype-limits-v2-4-2e92b3f566c5@kernel.org>
References: <20251219-remove_wtype-limits-v2-0-2e92b3f566c5@kernel.org>
	<20251219-remove_wtype-limits-v2-4-2e92b3f566c5@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 19 Dec 2025 23:39:48 +0100
Vincent Mailhol <mailhol@kernel.org> wrote:

> The function like macro __is_nonneg() casts its argument to (long long)
> in an attempt to silence -Wtype-limits warnings on unsigned values.

nak.

The cast is needed for pointer types, not for -Wtype-limits.
which is why the '#if __SIZEOF_POINTER__ == __SIZEOF_LONG_LONG__'
test is there.

	David

> 
> But this workaround is incomplete as proven here:
> 
>   $ cat foo.c
>   #include <linux/minmax.h>
> 
>   int foo(unsigned int a)
>   {
>   	return __is_nonneg(a);
>   }
>   $ make CFLAGS_KERNEL="-Wtype-limits" foo.o
>     CALL    scripts/checksyscalls.sh
>     DESCEND objtool
>     INSTALL libsubcmd_headers
>     CC      foo.o
>   foo.c: In function 'foo':
>   ./include/linux/minmax.h:68:57: warning: comparison is always true due to limited range of data type [-Wtype-limits]
>      68 | #define __is_nonneg(ux) statically_true((long long)(ux) >= 0)
>         |                                                         ^~
>   ./include/linux/compiler.h:350:50: note: in definition of macro 'statically_true'
>     350 | #define statically_true(x) (__builtin_constant_p(x) && (x))
>         |                                                  ^
>   foo.c:5:16: note: in expansion of macro '__is_nonneg'
>       5 |         return __is_nonneg(a);
>         |                ^~~~~~~~~~~
>   ./include/linux/minmax.h:68:57: warning: comparison is always true due to limited range of data type [-Wtype-limits]
>      68 | #define __is_nonneg(ux) statically_true((long long)(ux) >= 0)
>         |                                                         ^~
>   ./include/linux/compiler.h:350:57: note: in definition of macro 'statically_true'
>     350 | #define statically_true(x) (__builtin_constant_p(x) && (x))
>         |                                                         ^
>   foo.c:5:16: note: in expansion of macro '__is_nonneg'
>       5 |         return __is_nonneg(a);
>         |                ^~~~~~~~~~~
> 
> And because -Wtype-limits is now globally disabled, such a workaround
> now becomes useless. Remove the __is_nonneg()'s cast and its related
> comment.
> 
> Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
> ---
> Changelog:
> 
>   v1 -> v2: new patch
> ---
>  include/linux/minmax.h | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/include/linux/minmax.h b/include/linux/minmax.h
> index a0158db54a04..3e2e3e539ba1 100644
> --- a/include/linux/minmax.h
> +++ b/include/linux/minmax.h
> @@ -52,9 +52,6 @@
>  /*
>   * Check whether a signed value is always non-negative.
>   *
> - * A cast is needed to avoid any warnings from values that aren't signed
> - * integer types (in which case the result doesn't matter).
> - *
>   * On 64-bit any integer or pointer type can safely be cast to 'long long'.
>   * But on 32-bit we need to avoid warnings about casting pointers to integers
>   * of different sizes without truncating 64-bit values so 'long' or 'long long'
> @@ -65,7 +62,7 @@
>   * but they are handled by the !is_signed_type() case).
>   */
>  #if __SIZEOF_POINTER__ == __SIZEOF_LONG_LONG__
> -#define __is_nonneg(ux) statically_true((long long)(ux) >= 0)
> +#define __is_nonneg(ux) statically_true((ux) >= 0)
>  #else
>  #define __is_nonneg(ux) statically_true( \
>  	(typeof(__builtin_choose_expr(sizeof(ux) > 4, 1LL, 1L)))(ux) >= 0)
> 


