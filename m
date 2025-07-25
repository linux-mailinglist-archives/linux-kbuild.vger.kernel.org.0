Return-Path: <linux-kbuild+bounces-8160-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE24B1187C
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 08:26:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D61021CC5EEE
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 06:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 476A72882C7;
	Fri, 25 Jul 2025 06:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="IWugx4X+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37442882C1
	for <linux-kbuild@vger.kernel.org>; Fri, 25 Jul 2025 06:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753424808; cv=none; b=VbHqgt4IZf8fc9+7bDAhrtAEDkNv1to4MATW7wGiD/Xtx1vduLV233fobAm7x1yH1yt8XvoLxQRa/W+tYQUenlIzYM5CSnLLlMVY2ra/xgUT+YeqYBaqVu2VNbvUy3IM63SGgTZlGVJ55Y3hdb1ds4zAp9xSuhS94H+SdYRbrWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753424808; c=relaxed/simple;
	bh=2si2snLINEkjaC7gF7x3f6zLZxI8VdibGsVfnQtcyl4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AafYNWRSS9C1B6CP4ZceS6eO4zO5Q6mS8gca+j37G19KC2jgSAOHRtZ4Cu0hV2fYaSwSTR34FUoOsWFhmL/5nftb1snGkelyt8G+lxG0Mb99oA8A7mbZqeOPxd/8Ab4cmzbSX4OfpOCX8GO5nEm7BUVpExlqK8c4dI4BpDZO2nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=IWugx4X+; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2D1923FB4E
	for <linux-kbuild@vger.kernel.org>; Fri, 25 Jul 2025 06:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1753424804;
	bh=i7Z45Di1DKvPrIvb2/CHdBXTyeDYviINQxq/IZOTBeg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=IWugx4X+bTsW+tLBhJVw7GOYeoC59am65WCy0KgCsDi+PYktPZHpiLqCthurKR+rA
	 ghChtgIetvXu0gOUcL9NRsVZamJpZNA70B2aQYGDnKH6g38ZG0eWlbICoGXJ2l2v3i
	 GHd0j4MDN29cWl4TDaXgQ2PNp/vmRR4BTHtzmcEp77tK2jxWIZJwdlfG+UpIYekDdk
	 LXXNbPUjzYcg3QXOjopn6EEbaXCQ6rNcY/k4kRrXQfUe8jg6oWT40Qgcsl8TApLtdR
	 kyv29YdXWv6cOxv5wlkdOgnWg2uHvPTAJKTdq8Gk/H5Vriz8HrT4crIQMj/wNfBgna
	 sYReZIYQB34lQ==
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3b7737aed7bso527676f8f.3
        for <linux-kbuild@vger.kernel.org>; Thu, 24 Jul 2025 23:26:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753424802; x=1754029602;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i7Z45Di1DKvPrIvb2/CHdBXTyeDYviINQxq/IZOTBeg=;
        b=dhTwPt5oRDF59sMhmN65JG5h+WZ9e7Bzn/ZOkaaf1yZDbwzSR00KHUJoINPc5Ocfo8
         w5sHfIZ1f0PPya9gKGV9wV2NW0xHmbyn1om4jMBd9U3IF1MTKxbPtEd3LaX/ZXRyCJ9m
         4e7/GTqIOLo1dLZQE6B4rbe2lSjDWOrEeXGe6XNiU2xHDHHRENKm9BdgTXM1jj8CeMJO
         0HvOLK8VpdSFtEOx9vuvunwmp6Cmp7GSp07EXzOZsrhbxNo7qRUCw5h6+nVc38wLPJj8
         VfZU0k9oNSfzZIB2VE9aEPwFJP4eZO+M3WpadrOooQwoOQWvPVOM20QBZmXrdh4VmcEn
         9mfg==
X-Forwarded-Encrypted: i=1; AJvYcCW8zN3jq6HJlEymPzS8u/FqONlQ46b7zP+nhMDLOutmnBg80ShxuJ+pMwKlU6OzZ21hkTki268+3FGWhjM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAdphAUR3yV8FGS9+l6GWHBX5bX/akX+6FCinluYFXplnCtYhP
	x4Ci4NWk0MZMQl4aaKmW9IQxhEu7UWZ5674XpvtJoR7V8B/vcfBlRopuz+CmBqfW099nnLFWJon
	A1M6i9XwiBDvILN2nTKDcobbDjoEV7onwgLfP+HKNj4H7wLJGbz35ZY9ukz4hGZoCODAAWAKE+x
	LJOUx+Dw==
