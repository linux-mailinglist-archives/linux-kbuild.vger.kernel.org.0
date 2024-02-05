Return-Path: <linux-kbuild+bounces-833-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68635849BFD
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Feb 2024 14:37:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F16028500E
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Feb 2024 13:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 623EC1BC4E;
	Mon,  5 Feb 2024 13:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FwI6+fkk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C9F22EED
	for <linux-kbuild@vger.kernel.org>; Mon,  5 Feb 2024 13:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707140228; cv=none; b=lcgpEqe5hSTGIHFTrzbPvjSP5uDE2DXyqArCSHP+lJ3X99zBv5gH4da7AORldEoYF5/MA8BbOw6NqS7uuOp477Rubcfn1Lw9f3zgNF6EEDefEX2DVvSbt7YbXGruMlZEC+Zc95JBaJ3qbbOpSTfa/hbO7GrlRN03kDG7VETakLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707140228; c=relaxed/simple;
	bh=fOSFDRKimv2ug0bZCZy4PNZkl8RruJjLYbcI79qt6K0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bxkuEe8bvtPpoqtYR6DqiXsRCnTcECc7m7XW5XSfGZ5DKkz4bixF5FiLEGL71fcNohZ6fNqPmGWSpD12P/zTthyNBSLVBoug6iFTg1qxI3kblq0w4v95Q/LbioTJP3QV1Vn/XpuFgwRITTeA9jb3WIYeltiAsBFx9TCf/2JQCEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FwI6+fkk; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-55fc7f63639so5043380a12.1
        for <linux-kbuild@vger.kernel.org>; Mon, 05 Feb 2024 05:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707140224; x=1707745024; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dhvBPdCRvn2fx27a6ngoUG20w6mdfBMhz1CdhmSbPVM=;
        b=FwI6+fkkYZEvjklRknU6DXSRMsmYvun/rAGakkPyokQ3L3/ELUaILvjvHRHiao8pe1
         v2TWheu7U7NbJbRBQJOmI9tl7byi2xgVgGN0b7rD+bBZbPOAZqxxTY0EPHeZyqfTOTsV
         AvBQokLzb8sxPdW5qXZeN7Ywyo259gCL4zgUTBzqiMT3xPAPUx7oHocNPVWDNoWukibg
         Jkiswh7v6n64/V14VLK9VIscbfBcZmI7mHwjSaDdF4C/ieGz2cRy4zB0I0K0CvMhjIfC
         jYXyeKhaRdpi03QaBhY9PqFG0RddCjXcCbKOEgdUTC9Uree/S+RXo2Tl8qaS+IGxhfpt
         WBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707140224; x=1707745024;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dhvBPdCRvn2fx27a6ngoUG20w6mdfBMhz1CdhmSbPVM=;
        b=MwfBrb1dU+vBQWTBH5JzYNugwYZ43xW5K/3UV7a3WKgyGVq9VXcDoGJcM0cc7XogLX
         uErt3hjmGQPWBGSJdHenzVvm1zf6pjiCqw6uxblZvh8na0cbEFQJN0JYWbSl50RczH7k
         k2Ao8tNXFHjY5BwxQPyuSUvUMaDHJ/K1FojvsxmXu0scA2T6GKIQ6ZJaigfsrs+3iV/p
         crley7zQOqjlYruYJzKMUD+Z+f2EtGGcfOkZP6CAK9LNyhmxWvVsl6avY0oP3i67+WKq
         w294ljxNcWw07C2K34ipwKPh2+n7MQxCeCQxVC58PrMCGdn9CWtxlWQ0/xItzPTYusrv
         9DfA==
X-Gm-Message-State: AOJu0Yy7IiUlcYLzbTpsrodBLlMk67xl2XanskQP/a9FZ+oxyiTRco5/
	jvl8pDRm4mlvdSst+nFiIyozx9IBLLk+7gsPVCw1ty9LMp8dNX6N5MSNqxm/V/c=
