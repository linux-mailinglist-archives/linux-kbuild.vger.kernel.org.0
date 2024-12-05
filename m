Return-Path: <linux-kbuild+bounces-5013-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8BF9E5E95
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Dec 2024 20:05:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3DBD28206B
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Dec 2024 19:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89E3D1990A2;
	Thu,  5 Dec 2024 19:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DZ6Pw/DS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E1C2EB1F;
	Thu,  5 Dec 2024 19:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733425550; cv=none; b=B8ZapHtKBhtUZ/cRuGILKBbUqdgrdxedTt+bmkoDA694M8SRYG99qUCqtd5ZGUt6YJgUP+hvmkfZC0SKI0SIKTbEtM/dt+AdMk1X7xz82xUk16x+1PV3zyXx/n3OBaLRSIzb8Bidl1oBAaofTuiLASzUtlGFWAO5GRRSCTqgH9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733425550; c=relaxed/simple;
	bh=fbjFRbT812S2i1TIZtn2iX4j7BIjiLB+D/7f6MXQU3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sWu1tMtiaduLcIg2H6w+pQq8QVZnDUHiRy+5fZirJU2Q/06rt6Wm7v/OwThcJhEv3sIY9LJjKGd/kL3FzD3X44RFHbLUdfJNQB2eT7+Qn/aIsb/Cf33Z8bMDpF2hCQQA2OVGCqooSzXkgwAmeBxZHmEQuPEepel82qu6S46zCvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DZ6Pw/DS; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-434a044dce2so14988515e9.2;
        Thu, 05 Dec 2024 11:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733425547; x=1734030347; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5dDApur/Rj0EwjQM+0WphnoTkxIDXSHSGeMDAISBHXY=;
        b=DZ6Pw/DShnacoA2Mr39A2aJHQ9E81zf0z0FWpHBcXsJ1v93ncPjhY73EpWtchJBdjM
         UeEjRr7VVxPEBGTOcE6AHVrhaKZRF4S1dm3wTtz/tBFb8KrzaAqnVz30omKJlcD446lw
         MhzhisxQGl8vfyK1j8bjLZlQBX6Md28H007zZdwdt8Tg5qJfBh6EfRl5zDUKakMPVYLW
         GOycilV0UetQKBycmnPMHP0IwrFC6BLbWBTynbg7QJHbGbKKX4m9gtHdonlnc/tQyDB2
         /U8tx3O26uUayZoHKC7rJtrhyWjYHwaj9ccpFCON4R/egKBi6SNdovSy/IdhbYq4jfmf
         fB6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733425547; x=1734030347;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5dDApur/Rj0EwjQM+0WphnoTkxIDXSHSGeMDAISBHXY=;
        b=B/T2eZiTavHLq3y2Am68+/Rv2OFBekG8S/QPnoi6wdFtwt5BME8tAeTyQYjZTRIDRR
         u4vB5qeXV03CKyI0y8DpGCtflakxKBoyEY3ioK5oQ6+c+HW0zHOwnXKqbGNIZGFlyaV0
         KC79JnGaZwOdT9y/jx59WFIB7U1/CW7ddnjWb7e8/BRcz6qOVqTbs00xNtwCmvGOfsaU
         pVt5DUDwBt7imXn3zf1CSdb24L243q+CJYxtdgJd5ePqG9gjAej7kp4I+Ec/3bu9/UNa
         VYEuLh1mREectj5FT5Ae+TLMOBq0caUKxheRfTYI+qP0hhfTmJJB/lBblj5aideG16nX
         +OlA==
X-Forwarded-Encrypted: i=1; AJvYcCUQ2DeutzI2jKbiPAJpTx3+D3QOoEC1iO3dbzM6PPxXZWog0BmvXl1+z6Ovjrv2kvZyGy8zpwsM3L7iyR7l@vger.kernel.org, AJvYcCUr57biQv4vbkAXGWFPdWgTzw4S8pdkoJoUfkmnsB5U6H5acDYUE9uAMToTa1muGE1T7eoTxUNymhi2w8dmdRU=@vger.kernel.org, AJvYcCVHk6Ul4J64RWsB0ShLl8pE+4rjXWLVBUfPlubNqQAYLgHhaBUDB6TN/s2rJZhxvLQ+cccao6HgeNZ0g4Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7aEWWvw891AdXVKCmWzfIiUudZsYsq+AoqaXAWQcooL0OflQx
	M52o4YYQnasr6u9vEIwCEa8D3cr0+DrN8DqSNmN8C0lQL20DCSaEE2N8kpRz
