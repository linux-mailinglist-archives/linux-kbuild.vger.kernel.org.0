Return-Path: <linux-kbuild+bounces-9050-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CD3BC53B4
	for <lists+linux-kbuild@lfdr.de>; Wed, 08 Oct 2025 15:35:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C59073A626E
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Oct 2025 13:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A39782857F8;
	Wed,  8 Oct 2025 13:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dywjDn0h"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778422853ED
	for <linux-kbuild@vger.kernel.org>; Wed,  8 Oct 2025 13:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759930535; cv=none; b=e8vaoB+4IoYphHEO41jIhGbFa472c+98BhkXWlfeCjcfS69nu2YH01rhT8pegW8cqEK8vhIdr8gwDgK2CNL1CgBe4EEl/jOQxbiwwUwXtQ6Yrwh5aB0vLNDs4VTUe4rbE+PJ3bbixLyhWYoxMPznVLh6j+O3VG6UiDeHOhNY98U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759930535; c=relaxed/simple;
	bh=7vGH8N/m6PE6lnr/uLWOIY85RQ6MjHgDYrjIeFb+YNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u9rM5RB6p4INQXYgJ/Vu0LyBCK9uo2c+xUXrZ+ChPMo34NH8cnVFylChzUrjErz/ao0X6/KM/KaxKN6/OLFtd00mOHjD0cC/s0WiHMY4dVhg3D5XddDWgbubSw1c/d0aEKz2suM4VGGM3KBUbbF4jN/z27X5XXwJHab7nU0BOI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dywjDn0h; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-46e2e363118so67808135e9.0
        for <linux-kbuild@vger.kernel.org>; Wed, 08 Oct 2025 06:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759930532; x=1760535332; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hDHlNMCgPWfKcx9mEMfAa7rnZ2ePjEXMkf1KPca5jNs=;
        b=dywjDn0hZVcYnCqsGOJwB9zIwhAuPBx6/MnaRssTC2JfxFetIhJNqVQHO9Glfw/Mzl
         jdCKVnXimtkCw+nFxD3dFnOx4hTdnFv3SbJ5xkAh87EiDw6ziOab7IrwKFiDG1dvfCNd
         zBYEFhKO89Acm6ztRue/IbFMpeXzKHV5zH5R+BhNi/y0az0Q0aLDXYMhdJKVuVLQsclY
         yZcjxPi+91EiGK8WBuDigRSxaFesJlkjC1nKNfND+ejLHMimqJvAFU/kRvEiRA7THLqA
         odnmDDe3Drz2vcYt5g/ZyOvD3MWFevAngP95s6KBpFuSxrjXluGXf9FpghAzLon+0V8D
         T86A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759930532; x=1760535332;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hDHlNMCgPWfKcx9mEMfAa7rnZ2ePjEXMkf1KPca5jNs=;
        b=J59hCiWWuhGu9GvJcoYM0RuebJjV3yavE1ra9NmPPsX49v5jnnpb0usPCK4WqFzPJb
         T6cipG+RaifJPVE04IE0wyb9H/nIsRmcw+wo7hSgYwcDAmW6cC6HBKcPL+pi5v+KqYoC
         +C5sWtcg8GhOa38jUfqdkB91eddTSYkoOKBiYgaheBurQLs75QMP2KdIIM0r9P1YqRMm
         xMu5FYUeoVHB+cBfbK3sLq6ublVXZu0NSnI8TTq2R6YbE1/WchQ6EivIAKvpjDNRc2BI
         2odg5VI/S+UpVfacJR37Au+63+KCgiUCvGwUjjpNvXlS6jPilOPRoeJY2MuDaf2Er0cN
         kKag==
