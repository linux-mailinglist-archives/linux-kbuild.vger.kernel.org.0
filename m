Return-Path: <linux-kbuild+bounces-2655-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E0E93BF66
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jul 2024 11:54:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 551551F22F26
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jul 2024 09:54:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65DA1172BD8;
	Thu, 25 Jul 2024 09:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HDietoas"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0959198A19
	for <linux-kbuild@vger.kernel.org>; Thu, 25 Jul 2024 09:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721901244; cv=none; b=qFpfZQsld/xwcZA2bvuT9HW4WxxLjDXvuLQQQKMHNOt/QDQfGTbC3BTlPlGWQzm8MlCABbtewU01n4heiYGfE9eZ4ERCvOrWfK4f9eTPCL4rNPZUdNRbyqkGncXMVmQ0Lh4/GvYDiKo83iEnX+dtdmZmn2EZhMgTz0T+uulgnMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721901244; c=relaxed/simple;
	bh=TRogKpvrGbqxUvdw8euZYKuVBYuIo9/CTs0zy8grZV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GLCFpBvDlrrwNXttbPUsqhlceL8G4AHYA3J03Veq/QegBiL4nFfnPiwwgfDNBq9XycQtCAHoOCdXu4KCX9FY85P81OAKgH1Jmgz8ykM7pMXaltXUxAKfGhWnMFIpBLUDFxaAxHJ284jgzzy050fZRVM3uCKZf3Vtm4nDqcJUd7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HDietoas; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721901241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Azo1YWuyIM0irZB6B+BIwEhaWJ15+/vkqjauTRjqjt8=;
	b=HDietoas/qOUT+bfBEpHnfwXNDsz7rqyJx+uNGvil09uWWg/BUQqadPt6ZH2BQO4P70hdp
	XLA1RJTeHwGv6H3lcBbPoBv5LsZervlQGSQ3pysGCIgcBQt3HLOx2829jNpl5OKzEhoY/p
	jy1qMjpGze5107zlvEoXygvo5tSyOZg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-8eHDV9jaMsuN-EVCti8Cgg-1; Thu, 25 Jul 2024 05:54:00 -0400
X-MC-Unique: 8eHDV9jaMsuN-EVCti8Cgg-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3687f5de494so112955f8f.2
        for <linux-kbuild@vger.kernel.org>; Thu, 25 Jul 2024 02:54:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721901238; x=1722506038;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Azo1YWuyIM0irZB6B+BIwEhaWJ15+/vkqjauTRjqjt8=;
        b=O22BhqEaiuj7sDwSkWVj0Yc9YpWJ75SI+0XNNlez791q54uRG0F5v6kBUvhcvXB6x5
         aaZqcX7JRHT9eb99ByIGr8e/a66blZB7YmiksGOyj6f0Zot2D/dB+dZmEmTDOm1Dc3pD
         yhJ+8it/48yhKmuduuZCPCPR5pUFDu080FHF8wIUxZJU9xBrqBitN8/qeGLFKL8kdac0
         8tStM3OATXVHMTpl3W45yn4CME6G96fmpBYzWxrO6KlDEs/bVLf6TaOJUay7m2kbbW+Z
         7ne5Bf8xK1cGLE/pY0AJ9m/EWlmSqPl7oXjyS7Uv8DhDKwgDkV1qm9O49MLcOyKqj/fW
         bFoA==
X-Forwarded-Encrypted: i=1; AJvYcCW5dtL1lbYCXho3SfTtNch1AoCU2m+R/ced66CQfUgIG2Q/85r8MoKplPhsRpO/hNeMURMl+Fwn/gHsuUM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/oKlMxVUdhy0tm+1dMbT2ZCmGhN9hYQIpmaLUDqvc7GNbfVqN
	rhDtUbzHEnTjXt9c+pLpQGY+2UGomII8IxabATGjp2eIv01JTA/aJNfthmtXbR/D/Mu4t5BtFic
	FFJ8RkTjKM7WmQfa35Yj2n12ywXzD3A6cqjac1s16zx21FJb8ACV3cZveO83RVo5oIgDj4A==
X-Received: by 2002:a05:600c:3c89:b0:425:6dfa:c005 with SMTP id 5b1f17b1804b1-42805440493mr7672535e9.2.1721901237836;
        Thu, 25 Jul 2024 02:53:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFI9xUvHg0R+EO/RKq9ufzKkJZaoU8wz7XHuGLoen5hz1S74CdRTqMxjnghTCleM8tL0hE06w==
X-Received: by 2002:a05:600c:3c89:b0:425:6dfa:c005 with SMTP id 5b1f17b1804b1-42805440493mr7672425e9.2.1721901237386;
        Thu, 25 Jul 2024 02:53:57 -0700 (PDT)
Received: from ?IPV6:2a0d:3341:b231:be10::f71? ([2a0d:3341:b231:be10::f71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427f941352asm67749725e9.41.2024.07.25.02.53.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jul 2024 02:53:56 -0700 (PDT)
Message-ID: <d3d97260-f840-4ea8-b964-64e36448bf96@redhat.com>
Date: Thu, 25 Jul 2024 11:53:54 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: usb: lan78xx: add weak dependency with micrel phy
 module
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Florian Fainelli <f.fainelli@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
 UNGLinuxDriver@microchip.com, davem@davemloft.net, edumazet@google.com,
 gregkh@linuxfoundation.org, kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, mcgrof@kernel.org, netdev@vger.kernel.org,
 woojung.huh@microchip.com, Masahiro Yamada <masahiroy@kernel.org>,
 linux-kbuild@vger.kernel.org
References: <20240724145458.440023-1-jtornosm@redhat.com>
 <20240724161020.442958-1-jtornosm@redhat.com>
 <8a267e73-1acc-480f-a9b3-6c4517ba317a@lunn.ch>
 <v6uovbn7ld3vlym65twtcvximgudddgvvhsh6heicbprcs5ii3@nernzyc5vu3i>
 <32be761b-cebc-48e4-a36f-bbf90654df82@gmail.com>
 <ybluy4bqgow5qurzfame6kxx2sflsh5trmnlyaifrlurasid3e@73kpadpk5d3p>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <ybluy4bqgow5qurzfame6kxx2sflsh5trmnlyaifrlurasid3e@73kpadpk5d3p>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/25/24 08:50, Lucas De Marchi wrote:
> if you are saying that the build system should automatically convert
> this:
> 
> 	config USB_LAN78XX
> 		tristate "Microchip LAN78XX Based USB Ethernet Adapters"
> 		select MII
> 		select PHYLIB
> 		select MICROCHIP_PHY
> 		select FIXED_PHY
> 		select CRC32
> 
> into (for my config):
> 
> 	MODULE_WEAKDEP("mii");
> 	MODULE_WEAKDEP("microchip");
> 
> then humn... why is CONFIG_MICREL (being added in this patch) not there?
> It seems even if we automatically derive that information it wouldn't
> fix the problem Jose is trying to solve.

I hoped that the 'weak dependency' towards mii and microchip could be 
inferred greping for 'request_module()' in the relevant code, but 
apparently it's not the case.

The MODULE_WEAKDEP() construct usage makes sense to me, but this patch 
will need at least for MODULE_WEAKDEP() to land into net-next, and to 
grasp more consensus in the phy land.

Cheers,

Paolo


