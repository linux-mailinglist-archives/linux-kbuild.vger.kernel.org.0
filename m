Return-Path: <linux-kbuild+bounces-3859-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E1298BF76
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Oct 2024 16:15:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A80D41C23D62
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Oct 2024 14:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6F0D1C9DF7;
	Tue,  1 Oct 2024 14:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QWgh4C2D"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78E01C9DF3
	for <linux-kbuild@vger.kernel.org>; Tue,  1 Oct 2024 14:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727791967; cv=none; b=hB1eCH5dJV8t81v49Lj9DlsHuviUN8vYP9iZKztz/Ly9wMLKS3bVeZqNwM94hHdMtMFNnslvOpCNjjXyxP2t2jE95Fl0du4ze5+zQE3sWvH9orGdY12ly+QqM87Y3M0xkP/QHqCrtnBy3k1oGxgm6Un2wjQgEJ4HiH5TG7Lp6rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727791967; c=relaxed/simple;
	bh=zANKrDNHHPw85OVvoKNOqJRMnnY/7KTHaVV++XWrNQg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZVW0zAtdnTxPi+Di2pddfhfqUcUYFhgIu6Xw/XqHzg/rYVfYOmCH4eYhSOV6ApMZpIgqTNPys+CanVC3vLwvcDh/gYgnscz0hcanY+GCjENftrAhb2XYIklREPzhT0DD49upWWxboNKo4UMVcZYlkrI/Sfbzvnh8cKUwuP74WRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QWgh4C2D; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a8d6d0fe021so968306366b.1
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Oct 2024 07:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727791963; x=1728396763; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DeoJTd250N86AwxT75TCft/ULiYvSUL27Dnc1hyjfJ8=;
        b=QWgh4C2DrgxG8VEkHG3EXtLpEVkP/ikONr6tZRKUxt38gI32nCdElG+xv/7OksKHVa
         jZHaw4WF7d0GXOJSP38L4e68jy5aqzHBX/r6BLSOYLKmlQhFfXe25Ko94c9EF9BcwWGh
         lXk94Tg59hzUdyee2pNLbYRSTA+5378t3VnFZP+Aap2jpuyXmZCrO10nVXiEoBLaTG+w
         Y+zSsgtXt5vihZiBpH95aXtUH0FUxiTVl1psEPBQ56Sl4ERo45HpDPp+z7fk5c2qOkug
         NqJGpyS4FkEgtQdZ6fpojR8qEqJ5dKMhUcKhyXOk/DcsTt80K/gPAiMmXwTZZ+2JYEI0
         nDpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727791963; x=1728396763;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DeoJTd250N86AwxT75TCft/ULiYvSUL27Dnc1hyjfJ8=;
        b=ZRiwyn0nt3AlKygpu8E36ZngzthXlALAv73CdEkq8l2MnRl8S+KSXVpCck5ZXo7PJK
         z/31D9aOkdz4d1pr/abC4o3UdTle+7dtsznacA3MSsN69BczQmYDQc9vIrvgTRqRiuLw
         n7jPkvqxHIw8S7PLisvWYSjfwtRfCPtM0gbEtnLTbCw29y6jQqFElsUIpL/WF9jnXAjg
         OC3tMuMEq32qGOFiNo/n0d2E0wHaGOYUl3Rf/MviLyagBVSXkBqSlX1oieJ9SGiZ6Lyt
         xYWdcML41MEKaMTTRzspdISPzWPqp31R+Wcor4kr2pJufPUKtnfcDz5OG5KUybOje9jH
         uzNg==
X-Forwarded-Encrypted: i=1; AJvYcCX1Tj3fWuTu+wyOKA5Pg8BOK9NEeSotICsb+AsJo56qsYi/Id9R+FyCi32G9CGOWm2ZQGKxISy7TGnNqvI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhbcR1bYyd2TEJERpYGGv0iUkxvJsxloYBCy76dNErCGQnH0oO
	qPN/xwscwfQ2CHYFZYxuJKWO4fCqystKG8deVHdX7RMbir4FJuxmeM2OPy1EUUg=
X-Google-Smtp-Source: AGHT+IFkBtWi40iUpXvMtDXyvuH4imak9CnOFIL9Jv+C/N0N1k9h3hOedmoIkMwXqfp0vxX1k3WfwA==
X-Received: by 2002:a17:907:d20:b0:a86:82e2:8c6d with SMTP id a640c23a62f3a-a93c4aefc0cmr1881927566b.62.1727791962932;
        Tue, 01 Oct 2024 07:12:42 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27c5af5sm717179766b.70.2024.10.01.07.12.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 07:12:42 -0700 (PDT)
Message-ID: <105dd859-f018-4b24-96f0-f395d53db9b9@suse.com>
Date: Tue, 1 Oct 2024 16:12:41 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/20] gendwarfksyms: Expand subroutine_type
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>,
 Petr Pavlu <petr.pavlu@suse.com>, Neal Gompa <neal@gompa.dev>,
 Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>,
 Miroslav Benes <mbenes@suse.cz>, Asahi Linux <asahi@lists.linux.dev>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20240923181846.549877-22-samitolvanen@google.com>
 <20240923181846.549877-30-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20240923181846.549877-30-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/23/24 20:18, Sami Tolvanen wrote:
> Add support for expanding DW_TAG_subroutine_type and the parameters
> in DW_TAG_formal_parameter. Use this to also expand subprograms.
> 
> Example output with --dump-dies:
> 
>   subprogram (
>     formal_parameter pointer_type {
>       const_type {
>         base_type char byte_size(1) encoding(6)
>       }
>     }
>   )
>   -> base_type unsigned long byte_size(8) encoding(7)
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> [...]

Looks ok to me, feel free to add:
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr

