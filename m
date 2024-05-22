Return-Path: <linux-kbuild+bounces-1915-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C89868CC059
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 May 2024 13:37:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60E961F22444
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 May 2024 11:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2E3582886;
	Wed, 22 May 2024 11:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="CHuq6u2J"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A02A82486
	for <linux-kbuild@vger.kernel.org>; Wed, 22 May 2024 11:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716377841; cv=none; b=eJ0fxZ+RgpWsiAkuTxgM8FfEg6on5TaoyIylK1Ob+sBA3MMz78qKnSP2byQFnXxGVed0zKzjHUNkAjZnD4/kubtMvDigrMbwFmjDkMGnJNlWKaNpX0v2DeOQ++/1a2XJVs9ECEhI1akDe5PvJMbMItzFoavHZuMsKpvnewVRIcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716377841; c=relaxed/simple;
	bh=ohpms8ssANJVFoaDki2np0GgbqsNCMxT9R6sKGwuFqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kYKsj4yp4/L6zQUbNOCsH7rnXcJ3vyP2kPspG6eVPbcYfaEL1qlB3NZXbCVrqshWzxw5n3Srj+oZeC/w0KhDeb3QWvvWnpNlI19YnenxL4AMZiEdBbGBla1V2M7r6jhtDR3zRoY8U9qy8gVlHmFgJlrmad7NU5u3+QEXFReldBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=CHuq6u2J; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-572a93890d1so11101868a12.3
        for <linux-kbuild@vger.kernel.org>; Wed, 22 May 2024 04:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716377838; x=1716982638; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5Ptb2sWzcgU+/pWuZsipU8bjPMNKPiOC3GCFAmIOk8I=;
        b=CHuq6u2JY4JsBv01TIOR6O6dddh/pS876vZ2qtQsPChYsw5tzRLhDxZYqZBJcqkbx6
         vnoPkpTxKOApGe6G8SEqBnWwMdASPRUEx46iSbPNupsRKqTlOK2y4yKia6Xo8v43dS+X
         hCxHW7yrRkoxOlibokHT8twiKOs6AhdKgNQBm4MrtiW8QsHqsFUseflBuV5PDX/wSabU
         lzNV3q50EHrIZflvrds58S8RlTuwc4XR1tUkuJFlwd0bkcbueQkmSqvkQipU1ylAOjhi
         gCS0B54YIldyrRCfMoE9CLe+FcPDf8gY3YCHUq8eEhorHzNpeysqtoBBY1APAhkSqLVN
         2r7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716377838; x=1716982638;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Ptb2sWzcgU+/pWuZsipU8bjPMNKPiOC3GCFAmIOk8I=;
        b=qI3lTQ/+RaW3zXfdgA4ZgGGYfRFknsHnB4R4Sf344kM0VyN86p9FZj8hO0M8fAhLC4
         DEHMmSBu+c0VM3+AnzNPMBG6b7nf4hjykyhJrLQCvhAjeDj3+XRUF/71b1AiCnANf7Vm
         HFiufX2rBkLomBOOUgZkYG4BBqfHvSrnanhu4jZ/GJs0uGI4mt6XyWhGmAzaVLgUTMjd
         NSdAcJgxMNhRV4zEw8zcKFUKdKnwGKF2MorqHdKkPvsTqmLLv1rMk4Lmpy1RqtGgk+Mk
         FHssLnoSrFyCKR0iDH6/KXPOfLlR+iMlcZjiwFbA9S+SCiRjHcdUAZJEV314VijLPe4F
         X5gg==
X-Forwarded-Encrypted: i=1; AJvYcCXCNx5LKWFWdV+1Enh7h+HevkMbXD9Ou3dKawyRdMlAFygcv8wPHZUKJOXUOADYb88o0KM6vfLoH+dA5qQKfedIW+U8qdTN090pnI16
X-Gm-Message-State: AOJu0YxWBWliz3E2aj0s9duicuQ43VrcVaxEVJkVE1zqP0JmZ7iCSC7a
	HX4mpwnt56+wiz2HV8Mch0X8vAp8rVWfDAQJUzILF/Vq2/HPk/fTZtVfIWPLNUkEZcBFOAoEUlS
	I
X-Google-Smtp-Source: AGHT+IExl6EGuLlspJ3UkC1uRIX9L3WPWeeW1cTdzJEV7Da71NsJLbwitPi51l2QjtpfQ62N0ScZlg==
X-Received: by 2002:a17:906:fa88:b0:a5a:2d0d:2aef with SMTP id a640c23a62f3a-a62280d4fdemr164881566b.21.1716377837646;
        Wed, 22 May 2024 04:37:17 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a44f9581fsm1562314666b.196.2024.05.22.04.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 04:37:17 -0700 (PDT)
Date: Wed, 22 May 2024 13:37:15 +0200
From: Petr Mladek <pmladek@suse.com>
To: Lukas Hruska <lhruska@suse.cz>
Cc: mbenes@suse.cz, jpoimboe@kernel.org, joe.lawrence@redhat.com,
	live-patching@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, mpdesouza@suse.com,
	Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: [PATCH v2 4/6] livepatch: Add sample livepatch module
Message-ID: <Zk3Y60KxKfbrVc9s@pathway.suse.cz>
References: <20240516133009.20224-1-lhruska@suse.cz>
 <20240516133009.20224-5-lhruska@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240516133009.20224-5-lhruska@suse.cz>

On Thu 2024-05-16 15:30:07, Lukas Hruska wrote:
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
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> ---
>  samples/livepatch/Makefile                  |  1 +
>  samples/livepatch/livepatch-extern-symbol.c | 84 +++++++++++++++++++++
>  2 files changed, 85 insertions(+)
>  create mode 100644 samples/livepatch/livepatch-extern-symbol.c
> 
> diff --git a/samples/livepatch/Makefile b/samples/livepatch/Makefile
> index 9f853eeb6140..f2b41f4d6c16 100644
> --- a/samples/livepatch/Makefile
> +++ b/samples/livepatch/Makefile
> @@ -6,3 +6,4 @@ obj-$(CONFIG_SAMPLE_LIVEPATCH) += livepatch-shadow-fix2.o
>  obj-$(CONFIG_SAMPLE_LIVEPATCH) += livepatch-callbacks-demo.o
>  obj-$(CONFIG_SAMPLE_LIVEPATCH) += livepatch-callbacks-mod.o
>  obj-$(CONFIG_SAMPLE_LIVEPATCH) += livepatch-callbacks-busymod.o
> +obj-$(CONFIG_SAMPLE_LIVEPATCH) += livepatch-annotated-sample.o

It seems that the sample has been renamed without updating
the Makefile rule. There should be:

+obj-$(CONFIG_SAMPLE_LIVEPATCH) += livepatch-extern-symbol.o

Otherwise, I get:

make[4]: *** No rule to make target 'samples/livepatch/livepatch-annotated-sample.o', needed by 'samples/livepatch/'.  Stop.
make[3]: *** [scripts/Makefile.build:485: samples/livepatch] Error 2
make[2]: *** [scripts/Makefile.build:485: samples] Error 2
make[1]: *** [/prace/kernel/linux/Makefile:1921: .] Error 2
make: *** [Makefile:240: __sub-make] Error 2

> diff --git a/samples/livepatch/livepatch-extern-symbol.c b/samples/livepatch/livepatch-extern-symbol.c
> new file mode 100644
> index 000000000000..276a43d157b4
> --- /dev/null
> +++ b/samples/livepatch/livepatch-extern-symbol.c
> @@ -0,0 +1,84 @@

The test module works as expected after fixing the Makefile.

Best Regards,
Petr

