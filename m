Return-Path: <linux-kbuild+bounces-1720-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 933968B81AC
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Apr 2024 22:58:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B27AA1C22745
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Apr 2024 20:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DAF21A0B07;
	Tue, 30 Apr 2024 20:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a1h6+y4c"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19D938DCC;
	Tue, 30 Apr 2024 20:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714510702; cv=none; b=XHDXaxa16PJnFpQ/GvrFLQYLCdejwiFUSNtDc+of9nEFBgHp51mNHdx5bsl4n6okKlu7Ja8lc1D3MqeI1x7SX4prq6Ja0S1Uu/NwUZjGXE22JZByEhSdbGXJqeR5iYa7s3IWWf8ih0vqXEbQae/+2H6sHDXWZ5ySXYTqO6pdzpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714510702; c=relaxed/simple;
	bh=juh70v1QnKlE6YVr1EvCbhOVQM6kJ/xctU5ouz6l3PU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jnTUFuENqU9mmPi7KBA9kDIRHtqL1iR5xdC8sxcryWpc6oda9M7uG0+tWkn9dlqu/yEI3wopByNYRVnzUqXq09jszZz1wu0gVjDXr5Jdn1ioK/4cBXQLu9cFXG7d3JWsdXziBF8K1gh9CNo9EtL9jiTI/iZ9tbhcc4W5ciThY18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a1h6+y4c; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1e83a2a4f2cso40832245ad.1;
        Tue, 30 Apr 2024 13:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714510700; x=1715115500; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1VJ0M5pnvy7uRIaQ3cg098+/oboVlusncbI4chD8Is4=;
        b=a1h6+y4cyFpqphodSUkYRQFmv7zeGl2ugGKvXhYZ7Zkggnz8qkUHn3/Z0x+xyEkiN/
         a/kZvHWhBsaW/ZE9LGnazTj2EliMtayJUNDa1TjvogY9G64Nol6hgSyOAaoO11X26Hcy
         4J3P6p9+zqF3mxAVqep6T+waraLQgHMeOoxvHRjdMP8K1jXb4Kjz+K6GGLyiZJviPFP+
         WWFH3p+Ge9NQh7klc7DU6DG2UbuNJzCR64Iv41/FlELWWFVzxLrBtR/teLfbERYv5VF8
         4BnGyuDpPcHc2EWIIZET6+Q+Jqm+mAZrPSnjNquxAmphiy623OMF2a/OP+DHJYtKMEQQ
         g03w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714510700; x=1715115500;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1VJ0M5pnvy7uRIaQ3cg098+/oboVlusncbI4chD8Is4=;
        b=QV10vKKT7GuDbqfd/TE2YSp9wQJIPlmvGGInTWEnz4Gj3M+odppeJfdza0UOLCM7ys
         yPyxzSx5Z226u8QAJSlcDCqoovrkGYhRHDHyXHkjxIPNJuKgHnq0qMvJtNq1zBO8/zsC
         dqUBLnwy8H6ia3YWmuvG2+RHQhxIleIaE31JQasTdD5Rw7l77+vIO87BNzXS6A4+L/8h
         XFZs+cXre7tM/lJhNPHZZC38Ml9XYNJnEMFG3JTX5rpQvNw6Q+ApKXybR4joFHCHHMSS
         AaH2cxaWljUG2BOH8rzghSTobtit/KAS3TNJckcX5r2aUNI8yt0aAZAKvzagOGWNzugQ
         mxXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQXWKfKfgPop9Ch+aC9oVU3+Sl22ACWYZCTMZyV8KO8CQO+wfaLoxs4iDzZxTNgOnyW/3PCc1XoR4zGACuH6eV6ehTQVQ+kd15hR02
X-Gm-Message-State: AOJu0Yy25txJLvh+cl0XHsT8tqsO1gsF3EkXI2q1oEFpOCj09WXeS9Tr
	PW3JT/XfQlYexsvIUDIHQf8K+uC4ASRuTQO2MbSNO7BjjHK/s1Uo
X-Google-Smtp-Source: AGHT+IGpoLTFCuw5ghVgmrtqPZpEGUrV/AdqAio6EVs9puSp8zJJ6D5OZT7FkNMYCTwgNPjcF+kAsA==
X-Received: by 2002:a17:902:e884:b0:1e0:11a4:30e0 with SMTP id w4-20020a170902e88400b001e011a430e0mr593088plg.19.1714510700071;
        Tue, 30 Apr 2024 13:58:20 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:68d:41e7:d081:607d])
        by smtp.gmail.com with ESMTPSA id a5-20020a170902ecc500b001eacedac996sm10044345plh.74.2024.04.30.13.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 13:58:19 -0700 (PDT)
Date: Tue, 30 Apr 2024 13:58:17 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-input@vger.kernel.org, linux-kbuild@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH] Input: amimouse - Mark driver struct with __refdata to
 prevent section mismatch
Message-ID: <ZjFbafUyLb3PymwC@google.com>
References: <2e3783106bf6bd9a7bdeb12b706378fb16316471.1711748999.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2e3783106bf6bd9a7bdeb12b706378fb16316471.1711748999.git.u.kleine-koenig@pengutronix.de>

On Fri, Mar 29, 2024 at 10:54:38PM +0100, Uwe Kleine-König wrote:
> As described in the added code comment, a reference to .exit.text is ok
> for drivers registered via module_platform_driver_probe(). Make this
> explicit to prevent the following section mismatch warning
> 
> 	WARNING: modpost: drivers/input/mouse/amimouse: section mismatch in reference: amimouse_driver+0x8 (section: .data) -> amimouse_remove (section: .exit.text)
> 
> that triggers on an allmodconfig W=1 build.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Applied, thank you.

-- 
Dmitry

