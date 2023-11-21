Return-Path: <linux-kbuild+bounces-101-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 095E37F354C
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Nov 2023 18:51:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA5CBB218FE
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Nov 2023 17:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1A1F20DF3;
	Tue, 21 Nov 2023 17:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="AAdhhZrG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42F32F4
	for <linux-kbuild@vger.kernel.org>; Tue, 21 Nov 2023 09:51:09 -0800 (PST)
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-7b34c5d7ecdso24539639f.0
        for <linux-kbuild@vger.kernel.org>; Tue, 21 Nov 2023 09:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700589068; x=1701193868; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F3VZHmlNlu0O99ZtiO5dO2f9VsPMxl7hcUKuMcRux78=;
        b=AAdhhZrGqtO9WX/0FJiROZuuVxqztoHrrSFtt+2EpVaGInKdHxws/PoOYU2IsaOInz
         hGBl/OuVtxzzGzrfbSYTqmia6mywEVuhl1HQtSw5h3+7ydK7fIK3WKvZkdlH27VmqDlJ
         zV//3P5p51mo48JT+JZeH3fCKjTtSaILwEHwoxAOpZOBzuVDJl9zkm0GpeMryT0QNAU7
         uGH8WCu9cqfFfgQWBt4SDGKLB08+7UWZZosv3kKzEydhTcI6YTFBTRMwzlOrKR0gZtlv
         3te1yyRC0hfjEwnStAXjVLzjibVChSauDsEl4Ueu9c0Cobi+r7vOZE3HEQWZyx6W3lBD
         yJaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700589068; x=1701193868;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F3VZHmlNlu0O99ZtiO5dO2f9VsPMxl7hcUKuMcRux78=;
        b=AwLe4Vl4lV6U7TNgRMLXZMFok5j59XUeu5gjE74Cgtd9UEWrguj6rP4YRg98JElsJM
         3INNtDaaxFeCvUhAQ7jEXVpMlyNQNqC7aRPHtyUAR1uQTFS0LZPqeWD8oJbZ0sXrWKaE
         ynfgol6vahGgH21cJQ4RTVr7DFd61OOcyH2OhtFSFPeG9GIakV0YGjsM6Ajmaupk7Qo5
         jJVGiOR78Zw9fBLRHHDAay4gQBuNjKU51paldteTLf53eeFMdjRfkly5UgjSn7rrWOWX
         P2iZY8ntmlambz/ND7v6xXvzBIDLQG0ZJZAelgFL6vPcQwpvX0PQA1XGXW0wVVxdKqAR
         ggtA==
X-Gm-Message-State: AOJu0Yywjx/TMo4N4TcZp1JjxH0LFVX1pfT55SmBMNo+NvPrUtKyjoC7
	d/A0BW+d4iRYj1r4ysTWYleKQg==
X-Google-Smtp-Source: AGHT+IEIMVbZd/opiVLMX9t1gte/ruLkANfduOCEUWfGVPu+dBFO4cz1YKq267xfZYCyskPVuqaPog==
X-Received: by 2002:a05:6602:4f44:b0:79f:d4e6:5175 with SMTP id gm4-20020a0566024f4400b0079fd4e65175mr69374iob.16.1700589068654;
        Tue, 21 Nov 2023 09:51:08 -0800 (PST)
Received: from ?IPV6:2605:a601:adae:4500:9465:402f:4b0a:1116? ([2605:a601:adae:4500:9465:402f:4b0a:1116])
        by smtp.gmail.com with ESMTPSA id t5-20020a056638204500b00466526e1e02sm1663632jaj.135.2023.11.21.09.51.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 09:51:08 -0800 (PST)
Message-ID: <218f068c-40b5-4f93-b26a-c300054be11e@sifive.com>
Date: Tue, 21 Nov 2023 11:51:04 -0600
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv: add dependency among Image(.gz), loader(.bin),
 and vmlinuz.efi
Content-Language: en-US
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, Simon Glass <sjg@chromium.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org
References: <20231119100024.2370992-1-masahiroy@kernel.org>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20231119100024.2370992-1-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2023-11-19 4:00 AM, Masahiro Yamada wrote:
> A common issue in Makefile is a race in parallel building.
> 
> You need to be careful to prevent multiple threads from writing to the
> same file simultaneously.
> 
> Commit 3939f3345050 ("ARM: 8418/1: add boot image dependencies to not
> generate invalid images") addressed such a bad scenario.
> 
> A similar symptom occurs with the following command:
> 
>   $ make -j$(nproc) ARCH=riscv Image Image.gz loader loader.bin vmlinuz.efi
>     [ snip ]
>     SORTTAB vmlinux
>     OBJCOPY arch/riscv/boot/Image
>     OBJCOPY arch/riscv/boot/Image
>     OBJCOPY arch/riscv/boot/Image
>     OBJCOPY arch/riscv/boot/Image
>     OBJCOPY arch/riscv/boot/Image
>     GZIP    arch/riscv/boot/Image.gz
>     AS      arch/riscv/boot/loader.o
>     AS      arch/riscv/boot/loader.o
>     Kernel: arch/riscv/boot/Image is ready
>     PAD     arch/riscv/boot/vmlinux.bin
>     GZIP    arch/riscv/boot/vmlinuz
>     Kernel: arch/riscv/boot/loader is ready
>     OBJCOPY arch/riscv/boot/loader.bin
>     Kernel: arch/riscv/boot/loader.bin is ready
>     Kernel: arch/riscv/boot/Image.gz is ready
>     OBJCOPY arch/riscv/boot/vmlinuz.o
>     LD      arch/riscv/boot/vmlinuz.efi.elf
>     OBJCOPY arch/riscv/boot/vmlinuz.efi
>     Kernel: arch/riscv/boot/vmlinuz.efi is ready
> 
> The log "OBJCOPY arch/riscv/boot/Image" is displayed 5 times.
> (also "AS      arch/riscv/boot/loader.o" twice.)
> 
> It indicates that 5 threads simultaneously enter arch/riscv/boot/
> and write to arch/riscv/boot/Image.
> 
> It occasionally leads to a build failure:
> 
>   $ make -j$(nproc) ARCH=riscv Image Image.gz loader loader.bin vmlinuz.efi
>     [ snip ]
>     SORTTAB vmlinux
>     OBJCOPY arch/riscv/boot/Image
>     OBJCOPY arch/riscv/boot/Image
>     OBJCOPY arch/riscv/boot/Image
>     OBJCOPY arch/riscv/boot/Image
>     PAD     arch/riscv/boot/vmlinux.bin
>   truncate: Invalid number: 'arch/riscv/boot/vmlinux.bin'
>   make[2]: *** [drivers/firmware/efi/libstub/Makefile.zboot:13: arch/riscv/boot/vmlinux.bin] Error 1
>   make[2]: *** Deleting file 'arch/riscv/boot/vmlinux.bin'
>   make[1]: *** [arch/riscv/Makefile:167: vmlinuz.efi] Error 2
>   make[1]: *** Waiting for unfinished jobs....
>     Kernel: arch/riscv/boot/Image is ready
>     GZIP    arch/riscv/boot/Image.gz
>     AS      arch/riscv/boot/loader.o
>     AS      arch/riscv/boot/loader.o
>     Kernel: arch/riscv/boot/loader is ready
>     OBJCOPY arch/riscv/boot/loader.bin
>     Kernel: arch/riscv/boot/loader.bin is ready
>     Kernel: arch/riscv/boot/Image.gz is ready
>   make: *** [Makefile:234: __sub-make] Error 2
> 
> Image.gz, loader, vmlinuz.efi depend on Image. loader.bin depends
> on loader. Such dependencies are not specified in arch/riscv/Makefile.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
> Changes in v2:
>   - Fix commit log
> 
>  arch/riscv/Makefile | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Tested-by: Samuel Holland <samuel.holland@sifive.com>


