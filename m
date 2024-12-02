Return-Path: <linux-kbuild+bounces-4945-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F1F9E0D05
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Dec 2024 21:33:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 811BA1628AE
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Dec 2024 20:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55A791DE8A7;
	Mon,  2 Dec 2024 20:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WcCNsyYD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798E21DED67;
	Mon,  2 Dec 2024 20:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733171595; cv=none; b=SQ0KEf08stuTHb+EU4jDjLhzIpL6vMOY7HQ2mCUvA6ZUdR234Nn7aE9lKhpOmLngma8rvWHS2Nt69i41uxXXPh/NzQb7lakH5xi/eKTVx49MPcP27vrYd3e9E8pf3V+vy6aeMS+FfACP1t7NeftfrTNtGQqy3eMk3/1yyn/NYrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733171595; c=relaxed/simple;
	bh=5hTytA/323orTHPBckXWro3utEuKP7/p06If5sUJ5wY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HqOcjRudLTj0L5oyT7E6JuFZkU+pJ/Y9u1ODdpbiKz0dBNgIrg1iKVzQ7J/kNXObkTnCXWi4b7PcQNFxcqLAmDuzRAxNQN74DCNcUMCk6lKyWvR1h/7hOH3LK1bK6BS8HQF8i/k7J56Zu201i7c7ko9f7Ko8mheNG4uuzsean90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WcCNsyYD; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-215348d1977so37153475ad.3;
        Mon, 02 Dec 2024 12:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733171593; x=1733776393; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JvIrUVZ26c/hkCNcIW5Ac8d45yn03JhhJVVGGlpUW/w=;
        b=WcCNsyYDj9Vs4sPfGcnsSvgeCjVRvHB488U/yovAzW0TKYsv8kJrZ55MwjteyZ/d+L
         A5kf1cssMx/Rln/6uHFQoXso4WcR+YwdLK4zM9FcPEPGJXYNo/EWWO4IkN8G/1FsgEqr
         +DZNFEHdiRomKcfkxSk/Wwkz9PWJBm4CjiVxnx/KCV1DVyty3Dexy6aY1Ngs/ThGVayq
         ncNh3qlQ6j+b/Aksj+dsQvti72fD+55c1oPrO45MpSABVpPqdDS0CIjOpqwtURuqCXkT
         f11nPnVpBRBuJ3NkAfYv7MA7CpOdrj74BFWy5nqMfgfcfOhmv9iQBCVHVL9gy5HISOkg
         TvNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733171593; x=1733776393;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JvIrUVZ26c/hkCNcIW5Ac8d45yn03JhhJVVGGlpUW/w=;
        b=UEY4VlZHSLpUiKFpyyaMDVb3ABOymU4E7qX8m34B5R7oSx6nJ+ALLjbOdhDEHkcd1f
         Q182+kDCTfu5Tkd1tW+hwyZXFxdn4pt1dtfLbY1K5ASv/pO7CRBG3cq27YGW/cmnACVV
         K0/k7L7eNL1QxpBwissBrGGetjVaDa5RRPSNwEWo2w42qzTo512+kvB6E/o2zEVYExpl
         KYEG69UZ9A7H+6p5Id/8wq11hA8McNirZaC/3VAMKnTlvAWxgGx1eJojMX8Ur4JS49IH
         RIc96it58Ke2/uQvvCH/4h0FbFoXY5Y1Zsb/x0ZoZF86IDikXIYJZwDuqDuOE4+TYmU+
         HVAA==