X-Forwarded-Encrypted: i=1; AJvYcCVbvuJSyZvkIEAuG5P2ajB6NKnWJhcZsbXrwzXnIi2G2ulmwzzBtyP61skAFNBl98I0HjK28rk+19FXfmE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfe+DaTI1mygaIw79O5EbbNke8h9NnIxU7ozHj5i+afct6ez5r
	o2AKZdrvXf4EJYvmPuGUpIRkwwdqVtosq79tKAUfprY0bDnihMcNHzC3ilB+MFiRtcA=
X-Gm-Gg: ASbGnct2TurzfKo+Iae8sMSC6Wzss9C/J0OYz+vknNPHA7KgDIjsQADYT/oARWayLnB
	+VY4lqkzXNkCvwjLrrcpidgYyoLbjCAZ9RtUB5oCa3o4F4T/Ytb9lBmbQco0QpS1KPfL6t4seI4
	5xTLB8IUVsjE9zkh7p8H6y8B4h5y51GJ9eohc6aO9SUfFr7eUHBy3C1jZutGPqAw8w3GHlsmFlv
	E6AStRMsLaQXzzGa/4Babq3Lx/VVzlZWTB0QHF+4IQxVyyuHQTdFTlTyZdAnJFsV9/sg4dspu9L
	gaWEHvnRLMc3cgmR9WGibhbVpCk48oZpSFV5PCV4XDfiXbQ0itcznLOQ9TVQSwZb+oPH+/dMaCO
	n4wdGdK+nv1LA/5BXgKVW0lxZCO7FvojVXbSqfiy4KTXICc7jQrlGDxfL2OBWsggm
X-Google-Smtp-Source: AGHT+IEXN1OK+uUWcZYHcu8mGQCE4xlOe4D5UqEffJSE6zNfCHiuL17ImKFC3KKJ16P8hPWOZxwfnw==
X-Received: by 2002:a05:600c:4f92:b0:458:c094:8ba5 with SMTP id 5b1f17b1804b1-46fa9a96588mr24061795e9.12.1759930531814;
        Wed, 08 Oct 2025 06:35:31 -0700 (PDT)
Received: from [10.0.1.22] (109-81-1-107.rct.o2.cz. [109.81.1.107])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8e9762sm30365608f8f.38.2025.10.08.06.35.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 06:35:31 -0700 (PDT)
Message-ID: <6e057525-ca8d-4f96-bb52-cca6cafbe835@suse.com>
Date: Wed, 8 Oct 2025 15:35:30 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] modpost: add symbol import protection flag to
 kflagstab
To: Siddharth Nayyar <sidnayyar@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Sami Tolvanen
 <samitolvanen@google.com>, Nicolas Schier <nicolas.schier@linux.dev>,
 Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250829105418.3053274-1-sidnayyar@google.com>
 <20250829105418.3053274-10-sidnayyar@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20250829105418.3053274-10-sidnayyar@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/29/25 12:54 PM, Siddharth Nayyar wrote:
> When the unused exports whitelist is provided, the symbol protection bit
> is set for symbols not present in the unused exports whitelist.
> 
> The flag will be used in the following commit to prevent unsigned
> modules from the using symbols other than those explicitly declared by
> the such modules ahead of time.
> 
> Signed-off-by: Siddharth Nayyar <sidnayyar@google.com>
> ---
> [...]
> diff --git a/include/linux/module_symbol.h b/include/linux/module_symbol.h
> index 574609aced99..96fe3f4d7424 100644
> --- a/include/linux/module_symbol.h
> +++ b/include/linux/module_symbol.h
> @@ -3,8 +3,9 @@
>  #define _LINUX_MODULE_SYMBOL_H
>  
>  /* Kernel symbol flags bitset. */
> -enum ksym_flags {
> +enum symbol_flags {
>  	KSYM_FLAG_GPL_ONLY	= 1 << 0,
> +	KSYM_FLAG_PROTECTED	= 1 << 1,
>  };
>  

Nit: The ksym_flags enum is added in patch #1. If you prefer a different
name, you can change it in that patch.

-- 
Thanks,
Petr

