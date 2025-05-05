Return-Path: <linux-kbuild+bounces-6934-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB47AA9288
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 May 2025 13:57:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EC3C3A3C20
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 May 2025 11:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F78220966B;
	Mon,  5 May 2025 11:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="O7S0bVWS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D92F2063F0
	for <linux-kbuild@vger.kernel.org>; Mon,  5 May 2025 11:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746446252; cv=none; b=vF0EnhC0LOL8MmVsRHeyFRWvgSLoTk1LaJrapWaxYXV54sXqBUYfaSnvBLuIVyNbrehnC9X4kmoQvlKIkk9D05YtN23n5Jy4a0HsWJF/X5hMQhZrclUvhDEILhcTcSdM7Gb8toawZ+R/rTKvYRY/6mffEnk9GndMeOi/poPtPR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746446252; c=relaxed/simple;
	bh=qySfuoPl9wV07OnVIwdvGpKvtcyDus4i0vcs8YMKyZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O1MLRxrJsX3flUg7KJ9VS5PCLWJCnxAD19lLAN3nygGpMD+z0pG4ms6rggK6k46G7d6aSic9vGZRbOWB3We1rv4f7rVwycs7JyfV9vTss/b1WDqfKEiSlezjWsgPu13Isi7L1ntwtxHgcXVizb42N9N7nLRYDRXHXq1txvAoqSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=O7S0bVWS; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5f624291db6so6422748a12.3
        for <linux-kbuild@vger.kernel.org>; Mon, 05 May 2025 04:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746446249; x=1747051049; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kMKaPde6OkE/AtVUsHGGgX212tPSCHNNuxA10fp7Sb0=;
        b=O7S0bVWS8cwnbONviLMaVDXCjDn0VnD9jXBhxRTbZcAttsAkOQ3BOdNYGR8wDl3UHi
         aCa8VsRTjfKdupB9IkKeBECkrk9KvQ0hXSU+0Z4EUooxZArSjez3dwVGFiVPY/ZIumow
         3G4oRRiP5B+mcuUDKkf9GVtEUg3eTA3303e/6HpZRYKHqRFFBTZ+sf+yGRfXRPNRiPh9
         VR2iDuwIVi+KDfJtPL90rLLcrqQlHdgW4a2Oj6wYWrvZgNP1c+pl4Wtz/K9Ts49AcH6I
         FauBby6+Oh99CQonL/4H1CyFFZpWOAXAotMQ6/kauZxZG4YR9TjVlO3TGwqm3iPYY4Hi
         VojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746446249; x=1747051049;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kMKaPde6OkE/AtVUsHGGgX212tPSCHNNuxA10fp7Sb0=;
        b=BGNMjtI0anuBygFlR4tMsQCdixB+70XIdIgOtTN5E15I+R4f+0aexvHkq5O+eglXFN
         Fvr/XcFksnoJSY94eV44KP1ITnuINns+g1tjuhJTruKsQ9Q6cfhigqT/CL6AvxCXHeVA
         3/dAZOe5160Xjxqmuhca6X9TxmHeZBDUrWKDX6JF5pV3MbKBNQ2D+JIjP6x2mn9ISxFW
         Lcvh5wGVPKxA/S6wqvy5ddTULt1TAzaj35g4a++pxrvwCJEIijxUWkbdo6taBPPSzUr6
         2q8gKNPSItwr62OXqLP4eE8hZmuiWUGrxhTQ6ChACJiW3qpDihQzqYOhF1vWD0PyDS4S
         DdLA==
X-Forwarded-Encrypted: i=1; AJvYcCXW3Te3vMrQnDrYGCc1yH5RCd6u5eQL6dXzyPduuW7ezIN3tGnIfXmG9OMkfg2Qs83oTPWgq0lO4ZQoLoU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2nCki18q7oAHVsxmCfNCTaEYnbQIccaMB0n1z8sKMBnnqcA8M
	jcjkzNIu0qRsqDKOc1TCA3C+CidIJgRfbbR5QNuj2UiIbsyyIeM6vxk36PWcuGg=
