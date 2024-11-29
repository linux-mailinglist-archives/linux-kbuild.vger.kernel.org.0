Return-Path: <linux-kbuild+bounces-4912-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D2F9DED9A
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 Nov 2024 00:31:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D38FB16380B
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Nov 2024 23:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AB2A1990C5;
	Fri, 29 Nov 2024 23:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zr+fQ40d"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B4C197A8A
	for <linux-kbuild@vger.kernel.org>; Fri, 29 Nov 2024 23:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732923073; cv=none; b=aKPqK8yEBrXXB1yrFOoAiyFa3gGkiT+x19s8bnnyKholw54fw+EN+SA2Ulef7xXjzbErMMmSKR2BYFWbS8joAJIlkfnm7Q8gs+2tyCjokN5WiFpwtVAY+b5YHZ+qh+B/HilJlie/YQznNCXKpULuspOSb/a4nHTc7yFM34r8tnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732923073; c=relaxed/simple;
	bh=TzeLF3QcB3Hf0datyvWeAMYglj1yvT4eY0FnhcZxwBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DK/t/rK1yjZeHAz+nU+PGQsvWnW4bpk2/0Rm2+1s3vYbyD1alYU5KOMs/3WSgtDVPOy04DM1EVWPAaAjDzU1AMrOQb2LdaLhNcZxeQ07EOZELwWMBEmJQ9SEcSXW+Vxbys54M1LJ01kqsIAgb3FwUAm+0c4da/2kWugGAnG9b0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zr+fQ40d; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-434ab938e37so15213405e9.0
        for <linux-kbuild@vger.kernel.org>; Fri, 29 Nov 2024 15:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732923069; x=1733527869; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fwf2ZpyKf/ZtBImPmb08+6DmBeOBIjCMYguEVZ/4P84=;
        b=Zr+fQ40dl0sC1Eh4pSzOJ4uK1FzBZrQ7eWXHmyWD//HEI1FaO48TvjJ0hn06SsPdN2
         +M4KM5DoS9008fGk2+3P++o6grTTYD0WtYuAv3OtPNnjcPVtex278fkTpqYXU98xRdK+
         MMLjk0NY+zMqB82VCOHu5dTHTrYv1+zp/fu7T+Iblyghavj+P+K4APDq0HpNfOadctkV
         MaRUQAaSpMiCVCx6oolbJtxlpWTKQlnSY9talsqG7qpYfbM5ZHJuUv7raXg+XOh8bmNN
         IoPHD72JPXutfQBiSi8pEUzSTJhbuILtx00Xok0HxQZBitN2OJsUh39RYbKLCmWKjaCi
         KV3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732923069; x=1733527869;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fwf2ZpyKf/ZtBImPmb08+6DmBeOBIjCMYguEVZ/4P84=;
        b=Zzt58F3LLszHVwtlL6WIKnIYdxczrVkvHyBQyaHRXrXfZpa1cXVdm7Rie8mFyqPgG9
         o6LxPXE/CIN9jjHIStUJQts4FJHv4rGEUjE2WClp9f9BUl8XmNiwmqgic2bR+aDxI6T4
         +kWAk66OEQKKtLCK4Bt/7XLJ7C/I7mDZqSjJjfefgmqJ4ttN1xv7XIypHZjbFpXNueLM
         HKtprh8V4goji5MVCtZUPaUHDxb6w3624IRLC0aZRnRsCmACNohwz189hxVAMv+lHPVI
         +cpME10Ko+ujgYSS0JmHqSNv7t6hIYvMh0ISK1qyToBLnixVaqYWuaamyQHVuIe6if92
         Bxmw==
X-Forwarded-Encrypted: i=1; AJvYcCWKfw91GGKEB/qe//IXwKy6ysvpIbcYkDR6iU8YtWh86TUuWRCngRSgdzsSiDnZIEQcOekXJme2NLEiB7E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaSHt1viWmbQNRmYervvkxc90s1XQbA8/9jHVw/dr8SG8RgVK0
	m/VhsyCsEKBsqvHNXxC948Nd0449tTuUyjUw2AODfcY80P+h1hQEN0mNgEInnY0=
