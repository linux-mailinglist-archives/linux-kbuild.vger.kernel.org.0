Return-Path: <linux-kbuild+bounces-5268-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8029FE6C5
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Dec 2024 15:02:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C70C1881F3E
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Dec 2024 14:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3F691A9B27;
	Mon, 30 Dec 2024 14:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="S08Jzw/X"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8C44F218
	for <linux-kbuild@vger.kernel.org>; Mon, 30 Dec 2024 14:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735567352; cv=none; b=sVzyVBDTukdcDUMnbnFwbNNmdyPY5ff2AQylU/YjzOqd/yJF3EbZswQ5H45WkX1E/X6uTosjouS2Nu0Hk57zp8VSzkD7gK//tXkU0RsGhdhs1E2+AkGSkrpAObSuaFnoNgAu2jIT/mWKHBhJvqjjELe/49UGpfuG2PFzVSb29Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735567352; c=relaxed/simple;
	bh=HquHmcZ+IK1gFRwkTRVt471/y2J4BoWJ3Pf6uqRKv28=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DC8NWfwY3fElDxd70Kz72567fuMM48JgOV2DJvK+1Dcg/WekBbaS9afKeSIxMNoZ57n3eSS/daTghJo/8Gmegn8hs3gWng1Fb9fxaMGI870c9RPvBFXmlaJ/vdm2ONlh8Swb+B2+YFnj1fH7XOu7VY7dn5t8qg0++xwNWM2++3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=S08Jzw/X; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43634b570c1so66261065e9.0
        for <linux-kbuild@vger.kernel.org>; Mon, 30 Dec 2024 06:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1735567348; x=1736172148; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ghxaxa8kqE7ZwKhklMmmPiZe5prcODEZKOXRrOwpZlo=;
        b=S08Jzw/X0dNyJ3olsp7A2FQoayGZ9j1nwj+RRMJsdKb1ErmM01khyM5/tC2uvPg/vc
         K8xUekH94JA1jT5nEuoqINRQy97afjk35HlGFhgfX4UsHdWbaTam7Iy/klh633FKUQ16
         dbrBCAnmDIA+IOEkQg7qQR5BJQZFK1cHQEou/QsROxrX+Mp/2RQfq4r18zZlxFN9kqkt
         KcO/43tRVyMtp+DyM2zoE8tION3xOIjPoV7NI7hkSsjPhKRS8xv+aw6rbiLrUWl54j3C
         xr/Scqpb+t8Cyahj1t+YFvtY1a7kHVauSWYBZuQgA0eN2fF42stKe8xlYCT+lg0o4Fpj
         EjNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735567348; x=1736172148;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ghxaxa8kqE7ZwKhklMmmPiZe5prcODEZKOXRrOwpZlo=;
        b=JDvppnJH7Jl4sCXq6oKlZrCqOxRCurTgKufnom1i9m09iYe0tMkddGvYGj0HR/iAzj
         hlsN8YeHMWDv4nzg/I5kIfGzzbMtGbc7Dc9WlHlv5f4wHdcKrJTTChQxTAVFvE5ldAru
         WcGt/SGgc1DVW68S/TRbFhDrAkHCnNnUeaeeoe24KDK//8rCdoQ+O/wYj/QAP4i6d3Xl
         OzPJRXpPbgegpWYns63qS/mzueJcEcpVexibQ8BRPnGrUnTgN2gWpksXqpbDJ2bHrcd0
         8awuX33sospui1gpbGufwu4j94uIBK7XW54lACzUN5HIUT0EUIqQ4blv7CwZQfRf9Oac
         BfPA==
X-Gm-Message-State: AOJu0YyXEd7J8LmcqXxQoB6Da/IftzSpyeCU/CETBD7TfDXMVPJ21ogO
	S95DZqj0FmrZiURnF9fWB9Lt2MhleocMNNJBgY1PRQVA9VSKjEjPFMoOsXsjiOI=
X-Gm-Gg: ASbGnctIkMmO5nfOIqXP9R0Y2wZokbZJsGIo5SEkK1Dw+ebqAI32kTdqLJEFtjSxqAO
	KMiJ3GwMD2bs6OV9UgsjkZJ8g/lF++ThaVave22t/VTGhwpDGEhaFjgm0W+YjrKaOMP14JCN59R
	AJNbXntJp559zBkh16UmL2B6ZgfPuUIRejDZLslDzJ8Z7AD1geGI2G93lQreI+kEh2JEqOki2pB
	Y7OMLwmRZ9cfDgJ6unU+SgI7peg0ftNPzL9s/z3YooIjs0ytCYiNezUO5+3
X-Google-Smtp-Source: AGHT+IFfKuRGvzP8k7Idtjz2pEXJrGPo/qoDpDzGYiMu75C8ujYym5YbjEq79bE7btiUuBJE8GDKcw==
X-Received: by 2002:a05:600c:198c:b0:431:3bf9:3ebb with SMTP id 5b1f17b1804b1-43668b5e045mr269685485e9.24.1735567347998;
        Mon, 30 Dec 2024 06:02:27 -0800 (PST)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e140sm30816423f8f.79.2024.12.30.06.02.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 06:02:27 -0800 (PST)
Message-ID: <f9b9795a-ab0c-49b6-92a1-b887f923279b@suse.com>
Date: Mon, 30 Dec 2024 15:02:25 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] module: get symbol crc back to unsigned
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>, Sami Tolvanen
 <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>,
 linux-modules@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
 Matthew Maurer <mmaurer@google.com>
References: <20241228154603.2234284-1-masahiroy@kernel.org>
 <20241228154603.2234284-2-masahiroy@kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20241228154603.2234284-2-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/28/24 16:45, Masahiro Yamada wrote:
> Commit 71810db27c1c ("modversions: treat symbol CRCs as 32 bit
> quantities") changed the CRC fields to s32 because the __kcrctab and
> __kcrctab_gpl sections contained relative references to the actual
> CRC values stored in the .rodata section when CONFIG_MODULE_REL_CRCS=y.
> 
> Commit 7b4537199a4a ("kbuild: link symbol CRCs at final link, removing
> CONFIG_MODULE_REL_CRCS") removed this complexity. Now, the __kcrctab
> and __kcrctab_gpl sections directly contain the CRC values in all cases.
> 
> The genksyms tool outputs unsigned 32-bit CRC values, so u32 is preferred
> over s32.
> 
> No functional changes are intended.
> 
> Regardless of this change, the CRC value is assigned to the u32 variable,
> 'crcval' before the comparison, as seen in kernel/module/version.c:
> 
>     crcval = *crc;
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

I understand the plan is for this to go through the kbuild tree with the
rest of the extended modversions + Rust support.

-- 
Thanks,
Petr