X-Gm-Gg: ASbGnctmUsqTKt3AlCHQ5ofNWcfspTcq4htmkT7u3LIG41dQNTVIWLN+Rg6l4EGp8G9
	Y/I+0zKz3dZsQnIzPb6wkv+j07deXHdhUZ7IWe82KPOj38DQIIEsar4ApYKf80aT/qmgOKrYcGw
	EnlNgxnIonPFi18WrWzd6uzxLwknnoBsyImV8q5mEW6yBpyyDFSYmIywVeN5hLG4KbLQ7FXG67O
	E8U4/sDVOVLjYmuLpA2T9uapgZXpUB82JimTpwffHvrQvcW0awA3XU9zTXNvOKy2vbMisg70n94
	JrySa3f//nc/pSk4nMccdGpPJ/CTtFgpPOI1TRj0Qck=
X-Google-Smtp-Source: AGHT+IFiyeoBtX6BSQ4FfqUekWlXlO5jzJ6Ey3HdmksDyNABdshCZwf6dxx6rks8EwQBNJy4ucHIFg==
X-Received: by 2002:a17:906:c115:b0:ac7:cfcb:c3e3 with SMTP id a640c23a62f3a-ad1a4acc6c3mr639033466b.45.1746446248779;
        Mon, 05 May 2025 04:57:28 -0700 (PDT)
Received: from [10.100.51.48] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891478fasm482865566b.26.2025.05.05.04.57.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 04:57:28 -0700 (PDT)
Message-ID: <0aa0c9b8-2d6a-48e8-9a57-df2583f26d14@suse.com>
Date: Mon, 5 May 2025 13:57:27 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] gendwarfksyms: Add a kABI rule to override byte_size
 attributes
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@samsung.com>,
 linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250430214049.2658716-6-samitolvanen@google.com>
 <20250430214049.2658716-8-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20250430214049.2658716-8-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/30/25 23:40, Sami Tolvanen wrote:
> A data structure can be partially opaque to modules if its
> allocation is handled by the core kernel, and modules only need
> to access some of its members. In this situation, it's possible
> to append new members to the structure without breaking the ABI,
> as long as the layout for the original members remains unchanged.
> For example, consider the following struct:
> 
>   struct s {
>           unsigned long a;
>           void *p;
>   };
> 
> gendwarfksyms --stable --dump-dies produces the following type
> expansion:
> 
>   variable structure_type s {
>     member base_type long unsigned int byte_size(8) encoding(7) a
>       data_member_location(0) ,
>     member pointer_type {
>       base_type void
>     } byte_size(8) p data_member_location(8)
>   } byte_size(16)
> 
> To append new members, we can use the KABI_IGNORE() macro to
> hide them from gendwarfksyms --stable:
> 
>   struct s {
>           /* old members with unchanged layout */
>           unsigned long a;
>           void *p;
> 
>           /* new members not accessed by modules */
>           KABI_IGNORE(0, unsigned long n);
>   };
> 
> However, we can't hide the fact that adding new members changes
> the struct size, as seen in the updated type string:
> 
>   variable structure_type s {
>     member base_type long unsigned int byte_size(8) encoding(7) a
>       data_member_location(0) ,
>     member pointer_type {
>       base_type void
>     } byte_size(8) p data_member_location(8)
>   } byte_size(24)
> 
> In order to support this use case, add a kABI rule that makes it
> possible to override the byte_size attribute for types:
> 
>   /*
>    * struct s allocation is handled by the kernel, so
>    * appending new members without changing the original
>    * layout won't break the ABI.
>    */
>   KABI_BYTE_SIZE(s, 16);
> 
> This results in a type string that's unchanged from the original
> and therefore, won't change versions for symbols that reference
> the changed structure.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- Petr

