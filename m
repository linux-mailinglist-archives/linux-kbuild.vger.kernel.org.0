Return-Path: <linux-kbuild+bounces-3939-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 311199932E2
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Oct 2024 18:15:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCCA81F239E1
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Oct 2024 16:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAA771DACAE;
	Mon,  7 Oct 2024 16:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lOWGEZn8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CCD1DB357;
	Mon,  7 Oct 2024 16:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728317643; cv=none; b=S44Q6L83cH88yXoM2KdfrcTd8z2QrOeB0XT0PHktzes3Yhq/WuMV7IKfom8123mc4pIwDPiZRih5krq0CPtWVrRKIYovisugScBRg1caj+8GJj+zxZ2e02PxXQWNBXulnLNISTo5HTSeDkcNGCcvAiPfXnpj/FHSPxTy4bLykmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728317643; c=relaxed/simple;
	bh=KyvWlTeBSKjtPumumehBe5sSwd1ihWBAwNMVt+a6kDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s3dRvdEBAbKNHmHAemig8m/0k1gUC9EtkDgn4DDtnEVylD5mzRP0+X4O1+vyoaIBppdPucUHQ9+FISjn0+73FFT0hjzuwy2zcHy0I60oBaKXTj5BVaoqGepqkqP1jXj8vkq2IoYX39ff0uexRE9ARBTV1h7DCZOGAdupTF8ZvwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lOWGEZn8; arc=none smtp.client-ip=209.85.215.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f193.google.com with SMTP id 41be03b00d2f7-7d4f85766f0so3787730a12.2;
        Mon, 07 Oct 2024 09:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728317640; x=1728922440; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+fRgv2moyl1PhmTJtYGS+cs9M/axLjy+ziPJRirSPA=;
        b=lOWGEZn80ueov5W/N+Ao8tUqStoOSDzPjCVgFZl+I0GpFFbiLutt93E4YkWwXqWvpG
         aclVefhsTIt2oUB0vsjvYTiy4OflAk21Z7WXcpxVDF1WkeP7jeXddjstvtIrnwDoNjYX
         fMT2y5w2ZrMJEzS7jT4epi3mABllTzfwYSUcU8+0TTqezNSpC5SUUXs8rPmTY2OoIcQV
         xqmIKW2cp/yf9htLcLbN69gVHtv/L9HCYOFH5ZwzUmudqzHJPHHEIRn6YhU+iFytkFJ1
         onUlaLdtWvOTYHDE26iJwvyGGuI3JauveHusm85+mUgOFrJ0dCOrOjLH1MiDdosQjLJK
         ITfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728317640; x=1728922440;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N+fRgv2moyl1PhmTJtYGS+cs9M/axLjy+ziPJRirSPA=;
        b=cx6OyCYBiAPAqCK7eOy5uwLtJ628OJtHtbzjcUVXNBvW58PejqqpRrdGMWtiHgbuf/
         1vbQsixFX+WeHM1D53V+YoIYJFalcz2PAvVC2OJQfTfqvFvnZkdhwMwYNtExmd+PO419
         9pOs56L9WJLq2u3zi1eTp7rKFj3ZoDlzPdLwwEQ+MYC5Gf/KexKoAroYF6Hm7ua0fSdt
         rDvKbbGUyzusRShitdtcAkwPg0dTgcTTi99zWcEvgh/fMJNnVEi4BjPswzTxmzyE0+NE
         hz4HESDgSpHKR44dm9U7zttTwbJQv8rgQPV3y62UqCGo234KP8Y3TXouQm0sCMe5kmpy
         WGNg==