X-Gm-Gg: ASbGnctQkc7Q8f5V6gWXapehBNHtTCRDeeReBlr6SfRKX07xZdcq8mED4hw9Mv4dpSb
	cRGFg5ti5/QBahca0c85KwrsufKLoJXgUFXfbNcXeCENFw0bwXJahIMjpfmGN+uRnkV44wO3T+3
	R9nRoDC38Ap/MqzMvtiy5rs8lcZJ2euXYhdQ2kA1Ve86A0uXTVfOGPH42HZ5qWXolK7CtCvsheG
	CEo/bcrI0y9hZB5pOQZAZsZUaAKeDqHKw/3GlTA88QpvRM6KvIZ7aMHVD0jPAV0c2aUDsY1t7ij
	w8PQau/u3/ZI1rxWY8dx4ZBGEPAHpIrfUIfx+sh8DVsQqlwNleXc9dbMLC0eLCsvWOkkf6Aiore
	HUYk/Mcwan3GvSgPc/9KNBhR6RbvV6uq3bbyw
X-Received: by 2002:a05:6000:1a88:b0:3a4:fb7e:5fa6 with SMTP id ffacd0b85a97d-3b77671592amr538360f8f.1.1753424802554;
        Thu, 24 Jul 2025 23:26:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTcbhP+qpBUFcpUqfk2Wp/N8FXB7Xsc01E0wuMcV6UBfsne+SnFue51uathOre6C5p/D/OcQ==
X-Received: by 2002:a05:6000:1a88:b0:3a4:fb7e:5fa6 with SMTP id ffacd0b85a97d-3b77671592amr538323f8f.1.1753424802160;
        Thu, 24 Jul 2025 23:26:42 -0700 (PDT)
Received: from [192.168.123.154] (ip-005-147-080-091.um06.pools.vodafone-ip.de. [5.147.80.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fcacf0bsm4109538f8f.38.2025.07.24.23.26.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 23:26:41 -0700 (PDT)
Message-ID: <0532c555-1876-449b-89cb-36ce5394433f@canonical.com>
Date: Fri, 25 Jul 2025 08:26:39 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] riscv: indirect jmp in asm that's static in nature
 to use sw guarded jump
To: Deepak Gupta <debug@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Monk Chiang <monk.chiang@sifive.com>,
 Kito Cheng <kito.cheng@sifive.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev,
 rick.p.edgecombe@intel.com, broonie@kernel.org, cleger@rivosinc.com,
 samitolvanen@google.com, apatel@ventanamicro.com, ajones@ventanamicro.com,
 conor.dooley@microchip.com, charlie@rivosinc.com, samuel.holland@sifive.com,
 bjorn@rivosinc.com, fweimer@redhat.com, jeffreyalaw@gmail.com,
 andrew@sifive.com, ved@rivosinc.com
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-3-04b8fa44c98c@rivosinc.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20250724-riscv_kcfi-v1-3-04b8fa44c98c@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25.07.25 01:36, Deepak Gupta wrote:
> Handwritten `__memset` asm routine perform static jumps within
> function and uses `a5` to do that. This would require a landing pad
> instruction at the target. Since its static jump and no memory load is
> involved, use `t2` instead which is exempt from requiring a landing pad.
> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>

Acked-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

> ---
>   arch/riscv/lib/memset.S | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/lib/memset.S b/arch/riscv/lib/memset.S
> index da23b8347e2d..c4a318d8eef3 100644
> --- a/arch/riscv/lib/memset.S
> +++ b/arch/riscv/lib/memset.S
> @@ -56,12 +56,12 @@ SYM_FUNC_START(__memset)
>   
>   	/* Jump into loop body */
>   	/* Assumes 32-bit instruction lengths */
> -	la a5, 3f
> +	la t2, 3f
>   #ifdef CONFIG_64BIT
>   	srli a4, a4, 1
>   #endif
> -	add a5, a5, a4
> -	jr a5
> +	add t2, t2, a4
> +	jr t2
>   3:
>   	REG_S a1,        0(t0)
>   	REG_S a1,    SZREG(t0)
> 


