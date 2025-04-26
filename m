Return-Path: <linux-kbuild+bounces-6751-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E51A9DC1F
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Apr 2025 18:15:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A53667ADB5A
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Apr 2025 16:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4971A25D21A;
	Sat, 26 Apr 2025 16:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jXrhedVf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7595C79CF;
	Sat, 26 Apr 2025 16:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745684099; cv=none; b=knSz5msAuBg6YBpnzScNnhA/e/o2nESl3Y/O1QQmx35ZDHcygwjIxW4kSf27XbzMlg1/dQN3pyMgAgWv1Dp+ymVRiyjR/aEcQOjb9/FS9fX/17vhc/R8KIJSg11vTqye19lCM0lEGX3Ji38EX5uwDx0O1VA3+zDAAe7ZI5TOi0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745684099; c=relaxed/simple;
	bh=aRXOw8MWfKyLqraSU9LuH+0mAXYs2vAJQZ/x01aNlts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UILZb4xwGwPIPzQw3EtVOE76GNIFm8ePxeHn7BPiC70JeXJK6VsAusOJ1CkF28OuokA4j3slxG+WBHJxkYaKpKp7Xwz+Txex1ZHZ7QqI4iG/OMeovcSBTOf3E5xnXcntPyCska9iN5bb6wwgZKtYJDom+U3cdnc92bBENUeeR34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jXrhedVf; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so31492845e9.3;
        Sat, 26 Apr 2025 09:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745684096; x=1746288896; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N6W9PLDgWdZ76gIPg7wS39+C+2C+d0RjKyz++Ot4Nrk=;
        b=jXrhedVfiQlReHw73K3w6AZwXRS0s0v+tfC34J6XvzhnZwfvwn5Krg22tt1XbhbvHq
         AATjVsFrFwN6qGBVEcdqxBJRcReGzUHPIwehHIDjNC08c3LyrFOSHah+KXna3JuVq8cd
         zCPQop+2J8sCtWC5/i0XCQv1Yxvdy/LahRmMODPKzaJYoJvDeU6NXIXdYzoUC6H98LBM
         8R6GOYyrOynxB8/vXBcRIg9YrtyE5Gxia5xQjkRsZg0971fhN0XzeUKwjaCZLHgwyajO
         ih9JP23EPJCznKqxd2Vtjh34/IVsPk0BG0FhpAx3LOqZjuJHOQ9df6hfAxA0OU67xQNI
         oo6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745684096; x=1746288896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N6W9PLDgWdZ76gIPg7wS39+C+2C+d0RjKyz++Ot4Nrk=;
        b=NhSdpeSERKkWgiRnMA3qP3CIlVPDxicRhEi2C3mZfzA3OCMt7KpwkCMbg0XxTZhT7A
         pD+itee/9ECYXGlVnZbWISSiou9HDi9a5Wl66ZsKzrgKSXGtADEdM1Zn3m4fSuKaIR60
         yB0Y6i/Rjfz99hWAtRDinv5KMmUiIeeQOAW1OqrgHeg2uDkO9hodRbUCav1+r6rcRXkh
         l3fA/DuCH/yR7WoCCXy73Mf4nl/BiqpudXntlQzfLl7phg3HpLObNoa4coDGUh8L87zs
         6oeumAMv/qfYZYNc4VtDCuYJgE+AhorQ9A6yp8XLL8Uviy5V+Mdp/1+hNbURzoeogzCU
         ebhA==
X-Forwarded-Encrypted: i=1; AJvYcCW2tXZ06lkY0KSXNkbB4+R/SUG76BxzdpsDpBBI6FIrvfDkyOia44OrVOYMnq0W6nWPKQwYh249C6peMKw=@vger.kernel.org, AJvYcCX4hacC53XPZ3bPgQ+y3cdOgiEHPHL4N3YxM0OMsorDgIriV5/59xkSJMUEKvwdI3SzTVtDysQWDHY94G/l0gM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzop1RLz+c8xvZUWY0v7mHdbxkTlAfTcvyVxozsHVOXErd1vc1b
	bXLDVTcOeWUSfdn5Nb4Sqq28QZ2mK4FsYrYnue6uMqiYcbOcEpnj