X-Forwarded-Encrypted: i=1; AJvYcCUqj0txbm1Lq9R/Cbaqs/UiXdmJNWGESt9dQssy7MRlGcLjK/bORJhkSoH4ozxDqZqkxq1Big/YKdQnPpI=@vger.kernel.org, AJvYcCWRJT2/PnfAT6kvq1vNk9BDpj9j2f3ZgnUTgfRU+w+39MTfVjO5Pno10usdCwgv904taaaiiGYXBICIbt/L@vger.kernel.org, AJvYcCXXWQq6MmWbHc+smMYwBubXIMwmRjjBcA9AgacQG/t7inTTQDcv/uYeq6PqrC1ifPZs//9MJg2jUEBFl9znP58=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHwCyRd6QjyqpC5HHD6nTMKd1RTBWtEoxPqRggaDL/pB8ZoCEC
	bWn6EMrEMw5/6cHog8W1NZr0f62m9eUABQyqx6lyB0Sd7fs90OH4
X-Gm-Gg: ASbGncty0HIIvw18qv0dJfU2HK7mY2cRQ4/s+v62AFdNsSnIckuVwScy6lgfcr93dJW
	udEpAgUtdqP6b63K+0PxKyHYv88Fqr6mQcZh63KnG9a+kssPtyjkwupEq4wNAgRc1PRLrtOd3YS
	zYFAcQtiOEYObrYlvQ0XyPtUS3NVGJvnRrh1861YPmR5/CFwURYM3jAmYMp9Y2Laaz+JoREIS5f
	5kP0hxTvpo4eKKCAAmUBjvZbGZlrqyGpPCL+F3GtwFB39U7nRQDQLtNFr94OOs=
X-Google-Smtp-Source: AGHT+IH8dNd1XAqIFQbJi+JtUGTNnehRKYTwkqN0kLONDL4Bl28lQMIPvBJQYHM3PhL4mvPCaRWpgA==
X-Received: by 2002:a17:902:f549:b0:215:5d4a:fdfe with SMTP id d9443c01a7336-2155d4affefmr147512115ad.20.1733171592583;
        Mon, 02 Dec 2024 12:33:12 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2152191dcc9sm81565565ad.112.2024.12.02.12.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 12:33:11 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 2 Dec 2024 12:33:10 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>, linux-openrisc@vger.kernel.org,
	linux-kbuild@vger.kernel.org, Rong Xu <xur@google.com>,
	Han Shen <shenhan@google.com>, Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] openrisc: place exception table at the head of vmlinux
Message-ID: <07dcb646-d806-4767-b29d-77092f6819e4@roeck-us.net>
References: <20241202062909.2194341-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202062909.2194341-1-masahiroy@kernel.org>

On Mon, Dec 02, 2024 at 03:28:22PM +0900, Masahiro Yamada wrote:
> Since commit 0043ecea2399 ("vmlinux.lds.h: Adjust symbol ordering in
> text output section"), the exception table in arch/openrisc/kernel/head.S
> is no longer positioned at the very beginning of the kernel image, which
> causes a boot failure.
> 
> Currently, the exception table resides in the regular .text section.
> Previously, it was placed at the head by relying on the linker receiving
> arch/openrisc/kernel/head.o as the first object. However, this behavior
> has changed because sections like .text.{asan,unknown,unlikely,hot} now
> precede the regular .text section.
> 
> The .head.text section is intended for entry points requiring special
> placement. However, in OpenRISC, this section has been misused: instead
> of the entry points, it contains boot code meant to be discarded after
> booting. This feature is typically handled by the .init.text section.
> 
> This commit addresses the issue by replacing the current __HEAD marker
> with __INIT and re-annotating the entry points with __HEAD. Additionally,
> it adds __REF to entry.S to suppress the following modpost warning:
> 
>   WARNING: modpost: vmlinux: section mismatch in reference: _tng_kernel_start+0x70 (section: .text) -> _start (section: .init.text)
> 
> Fixes: 0043ecea2399 ("vmlinux.lds.h: Adjust symbol ordering in text output section")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Closes: https://lore.kernel.org/all/5e032233-5b65-4ad5-ac50-d2eb6c00171c@roeck-us.net/#t
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Tested-by: Guenter Roeck <linux@roeck-us.net>

Guenter

