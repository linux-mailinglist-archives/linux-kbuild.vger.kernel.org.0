Return-Path: <linux-kbuild+bounces-326-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5FB80CE7B
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Dec 2023 15:35:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A8E71C20F5E
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Dec 2023 14:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A91A748CF1;
	Mon, 11 Dec 2023 14:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DEbAEfIb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22D64B4;
	Mon, 11 Dec 2023 06:35:33 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6ce972ac39dso2771628b3a.3;
        Mon, 11 Dec 2023 06:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702305332; x=1702910132; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qg0t6giPlhY8ENsAnr+OMEBoJVeV7B3VLvZboJyh0Mk=;
        b=DEbAEfIbrqJPTiGUGfriNRaRGaLVydlKu1hpOEnNy6XhVeYGkdoDjtv1J5qvyRpbDF
         +cmhyKPvZkcdap5usn8OY862WFlp8NYznb+9QqH7Sz8Bw54a5QUjf2yiaaibUbdb6y5N
         zwCaxPupJeLyXnyCIZqZkINvBnzmlOsV58e57hhqZeE6qOBSisbhkw98GvimXMWYipfe
         8xGnim3dz23EgbC3u2PNCnNQ/93TJPsXv83XroTwmAknAaBu4ZKXsGrD5+qljtayND6S
         d0sCsoVq8mD6tcsM+6rJwMX35CU4B9SxP1S/4L1l2JweF4yAcA7+zCFVlZ3DW4CJXAVS
         mtAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702305332; x=1702910132;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qg0t6giPlhY8ENsAnr+OMEBoJVeV7B3VLvZboJyh0Mk=;
        b=V7BPfZ9L2BvFsyxK5nCIlszrbsKEz8Yzh++FDuAOiKy9PMPF0nusAqQpD1N+mNI7YQ
         b6qUGNzDzyE+kALeZfQoeTmMAbaEKW3iYcGs6RCqv4vQYDVZxegZEAWzzkx09VAKcbTF
         zdIEu0cRh+9pqpRJsFNzOKQWSw7Zri/DE+57kE2F1vFJzymjgYUNRbnjh0ooSA91L8ZN
         oax2msuWVed4foxXpShnkrPXUCNmUOcsVBO8Xi8lsdkPrJe7p6zft0HYfr/RVPXvqYIN
         7MfdkkpbuHgwrNsNFspdrvrG0YQuESlQtDMHQs72ZTO6o2qbWqUqHHLP7bUeEn0czZxG
         u8Rw==
X-Gm-Message-State: AOJu0YyNEa/FrvT6Mzy+EW3l/ARXKH3xrhuunEm3Ce7aPfrOBGGp3y/N
	3LbsBGTcXtB2yyfuFOg/xKc=
X-Google-Smtp-Source: AGHT+IFFOG8GoFOb9hlOpJl1wXu+rvFNF4t4pOI6/r4CVPJMKEx/vBqFBytEflBMF/ZaMh6DQ6crDw==
X-Received: by 2002:aa7:8554:0:b0:6ce:2732:295 with SMTP id y20-20020aa78554000000b006ce27320295mr1723460pfn.68.1702305332510;
        Mon, 11 Dec 2023 06:35:32 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id ey2-20020a056a0038c200b006cbb75d87d2sm6369613pfb.6.2023.12.11.06.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 06:35:32 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 11 Dec 2023 06:35:31 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	linux-kbuild@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 1/4] hwmon: (smsc47m1) Mark driver struct with __refdata
 to prevent section mismatch
Message-ID: <2d49df1b-4ff8-4dda-a4f4-bde81347f6a6@roeck-us.net>
References: <cover.1701957840.git.u.kleine-koenig@pengutronix.de>
 <57977a88a9b99b6555b227aa4994ac3df10c6490.1701957840.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <57977a88a9b99b6555b227aa4994ac3df10c6490.1701957840.git.u.kleine-koenig@pengutronix.de>

On Thu, Dec 07, 2023 at 03:09:29PM +0100, Uwe Kleine-König wrote:
> As described in the added code comment, a reference to .exit.text is ok
> for drivers registered via module_platform_driver_probe(). Make this
> explicit to prevent the following section mismatch warning
> 
> 	WARNING: modpost: drivers/hwmon/smsc47m1: section mismatch in reference: smsc47m1_driver+0x8 (section: .data) -> smsc47m1_remove (section: .exit.text)
> 
> that triggers on an allmodconfig W=1 build.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Applied.

Thanks,
Guenter

