Return-Path: <linux-kbuild+bounces-4089-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F03999CCA7
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 16:22:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E42F51F23343
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 14:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A9EC14A614;
	Mon, 14 Oct 2024 14:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XMsMe+0J"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60F1E571;
	Mon, 14 Oct 2024 14:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728915742; cv=none; b=FjHlSLuqJn3WOQJqaUK9/PVJSUmQOk17BhX1eS4IlWwpA6d09p0AdcjER7XPLc0mH1/3VQklXrymq0aSibwajLsTcjAWE+gnNu4T8yWap0XkGD/oDFiv3XbsrCer3AGyMOvQ7ROu8fAVu2l6xCLujUB+KTHIeh1CWhLBZMsXctQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728915742; c=relaxed/simple;
	bh=wIbxsaUe+xhT16JELcMjeR4uI5t9g5DMA0UJNK4LCSU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=lsQ0A0rsdWI6ejJ4pdvtdWWKpv4IASV0bfvZz9NQwFVnX9ITxnbU7DZYHeYbCFNMWEZiCUgQkd9R4Xv9/AeK8ic5/aq1V38TrVkKu5+Ug76PGR7+V7fC5/L3yYG/CqZNNbDbKDw0gmW1M5SuelKQKN1GDWrRhE0p1LnxeGAtqMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XMsMe+0J; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e35bf59cf6so20648487b3.0;
        Mon, 14 Oct 2024 07:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728915739; x=1729520539; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LdegCtUbD7wiLDgojYxAyOeJ1T6p8Tx1rzHSq7BJ/hc=;
        b=XMsMe+0JpxFwJSP18pC0OEtFqa/GXPyP4x8dTYi/YgszMkRcuoAvzvNGcWfc1sizl2
         9iq2nsQkMpuRiFiYE/Dq1LLdNaB+v0OZ9eK0s1o72cfL+e3BImM9+bAsctnLqAej6HHT
         H5npS74qMe97rbQOVoBVQ7rDwFtVPEgnfJ+FwrvWpCXRGrQI/Yv6oFIx1PHvAOK2rgBY
         1WHktbOIjM5oBWfB31OmgCbFftXYwN7650+X1FnDDrkf0SH/wfh5OFa5jYdDIApicOfk
         YyNzPyErzRwdSPS8vVaYd2CYuhtrFt8p6uCWOIRAvFK+jNN1j3MxjWECUiubGIkW2rAN
         yhAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728915739; x=1729520539;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LdegCtUbD7wiLDgojYxAyOeJ1T6p8Tx1rzHSq7BJ/hc=;
        b=w1UMoLtsVMg7Os81RIjd6BX+FfwS3KhC3seamlAFU8yRL88FyVmTqXpWRtZqOz1Ck2
         1c/YmsHzRUqmDyjoA5hLegozdPQKlA8+2Hml/98W+r+0NNFTpjv1gcumOGfnQ8qIr+3j
         HT54ZWien485lsPMSpcx06QOEumM3oylyXaKVyiTIQYkwa3IjmSqskwiYLMk5bcQge+2
         hBLat+rnYzXC7qkTErV7+YCbCcfl8d+/Lq9X+bfo0nztg8oIqh4hJm7bUa6T26zzqH2w
         IlymeJT+SLBROrCNi6TaXRNs2Xo0QY2l9IycnflkcPSxOCjCCM81gnElrMcr/EUcioHX
         BPEQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0Drnb1rDhjP/V5IesQtfsT7E5RIzArIZqrLqAy+TZO/zlKbHI32K1XvH2w1StthcixqbilAGjYmrSgp4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9YfCssccV7o/VqEgQpqSkXF1hAlgHdxI4azFHge9+fho8N8kv
	ZW8gccehVr/uZ3n1DAv7ldeRPs1zBGV/96/45LR+sw1ag/FUQnCPfYH8kQ==
X-Google-Smtp-Source: AGHT+IHBjIM25SaqneOqGQ9cMCegaMQX6vm0NpdhTLfcGI0/p0ypu80FPwkT/Pa7CEdXypFXFc3sQg==
X-Received: by 2002:a05:690c:67ca:b0:6dd:dd40:54e2 with SMTP id 00721157ae682-6e32f24a584mr112196757b3.12.1728915738712;
        Mon, 14 Oct 2024 07:22:18 -0700 (PDT)
Received: from [192.168.1.145] (57-135-107-183.static4.bluestreamfiber.net. [57.135.107.183])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e332b89c87sm15355767b3.37.2024.10.14.07.22.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 07:22:18 -0700 (PDT)
Message-ID: <47857d77-6d1c-4236-b902-de3e2fff5205@gmail.com>
Date: Mon, 14 Oct 2024 10:22:15 -0400
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] linux-kbuild: fix: config option can be bool
From: David Hunter <david.hunter.linux@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 shuah@kernel.org, javier.carrasco.cruz@gmail.com
References: <20240913171205.22126-1-david.hunter.linux@gmail.com>
 <20240913171205.22126-2-david.hunter.linux@gmail.com>
 <CAK7LNATkjh8LR58+SZPw44ezbRj6-aisQ9nsUoTY_6yVf+t3Mg@mail.gmail.com>
 <709f5217-b04a-45de-b9a1-373196e5a47d@gmail.com>
Content-Language: en-US
In-Reply-To: <709f5217-b04a-45de-b9a1-373196e5a47d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

version 2: 
https://lore.kernel.org/all/20241014141345.5680-8-david.hunter.linux@gmail.com/