X-Gm-Gg: ASbGncvR21B2uT71NyKSsM2ISj/KoFg0k83HQFxPDOp05cSRUd7Ag/rqIoNnk+x6/bF
	ul+rD/gTlxIbKEjwbmSKjWSXoRinSgDRfW8yPBjbRTfXwWXh1umwuZMjfZYgRyRrtOFzXf+Fouf
	nT5bVhVEtc58qN4PMOjY2GbBERir+gCjEP/+utS5ZIfyowbKF/hv2ecErEFqItchRfz9sYYQXy6
	rMJnWltaogGH3tsi0Y4hhgTCQRAEPnJS4UgUt5SZKSkVzY78wfG2Wm2JdcxY07CYWbA7j5SOVx/
	pgHeFVCw+C5drkysYwfW67Sp8F17dvc8UbndmCi3FrGau1J1pkY0AXTeBFaIveTmxKExgdDUCBF
	5YjB6
X-Google-Smtp-Source: AGHT+IGDUFw0iTMIHLK69UpcIn/B+Z9R2PRxhkc7bU7W/J6G8wmeg3DRGBHkLP9EbKbBE5uzPljtcQ==
X-Received: by 2002:a05:600c:1d06:b0:43d:1f1:8cd with SMTP id 5b1f17b1804b1-440ab84518bmr23742305e9.24.1745684095301;
        Sat, 26 Apr 2025 09:14:55 -0700 (PDT)
Received: from localhost (cpc1-brnt4-2-0-cust862.4-2.cable.virginm.net. [86.9.131.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46517sm5979740f8f.71.2025.04.26.09.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 09:14:53 -0700 (PDT)
Date: Sat, 26 Apr 2025 17:14:53 +0100
From: Stafford Horne <shorne@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
	Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	linux-openrisc@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] usr/include: openrisc: don't HDRTEST bpf_perf_event.h
Message-ID: <aA0GfU513267ndkY@antec>
References: <20250426030815.1310875-1-rdunlap@infradead.org>
 <aAx2eAa2yyjabL2L@antec>
 <fb18f076-9bb4-4769-a0ce-e3c03ea0e101@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb18f076-9bb4-4769-a0ce-e3c03ea0e101@infradead.org>

On Sat, Apr 26, 2025 at 08:45:38AM -0700, Randy Dunlap wrote:
> 
> 
> On 4/25/25 11:00 PM, Stafford Horne wrote:
> > Hi Randy,
> > 
> > On Fri, Apr 25, 2025 at 08:08:15PM -0700, Randy Dunlap wrote:
> >> Since openrisc does not support PERF_EVENTS, omit the HDRTEST of
> >> bpf_perf_event.h for arch/openrisc/.
> >>
> >> Fixes a build error:
> >> usr/include/linux/bpf_perf_event.h:14:28: error: field 'regs' has incomplete type
> > 
> > This looks ok to me, but do you have any pointer of how to reproduce this?
> > 
> 
> All I did was 'make allmodconfig' or 'make allyesconfig'. Either of them cause
> this error.

Thanks, I was just now able to figure this out after some more reading of
usr/include/Makefile.  As long as I have CONFIG_UAPI_HEADER_TEST enabled the
HDRTEST's will run and I could produce this.

I suppose this should go via the Yamada-san's make tree. So:

Acked-by: Stafford Horne <shorne@gmail.com>

> > -Stafford
> > 
> >> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> >> Cc: Masahiro Yamada <masahiroy@kernel.org>
> >> Cc: Jonas Bonn <jonas@southpole.se>
> >> Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
> >> Cc: Stafford Horne <shorne@gmail.com>
> >> Cc: linux-openrisc@vger.kernel.org
> >> Cc: linux-kbuild@vger.kernel.org
> >> ---
> >>  usr/include/Makefile |    4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> --- linux-next-20250424.orig/usr/include/Makefile
> >> +++ linux-next-20250424/usr/include/Makefile
> >> @@ -59,6 +59,10 @@ ifeq ($(SRCARCH),arc)
> >>  no-header-test += linux/bpf_perf_event.h
> >>  endif
> >>  
> >> +ifeq ($(SRCARCH),openrisc)
> >> +no-header-test += linux/bpf_perf_event.h
> >> +endif
> >> +
> >>  ifeq ($(SRCARCH),powerpc)
> >>  no-header-test += linux/bpf_perf_event.h
> >>  endif
> 
> -- 
> ~Randy
> 

