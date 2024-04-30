Return-Path: <linux-kbuild+bounces-1721-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2D38B81AF
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Apr 2024 22:59:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C505E2849EC
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Apr 2024 20:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9FFF1A0AF8;
	Tue, 30 Apr 2024 20:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="glexBrpf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAC88F6E;
	Tue, 30 Apr 2024 20:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714510750; cv=none; b=X4yF7c+GD7gsnJvj5T2fSCqPb+AlZzWtvn4QfeaPb+YkCH2h4jlINQSGXj2Sz0YFCTSaDAAfOrGQYpZScfgd86SOweLS+DtnpDSfNTJsqIsOPzXDgaV87zpMS7NH+Sy5cXTN0/y/PbX1sqsePg4zXLZyrsrDsS9qOhAXi1SyjK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714510750; c=relaxed/simple;
	bh=pjgtyfnh5tFTSw52lMGUaW48/HjGzACxafZOrZ7CAyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HiDCXLutT7Y7rxBk6XY5nPKwskUKYOyXUW5kthFGu1vDA+OlBO0uVA96Rvnt0VjTnzTjDlpW0m5nvJlANViYV5Kj66GeA8+aU3mxxdCYovhJoXq56oThLurg5A5t3hyDPmmup4crgz1OhjINlHQLeBQQ2kA4YaYsXhMONwmNeYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=glexBrpf; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2af800ff18dso5166284a91.1;
        Tue, 30 Apr 2024 13:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714510748; x=1715115548; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QUnRfl4tqgq8HasBCd3KnwmOL/6GB2kU7j+bDTzwvdw=;
        b=glexBrpfc9eLv8UIay/NFaBV7Ei+kFBlMy3YURmIBBJtPg3qHni7bMDTR5o8umoyzA
         vrmZcX7sEXxeN9MTXCefCsXEzerDdVgPnB+GcT/SY/uedgIM4gUrPqBUeFGAgz6QaElE
         pierv5ugE4adEE0rcTnxlMj34aeMS3TlYoyIKs6wi1g++ptw3NPZj+EBJAKj7lmjzj2F
         01mm9ZsVZ/fFEPOg2xHZR+aMtDlcvH+kQyFQIgxfEV4uGdhIMRsNov+6hVCCb1vNz7Zl
         ceVck6j5KuGiap0fZ1TReeZvUdZRSJinKEwxe+hCZpF3lNUY0MqbnVxab8/FNjIl4Ctk
         pncw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714510748; x=1715115548;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QUnRfl4tqgq8HasBCd3KnwmOL/6GB2kU7j+bDTzwvdw=;
        b=jyf1tzdMhQR6KAaYjkf4PvvA510Lck7Xta1RO7U0VthcOItJuiwxr1eA6YyiSl2BSE
         ikYMWEysgb3mY2GolKbur6zR/zx0pWWlQc/+Kf5iJ/ITzNoO78Y6NPPRIbZrq0INckI6
         JkadhI4PJtarksDR28anbA/BaeW2Ey97Jzlz0xIN/6fUTy98GW7hdvUUCwkHwPRIacoE
         snqxkBCtW33UmQfVpwp2Fo7qIOIJbFOKamf9QSlPolev8ENhfhmpE0v9/L/alJ/gFxLe
         /A/7y/pIAzJcVPmf/tCUkAuYNbLdhVnGcNk3JYVTxEQatrhxO8LdLbdg9AcpuQXQ0Kf/
         tnCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvj4Kr7cecolskiQek/0FA/gimi1IFRyEMNFqdwQLh0kVYOGF08iNlHfKsG8jUHRYyQNBbOtSiPWuSIciGbbSKcJlZ54Xnl/2b95a9
X-Gm-Message-State: AOJu0YytDm74v+9NsprSH3E/B+4mkg2Pj/1mcscOqkMpCG37qXs+Kgy4
	maNWlM6I3dRIzgD8AVOv/ez6bcHpMSV1zDa9WFzuI5YjEx8MR3BPWLeJLg==
X-Google-Smtp-Source: AGHT+IHRmENx/NymYnVttDjBiRAmn1SJdIQxeE1kuKzsUBaoYTajsF13aFKFSiSX2CJ9tua920ouNA==
X-Received: by 2002:a17:90a:15d0:b0:2a6:9c5f:828e with SMTP id w16-20020a17090a15d000b002a69c5f828emr642525pjd.22.1714510748395;
        Tue, 30 Apr 2024 13:59:08 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:68d:41e7:d081:607d])
        by smtp.gmail.com with ESMTPSA id b24-20020a17090acc1800b002a54222e694sm25618pju.51.2024.04.30.13.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 13:59:08 -0700 (PDT)
Date: Tue, 30 Apr 2024 13:59:05 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-input@vger.kernel.org, kernel@pengutronix.de,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] Input: amimouse - Mark driver struct with __refdata to
 prevent section mismatch
Message-ID: <ZjFbmSNUff72Fg8d@google.com>
References: <2e3783106bf6bd9a7bdeb12b706378fb16316471.1711748999.git.u.kleine-koenig@pengutronix.de>
 <ln446wvlcruoglseztao7jwywzxiixyxnx3qxqnm7nmdan6bzt@klbghdi3wwir>
 <pkglwlztl5nj37j4i2ydh4y3ohfx6pt2dilzha5lng5aoaggid@ec2iszqt5nzj>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <pkglwlztl5nj37j4i2ydh4y3ohfx6pt2dilzha5lng5aoaggid@ec2iszqt5nzj>

Hi Uwe,

On Mon, Apr 29, 2024 at 10:29:41PM +0200, Uwe Kleine-König wrote:
> Hello Dmitry,
> 
> On Mon, Apr 15, 2024 at 04:34:53PM +0200, Uwe Kleine-König wrote:
> > On Fri, Mar 29, 2024 at 10:54:38PM +0100, Uwe Kleine-König wrote:
> > > As described in the added code comment, a reference to .exit.text is ok
> > > for drivers registered via module_platform_driver_probe(). Make this
> > > explicit to prevent the following section mismatch warning
> > > 
> > > 	WARNING: modpost: drivers/input/mouse/amimouse: section mismatch in reference: amimouse_driver+0x8 (section: .data) -> amimouse_remove (section: .exit.text)
> > > 
> > > that triggers on an allmodconfig W=1 build.
> > > 
> > > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > 
> > I'd like to enable these warnings even for W=0 builds, so it would be
> > great to get it into the main line soon.
> > 
> > If you apply it, please notice that I fat-fingered the parameters to git
> > send-email and it was sent in a thread. So (assuming you're using b4)
> > you'd need:
> > 
> > 	b4 am -P _ -v1 2e3783106bf6bd9a7bdeb12b706378fb16316471.1711748999.git.u.kleine-koenig@pengutronix.de
> 
> Do you have this patch still on your radar? I guess it's to late to get
> it into v6.9 now, but do you plan to apply it for v6.10-rc1?

I'll get it into 6.9, it is not controversial.

Thanks.

-- 
Dmitry