X-Google-Smtp-Source: AGHT+IFQjIpuSLDaVihr1fAeiTdUd1YkcJC0Qwa57kAqFLwOw5qPxXGFof2zMQ2wswOhBIEVO4Curw==
X-Received: by 2002:a05:6402:c90:b0:560:9277:80e5 with SMTP id cm16-20020a0564020c9000b00560927780e5mr191763edb.21.1707140224244;
        Mon, 05 Feb 2024 05:37:04 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWpleoW46IqW890YUCLtdnFwv+xQJHmszP0iVOwBL69TtpmHv4t1KzBGTuvqFXMV8IdHmuuWHcqgMmvc4q+Z0mAmvTVgQqAyng7GsB6Zsl7FKTNm6PxQdf0+ogp5NZltPThrv+Rqma0Igs8VmefyHznN3fKFLLLsAMzGJpRSTc4VEtY6IFjHXbMis2zJZtDMIFTRtqh/dS57xrWDOhHJN95wkj+inD9k6ISVaVg+xDTa3EGNrdxbRCqFfW0+myqMDvf/kaBNBzQq80Po8mGF0uuTQ74M9FRfz+Fm6f7NP0DQ/fb/mYBDzqqezrO8lD4JQajeiQLA4OFT+aMrgcZwDTUtxultQWw3Cym1WTenEt2fU+LvBBhPghurpIqMc/n5CRy2b51Pe5jzY4DBvFIq4a3UibU6YdXmzfS7l3B7eUj+sqKOKbAo8fgOSbzmWDhzvW/OvItjDPiC3i/gx3Q0Mnj5DaUKZ6lemZoB8HWTiW9yQN0ZXZlSBgD4u60rNHe6yLOclgiFgZJ4EVigC0DWo2OUYYUE2UJj0JKi4ilWfc3wd8fVqKBZElKfPiPtlvxHklwS5TaT84ywvUPjPqF6cH7u5ciZRpIPmO25gjc4m2tFRTQzFUW3YAgFyEaxR81t52+Jp2nZtHIGLU8iX0Erk38ZlgXGpkAtFZFwvFHaNvFiVKbRLfXmK2N00rQpn9eV8pdFfX6DaaGLzDVl1YRgvop7+sNe7ZeiqoJsLhbRNSifYH3Z9pLB6/iGsS99qiVGTA0+f6U
Received: from alley ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id e21-20020a056402149500b0055f4fbc32ccsm3782761edv.89.2024.02.05.05.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 05:37:04 -0800 (PST)
Date: Mon, 5 Feb 2024 14:37:02 +0100
From: Petr Mladek <pmladek@suse.com>
To: Yoann Congal <yoann.congal@smile.fr>
Cc: linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	x86@kernel.org,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Borislav Petkov <bp@alien8.de>, Darren Hart <dvhart@infradead.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"H . Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	John Ogness <john.ogness@linutronix.de>,
	Josh Triplett <josh@joshtriplett.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Subject: Re: [PATCH v3 2/2] printk: Remove redundant CONFIG_BASE_SMALL
Message-ID: <ZcDkfmDt2XRq5YLA@alley>
References: <20240204232945.1576403-1-yoann.congal@smile.fr>
 <20240204232945.1576403-3-yoann.congal@smile.fr>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240204232945.1576403-3-yoann.congal@smile.fr>

On Mon 2024-02-05 00:29:45, Yoann Congal wrote:
> CONFIG_BASE_SMALL is currently a type int but is only used as a boolean
> equivalent to !CONFIG_BASE_FULL.
> 
> So, remove it entirely and move every usage to !CONFIG_BASE_FULL:
> Since CONFIG_BASE_FULL is a type bool config,
> CONFIG_BASE_SMALL == 0 becomes  IS_ENABLED(CONFIG_BASE_FULL) and
> CONFIG_BASE_SMALL != 0 becomes !IS_ENABLED(CONFIG_BASE_FULL).
> 
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