X-Forwarded-Encrypted: i=1; AJvYcCVmE1xAiuLWxXeghgT7yvkdywMVMEok6mQ2gY5gPeAOM4HkGj5ToI5V3X6IfrRzs1kOTiISUi5cn0Uf6ApI@vger.kernel.org, AJvYcCW0DCZ/L9EHI7qffyXGTDT6q7O23xnILjJxB5jXXbaRjb6l5hukEV2vx4sNtoGEv15mcWOmeAyYmvHL3Xw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSejcraWunL0n7h8qih+HDfCdAeeMopEzNPH3aLDdMg/nBdBvU
	RxFMFJXghL73IMQP3ToEKwk7glkSWczug6S1rowPwIOm3IuiNcPU2sPPkSyG
X-Google-Smtp-Source: AGHT+IGV50TMfRNVJ24XJBvrkKUYALjj+QN8rmG4wqhvSFlPBG4CwgHfCpgOMVEPZe4q9x8y1YVnHA==
X-Received: by 2002:a05:6a20:9f09:b0:1d4:e4eb:73e2 with SMTP id adf61e73a8af0-1d6dfa35f28mr17213034637.13.1728317640207;
        Mon, 07 Oct 2024 09:14:00 -0700 (PDT)
Received: from [198.18.0.1] (n220246094186.netvigator.com. [220.246.94.186])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0d45347sm4546047b3a.135.2024.10.07.09.13.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 09:13:59 -0700 (PDT)
Message-ID: <f1ad7092-af82-459b-a5a1-863f6254decc@gmail.com>
Date: Tue, 8 Oct 2024 00:13:54 +0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kbuild: Add vmlinux_install to facilitate debugging
To: masahiroy@kernel.org
Cc: nathan@kernel.org, nicolas@fjasle.eu, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241007160710.3937-1-zachwade.k@gmail.com>
From: Zach Wade <zachwade.k@gmail.com>
In-Reply-To: <20241007160710.3937-1-zachwade.k@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2024/10/8 0:07, Zach Wade wrote:
> When testing multiple versions of the kernel with the same source code,it
> is often necessary to recompile the kernel, which is time-consuming for
> small hosts. I need to cp vmlinux to the corresponding module directory.
> I think adding this will make debugging the kernel a little more
> convenient.
> 
> Signed-off-by: Zach Wade <zachwade.k@gmail.com>
> ---
>   Makefile | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index c5493c0c0ca1..1caab011599f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1579,6 +1579,7 @@ help:
>   	@echo  '* vmlinux	  - Build the bare kernel'
>   	@echo  '* modules	  - Build all modules'
>   	@echo  '  modules_install - Install all modules to INSTALL_MOD_PATH (default: /)'
> +	@echo  '  vmlinux_install - Install vmlinux to INSTALL_MOD_PATH (default: /)'
>   	@echo  '  vdso_install    - Install unstripped vdso to INSTALL_MOD_PATH (default: /)'
>   	@echo  '  dir/            - Build all files in dir and below'
>   	@echo  '  dir/file.[ois]  - Build specified target only'
> @@ -1887,6 +1888,19 @@ modpost: $(if $(single-build),, $(if $(KBUILD_BUILTIN), vmlinux.o)) \
>   	 $(if $(KBUILD_MODULES), modules_check)
>   	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
>   
> +# ---------------------------------------------------------------------------
> +# vmlinux install
> +
> +PHONY += vmlinux_install
> +
> +vmlinux_install:
> +	@if [ -f vmlinux ]; then \
> +		echo "INSTALL ${MODLIB}/vmlinux"; \
> +		cp -f vmlinux ${MODLIB}/ ; \
> +	else \
> +		echo "vmlinux file does not exist."; \
> +	fi
> +
>   # Single targets
>   # ---------------------------------------------------------------------------
>   # To build individual files in subdirectories, you can do like this:

Hi Masahiro Yamada,

I think this patch will make me feel comfortable, so I submitted this 
change.
However, this submission may not be perfect. I just put forward my 
ideas. If you think it can be added, you are welcome to point out the 
parts that need to be modified. I will fix them as required and resubmit 
the v2 version.

Thanks,
Zach