X-Gm-Gg: ASbGnctDswxMgOZIeahziMnXLLaKF/bL2q37LAsgKDjsK3k7Y22IlwkIJJCwfWyk8MP
	mmBtit4qjtwuCuCJo91hM02hR7ZNQMG9xNJN1TmrWy5K3bHvfH9CoPpFpTSrlvcpaOxoWPwh/Qf
	yToIppV+nngQTUEL1DV3vphSF0zJLzH55tzm/wcyAVeCO/VRo5E5386ptRz8KbGE9xw8ENLxubb
	wZUD5wBjsgjRlC8LWnbRcQWM8n8WMECNeU/Ikd8ClnolwSJ9hge2jTGSKwIkzYpdTotW5e4j9JP
	+ssWt7lvboNbQA==
X-Google-Smtp-Source: AGHT+IF/uMyK+AWVINA2rb19bG20bBWUHi4bTRxZiJkaWIaVaVtLZ3V2qnVe6CwVkwjVfYAgs2RBWg==
X-Received: by 2002:a05:600c:4f51:b0:434:a923:9321 with SMTP id 5b1f17b1804b1-434ddead515mr4582165e9.5.1733425546814;
        Thu, 05 Dec 2024 11:05:46 -0800 (PST)
Received: from localhost (cpc1-brnt4-2-0-cust862.4-2.cable.virginm.net. [86.9.131.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d52c0cfdsm72030475e9.33.2024.12.05.11.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 11:05:45 -0800 (PST)
Date: Thu, 5 Dec 2024 19:05:45 +0000
From: Stafford Horne <shorne@gmail.com>
To: Rong Xu <xur@google.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	linux-openrisc@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Han Shen <shenhan@google.com>, Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] openrisc: place exception table at the head of vmlinux
Message-ID: <Z1H5iZNh7N4Gf7_X@antec>
References: <20241202062909.2194341-1-masahiroy@kernel.org>
 <07dcb646-d806-4767-b29d-77092f6819e4@roeck-us.net>
 <CAF1bQ=R_VUDR9rGAWhjPa4jHuauftLg=A9Mp=thJaK8PdjM0Wg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF1bQ=R_VUDR9rGAWhjPa4jHuauftLg=A9Mp=thJaK8PdjM0Wg@mail.gmail.com>

Hello,

This looks ok to me too. I also confirmed that the symbols that end up in the
.init.text of head.o are correct.

I will queue this to go in the next rc.

-Stafford

On Mon, Dec 02, 2024 at 12:59:27PM -0800, Rong Xu wrote:
> This looks good to me.
> 
> Reviewed-by: Rong Xu <xur@google.com>
> 
> -Rong
> 
> On Mon, Dec 2, 2024 at 12:33 PM Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > On Mon, Dec 02, 2024 at 03:28:22PM +0900, Masahiro Yamada wrote:
> > > Since commit 0043ecea2399 ("vmlinux.lds.h: Adjust symbol ordering in
> > > text output section"), the exception table in arch/openrisc/kernel/head.S
> > > is no longer positioned at the very beginning of the kernel image, which
> > > causes a boot failure.
> > >
> > > Currently, the exception table resides in the regular .text section.
> > > Previously, it was placed at the head by relying on the linker receiving
> > > arch/openrisc/kernel/head.o as the first object. However, this behavior
> > > has changed because sections like .text.{asan,unknown,unlikely,hot} now
> > > precede the regular .text section.
> > >
> > > The .head.text section is intended for entry points requiring special
> > > placement. However, in OpenRISC, this section has been misused: instead
> > > of the entry points, it contains boot code meant to be discarded after
> > > booting. This feature is typically handled by the .init.text section.
> > >
> > > This commit addresses the issue by replacing the current __HEAD marker
> > > with __INIT and re-annotating the entry points with __HEAD. Additionally,
> > > it adds __REF to entry.S to suppress the following modpost warning:
> > >
> > >   WARNING: modpost: vmlinux: section mismatch in reference: _tng_kernel_start+0x70 (section: .text) -> _start (section: .init.text)
> > >
> > > Fixes: 0043ecea2399 ("vmlinux.lds.h: Adjust symbol ordering in text output section")
> > > Reported-by: Guenter Roeck <linux@roeck-us.net>
> > > Closes: https://lore.kernel.org/all/5e032233-5b65-4ad5-ac50-d2eb6c00171c@roeck-us.net/#t
> > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> >
> > Tested-by: Guenter Roeck <linux@roeck-us.net>
> >
> > Guenter