X-Gm-Gg: ASbGnct9m3NRcJZA3GS5bNaCE7HdHG+kNdoLDmOeP7Qqj4QHgFnjuTGDh8IQTQ6bC9p
	LPrQxSmjMbRaENXI/ixjif8GmHONU6BRmKwZ0JlZ9RjEsewaPASNqFwc/99gltB28ly7JPqE7YM
	6QtCOLwqkNynYsTGLYgEWwjuRwmW9Oiqr+kVcB+86roBZH0MlOteYdLl7mgTkifEAYKO84ZML7F
	gprVAPdqjnPT7ocHKrq8RcwI4r7ZDHR0fPpH0ZN5ffeFVAMV9TeNr9F8nLrTlgItZXVVWTY7GUh
	bDoLAE5g61wtpw6XA5tZMGQt
X-Google-Smtp-Source: AGHT+IEykCxTGZMCKJYW5Uspz4zr6yyrHOVmE4xBgO7Vj/5z1tSmuzot/DIJMWX3+1MAZ8NoNO4Q3A==
X-Received: by 2002:a05:600c:1ca7:b0:431:5187:28dd with SMTP id 5b1f17b1804b1-434a9df6aedmr110283385e9.28.1732923069512;
        Fri, 29 Nov 2024 15:31:09 -0800 (PST)
Received: from ?IPV6:2a01:170:117e:fc:8db4:3ffe:8420:e745? ([2a01:170:117e:fc:8db4:3ffe:8420:e745])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0f7dccasm66191865e9.43.2024.11.29.15.31.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Nov 2024 15:31:08 -0800 (PST)
Message-ID: <b453017b-d719-4984-91d9-f28d34352d8f@linaro.org>
Date: Sat, 30 Nov 2024 00:31:07 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/23] kbuild: use absolute path in the generated wrapper
 Makefile
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas@fjasle.eu>,
 Stephan Gerhold <stephan.gerhold@linaro.org>
References: <20240917141725.466514-1-masahiroy@kernel.org>
 <20240917141725.466514-22-masahiroy@kernel.org>
Content-Language: en-US
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20240917141725.466514-22-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Masahiro,

On 9/17/24 16:16, Masahiro Yamada wrote:
> Keep the consistent behavior when this Makefile is invoked from another
> directory.

This breaks building in a chroot for me. I usually compile the kernel on 
my host and then use some tooling to just run the "package" step of an 
Alpine kernel package definition. See

https://wiki.postmarketos.org/wiki/Compiling_kernels_with_envkernel.sh#Packaging_kernels_built_without_envkernel

Since this requires mounting the source directory into a chroot, and 
then symlinking the output directory to the package "src" dir. It relies 
on the fact that make can be run from the output directory and 
implicitly relies on the include being relative since the absolute paths 
don't map inside the chroot.

I'm not sure if breakages like this justify a revert, but I noticed this 
issue in -next the other day and thought it was at least worth reporting.

I wouldn't be surprised if other folks with other build systems get 
bitten by this too.

Kind regards,
Caleb
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>   Makefile | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index ce646a6994a6..9f0ba07e8f25 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -643,8 +643,9 @@ ifdef building_out_of_srctree
>   
>   quiet_cmd_makefile = GEN     Makefile
>         cmd_makefile = { \
> -	echo "\# Automatically generated by $(srctree)/Makefile: don't edit"; \
> -	echo "include $(srctree)/Makefile"; \
> +	echo "\# Automatically generated by $(abs_srctree)/Makefile: don't edit"; \
> +	echo "export KBUILD_OUTPUT = $(CURDIR)"; \
> +	echo "include $(abs_srctree)/Makefile"; \
>   	} > Makefile
>   
>   outputmakefile:


