Return-Path: <linux-kbuild+bounces-477-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 111448254FD
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Jan 2024 15:14:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBAF21F2381A
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Jan 2024 14:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 795B82DF7E;
	Fri,  5 Jan 2024 14:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KrIM+16U"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354832D7B0
	for <linux-kbuild@vger.kernel.org>; Fri,  5 Jan 2024 14:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-50e5a9bcec9so2046506e87.3
        for <linux-kbuild@vger.kernel.org>; Fri, 05 Jan 2024 06:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704464047; x=1705068847; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3MJaHAszdZUSCF8RvYD7/rtww+NTICg/HaM50PxxxFg=;
        b=KrIM+16UDatjqps6jvuMQntnN4fQsBi505x73hvgiKO6tPmfHScprXweNqNskNlsEK
         3F+jsTE4Y3SxSsyYu6937WkLAeUVWScJI/U2zN3BW451PZ1ltZfVR5JN4XaHHMVgXu1c
         3la2oQX7ZVDW0g/yTAcXIxjpYLKLjk/tWO72eKGq7nNgNdYIV+3MzC3bW/zxW0D2YqfY
         uhjiRTpWznQSX3B7gZfsBxXSGkGEo8Zfg8DdDqf2z1FBHAEaQexZz64dpdvB697Zlq1p
         fNHx+0wfuHR4NHVFNiTmj/zUfbMYqDNzHoViDSPgeJa1A7JQ6HTEPo4ITlsWP+dF+eFW
         ZSBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704464047; x=1705068847;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3MJaHAszdZUSCF8RvYD7/rtww+NTICg/HaM50PxxxFg=;
        b=Ie6d+0kQ4cmPLrO6O31o9IdsHYn2nY9BZJq79r275zn+JbCJLe1DXYj8soCHLuAEms
         Zpa7qsyaKiTe0Lo5BG2WAEF79+lLzHGvB8F4vbQlWQElBRY07xLm+b2pFPPRQZ1o44SP
         ViXgpu+/XdljZdrP9Tbu3Bzgtr1WTlvzNJgJO3i2lN+hAIp3PBSUy3hPl6gHro8Adp2l
         bqHpRGtodw3C2be3i73CdaB8iYhzMCVpKCLL5+/GKgcZCI0JYKb7o0zfDYBoweCKH+UY
         6Htc3QWPe8DOg/kr9eGDn/eQSKH4ynyyScomsgwrGVv68K/TWFU5I3mly2/tdQBVktQ0
         Fxug==
X-Gm-Message-State: AOJu0Yxx0tWSRnsomk2oD3RIN7zjRTIx3hi165vVPxtLYqwqyYx+1ndu
	TEyecAveJw6S6VFIXh7v3HNpLRuJG/HxcjgvsyvmTa3T74U=
X-Google-Smtp-Source: AGHT+IFeKM1LlOQPyyTZ0B0WVH7ZWC7qc5rKZz306f28ArUewWCUHKflALSNQ7ngQWs2NuepHlMg1A==
X-Received: by 2002:a05:6512:3f0e:b0:50e:7fb5:a07e with SMTP id y14-20020a0565123f0e00b0050e7fb5a07emr1430322lfa.56.1704464047235;
        Fri, 05 Jan 2024 06:14:07 -0800 (PST)
Received: from alley ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id q10-20020a17090609aa00b00a27b4e1b189sm907164eje.209.2024.01.05.06.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 06:14:07 -0800 (PST)
Date: Fri, 5 Jan 2024 15:14:05 +0100
From: Petr Mladek <pmladek@suse.com>
To: Lukas Hruska <lhruska@suse.cz>
Cc: Miroslav Benes <mbenes@suse.cz>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	live-patching@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: [PATCH v1 4/5] livepatch: Add sample livepatch module
Message-ID: <ZZgOrSgNGQGpJ6_L@alley>
References: <20231106162513.17556-1-lhruska@suse.cz>
 <20231106162513.17556-5-lhruska@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231106162513.17556-5-lhruska@suse.cz>

On Mon 2023-11-06 17:25:12, Lukas Hruska wrote:
> From: Josh Poimboeuf <jpoimboe@redhat.com>
> 
> Add a new livepatch sample in samples/livepatch/ to make use of symbols
> that must be post-processed to enable load-time relocation resolution.
> As the new sample is to be used as an example, it is annotated with
> KLP_RELOC_SYMBOL macro.
> 
> The livepatch sample updates the function cmdline_proc_show to print the
> string referenced by the symbol saved_command_line appended by the
> string "livepatch=1".
> 
> Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
> Signed-off-by: Lukas Hruska <lhruska@suse.cz>
> ---
>  samples/livepatch/Makefile                    |  1 +
>  .../livepatch/livepatch-annotated-sample.c    | 84 +++++++++++++++++++

The name is ambiguous. I would use something like livepatch-extern-symbol.c

Also it would be great to prepare a selftest. In this case, I would
suggest to livepatch a symbol from another test module so that
it does not modify the running system and the result is predictable.

Otherwise it looks good. With a better module name:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

